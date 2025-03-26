
package dto;

/**
 *
 * @author PHAM THAI AN
 */
public class ClassJoin {
    private int accId;
    private String claName;

    public ClassJoin(int accId, String claName) {
        this.accId = accId;
        this.claName = claName;
    }

    public int getAccId() {
        return accId;
    }

    public void setAccId(int accId) {
        this.accId = accId;
    }

    public String getClaName() {
        return claName;
    }

    public void setClaName(String claName) {
        this.claName = claName;
    }
    
}
