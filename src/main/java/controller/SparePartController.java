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

@WebServlet("/sparepart")
public class SparePartController extends HttpServlet {
    private final SparePartDAO dao = new SparePartDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");
        String keyword = req.getParameter("keyword");

        // Xem chi tiết
        if (id != null && !id.trim().isEmpty()) {
            SparePart part = dao.getSparePartDetail(id);
            req.setAttribute("part", part);
            req.setAttribute("keyword", keyword != null ? keyword : "");
            req.getRequestDispatcher("/SearchSparePart/ifDetailSparePart.jsp").forward(req, resp);
            return;
        }

        // Tìm kiếm hoặc hiển thị tất cả
        if (keyword == null || keyword.trim().isEmpty()) {
            keyword = "";
        }

        List<SparePart> list = dao.getSparePartList(keyword);
        req.setAttribute("sparePartList", list);
        req.setAttribute("keyword", keyword);
        req.getRequestDispatcher("/SearchSparePart/ifSearchSparePart.jsp").forward(req, resp);
    }
}