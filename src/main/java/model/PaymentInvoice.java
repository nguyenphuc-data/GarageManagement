package model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class PaymentInvoice implements Serializable {
    private String id;
    private BigDecimal totalamount;
    private LocalDateTime time;
    private String type;
    private String receivingslipid;
    private String customerName;
    private String licensePlate;
    private String staffName;

    public static class ServiceSlip {
        private String name;
        private int quantity;
        private BigDecimal total;

        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public int getQuantity() { return quantity; }
        public void setQuantity(int quantity) { this.quantity = quantity; }
        public BigDecimal getTotal() { return total; }
        public void setTotal(BigDecimal total) { this.total = total; }
    }

    public static class SparePartSlip {
        private String name;
        private int quantity;
        private BigDecimal total;

        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public int getQuantity() { return quantity; }
        public void setQuantity(int quantity) { this.quantity = quantity; }
        public BigDecimal getTotal() { return total; }
        public void setTotal(BigDecimal total) { this.total = total; }
    }

    private List<ServiceSlip> services = new ArrayList<>();
    private List<SparePartSlip> spareparts = new ArrayList<>();

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public BigDecimal getTotalamount() { return totalamount; }
    public void setTotalamount(BigDecimal totalamount) { this.totalamount = totalamount; }
    public LocalDateTime getTime() { return time; }
    public void setTime(LocalDateTime time) { this.time = time; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public String getReceivingslipid() { return receivingslipid; }
    public void setReceivingslipid(String id) { this.receivingslipid = id; }
    public String getCustomerName() { return customerName; }
    public void setCustomerName(String name) { this.customerName = name; }
    public String getLicensePlate() { return licensePlate; }
    public void setLicensePlate(String plate) { this.licensePlate = plate; }
    public String getStaffName() { return staffName; }
    public void setStaffName(String staffName) { this.staffName = staffName; }

    public List<ServiceSlip> getServices() { return services; }
    public void setServices(List<ServiceSlip> s) { this.services = s; }
    public List<SparePartSlip> getSpareparts() { return spareparts; }
    public void setSpareparts(List<SparePartSlip> s) { this.spareparts = s; }
}