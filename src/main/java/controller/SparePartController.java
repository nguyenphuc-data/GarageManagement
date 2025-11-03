// src/main/java/controller/SparePartController.java
package controller;

import dao.SparePartDAO;
import model.SparePart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SparePartController", urlPatterns = "/searchSparePart")
public class SparePartController extends HttpServlet {
    private final SparePartDAO sparePartDAO = new SparePartDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        String id = request.getParameter("id");

        if (keyword != null && !keyword.isEmpty()) {
            List<SparePart> sparePartList = sparePartDAO.getSparePartList(keyword);
            request.setAttribute("sparePartList", sparePartList);
            request.getRequestDispatcher("/SearchSparePart/ifSearchSparePart.jsp").forward(request, response);
        } else if (id != null && !id.isEmpty()) {
            SparePart sparePart = sparePartDAO.getSparePartDetail(id);
            request.setAttribute("sparePart", sparePart);
            request.getRequestDispatcher("/SearchSparePart/ifDetailSparePart.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/SearchSparePart/ifSearchSparePart.jsp");
        }
    }
}