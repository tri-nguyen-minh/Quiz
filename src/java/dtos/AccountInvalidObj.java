
package dtos;

import java.io.Serializable;

/**
 *
 * @author TNM
 */
public class AccountInvalidObj implements Serializable{
    private String errorEmail, errorPassword, errorName;

    public String getErrorEmail() {
        return errorEmail;
    }

    public void setErrorEmail(String errorEmail) {
        this.errorEmail = errorEmail;
    }

    public String getErrorPassword() {
        return errorPassword;
    }

    public void setErrorPassword(String errorPassword) {
        this.errorPassword = errorPassword;
    }

    public String getErrorName() {
        return errorName;
    }

    public void setErrorName(String errorName) {
        this.errorName = errorName;
    }

    public AccountInvalidObj() {
    }
    
}
