package model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List; // dùng List thay vì mảng

public class PaymentInvoice implements Serializable {
    private String id;
    private String customerId;
    private String vehicleId;
    private Timestamp time;
    private String totalAmount;
    private String status;
    private String staffId;

    // Danh sách hóa đơn dịch vụ và hóa đơn phụ tùng
    private List<ServiceInvoice> serviceInvoices;
    private List<SparePartInvoice> sparePartInvoices;

    public PaymentInvoice() {}

    // Getters and setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getCustomerId() { return customerId; }
    public void setCustomerId(String customerId) { this.customerId = customerId; }

    public String getVehicleId() { return vehicleId; }
    public void setVehicleId(String vehicleId) { this.vehicleId = vehicleId; }

    public Timestamp getTime() { return time; }
    public void setTime(Timestamp time) { this.time = time; }

    public String getTotalAmount() { return totalAmount; }
    public void setTotalAmount(String totalAmount) { this.totalAmount = totalAmount; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getStaffId() { return staffId; }
    public void setStaffId(String staffId) { this.staffId = staffId; }

    public List<ServiceInvoice> getServiceInvoices() { return serviceInvoices; }
    public void setServiceInvoices(List<ServiceInvoice> serviceInvoices) { this.serviceInvoices = serviceInvoices; }

    public List<SparePartInvoice> getSparePartInvoices() { return sparePartInvoices; }
    public void setSparePartInvoices(List<SparePartInvoice> sparePartInvoices) { this.sparePartInvoices = sparePartInvoices; }
}
