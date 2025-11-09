package model;

import java.io.Serializable;
import java.math.BigDecimal;

public class SparePart implements Serializable {
    private String id;
    private String name;
    private BigDecimal price;
    private Integer quantity;
    private String desc;

    public SparePart() {}

    public SparePart(String id, String name, BigDecimal price, Integer quantity, String desc) {
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

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }

    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }

    public String getDesc() { return desc; }
    public void setDesc(String desc) { this.desc = desc; }
}