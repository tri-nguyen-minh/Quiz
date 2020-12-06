
package dtos;

import java.io.Serializable;

/**
 *
 * @author TNM
 */
public class QuestionInvalidObj implements Serializable{
    private String errorSubjectId,errorContent,errorCorrectAnswer,
                   errorAnswers;

    public QuestionInvalidObj() {
    }

    public String getErrorSubjectId() {
        return errorSubjectId;
    }

    public void setErrorSubjectId(String errorSubjectId) {
        this.errorSubjectId = errorSubjectId;
    }

    public String getErrorContent() {
        return errorContent;
    }

    public void setErrorContent(String errorContent) {
        this.errorContent = errorContent;
    }

    public String getErrorCorrectAnswer() {
        return errorCorrectAnswer;
    }

    public void setErrorCorrectAnswer(String errorCorrectAnswer) {
        this.errorCorrectAnswer = errorCorrectAnswer;
    }

    public String getErrorAnswers() {
        return errorAnswers;
    }

    public void setErrorAnswers(String errorAnswers) {
        this.errorAnswers = errorAnswers;
    }
    
}
