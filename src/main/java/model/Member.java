package model;

import java.util.Date;

public class Member {
    private String id;
    private String username;
    private String password;
    private String name;
    private Date dateOfBirth;
    private Address address;
    private String email;
    private String phone;
    private String role;
    private String notes;

    // Getters & Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public Date getDateOfBirth() { return dateOfBirth; }
    public void setDateOfBirth(Date dateOfBirth) { this.dateOfBirth = dateOfBirth; }

    public Address getAddress() { return address; }
    public void setAddress(Address address) { this.address = address; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
}
