/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author PHAM THAI AN
 */
public class Grade {
    private int gradeId;
    private float midgrade;
    private float finalgrade;
    private float total;
    private String stuId;
    private int subId;
    private int semId;

    public Grade(int gradeId, float midgrade, float finalgrade, float total, String stuId, int subId, int semId) {
        this.gradeId = gradeId;
        this.midgrade = midgrade;
        this.finalgrade = finalgrade;
        this.total = total;
        this.stuId = stuId;
        this.subId = subId;
        this.semId = semId;
    }

    public int getGradeId() {
        return gradeId;
    }

    public void setGradeId(int gradeId) {
        this.gradeId = gradeId;
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

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public int getSubId() {
        return subId;
    }

    public void setSubId(int subId) {
        this.subId = subId;
    }

    public int getSemId() {
        return semId;
    }

    public void setSemId(int semId) {
        this.semId = semId;
    }
    
}
