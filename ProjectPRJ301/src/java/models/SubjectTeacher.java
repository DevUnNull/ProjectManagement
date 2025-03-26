/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author PHAM THAI AN
 */
public class SubjectTeacher {
    private int subteId;
    private int subId;
    private String teId;

    public SubjectTeacher(int subteId, int subId, String teId) {
        this.subteId = subteId;
        this.subId = subId;
        this.teId = teId;
    }

    public int getSubteId() {
        return subteId;
    }

    public void setSubteId(int subteId) {
        this.subteId = subteId;
    }

    public int getSubId() {
        return subId;
    }

    public void setSubId(int subId) {
        this.subId = subId;
    }

    public String getTeId() {
        return teId;
    }

    public void setTeId(String teId) {
        this.teId = teId;
    }
    
}
