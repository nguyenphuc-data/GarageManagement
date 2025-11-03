package dao;

import model.SparePart;
import util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SparePartDAO {
    private static final String SELECT_BY_KEYWORD = "SELECT * FROM sparepart WHERE name LIKE ?";
    private static final String SELECT_BY_ID = "SELECT * FROM sparepart WHERE id = ?";

    public List<SparePart> getSparePartList(String keyword) {
        List<SparePart> spareParts = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_KEYWORD)) {
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SparePart p = new SparePart(rs.getString("sp_id"), rs.getString("sp_name"), rs.getString("sp_price"), rs.getString("sp_desc"));
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getString("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDesc(rs.getString("description")); // Sửa từ "desc" sang "description"
                spareParts.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return spareParts;
    }

    public SparePart getSparePartDetail(String id) {
        SparePart sparePart = null;
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_ID)) {
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                sparePart = new SparePart(rs.getString("sp_id"), rs.getString("sp_name"), rs.getString("sp_price"), rs.getString("sp_desc"));
                sparePart.setId(rs.getString("id"));
                sparePart.setName(rs.getString("name"));
                sparePart.setPrice(rs.getString("price"));
                sparePart.setQuantity(rs.getInt("quantity"));
                sparePart.setDesc(rs.getString("description")); // Sửa từ "desc" sang "description"
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sparePart;
    }
}