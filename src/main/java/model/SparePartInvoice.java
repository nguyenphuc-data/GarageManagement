package model;

public class SparePartInvoice {
    private String id;
    private SparePart sparePart;
    private Integer quantity;
    private String totalAmount;

    // Constructor
    public SparePartInvoice(String id, SparePart sparePart, Integer quantity, String totalAmount) {
        this.id = id;
        this.sparePart = sparePart;
        this.quantity = quantity;
        this.totalAmount = totalAmount;
    }

    public SparePartInvoice() {}

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public SparePart getSparePart() { return sparePart; }
    public void setSparePart(SparePart sparePart) { this.sparePart = sparePart; }

    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }

    public String getTotalAmount() { return totalAmount; }
    public void setTotalAmount(String totalAmount) { this.totalAmount = totalAmount; }
}
