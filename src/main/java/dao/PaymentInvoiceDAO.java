package dao;

import model.PaymentInvoice;
import util.DatabaseConnection;
import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class PaymentInvoiceDAO {

    public List<PaymentInvoice> getPaymentInvoiceList(String customerId, Date start, Date end) {
        List<PaymentInvoice> list = new ArrayList<>();
        String sql = """
            SELECT pi.id, pi.totalamount, pi.time, pi.type 
            FROM paymentinvoice pi
            JOIN receivingslip rs ON pi.receivingslipid = rs.id
            WHERE rs.customermemberid = ? AND pi.time BETWEEN ? AND ?
            """;
        try (Connection c = DatabaseConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, customerId);
            ps.setDate(2, start);
            ps.setDate(3, end);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PaymentInvoice inv = new PaymentInvoice();
                inv.setId(rs.getString("id"));
                inv.setTotalamount(rs.getBigDecimal("totalamount"));
                inv.setTime(rs.getTimestamp("time").toLocalDateTime());
                inv.setType(rs.getString("type"));
                list.add(inv);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // 1 HÀM DUY NHẤT – LẤY HẾT: INVOICE + NHÂN VIÊN + DỊCH VỤ + PHỤ TÙNG
    public PaymentInvoice getPaymentInvoiceDetail(String id) {
        PaymentInvoice inv = null;
        String sql = """
            SELECT 
                pi.id, pi.totalamount, pi.time, pi.type,
                m.name AS customer_name,
                v.licenseplate,
                staff_mem.name AS staff_name,
                svc.name AS svc_name, ss.quantity AS svc_qty, ss.totalamount AS svc_total,
                sp.name AS sp_name, sps.quantity AS sp_qty, sps.totalamount AS sp_total
            FROM paymentinvoice pi
            JOIN receivingslip rs ON pi.receivingslipid = rs.id
            JOIN customer c ON rs.customermemberid = c.member_id
            JOIN member m ON c.member_id = m.id
            LEFT JOIN vehicle v ON rs.vehicleid = v.id
            JOIN staff s ON rs.staffmemberid = s.id
            JOIN member staff_mem ON s.id = staff_mem.id
            LEFT JOIN serviceslip ss ON ss.receivingslipid = rs.id
            LEFT JOIN service svc ON ss.serviceid = svc.id
            LEFT JOIN sparepartslip sps ON sps.receivingslipid = rs.id
            LEFT JOIN sparepart sp ON sps.sparepartid = sp.id
            WHERE pi.id = ?
            """;

        try (Connection c = DatabaseConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                if (inv == null) {
                    inv = new PaymentInvoice();
                    inv.setId(rs.getString("id"));
                    inv.setTotalamount(rs.getBigDecimal("totalamount"));
                    inv.setTime(rs.getTimestamp("time").toLocalDateTime());
                    inv.setType(rs.getString("type"));
                    inv.setCustomerName(rs.getString("customer_name"));
                    inv.setLicensePlate(rs.getString("licenseplate"));
                    inv.setStaffName(rs.getString("staff_name"));
                }

                String svcName = rs.getString("svc_name");
                if (svcName != null) {
                    PaymentInvoice.ServiceSlip item = new PaymentInvoice.ServiceSlip();
                    item.setName(svcName);
                    item.setQuantity(rs.getInt("svc_qty"));
                    item.setTotal(rs.getBigDecimal("svc_total"));
                    inv.getServices().add(item);
                }

                String spName = rs.getString("sp_name");
                if (spName != null) {
                    PaymentInvoice.SparePartSlip item = new PaymentInvoice.SparePartSlip();
                    item.setName(spName);
                    item.setQuantity(rs.getInt("sp_qty"));
                    item.setTotal(rs.getBigDecimal("sp_total"));
                    inv.getSpareparts().add(item);
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return inv;
    }
}