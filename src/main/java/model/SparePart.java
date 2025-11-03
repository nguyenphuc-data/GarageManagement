package model;

import java.io.Serializable;

public class SparePart implements Serializable {
    private String id;
    private String name;
    private String price;
    private Integer quantity;
    private String desc;

    public SparePart(String spId, String spName, String spPrice, String spDesc) {}

    public SparePart(String id, String name, String price, Integer quantity, String desc) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.desc = desc;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getPrice() { return price; }
    public void setPrice(String price) { this.price = price; }
    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }
    public String getDesc() { return desc; }
    public void setDesc(String desc) { this.desc = desc; }

    @Override
    public String toString() {
        return "SparePart{" + "id='" + id + '\'' + ", name='" + name + '\'' + ", price='" + price + '\'' + ", quantity=" + quantity + ", desc='" + desc + '\'' + '}';
    }
}