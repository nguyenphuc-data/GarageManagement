package controller;

import dao.CustomerStatDAO;
import dao.PaymentInvoiceDAO;
import model.CustomerStat;
import model.PaymentInvoice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PaymentInvoiceController", urlPatterns = {"/PaymentInvoiceController"})
public class PaymentInvoiceController extends HttpServlet {
    private final PaymentInvoiceDAO paymentInvoiceDAO = new PaymentInvoiceDAO();
    private final CustomerStatDAO customerStatDAO = new CustomerStatDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idCustomer = request.getParameter("idCustomer");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String id = request.getParameter("id");

        if (idCustomer != null && startDate != null && endDate != null) {
            List<PaymentInvoice> invoices = paymentInvoiceDAO.getPaidPaymentInvoiceList(idCustomer, startDate, endDate);
            long totalRevenue = invoices.stream()
                    .mapToLong(invoice -> Long.parseLong(invoice.getTotalAmount().replace(",", "")))
                    .sum();
            List<CustomerStat> customerStats = customerStatDAO.getCustomerRevenue(startDate, endDate);
            String customerName = customerStats.stream()
                    .filter(stat -> stat.getIdCustomer().equals(idCustomer))
                    .findFirst()
                    .map(CustomerStat::getName)
                    .orElse("[Không tìm thấy tên]");
            request.setAttribute("invoices", invoices);
            request.setAttribute("customerName", customerName);
            request.setAttribute("totalRevenue", String.format("%,d", totalRevenue));
            request.getRequestDispatcher("/StaffViewStatistics/ifViewCustomerInvoices.jsp").forward(request, response);
        } else if (id != null) {
            System.out.println("Fetching invoice detail for id: " + id); // Debug log
            PaymentInvoice invoice = paymentInvoiceDAO.getPaymentInvoiceDetail(id);
            if (invoice != null && "Paid".equals(invoice.getStatus())) {
                request.setAttribute("invoice", invoice);
                request.getRequestDispatcher("/StaffViewStatistics/ifInvoiceDetail.jsp").forward(request, response);
            } else {
                request.setAttribute("invoice", null);
                request.getRequestDispatcher("/StaffViewStatistics/ifInvoiceDetail.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/StaffViewStatistics/ifViewCustomerStatistics.jsp");
        }
    }
}