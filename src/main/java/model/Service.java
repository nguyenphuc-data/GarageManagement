package model;

import java.io.Serializable;
import java.math.BigDecimal;

public class Service implements Serializable {
    private String id;
    private String name;
    private BigDecimal price;  // ← DECIMAL(15,2) → BigDecimal
    private String desc;       // ← GIỮ NGUYÊN desc

    public Service() {}

    public Service(String id, String name, BigDecimal price, String desc) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.desc = desc;
    }

    // GETTER / SETTER
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }
    public String getDesc() { return desc; }
    public void setDesc(String desc) { this.desc = desc; }

    @Override
    public String toString() {
        return "Service{id='" + id + "', name='" + name + "', price=" + price + ", desc='" + desc + "'}";
    }
}