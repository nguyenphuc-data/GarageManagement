package model;

public class ServiceInvoice {
    private String id;
    private Service service;
    private Integer quantity;
    private String totalAmount;
    private Staff technicalStaff;

    // Constructor
    public ServiceInvoice(String id, Service service, Integer quantity, String totalAmount, Staff technicalStaff) {
        this.id = id;
        this.service = service;
        this.quantity = quantity;
        this.totalAmount = totalAmount;
        this.technicalStaff = technicalStaff;
    }

    public ServiceInvoice() {}

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public Service getService() { return service; }
    public void setService(Service service) { this.service = service; }

    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }

    public String getTotalAmount() { return totalAmount; }
    public void setTotalAmount(String totalAmount) { this.totalAmount = totalAmount; }

    public Staff getTechnicalStaff() { return technicalStaff; }
    public void setTechnicalStaff(Staff technicalStaff) { this.technicalStaff = technicalStaff; }
}
