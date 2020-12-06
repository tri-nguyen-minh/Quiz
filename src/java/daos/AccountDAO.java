
package daos;

import dtos.AccountDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import utils.MyConnection;

/**
 *
 * @author TNM
 */
public class AccountDAO implements Serializable {
    private Connection con;
    private PreparedStatement preStm;
    private ResultSet rs;
 
    private void closeConnection() throws Exception {
        if(rs != null)
            rs.close();
        if(preStm != null)
            preStm.close();
        if(con != null)
            con.close();
    }

    public AccountDAO() {
    }
    
    public String checkLogin(String id, String password) throws Exception {
        String role = "failed";
        try {
            String sql = "Select Role From Registration Where Email = ? And Password = ?";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setString(1, id);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            if(rs.next()) {
                role = rs.getString("Role");
            }
        } finally {
            closeConnection();
        }
        return role;
    }
    public AccountDTO findAccount(String id) throws Exception {
        AccountDTO student = null;
        try {
            String sql = "Select Name, Role, Status From Registration Where Email = ?";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if(rs.next()) {
                String name = rs.getString("Name");
                String role = rs.getString("Role");
                int status = rs.getInt("Status");
                student = new AccountDTO();
                student.setEmail(id);
                student.setName(name);
                student.setStatus(status);
                student.setRole(role);
            }
        } finally {
            closeConnection();
        }
        return student;
    }
    public boolean registerNewStudent(AccountDTO newStudent) throws Exception {
        boolean registered = false;
        try {
            String sql = "Insert into Registration(Email,Password,name,role,status) "
                    + "values(?,?,?,?,?)";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setString(1, newStudent.getEmail());
            preStm.setString(2, newStudent.getPassword());
            preStm.setString(3, newStudent.getName());
            preStm.setString(4, newStudent.getRole());
            preStm.setInt(5, newStudent.getStatus());
            registered = preStm.executeUpdate()>0;
        } finally {
            closeConnection();
        }
        return registered;
    }
}
