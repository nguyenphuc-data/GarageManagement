package controller;

import dao.PaymentInvoiceDAO;
import model.PaymentInvoice;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/paymentinvoice")
public class PaymentInvoiceController extends HttpServlet {
    private final PaymentInvoiceDAO dao = new PaymentInvoiceDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("viewInvoices".equals(action)) {
            String customerId = req.getParameter("customerId");
            String customerName = req.getParameter("customerName"); // ← LẤY TÊN TỪ LINK
            Date start = Date.valueOf(req.getParameter("start"));
            Date end = Date.valueOf(req.getParameter("end"));

            // TRUYỀN TÊN KHÁCH TRƯỚC KHI FORWARD!
            req.setAttribute("customerName", customerName);
            req.setAttribute("invoices", dao.getPaymentInvoiceList(customerId, start, end));
            req.setAttribute("customerId", customerId);
            req.setAttribute("start", req.getParameter("start"));
            req.setAttribute("end", req.getParameter("end"));

            // BÂY GIỜ MỚI FORWARD
            req.getRequestDispatcher("/StaffViewStatistics/ifViewCustomerInvoices.jsp").forward(req, resp);

        } else if ("viewDetail".equals(action)) {
            String invoiceId = req.getParameter("invoiceId");
            PaymentInvoice inv = dao.getPaymentInvoiceDetail(invoiceId);
            req.setAttribute("invoice", inv);
            req.getRequestDispatcher("/StaffViewStatistics/ifInvoiceDetail.jsp").forward(req, resp);
        }
    }
}