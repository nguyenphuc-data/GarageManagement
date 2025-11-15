package controller;

import dao.CustomerStatDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/customerstat")
public class CustomerStatController extends HttpServlet {
    private final CustomerStatDAO dao = new CustomerStatDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("showForm".equals(action)) {
            req.getRequestDispatcher("/StaffViewStatistics/ifViewCustomerStatistics.jsp").forward(req, resp);
            return;
        }

        String startStr = req.getParameter("startDate");
        String endStr = req.getParameter("endDate");
        Date start = Date.valueOf(startStr);
        Date end = Date.valueOf(endStr);

        List<model.CustomerStat> stats = dao.getCustomerRevenue(start, end);

        req.setAttribute("stats", stats);
        req.setAttribute("startDate", startStr);
        req.setAttribute("endDate", endStr);

        req.getRequestDispatcher("/StaffViewStatistics/ifViewCustomerStatistics.jsp").forward(req, resp);
    }
}