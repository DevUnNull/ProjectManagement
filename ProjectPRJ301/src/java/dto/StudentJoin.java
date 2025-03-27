
package dto;

public class StudentJoin {
    private String claName;
    private String stuId;
    private String stuName;
    private String gender;
    private int byear;
    private String address;
    private String phone;
    private String email;

    public StudentJoin(String claName, String stuId, String stuName, String gender, int byear, String address, String phone, String email) {
        this.claName = claName;
        this.stuId = stuId;
        this.stuName = stuName;
        this.gender = gender;
        this.byear = byear;
        this.address = address;
        this.phone = phone;
        this.email = email;
    }

    public String getClaName() {
        return claName;
    }

    public void setClaName(String claName) {
        this.claName = claName;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getByear() {
        return byear;
    }

    public void setByear(int byear) {
        this.byear = byear;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    
}
