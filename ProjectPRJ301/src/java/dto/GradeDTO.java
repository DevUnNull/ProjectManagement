package dto;

public class GradeDTO {
    private String studentId;
    private String studentName;
    private String className;
    private String subjectId;    // Thêm Subject_ID
    private String subjectName;
    private String semesterId;   // Thêm Semester_ID
    private String semesterName;
    private float midTerm;
    private float finalExam;
    private float totalGrade;

    public GradeDTO(String studentId, String studentName, String className, String subjectId,
                    String subjectName, String semesterId, String semesterName,
                    float midTerm, float finalExam, float totalGrade) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.className = className;
        this.subjectId = subjectId;
        this.subjectName = subjectName;
        this.semesterId = semesterId;
        this.semesterName = semesterName;
        this.midTerm = midTerm;
        this.finalExam = finalExam;
        this.totalGrade = totalGrade;
    }

    // Getter và Setter cho Subject_ID và Semester_ID
    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }

    public String getSemesterId() {
        return semesterId;
    }

    public void setSemesterId(String semesterId) {
        this.semesterId = semesterId;
    }

    // Các getter và setter khác
    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getSemesterName() {
        return semesterName;
    }

    public void setSemesterName(String semesterName) {
        this.semesterName = semesterName;
    }

    public float getMidTerm() {
        return midTerm;
    }

    public void setMidTerm(float midTerm) {
        this.midTerm = midTerm;
    }

    public float getFinalExam() {
        return finalExam;
    }

    public void setFinalExam(float finalExam) {
        this.finalExam = finalExam;
    }

    public float getTotalGrade() {
        return totalGrade;
    }

    public void setTotalGrade(float totalGrade) {
        this.totalGrade = totalGrade;
    }

    @Override
    public String toString() {
        return "GradeDTO{" +
                "studentId='" + studentId + '\'' +
                ", studentName='" + studentName + '\'' +
                ", className='" + className + '\'' +
                ", subjectId='" + subjectId + '\'' +
                ", subjectName='" + subjectName + '\'' +
                ", semesterId='" + semesterId + '\'' +
                ", semesterName='" + semesterName + '\'' +
                ", midTerm=" + midTerm +
                ", finalExam=" + finalExam +
                ", totalGrade=" + totalGrade +
                '}';
    }
}
