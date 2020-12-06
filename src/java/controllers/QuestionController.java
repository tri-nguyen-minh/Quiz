
package controllers;

import daos.QuestionDAO;
import daos.SubjectDAO;
import dtos.QuestionDTO;
import dtos.QuestionInvalidObj;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

/**
 *
 * @author TNM
 */
public class QuestionController extends HttpServlet {
    
    private static Logger LOGGER = Logger.getLogger(QuestionController.class);
    private static final String RETURN = "Admin.jsp";
    private static final String CREATE = "CreateQuestion.jsp";
    private static final String SEARCH = "SearchQuestion.jsp";
    private static final String RETURNSEARCH = "SearchController";
    private static final String SETFORUPDATE = "UpdateQuestion.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = RETURN;
        try {
            String action = request.getParameter("action");
            QuestionDAO dao = new QuestionDAO();
            if (action.equals("Create")) {
                url = CREATE;
                boolean valid = true;
                String subjectId = request.getParameter("txtSubject");
                String content = request.getParameter("txtQuestion");
                String correctAnswer = request.getParameter("txtCorrect");
                String answer1 = request.getParameter("txtWrong1");
                String answer2 = request.getParameter("txtWrong2");
                String answer3 = request.getParameter("txtWrong3");
                QuestionInvalidObj obj = new QuestionInvalidObj();
                if (subjectId.isEmpty()) {
                    valid = false;
                    obj.setErrorSubjectId("Please enter a Subject.");
                } else if (!(new SubjectDAO()).checkSubject(subjectId)) {
                    valid = false;
                    obj.setErrorSubjectId("This Subject is not in the system.");
                }
                if (content.isEmpty()) {
                    valid = false;
                    obj.setErrorContent("Please enter question's content");
                }
                if (correctAnswer.isEmpty()) {
                    valid = false;
                    obj.setErrorCorrectAnswer("Please enter the answer for the question.");
                }
                if (answer1.isEmpty()) {
                    valid = false;
                    obj.setErrorAnswers("Please enter all 3 wrong answers.");
                }
                if (answer2.isEmpty()) {
                    valid = false;
                    obj.setErrorAnswers("Please enter all 3 wrong answers.");
                }
                if (answer3.isEmpty()) {
                    valid = false;
                    obj.setErrorAnswers("Please enter all 3 wrong answers.");
                }
                if (valid) {
                    int questionCount = dao.countSubjectQuestions(subjectId) + 1;
                    String id = subjectId + questionCount;
                    Calendar cal = Calendar.getInstance();
                    Timestamp createDate = new Timestamp(cal.getTimeInMillis());
                    QuestionDTO dto = new QuestionDTO(id, content, correctAnswer,
                            answer1, answer2, answer3, subjectId, createDate, 1);
                    if (dao.createQuestion(dto)) {
                        url = RETURN;
                        request.setAttribute("NOTIFY", "A new question was created.");
                    } else {
                        LOGGER.error("\nFailed to create the question");
                        request.setAttribute("ERROR", "An error has occured, please try again.");
                    }
                } else {
                    request.setAttribute("INVALID", obj);
                }
            } else if (action.equals("Search")) {
                url = SEARCH;
                String method = request.getParameter("SearchMethod");
                if(method.equals("subject"))
                    request.setAttribute("SUBJECT", (new SubjectDAO()).getAllSubjects());
                request.setAttribute("METHOD", method);
            } else if (action.equals("Delete")) {
                String id = request.getParameter("ID");
                if (dao.deleteQuestion(id)) {
                    url = RETURNSEARCH;
                } else {
                    LOGGER.error("\nFailed to create the question");
                    request.setAttribute("ERROR", "An error has occured, please try again.");
                }
            } else if (action.equals("SetForUpdate")) {
                String id = request.getParameter("ID");
                QuestionDTO dto = dao.findById(id);
                request.setAttribute("txtSearch", request.getParameter("txtSearch"));
                request.setAttribute("METHOD", request.getParameter("METHOD"));
                request.setAttribute("PAGE", request.getParameter("PAGE"));
                request.setAttribute("DTO", dto);
                url = SETFORUPDATE;
            } else if (action.equals("Update")) {
                url = SETFORUPDATE;
                boolean valid = true;
                String id = request.getParameter("ID");
                QuestionDTO dto = dao.findById(id);
                String subjectId = request.getParameter("txtSubject");
                String content = request.getParameter("txtQuestion");
                String correctAnswer = request.getParameter("txtCorrect");
                String answer1 = request.getParameter("txtWrong1");
                String answer2 = request.getParameter("txtWrong2");
                String answer3 = request.getParameter("txtWrong3");
                QuestionInvalidObj obj = new QuestionInvalidObj();
                if (subjectId.isEmpty()) {
                    valid = false;
                    obj.setErrorSubjectId("Please enter a Subject.");
                } else if (!(new SubjectDAO()).checkSubject(subjectId)) {
                    valid = false;
                    obj.setErrorSubjectId("This Subject is not in the system.");
                }
                if (content.isEmpty()) {
                    valid = false;
                    obj.setErrorContent("Please enter question's content");
                }
                if (correctAnswer.isEmpty()) {
                    valid = false;
                    obj.setErrorCorrectAnswer("Please enter the answer for the question.");
                }
                if (answer1.isEmpty()) {
                    valid = false;
                    obj.setErrorAnswers("Please enter all 3 wrong answers.");
                }
                if (answer2.isEmpty()) {
                    valid = false;
                    obj.setErrorAnswers("Please enter all 3 wrong answers.");
                }
                if (answer3.isEmpty()) {
                    valid = false;
                    obj.setErrorAnswers("Please enter all 3 wrong answers.");
                }
                if (valid) {
                    dto = new QuestionDTO(id, content, correctAnswer,
                                            answer1, answer2, answer3, subjectId);
                    if (dao.updateQuestion(dto)) {
                        url = RETURNSEARCH;
                    } else {
                        LOGGER.error("\nFailed to update the question");
                        request.setAttribute("ERROR", "An error has occured, please try again.");
                    }
                } else {
                    request.setAttribute("INVALID", obj);
                    request.setAttribute("DTO", dto);
                }
            }
        } catch (Exception e) {
            LOGGER.error("\n" + e.getMessage());
            log("Error at QuestionController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
