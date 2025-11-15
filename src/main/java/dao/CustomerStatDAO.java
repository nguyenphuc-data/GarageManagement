package dao;

import model.CustomerStat;
import util.DatabaseConnection;
import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerStatDAO {

    public List<CustomerStat> getCustomerRevenue(Date startDate, Date endDate) {
        List<CustomerStat> stats = new ArrayList<>();
        String sql = """
            SELECT 
                c.member_id AS customerId,
                m.name AS customerName,
                COALESCE(SUM(invoice_revenue.total), 0) AS revenue,
                COUNT(DISTINCT pi.id) AS invoiceCount
            FROM tblCustomer c
            JOIN tblMember m ON c.member_id = m.id
            LEFT JOIN tblReceivingSlip rs ON rs.customermemberid = c.member_id
            LEFT JOIN tblPaymentInvoice pi 
                ON pi.receivingslipid = rs.id 
                AND pi.time BETWEEN ? AND ?
            LEFT JOIN (
                SELECT 
                    COALESCE(ss.receivingslipid, sps.receivingslipid) AS rs_id,
                    COALESCE(ss.service_total, 0) + COALESCE(sps.sparepart_total, 0) AS total
                FROM (
                    SELECT receivingslipid, SUM(totalamount) AS service_total
                    FROM tblServiceSlip
                    GROUP BY receivingslipid
                ) ss
                LEFT JOIN (
                    SELECT receivingslipid, SUM(totalamount) AS sparepart_total
                    FROM tblSparePartSlip
                    GROUP BY receivingslipid
                ) sps ON ss.receivingslipid = sps.receivingslipid
                UNION
                SELECT 
                    sps.receivingslipid AS rs_id,
                    COALESCE(ss.service_total, 0) + sps.sparepart_total AS total
                FROM (
                    SELECT receivingslipid, SUM(totalamount) AS service_total
                    FROM tblServiceSlip
                    GROUP BY receivingslipid
                ) ss
                RIGHT JOIN (
                    SELECT receivingslipid, SUM(totalamount) AS sparepart_total
                    FROM tblSparePartSlip
                    GROUP BY receivingslipid
                ) sps ON ss.receivingslipid = sps.receivingslipid
                WHERE ss.receivingslipid IS NULL
            ) invoice_revenue ON invoice_revenue.rs_id = pi.receivingslipid
            GROUP BY c.member_id, m.name
            HAVING revenue > 0 OR invoiceCount > 0
            ORDER BY revenue DESC
            """;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setDate(1, new java.sql.Date(startDate.getTime()));
            ps.setDate(2, new java.sql.Date(endDate.getTime()));

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CustomerStat stat = new CustomerStat();
                stat.setCustomerId(rs.getString("customerId"));
                stat.setCustomerName(rs.getString("customerName"));
                stat.setRevenue(rs.getBigDecimal("revenue"));
                stat.setNumberOfInvoices(rs.getInt("invoiceCount"));
                stats.add(stat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stats;
    }
}