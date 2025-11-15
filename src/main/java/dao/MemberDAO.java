package dao;

import model.Member;
import util.DatabaseConnection;

import java.sql.*;

public class MemberDAO {

    public Member login(String username, String password) {
        Member member = null;
        String sql = "SELECT * FROM tblMember WHERE username=? AND password=?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                member = new Member();
                member.setId(rs.getString("id"));
                member.setUsername(rs.getString("username"));
                member.setRole(rs.getString("role"));
                member.setName(rs.getString("name"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return member;
    }
}