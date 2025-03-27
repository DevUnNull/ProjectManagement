package dto;

public class InfoGrade {

    private String stuId;
    private String subName;
    private float midgrade;
    private float finalgrade;
    private float total;

    public InfoGrade() {
    }

    public InfoGrade(String stuId, String subName, float midgrade, float finalgrade, float total) {
        this.stuId = stuId;
        this.subName = subName;
        this.midgrade = midgrade;
        this.finalgrade = finalgrade;
        this.total = total;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public String getSubName() {
        return subName;
    }

    public void setSubName(String subName) {
        this.subName = subName;
    }

    public float getMidgrade() {
        return midgrade;
    }

    public void setMidgrade(float midgrade) {
        this.midgrade = midgrade;
    }

    public float getFinalgrade() {
        return finalgrade;
    }

    public void setFinalgrade(float finalgrade) {
        this.finalgrade = finalgrade;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "InfoGrade{" + "stuId=" + stuId + ", subName=" + subName + ", midgrade=" + midgrade + ", finalgrade=" + finalgrade + ", total=" + total + '}';
    }

   
}
