package model;

import java.io.Serializable;

public class CustomerStat implements Serializable {
    private String idCustomer;
    private String name;
    private String revenue;

    public CustomerStat() {}

    public String getIdCustomer() { return idCustomer; }
    public void setIdCustomer(String idCustomer) { this.idCustomer = idCustomer; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getRevenue() { return revenue; }
    public void setRevenue(String revenue) { this.revenue = revenue; }
}