package controller;

import dao.CustomerStatDAO;
import model.CustomerStat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerStatController", urlPatterns = "/CustomerStatController")
public class CustomerStatController extends HttpServlet {
    private final CustomerStatDAO customerStatDAO = new CustomerStatDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        if (startDate != null && endDate != null) {
            List<CustomerStat> customerStats = customerStatDAO.getCustomerRevenue(startDate, endDate);
            request.setAttribute("customerStats", customerStats);
            request.getRequestDispatcher("/StaffViewStatistics/ifViewCustomerStatistics.jsp").forward(request, response);
        } else {
            response.sendRedirect("/StaffViewStatistics/ifViewCustomerStatistics.jsp");
        }
    }
}