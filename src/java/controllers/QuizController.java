/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.QuizDAO;
import daos.SubjectDAO;
import dtos.AccountDTO;
import dtos.QuestionDTO;
import dtos.RecordDTO;
import dtos.SubjectDTO;
import java.io.IOException;
import java.util.Date;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author TNM
 */
public class QuizController extends HttpServlet {

    private static Logger LOGGER = Logger.getLogger(QuizController.class);
    private static final String ONGOINGQUIZ = "QuizPage.jsp";
    private static final String SUBMIT = "RecordController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ONGOINGQUIZ;
        try {
            HttpSession session = request.getSession();
            QuizDAO dao = new QuizDAO();
            List<QuestionDTO> questionList = null;
            int question;
            Calendar cal;
            long startTime, endTime;
            String action = request.getParameter("action");
            if(action == null) {
                String answer = request.getParameter("answer");
                questionList = (List<QuestionDTO>) session.getAttribute("QUESTIONLIST");
                question = Integer.parseInt(request.getParameter("questionCount")) - 1;
                if (answer != null) {
                    questionList.get(question).setAnswerCorrect(answer);
                }
                cal = Calendar.getInstance();
                Timestamp timeSubmitted = new Timestamp(cal.getTimeInMillis());
                int totalCorrectQuestions = dao.getCorrectQuestion(questionList);
                SubjectDTO subjectDTO = (SubjectDTO) session.getAttribute("SUBJECT");
                AccountDTO accountDTO = (AccountDTO) session.getAttribute("USER");
                double totalQuestion = (double) subjectDTO.getQuestionCount();
                double point = Double.parseDouble((new DecimalFormat("#.##")).format(((totalCorrectQuestions / totalQuestion) * 10)));
                RecordDTO dto = new RecordDTO(subjectDTO.getId(), accountDTO.getEmail(), "", subjectDTO.getQuizTime(), 0, "" + point);
                dto.setTimeSubmit(timeSubmitted);
                boolean quizSubmitted = dao.createQuizRecord(dto, totalCorrectQuestions);
                if (quizSubmitted) {
                    session.setAttribute("QUESTIONLIST", null);
                    url = SUBMIT + "?action=Search by Subject&txtSearch=" + subjectDTO.getId();
                }
            } else if (action.equals("Start")) {
                String subjectId = request.getParameter("DTO");
                SubjectDTO subjectDTO = (new SubjectDAO()).findSubject(subjectId);
                questionList = (List<QuestionDTO>)session.getAttribute("QUESTIONLIST");
                if (questionList == null) {
                    questionList = dao.getQuizQuestionList(subjectId, subjectDTO.getQuestionCount());
                    cal = Calendar.getInstance();
                    startTime = cal.getTime().getTime();
                    cal.add(Calendar.MINUTE, subjectDTO.getQuizTime());
                    cal.add(Calendar.SECOND, 1);
                    endTime = cal.getTime().getTime();
                    session.setAttribute("ENDTIME",endTime);
                    session.setAttribute("STARTTIME", startTime);
                }
                question = 1;
                QuestionDTO dto = dao.loadQuestion(questionList.get(question - 1).getId());
                request.setAttribute("QUESTION", dto);
                request.setAttribute("QUESTIONCOUNT", question);
                session.setAttribute("QUESTIONLIST", questionList);
                session.setAttribute("SUBJECT", subjectDTO);
            } else if (action.equals("Previous Page")) {
                String answer = request.getParameter("answer");
                questionList = (List<QuestionDTO>) session.getAttribute("QUESTIONLIST");
                question = Integer.parseInt(request.getParameter("questionCount")) - 1;
                if (answer != null) {
                    questionList.get(question).setAnswerCorrect(answer);
                }
                QuestionDTO dto = dao.loadQuestion(questionList.get(question - 1).getId());
                request.setAttribute("QUESTION", dto);
                request.setAttribute("QUESTIONCOUNT", question);
                session.setAttribute("QUESTIONLIST", questionList);
            } else if (action.equals("Next Page")) {
                String answer = request.getParameter("answer");
                questionList = (List<QuestionDTO>) session.getAttribute("QUESTIONLIST");
                question = Integer.parseInt(request.getParameter("questionCount")) - 1;
                if (answer != null) {
                    questionList.get(question).setAnswerCorrect(answer);
                }
                question += 1;
                QuestionDTO dto = dao.loadQuestion(questionList.get(question).getId());
                request.setAttribute("QUESTION", dto);
                request.setAttribute("QUESTIONCOUNT", question + 1);
                session.setAttribute("QUESTIONLIST", questionList);
            } else if (action.equals("Switch")) {
                questionList = (List<QuestionDTO>) session.getAttribute("QUESTIONLIST");
                question = 0;
                String id = request.getParameter("id");
                for (int i = 0; i < questionList.size(); i++) {
                    if (questionList.get(i).getId().equals(id)) {
                        question = i + 1;
                    }
                }
                QuestionDTO dto = dao.loadQuestion(id);
                request.setAttribute("QUESTION", dto);
                request.setAttribute("QUESTIONCOUNT", question);
                session.setAttribute("QUESTIONLIST", questionList);
            } else if ((action.equals("Submit"))) {
                String answer = request.getParameter("answer");
                questionList = (List<QuestionDTO>) session.getAttribute("QUESTIONLIST");
                question = Integer.parseInt(request.getParameter("questionCount")) - 1;
                if (answer != null) {
                    questionList.get(question).setAnswerCorrect(answer);
                }
                cal = Calendar.getInstance();
                Timestamp timeSubmitted = new Timestamp(cal.getTimeInMillis());
                int totalCorrectQuestions = dao.getCorrectQuestion(questionList);
                SubjectDTO subjectDTO = (SubjectDTO) session.getAttribute("SUBJECT");
                AccountDTO accountDTO = (AccountDTO) session.getAttribute("USER");
                double totalQuestion = (double) subjectDTO.getQuestionCount();
                double point = Double.parseDouble((new DecimalFormat("#.##")).format(((totalCorrectQuestions / totalQuestion) * 10)));
                startTime = (long)session.getAttribute("STARTTIME");
                Date end = cal.getTime();
                long timeTaken = end.getTime() - startTime;
                int hourTaken = (int)(timeTaken % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60);
                int minuteTaken = (int)(((timeTaken % (1000 * 60 * 60)) / (1000 * 60)) + (hourTaken * 60));
                int secondTaken = (int)(timeTaken % (1000 * 60)) / 1000;
                RecordDTO dto = new RecordDTO(subjectDTO.getId(), accountDTO.getEmail(), "", minuteTaken, secondTaken, "" + point);
                dto.setTimeSubmit(timeSubmitted);
                boolean quizSubmitted = dao.createQuizRecord(dto, totalCorrectQuestions);
                if (quizSubmitted) {
                    session.setAttribute("QUESTIONLIST", null);
                    url = SUBMIT + "?action=Search by Subject&txtSearch=" + subjectDTO.getId();
                }
            }

        } catch (Exception e) {
            log("Error at QuizController: " + e.getMessage());
            LOGGER.error("\n" + e.getMessage());
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
