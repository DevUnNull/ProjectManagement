package dto;

public class SemesterDTO {
    private int semesterId;
    private String semesterName;
    
    public SemesterDTO(int semesterId, String semesterName) {
        this.semesterId = semesterId;
        this.semesterName = semesterName;
    }
    
    public int getSemesterId() {
        return semesterId;
    }
    
    public void setSemesterId(int semesterId) {
        this.semesterId = semesterId;
    }
    
    public String getSemesterName() {
        return semesterName;
    }
    
    public void setSemesterName(String semesterName) {
        this.semesterName = semesterName;
    }
    
    @Override
    public String toString() {
        return "SemesterDTO{" +
                "semesterId=" + semesterId +
                ", semesterName='" + semesterName + '\'' +
                '}';
    }
}
