package controllers;

import daos.QuestionDAO;
import daos.SubjectDAO;
import java.io.IOException;
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
public class SearchController extends HttpServlet {

    private static Logger LOGGER = Logger.getLogger(AccountController.class);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            int totalPage = 0, page = 0;
            String action = request.getParameter("action");
            QuestionDAO dao = new QuestionDAO();
            HttpSession session = request.getSession();
            if (action.equals("Search by Content")) {
                String search = request.getParameter("txtSearch");
                totalPage = dao.getTotalSearchPage(search, "Question_content");
                page = 1;
                request.setAttribute("QUESTIONLIST", dao.searchByLikeContent(search, page));
                request.setAttribute("METHOD", request.getParameter("METHOD"));
                request.setAttribute("txtSearch", search);
                session.setAttribute("TOTAL", totalPage);
            } else if (action.equals("Search by Subject")) {
                String search = request.getParameter("txtSearch");
                totalPage = dao.getTotalSearchPage(search, "SubjectId");
                page = 1;
                request.setAttribute("SUBJECT", (new SubjectDAO()).getAllSubjects());
                request.setAttribute("QUESTIONLIST", dao.searchBySubject(search, page));
                request.setAttribute("METHOD", request.getParameter("METHOD"));
                request.setAttribute("txtSearch", search);
                session.setAttribute("TOTAL", totalPage);
            } else if (action.equals("Search by Status")) {
                int search = Integer.parseInt(request.getParameter("txtSearch"));
                totalPage = dao.getTotalSearchPage(search + "", "Status");
                page = 1;
                request.setAttribute("QUESTIONLIST", dao.searchByStatus(search, page));
                request.setAttribute("METHOD", request.getParameter("METHOD"));
                request.setAttribute("STATUS", search);
                session.setAttribute("TOTAL", totalPage);
            } else {
                String method = request.getParameter("METHOD");
                String search = request.getParameter("txtSearch");
                page = Integer.parseInt(request.getParameter("PAGE"));
                if (action.equals("Next Page")) {
                    page += 1;
                } else if (action.equals("Previous Page")) {
                    page -= 1;
                }
                if (method.equals("content")) {
                    request.setAttribute("QUESTIONLIST", dao.searchByLikeContent(search, page));
                    request.setAttribute("METHOD", method);
                    request.setAttribute("txtSearch", search);

                } else if (method.equals("subject")) {
                    request.setAttribute("SUBJECT", (new SubjectDAO()).getAllSubjects());
                    request.setAttribute("QUESTIONLIST", dao.searchBySubject(search, page));
                    request.setAttribute("METHOD", method);
                    request.setAttribute("txtSearch", search);
                } else {
                    int status = Integer.parseInt(search);
                    request.setAttribute("QUESTIONLIST", dao.searchByStatus(status, page));
                    request.setAttribute("METHOD", method);
                    request.setAttribute("STATUS", search);
                }
            }
            request.setAttribute("PAGE", page);
        } catch (Exception e) {
            log("Error at SearchController: " + e.getMessage());
            LOGGER.error("\n" + e.getMessage());
        } finally {
            request.getRequestDispatcher("SearchQuestion.jsp").forward(request, response);
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
