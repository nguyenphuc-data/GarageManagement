package controller;

import dao.ServiceDAO;
import model.Service;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/service")
public class ServiceController extends HttpServlet {
    private final ServiceDAO serviceDAO = new ServiceDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");
        String keyword = req.getParameter("keyword");

        if (id != null && !id.trim().isEmpty()) {
            Service service = serviceDAO.getServiceDetail(id);
            req.setAttribute("service", service);
            req.setAttribute("keyword", keyword != null ? keyword : "");
            req.getRequestDispatcher("/SearchService/ifDetailService.jsp").forward(req, resp);
            return;
        }

        if (keyword == null || keyword.trim().isEmpty()) {
            keyword = "";  // Hiển thị tất cả
        }

        List<Service> list = serviceDAO.getServiceList(keyword);
        req.setAttribute("serviceList", list);
        req.setAttribute("keyword", keyword);
        req.getRequestDispatcher("/SearchService/ifSearchService.jsp").forward(req, resp);
    }
}