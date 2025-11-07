package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Lấy session hiện tại (không tạo mới nếu chưa có)
        HttpSession session = req.getSession(false);

        if (session != null) {
            session.invalidate(); // XÓA TOÀN BỘ SESSION → LOGOUT THÀNH CÔNG
        }

        // Redirect về trang login
        resp.sendRedirect(req.getContextPath() + "/Login/login.jsp");
    }

    // (Tùy chọn) Hỗ trợ POST nếu cần chống CSRF sau này
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }
}