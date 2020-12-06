/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.QuizDAO;
import daos.SubjectDAO;
import dtos.AccountDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author Nat
 */
public class RecordController extends HttpServlet {

    private static Logger LOGGER = Logger.getLogger(AccountController.class);
    private static final String SUCCESS = "RecordPage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String action = request.getParameter("action");
            QuizDAO quizDAO = new QuizDAO();
            SubjectDAO subjectDAO = new SubjectDAO();
            HttpSession session = request.getSession();
            AccountDTO account = (AccountDTO) session.getAttribute("USER");
            String studentId = account.getEmail();
            if (action.equals("ViewQuizzesUntaken")) {
                request.setAttribute("RECORD", quizDAO.getAvailableQuizzes(quizDAO.getAllQuizzes(studentId), studentId));
                request.setAttribute("CONTENT", action);
            } else if (action.equals("ViewQuizzesTaken")) {
                request.setAttribute("SUBJECT", subjectDAO.getAllSubjects());
                request.setAttribute("RECORD", quizDAO.getAllQuizRecords(studentId,""));
                request.setAttribute("CONTENT", action);
            } else if (action.equals("Search by Subject")) {
                String subjectId = request.getParameter("txtSearch");
                request.setAttribute("SUBJECT", subjectDAO.getAllSubjects());
                request.setAttribute("RECORD", quizDAO.getAllQuizRecords(studentId,subjectId));
                request.setAttribute("CONTENT", action);
                request.setAttribute("txtSearch", subjectId);
                request.setAttribute("CONTENT", "ViewQuizzesTaken");
            }
        } catch (Exception e) {
            LOGGER.error("\n" + e.getMessage());
            log("Error at RecordController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(SUCCESS).forward(request, response);
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
