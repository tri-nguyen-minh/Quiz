package controllers;

import daos.AccountDAO;
import dtos.AccountDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import utils.Utilities;

/**
 *
 * @author TNM
 */
public class AccountController extends HttpServlet {

    private static Logger LOGGER = Logger.getLogger(AccountController.class);
    private static final String FAILED = "Login.jsp";
    private static final String REGISTER = "Register.jsp";
    private static final String ADMIN = "Admin.jsp";
    private static final String STUDENT = "Student.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = FAILED;
        try {
            HttpSession session = request.getSession();
            String action = request.getParameter("action");
            if (action.equals("Login")) {
                String id = request.getParameter("txtId").toLowerCase();
                String password = Utilities.encryptPassword(request.getParameter("txtPassword"));
                AccountDAO dao = new AccountDAO();
                String role = dao.checkLogin(id, password);
                if (!role.equals("failed")) {
                    AccountDTO dto = dao.findAccount(id);
                    if (dto.getStatus() == 2) {
                        LOGGER.debug("good to go");
                        session.setAttribute("USER", dto);
                        if (role.equals("admin")) {
                            url = ADMIN;
                        } else {
                            url = STUDENT;
                        }
                    } else if (dto.getStatus() == 3) {
                        request.setAttribute("FAILED", "The account is no longer available");
                    } else {
                        request.setAttribute("FAILED", "The account has not been activated");
                    }
                } else {
                    request.setAttribute("FAILED", "Your username or password is incorrect");
                }
            } else if (action.equals("Register")) {
                url = REGISTER;
                request.setAttribute("action", action);
            } else {
                session = request.getSession();
                session.setAttribute("USER", null);
                session.setAttribute("QUESTIONLIST", null);
            }
        } catch (Exception e) {
            LOGGER.error("\n" + e.getMessage());
            log("Error at AccountController: " + e.getMessage());
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
