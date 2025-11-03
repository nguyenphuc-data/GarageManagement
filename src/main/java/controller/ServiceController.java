// src/main/java/controller/ServiceController.java
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

@WebServlet(name = "ServiceController", urlPatterns = "/searchService")
public class ServiceController extends HttpServlet {
    private final ServiceDAO serviceDAO = new ServiceDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        String id = request.getParameter("id");

        if (keyword != null && !keyword.isEmpty()) {
            List<Service> serviceList = serviceDAO.getServiceList(keyword);
            request.setAttribute("serviceList", serviceList);
            request.getRequestDispatcher("/SearchService/ifSearchService.jsp").forward(request, response);
        } else if (id != null && !id.isEmpty()) {
            Service service = serviceDAO.getServiceDetail(id);
            request.setAttribute("service", service);
            request.getRequestDispatcher("/SearchService/ifDetailService.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/SearchService/ifSearchService.jsp");
        }
    }
}