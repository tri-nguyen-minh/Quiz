
package dtos;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author TNM
 */
public class RecordDTO implements Serializable{
    private String subjectId, studentId, questionRatio, point;
    private int timeMin, timeSec;
    private Timestamp timeSubmit;

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getQuestionRatio() {
        return questionRatio;
    }

    public void setQuestionRatio(String questionRatio) {
        this.questionRatio = questionRatio;
    }

    public int getTimeMin() {
        return timeMin;
    }

    public void setTimeMin(int timeMin) {
        this.timeMin = timeMin;
    }

    public int getTimeSec() {
        return timeSec;
    }

    public void setTimeSec(int timeSec) {
        this.timeSec = timeSec;
    }

    public Timestamp getTimeSubmit() {
        return timeSubmit;
    }

    public void setTimeSubmit(Timestamp timeSubmit) {
        this.timeSubmit = timeSubmit;
    }


    public String getPoint() {
        return point;
    }

    public void setPoint(String point) {
        this.point = point;
    }

    public RecordDTO() {
    }

    public RecordDTO(String subjectId, String studentId, String questionRatio, int timeMin, int timeSec, String point) {
        this.subjectId = subjectId;
        this.studentId = studentId;
        this.questionRatio = questionRatio;
        this.timeMin = timeMin;
        this.timeSec = timeSec;
        this.point = point;
    }


    
}
