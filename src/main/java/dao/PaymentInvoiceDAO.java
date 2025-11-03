package dao;

import model.PaymentInvoice;
import util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PaymentInvoiceDAO {
    private static final String GET_PAID_INVOICES_BY_CUSTOMER =
            "SELECT pi.id, pi.time, pi.totalamount, pi.status " +
                    "FROM paymentinvoice pi " +
                    "WHERE pi.customerid = ? AND pi.time BETWEEN ? AND ? AND pi.status = 'Paid'";
    private static final String GET_INVOICE_DETAIL =
            "SELECT pi.id, pi.time, pi.totalamount, pi.status " +
                    "FROM paymentinvoice pi " +
                    "WHERE pi.id = ?";

    public List<PaymentInvoice> getPaidPaymentInvoiceList(String idCustomer, String startDate, String endDate) {
        List<PaymentInvoice> invoices = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(GET_PAID_INVOICES_BY_CUSTOMER)) {
            ps.setString(1, idCustomer);
            ps.setString(2, startDate + " 00:00:00");
            ps.setString(3, endDate + " 23:59:59");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PaymentInvoice invoice = new PaymentInvoice();
                invoice.setId(rs.getString("id"));
                invoice.setTime(rs.getTimestamp("time"));
                invoice.setTotalAmount(rs.getString("totalamount"));
                invoice.setStatus(rs.getString("status"));
                invoices.add(invoice);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return invoices;
    }

    public PaymentInvoice getPaymentInvoiceDetail(String id) {
        PaymentInvoice invoice = null;
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(GET_INVOICE_DETAIL)) {
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                invoice = new PaymentInvoice();
                invoice.setId(rs.getString("id"));
                invoice.setTime(rs.getTimestamp("time"));
                invoice.setTotalAmount(rs.getString("totalamount"));
                invoice.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return invoice;
    }
}