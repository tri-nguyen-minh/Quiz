package daos;

import dtos.QuestionDTO;
import dtos.RecordDTO;
import dtos.SubjectDTO;
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
public class QuizDAO implements Serializable {

    private List<String> answerList;
    private Connection con;
    private PreparedStatement preStm;
    private ResultSet rs;

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
        if (con != null) {
            con.close();
        }
    }

    public QuizDAO() {

    }

    public List<QuestionDTO> getQuizQuestionList(String subjectId, int questionCount) throws Exception {
        List<QuestionDTO> questionList = null;
        try {
            String sql = "Select top(?) Id From QuestionBank"
                    + " Where SubjectId = ? and Status = ? Order by NEWID()";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setInt(1, questionCount);
            preStm.setString(2, subjectId);
            preStm.setInt(3, 1);
            rs = preStm.executeQuery();
            questionList = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("Id");
                QuestionDTO dto = new QuestionDTO();
                dto.setId(id);
                dto.setAnswerCorrect("");
                questionList.add(dto);
            }
        } finally {
            closeConnection();
        }
        return questionList;
    }

    public QuestionDTO loadQuestion(String id) throws Exception {
        QuestionDTO dto = null;
        try {
            String sql = "Select top(1) Question_content,Correct_answer,"
                    + "Answer_one,Answer_two,Answer_three From QuestionBank"
                    + " Where Id = ? Order by Id";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                answerList = new ArrayList<>();
                String content = rs.getString("Question_content");
                answerList.add(rs.getString("Correct_answer"));
                answerList.add(rs.getString("answer_one"));
                answerList.add(rs.getString("answer_two"));
                answerList.add(rs.getString("answer_three"));
                for (int i = 3; i > 0; --i) {
                    int index = (int) (Math.random() * (i + 1));
                    answerList.add(answerList.get(index));
                    answerList.remove(index);
                }
                dto = new QuestionDTO(id, content, answerList.get(0),
                        answerList.get(1), answerList.get(2), answerList.get(3), null);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public List<RecordDTO> getAllQuizRecords(String studentId, String subjectId) throws Exception {
        List<RecordDTO> result = null;
        try {
            String sql = "Select top(5) SubjectId,Submit_time,Question_correct,Time_taken,Point From Record "
                    + "Where StudentId = ? And SubjectId LIKE ?";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setString(1, studentId);
            preStm.setString(2, "%" + subjectId + "%");
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("SubjectId");
                Timestamp timeSubmit = rs.getTimestamp("Submit_time");
                int questionCorrect = rs.getInt("Question_correct");
                int timeTaken = rs.getInt("Time_taken");
                int sec = timeTaken % 60;
                int min = timeTaken / 60;
                String point = rs.getString("Point");
                RecordDTO dto = new RecordDTO(id, studentId, questionCorrect + " out of ", min, sec, point);
                dto.setTimeSubmit(timeSubmit);
                result.add(dto);
            }
            sql = "Select Question_count From Subject Where SubjectId = ?";
            for (int i = 0; i < result.size(); i++) {
                preStm = con.prepareStatement(sql);
                preStm.setString(1, result.get(i).getSubjectId());
                rs = preStm.executeQuery();
                if (rs.next()) {
                    String questionRatio = result.get(i).getQuestionRatio();
                    result.get(i).setQuestionRatio(questionRatio + rs.getInt("Question_count"));
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<SubjectDTO> getAllQuizzes(String studentId) throws Exception {
        List<SubjectDTO> result = null;
        try {
            String sql = "Select SubjectId,Subject_name,Question_count,Quiz_time From Subject";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("SubjectId");
                String name = rs.getString("Subject_name");
                int questionCount = rs.getInt("Question_count");
                int time = rs.getInt("Quiz_time");
                SubjectDTO dto = new SubjectDTO(id, name, time, questionCount);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<SubjectDTO> getAvailableQuizzes(List<SubjectDTO> list, String studentId) throws Exception {
        try {
            String sql = "";
            int attemptCount = 0;
            for (int i = 0; i < list.size(); i++) {
                int questionCount = (new QuestionDAO()).countAvailableSubjectQuestions(list.get(i).getId());
                if (questionCount < list.get(i).getQuestionCount()) {
                    list.remove(i);
                }
            }
            for (int i = 0; i < list.size(); i++) {
                System.out.println(list.get(i).getId());
                attemptCount = 0;
                sql = "Select Id From Record Where SubjectId = ? And StudentId = ?";
                con = MyConnection.getConnection();
                preStm = con.prepareStatement(sql);
                preStm.setString(1, list.get(i).getId());
                preStm.setString(2, studentId);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    attemptCount++;
                }
                System.out.println(attemptCount);
                if (attemptCount == 5) {
                    list.remove(i);
                    i--;
                } else {
                    list.get(i).setAttempt(5 - attemptCount);
                }

            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public int getCorrectQuestion(List<QuestionDTO> list) throws Exception {
        int totalCorrect = 0;
        try {
            String sql = "Select top(1) Correct_answer From QuestionBank Where Id = ? Order by Id";
            con = MyConnection.getConnection();
            for (int i = 0; i < list.size(); i++) {
                preStm = con.prepareStatement(sql);
                preStm.setString(1, list.get(i).getId());
                rs = preStm.executeQuery();
                if (rs.next()) {
                    if (list.get(i).getAnswerCorrect().equals(rs.getString("Correct_answer"))) {
                        totalCorrect++;
                    }
                }
            }
        } finally {
            closeConnection();
        }
        return totalCorrect;
    }

    public boolean createQuizRecord(RecordDTO dto, int questionsCorrect) throws Exception {
        boolean created = false;
        try {
            int recordCount = 1;
            String sql = "Select Id From Record Where SubjectId = ?";
            con = MyConnection.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setString(1, dto.getSubjectId());
            rs = preStm.executeQuery();
            while (rs.next()) {
                recordCount++;
            }
            sql = "Insert into Record(Id,StudentId,SubjectId,Submit_time,Time_taken,Question_correct,Point) values(?,?,?,?,?,?,?)";
            preStm = con.prepareStatement(sql);
            preStm.setString(1, dto.getSubjectId() + recordCount);
            preStm.setString(2, dto.getStudentId());
            preStm.setString(3, dto.getSubjectId());
            preStm.setTimestamp(4, dto.getTimeSubmit());
            int timeTaken = dto.getTimeMin() * 60 + dto.getTimeSec();
            preStm.setInt(5, timeTaken);
            preStm.setInt(6, questionsCorrect);
            preStm.setString(7, dto.getPoint());
            created = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return created;
    }
}
