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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Hiển thị form chọn ngày
        req.getRequestDispatcher("/StaffViewStatistics/ifViewCustomerStatistics.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String startStr = req.getParameter("startDate");
        String endStr = req.getParameter("endDate");
        Date start = Date.valueOf(startStr);
        Date end = Date.valueOf(endStr);

        // LẤY DOANH THU + TÊN KHÁCH
        List<model.CustomerStat> stats = dao.getCustomerRevenue(start, end);

        // TRUYỀN THÊM 2 THUỘC TÍNH ĐỂ JSP DÙNG LÀM LINK
        req.setAttribute("stats", stats);
        req.setAttribute("startDate", startStr);
        req.setAttribute("endDate", endStr);

        req.getRequestDispatcher("/StaffViewStatistics/ifViewCustomerStatistics.jsp").forward(req, resp);
    }
}