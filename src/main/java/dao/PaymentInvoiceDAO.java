package dao;

import model.PaymentInvoice;
import util.DatabaseConnection;
import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class PaymentInvoiceDAO {

    public List<PaymentInvoice> getPaymentInvoiceList(String customerId, Date startDate, Date endDate) {
        List<PaymentInvoice> list = new ArrayList<>();
        String sql = """
            SELECT 
                pi.id,
                pi.time,
                pi.type,
                COALESCE(ss.service_total, 0) + COALESCE(sps.sparepart_total, 0) AS calculated_total
            FROM tblPaymentInvoice pi
            JOIN tblReceivingSlip rs ON pi.receivingslipid = rs.id
            LEFT JOIN (
                SELECT receivingslipid, SUM(totalamount) AS service_total
                FROM tblServiceSlip
                GROUP BY receivingslipid
            ) ss ON ss.receivingslipid = rs.id
            LEFT JOIN (
                SELECT receivingslipid, SUM(totalamount) AS sparepart_total
                FROM tblSparePartSlip
                GROUP BY receivingslipid
            ) sps ON sps.receivingslipid = rs.id
            WHERE rs.customermemberid = ? 
              AND pi.time BETWEEN ? AND ?
            ORDER BY pi.time;
            """;

        try (Connection c = DatabaseConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, customerId);
            ps.setDate(2, startDate);
            ps.setDate(3, endDate);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PaymentInvoice inv = new PaymentInvoice();
                inv.setId(rs.getString("id"));
                inv.setTime(rs.getTimestamp("time").toLocalDateTime());
                inv.setType(rs.getString("type"));
                inv.setTotalamount(rs.getBigDecimal("calculated_total"));
                list.add(inv);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public PaymentInvoice getPaymentInvoiceDetail(String id) {
        PaymentInvoice inv = null;
        String sql = """
        -- Phần 1: Lấy thông tin chung + tổng tiền
        SELECT
            pi.id,
            pi.time,
            pi.type,
            m.name AS customer_name,
            v.licenseplate,
            staff_mem.name AS staff_name,
            COALESCE(ss_total.service_total, 0) + COALESCE(sps_total.sparepart_total, 0) AS calculated_total
        FROM tblPaymentInvoice pi
        JOIN tblReceivingSlip rs ON pi.receivingslipid = rs.id
        JOIN tblCustomer c ON rs.customermemberid = c.member_id
        JOIN tblMember m ON c.member_id = m.id
        LEFT JOIN tblVehicle v ON rs.vehicleid = v.id
        JOIN tblStaff s ON rs.staffmemberid = s.id
        JOIN tblMember staff_mem ON s.id = staff_mem.id
        LEFT JOIN (
            SELECT receivingslipid, SUM(totalamount) AS service_total
            FROM tblServiceSlip GROUP BY receivingslipid
        ) ss_total ON ss_total.receivingslipid = rs.id
        LEFT JOIN (
            SELECT receivingslipid, SUM(totalamount) AS sparepart_total
            FROM tblSparePartSlip GROUP BY receivingslipid
        ) sps_total ON sps_total.receivingslipid = rs.id
        WHERE pi.id = ?
        """;

        String serviceSql = """
        SELECT svc.name, ss.quantity, ss.totalamount
        FROM tblServiceSlip ss
        JOIN tblService svc ON ss.serviceid = svc.id
        WHERE ss.receivingslipid = (
            SELECT receivingslipid FROM tblPaymentInvoice WHERE id = ?
        )
        """;

        String sparepartSql = """
        SELECT sp.name, sps.quantity, sps.totalamount
        FROM tblSparePartSlip sps
        JOIN tblSparePart sp ON sps.sparepartid = sp.id
        WHERE sps.receivingslipid = (
            SELECT receivingslipid FROM tblPaymentInvoice WHERE id = ?
        )
        """;

        try (Connection c = DatabaseConnection.getConnection();
             PreparedStatement psMain = c.prepareStatement(sql);
             PreparedStatement psService = c.prepareStatement(serviceSql);
             PreparedStatement psSpare = c.prepareStatement(sparepartSql)) {

            psMain.setString(1, id);
            ResultSet rsMain = psMain.executeQuery();
            if (rsMain.next()) {
                inv = new PaymentInvoice();
                inv.setId(rsMain.getString("id"));
                inv.setTime(rsMain.getTimestamp("time").toLocalDateTime());
                inv.setType(rsMain.getString("type"));
                inv.setCustomerName(rsMain.getString("customer_name"));
                inv.setLicensePlate(rsMain.getString("licenseplate"));
                inv.setStaffName(rsMain.getString("staff_name"));
                inv.setTotalamount(rsMain.getBigDecimal("calculated_total"));
            }

            psService.setString(1, id);
            ResultSet rsService = psService.executeQuery();
            while (rsService.next()) {
                PaymentInvoice.ServiceSlip item = new PaymentInvoice.ServiceSlip();
                item.setName(rsService.getString("name"));
                item.setQuantity(rsService.getInt("quantity"));
                item.setTotal(rsService.getBigDecimal("totalamount"));
                inv.getServices().add(item);
            }

            psSpare.setString(1, id);
            ResultSet rsSpare = psSpare.executeQuery();
            while (rsSpare.next()) {
                PaymentInvoice.SparePartSlip item = new PaymentInvoice.SparePartSlip();
                item.setName(rsSpare.getString("name"));
                item.setQuantity(rsSpare.getInt("quantity"));
                item.setTotal(rsSpare.getBigDecimal("totalamount"));
                inv.getSpareparts().add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return inv;
    }
}