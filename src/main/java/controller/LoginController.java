package controller;

import dao.MemberDAO;
import model.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    private static final String LOGIN_PAGE = "/Login/login.jsp";
    private static final String CUSTOMER_HOME = "/Login/ifMainCustomer.jsp";
    private static final String STAFF_HOME = "/Login/ifMainManagementStaff.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("error", "Username and password are required!");
            request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
            return;
        }

        try {
            MemberDAO dao = new MemberDAO();
            Member member = dao.login(username, password);

            if (member != null) {
                HttpSession session = request.getSession();
                session.setAttribute("member", member);

                String redirectUrl = "staff".equalsIgnoreCase(member.getRole()) ? STAFF_HOME : CUSTOMER_HOME;
                response.sendRedirect(request.getContextPath() + redirectUrl);
            } else {
                request.setAttribute("error", "Invalid username or password!");
                request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred during login. Please try again later.");
            e.printStackTrace();
            request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
        }
    }
}