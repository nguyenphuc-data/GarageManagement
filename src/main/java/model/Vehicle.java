package model;

public class Vehicle {
    private String id;
    private Customer customer;
    private String licensePlate;
    private String desc;

    // Constructor
    public Vehicle(String id, Customer customer, String licensePlate, String desc) {
        this.id = id;
        this.customer = customer;
        this.licensePlate = licensePlate;
        this.desc = desc;
    }

    public Vehicle() {}

    // Getters and Setters
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public String getLicensePlate() {
        return licensePlate;
    }
    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
    }

    public String getDesc() {
        return desc;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }
}
