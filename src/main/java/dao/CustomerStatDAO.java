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
                COALESCE(SUM(pi.totalamount), 0) AS revenue,
                COUNT(pi.id) AS invoiceCount
            FROM customer c
            JOIN member m ON c.member_id = m.id
            LEFT JOIN receivingslip rs ON rs.customermemberid = c.member_id
            LEFT JOIN paymentinvoice pi ON pi.receivingslipid = rs.id
            WHERE pi.time BETWEEN ? AND ?
            GROUP BY c.member_id, m.name
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