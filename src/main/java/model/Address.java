package model;

public class Address {
    private String id;
    private String homeNumber;
    private String roadName;
    private String district;
    private String province;
    private String nation;

    // Getters & Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getHomeNumber() { return homeNumber; }
    public void setHomeNumber(String homeNumber) { this.homeNumber = homeNumber; }

    public String getRoadName() { return roadName; }
    public void setRoadName(String roadName) { this.roadName = roadName; }

    public String getDistrict() { return district; }
    public void setDistrict(String district) { this.district = district; }

    public String getProvince() { return province; }
    public void setProvince(String province) { this.province = province; }

    public String getNation() { return nation; }
    public void setNation(String nation) { this.nation = nation; }
}
