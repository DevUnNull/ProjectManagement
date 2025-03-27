
package dto;


public class SubJoin {
    private int subId;
    private String subName;
    private int creValue;

    public SubJoin() {
    }

    public SubJoin(int subId, String subName, int creValue) {
        this.subId = subId;
        this.subName = subName;
        this.creValue = creValue;
    }

    public int getSubId() {
        return subId;
    }

    public void setSubId(int subId) {
        this.subId = subId;
    }

    public String getSubName() {
        return subName;
    }

    public void setSubName(String subName) {
        this.subName = subName;
    }

    public int getCreValue() {
        return creValue;
    }

    public void setCreValue(int creValue) {
        this.creValue = creValue;
    }

    @Override
    public String toString() {
        return "SubJoin{" + "subId=" + subId + ", subName=" + subName + ", creValue=" + creValue + '}';
    }
    
}
