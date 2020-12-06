
package daos;

import dtos.QuestionDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import utils.MyConnection;

/**
 *
 * @author TNM
 */
public class QuestionDAO implements Serializable{
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
    public QuestionDAO() {
    }
    
    public QuestionDTO findById(String id) throws Exception {
        QuestionDTO dto = null;
        try {
            String sql = "Select Question_content,Correct_answer,"
                        + "Answer_one,Answer_two,Answer_three,SubjectId "
                        + "From QuestionBank Where Id = ?";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if(rs.next()) {
                String content = rs.getString("Question_content");
                String correct = rs.getString("Correct_answer");
                String answer1 = rs.getString("Answer_one");
                String answer2 = rs.getString("Answer_two");
                String answer3 = rs.getString("Answer_three");
                String subjectId = rs.getString("SubjectId");
                dto = new QuestionDTO(id, content, correct, answer1, answer2, answer3, subjectId);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public boolean createQuestion(QuestionDTO question) throws Exception {
        boolean questionCreated = false;
        try {
            String sql = "Insert into QuestionBank(Id,Question_content,Correct_answer,Answer_one,Answer_two,Answer_three,CreateDate,SubjectId,Status) "
                        + "values(?,?,?,?,?,?,?,?,?)";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setString(1, question.getId());
            preStm.setString(2, question.getQuestionContent());
            preStm.setString(3, question.getAnswerCorrect());
            preStm.setString(4, question.getAnswerWrong1());
            preStm.setString(5, question.getAnswerWrong2());
            preStm.setString(6, question.getAnswerWrong3());
            preStm.setTimestamp(7, question.getCreatedDate());
            preStm.setString(8, question.getSubjectId());
            preStm.setInt(9, question.getStatus());
            questionCreated = preStm.executeUpdate()>0;
        } finally {
            closeConnection();
        }
        return questionCreated;
    }
    
    public boolean updateQuestion(QuestionDTO question) throws Exception {
        boolean questionCreated = false;
        try {
            String sql = "Update QuestionBank Set Question_content = ?,Correct_answer = ?,"
                        + " Answer_one = ?,Answer_two = ?,Answer_three = ?,"
                        + " SubjectId = ? Where Id = ?";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setString(1, question.getQuestionContent());
            preStm.setString(2, question.getAnswerCorrect());
            preStm.setString(3, question.getAnswerWrong1());
            preStm.setString(4, question.getAnswerWrong2());
            preStm.setString(5, question.getAnswerWrong3());
            preStm.setString(6, question.getSubjectId());
            preStm.setString(7, question.getId());
            questionCreated = preStm.executeUpdate()>0;
        } finally {
            closeConnection();
        }
        return questionCreated;
    }
    
    public boolean deleteQuestion(String id) throws Exception {
        boolean questionDeleted = false;
        try {
            String sql = "Update QuestionBank Set Status = ? Where Id = ?";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setInt(1, 3);
            preStm.setString(2, id);
            questionDeleted = preStm.executeUpdate()>0;
        } finally {
            closeConnection();
        }
        return questionDeleted;
    }
    
    public int getTotalSearchPage(String search, String searchColumm) throws Exception {
        int totalPages = 0;
        try {
        int totalRecords = 0;
        String sql = "Select Id From QuestionBank Where "+searchColumm+" LIKE ?";
        con = MyConnection.getConnection();
        preStm = con.prepareStatement(sql);
        preStm.setString(1, "%"+search+"%");
        rs = preStm.executeQuery();
        while(rs.next())
            totalRecords++;
        if((totalRecords%20)==0)
            totalPages = totalRecords/20;
        else totalPages = (totalRecords/20) + 1;
        } finally {
            closeConnection();
        }
        return totalPages;
    }
    public List<QuestionDTO> searchByLikeContent(String search, int pageCount) throws Exception{
        List<QuestionDTO> result = null;
        try {
            String sql = "select top(20) Id,Question_content,Correct_answer,"
                    + "Answer_one,Answer_two,Answer_three,CreateDate,SubjectId,Status from QuestionBank "
                    + "Where Question_content LIKE ? And Id NOT IN (select top (?) Id from QuestionBank "
                    + "Where Question_content LIKE ? Order by Question_content) Order by Question_content";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setString(1, "%"+search+"%");
            preStm.setInt(2, (pageCount-1)*20);
            preStm.setString(3, "%"+search+"%");
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("Id");
                String questionContent = rs.getString("Question_content");
                String answerCorrect = rs.getString("Correct_answer");
                String answerWrong1 = rs.getString("Answer_one");
                String answerWrong2 = rs.getString("Answer_two");
                String answerWrong3 = rs.getString("Answer_three");
                Timestamp createDate = rs.getTimestamp("CreateDate");
                String Subject = rs.getString("SubjectId");
                int status = rs.getInt("Status");
                QuestionDTO dto = new QuestionDTO(id, questionContent, answerCorrect, 
                        answerWrong1, answerWrong2, answerWrong3, Subject, createDate, status);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    public List<QuestionDTO> searchBySubject(String search, int pageCount) throws Exception{
        List<QuestionDTO> result = null;
        try {
            String sql = "select top(20) Id,Question_content,Correct_answer,"
                    + "Answer_one,Answer_two,Answer_three,CreateDate,SubjectId,Status from QuestionBank "
                    + "Where SubjectId LIKE ? And Id NOT IN (select top (?) Id from QuestionBank "
                    + "Where SubjectId LIKE ? Order by Question_content) Order by Question_content";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setString(1, "%"+search+"%");
            preStm.setInt(2, (pageCount-1)*20);
            preStm.setString(3, "%"+search+"%");
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("Id");
                String questionContent = rs.getString("Question_content");
                String answerCorrect = rs.getString("Correct_answer");
                String answerWrong1 = rs.getString("Answer_one");
                String answerWrong2 = rs.getString("Answer_two");
                String answerWrong3 = rs.getString("Answer_three");
                Timestamp createDate = rs.getTimestamp("CreateDate");
                String Subject = rs.getString("SubjectId");
                int status = rs.getInt("Status");
                QuestionDTO dto = new QuestionDTO(id, questionContent, answerCorrect, 
                        answerWrong1, answerWrong2, answerWrong3, Subject, createDate, status);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    public List<QuestionDTO> searchByStatus(int status, int pageCount) throws Exception{
        List<QuestionDTO> result = null;
        try {
            String sql = "select top(20) Id,Question_content,Correct_answer,"
                    + "Answer_one,Answer_two,Answer_three,CreateDate,SubjectId,Status from QuestionBank "
                    + "Where Status = ? And Id NOT IN (select top (?) Id from QuestionBank "
                    + "Where Status = ? Order by Question_content) Order by Question_content";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setInt(1, status);
            preStm.setInt(2, (pageCount-1)*20);
            preStm.setInt(3, status);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("Id");
                String questionContent = rs.getString("Question_content");
                String answerCorrect = rs.getString("Correct_answer");
                String answerWrong1 = rs.getString("Answer_one");
                String answerWrong2 = rs.getString("Answer_two");
                String answerWrong3 = rs.getString("Answer_three");
                Timestamp createDate = rs.getTimestamp("CreateDate");
                String Subject = rs.getString("SubjectId");
                QuestionDTO dto = new QuestionDTO(id, questionContent, answerCorrect, 
                        answerWrong1, answerWrong2, answerWrong3, Subject, createDate, status);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    public int countSubjectQuestions(String subjectId) throws Exception {
        int totalQuestion = 0;
        try {
            String sql = "Select Id From QuestionBank Where SubjectId = ?";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setString(1, subjectId);
            rs = preStm.executeQuery();
            while(rs.next())
                totalQuestion++;
        } finally {
            closeConnection();
        }
        return totalQuestion;
    }
    public int countAvailableSubjectQuestions(String subjectId) throws Exception {
        int totalQuestion = 0;
        try {
            String sql = "Select Id From QuestionBank Where SubjectId = ? and Status = ?";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setString(1, subjectId);
            preStm.setInt(2, 1);
            rs = preStm.executeQuery();
            while(rs.next())
                totalQuestion++;
        } finally {
            closeConnection();
        }
        return totalQuestion;
    }
}
