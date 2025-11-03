package dao;

import model.CustomerStat;
import util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerStatDAO {
    private static final String GET_CUSTOMER_REVENUE =
            "SELECT c.idCustomer, m.name, SUM(pi.totalamount) as revenue " +
                    "FROM customer c " +
                    "JOIN member m ON c.member_id = m.id " +
                    "JOIN paymentinvoice pi ON pi.customerid = c.idCustomer " +
                    "WHERE pi.time BETWEEN ? AND ? AND pi.status = 'Paid' " +
                    "GROUP BY c.idCustomer, m.name";

    public List<CustomerStat> getCustomerRevenue(String startDate, String endDate) {
        List<CustomerStat> stats = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(GET_CUSTOMER_REVENUE)) {
            ps.setString(1, startDate + " 00:00:00");
            ps.setString(2, endDate + " 23:59:59");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CustomerStat stat = new CustomerStat();
                stat.setIdCustomer(rs.getString("idCustomer"));
                stat.setName(rs.getString("name"));
                stat.setRevenue(rs.getString("revenue"));
                stats.add(stat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stats;
    }
}