package dao;

import model.Service;
import util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceDAO {
    private static final String SELECT_BY_KEYWORD = "SELECT * FROM service WHERE name LIKE ?";
    private static final String SELECT_BY_ID = "SELECT * FROM service WHERE id = ?";

    public List<Service> getServiceList(String keyword) {
        List<Service> services = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_KEYWORD)) {
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Service s = new Service();
                s.setId(rs.getString("id"));
                s.setName(rs.getString("name"));
                s.setPrice(rs.getString("price"));
                s.setDesc(rs.getString("description")); // Sửa từ "desc" sang "description"
                services.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return services;
    }

    public Service getServiceDetail(String id) {
        Service service = null;
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_ID)) {
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                service = new Service();
                service.setId(rs.getString("id"));
                service.setName(rs.getString("name"));
                service.setPrice(rs.getString("price"));
                service.setDesc(rs.getString("description")); // Sửa từ "desc" sang "description"
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return service;
    }
}