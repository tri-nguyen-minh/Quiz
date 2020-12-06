
package daos;

import dtos.SubjectDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.MyConnection;

/**
 *
 * @author TNM
 */
public class SubjectDAO implements Serializable{
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
    public List<SubjectDTO> getAllSubjects() throws Exception {
        List<SubjectDTO> result = null;
        try {
            String sql = "Select SubjectId, Subject_name From Subject";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {                
                String id = rs.getString("SubjectId");
                String name = rs.getString("Subject_name");
                SubjectDTO dto = new SubjectDTO();
                dto.setId(id);
                dto.setName(name);
                result.add(dto);
            }
        } finally {
        }
        return result;
    }
    public SubjectDTO findSubject(String id) throws Exception {
        SubjectDTO dto = null;
        try {
            String sql = "Select Subject_name,Question_count,Quiz_time From Subject Where SubjectId = ?";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if(rs.next()) {
                String subjectName = rs.getString("Subject_name");
                int questionCount = rs.getInt("Question_count");
                int time = rs.getInt("Quiz_time");
                dto = new SubjectDTO(id, subjectName, time, questionCount);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public boolean checkSubject(String id) throws Exception {
        boolean subjectExist = false;
        try {
            String sql = "Select Subject_name From Subject Where SubjectId = ?";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if(rs.next())
                subjectExist = true;
        } finally {
            closeConnection();
        }
        return subjectExist;
    }
    
}
