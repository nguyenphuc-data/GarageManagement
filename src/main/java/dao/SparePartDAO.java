package dao;

import model.SparePart;
import util.DatabaseConnection;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SparePartDAO {
    private static final String SELECT_BY_KEYWORD = "SELECT * FROM sparepart WHERE name LIKE ?";
    private static final String SELECT_BY_ID = "SELECT * FROM sparepart WHERE id = ?";

    public List<SparePart> getSparePartList(String keyword) {
        List<SparePart> parts = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_KEYWORD)) {

            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SparePart p = new SparePart();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getBigDecimal("price"));           // ← BigDecimal
                p.setQuantity(rs.getInt("quantity"));
                p.setDesc(rs.getString("description"));
                parts.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return parts;
    }

    public SparePart getSparePartDetail(String id) {
        SparePart part = null;
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_ID)) {

            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                part = new SparePart();
                part.setId(rs.getString("id"));
                part.setName(rs.getString("name"));
                part.setPrice(rs.getBigDecimal("price"));       // ← BigDecimal
                part.setQuantity(rs.getInt("quantity"));
                part.setDesc(rs.getString("description"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return part;
    }
}