
package dtos;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author TNM
 */
public class QuestionDTO implements Serializable{
    private String id,questionContent,answerCorrect,
            answerWrong1,answerWrong2,answerWrong3,subjectId;
    private Timestamp createdDate;
    private int status;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public String getAnswerCorrect() {
        return answerCorrect;
    }

    public void setAnswerCorrect(String answerCorrect) {
        this.answerCorrect = answerCorrect;
    }

    public String getAnswerWrong1() {
        return answerWrong1;
    }

    public void setAnswerWrong1(String answerWrong1) {
        this.answerWrong1 = answerWrong1;
    }

    public String getAnswerWrong2() {
        return answerWrong2;
    }

    public void setAnswerWrong2(String answerWrong2) {
        this.answerWrong2 = answerWrong2;
    }

    public String getAnswerWrong3() {
        return answerWrong3;
    }

    public void setAnswerWrong3(String answerWrong3) {
        this.answerWrong3 = answerWrong3;
    }

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public QuestionDTO() {
    }

    public QuestionDTO(String id, String questionContent, String answerCorrect,
                        String answerWrong1, String answerWrong2, String answerWrong3,
                        String subjectId) {
        this.id = id;
        this.questionContent = questionContent;
        this.answerCorrect = answerCorrect;
        this.answerWrong1 = answerWrong1;
        this.answerWrong2 = answerWrong2;
        this.answerWrong3 = answerWrong3;
        this.subjectId = subjectId;
    }

    public QuestionDTO(String id, String questionContent, String answerCorrect,
                        String answerWrong1, String answerWrong2, String answerWrong3,
                        String subjectId, Timestamp createdDate, int status) {
        this.id = id;
        this.questionContent = questionContent;
        this.answerCorrect = answerCorrect;
        this.answerWrong1 = answerWrong1;
        this.answerWrong2 = answerWrong2;
        this.answerWrong3 = answerWrong3;
        this.subjectId = subjectId;
        this.createdDate = createdDate;
        this.status = status;
    }
    
}
