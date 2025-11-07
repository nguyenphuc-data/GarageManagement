package model;

import java.math.BigDecimal;

public class CustomerStat {
    private String customerId;
    private String customerName;
    private BigDecimal revenue;
    private int numberOfInvoices;

    // Constructors
    public CustomerStat() {}

    public CustomerStat(String customerId, String customerName, BigDecimal revenue, int numberOfInvoices) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.revenue = revenue;
        this.numberOfInvoices = numberOfInvoices;
    }

    // Getters & Setters
    public String getCustomerId() { return customerId; }
    public void setCustomerId(String customerId) { this.customerId = customerId; }
    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }
    public BigDecimal getRevenue() { return revenue; }
    public void setRevenue(BigDecimal revenue) { this.revenue = revenue; }
    public int getNumberOfInvoices() { return numberOfInvoices; }
    public void setNumberOfInvoices(int numberOfInvoices) { this.numberOfInvoices = numberOfInvoices; }
}