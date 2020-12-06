
package dtos;

import java.io.Serializable;

/**
 *
 * @author TNM
 */
public class QuizDTO implements Serializable{
    private String id,name;
    private int quizTime, questionCount;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuizTime() {
        return quizTime;
    }

    public void setQuizTime(int quizTime) {
        this.quizTime = quizTime;
    }

    public int getQuestionCount() {
        return questionCount;
    }

    public void setQuestionCount(int questionCount) {
        this.questionCount = questionCount;
    }

    public QuizDTO() {
    }

    public QuizDTO(String id, String name, int quizTime, int questionCount) {
        this.id = id;
        this.name = name;
        this.quizTime = quizTime;
        this.questionCount = questionCount;
    }
    
}
