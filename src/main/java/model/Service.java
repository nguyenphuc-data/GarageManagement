package model;

import java.io.Serializable;
import java.math.BigDecimal;

public class Service implements Serializable {
    private String id;
    private String name;
    private BigDecimal price;
    private String desc;

    public Service() {}

    public Service(String id, String name, BigDecimal price, String desc) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.desc = desc;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }
    public String getDesc() { return desc; }
    public void setDesc(String desc) { this.desc = desc; }
}