
package controllers;

import daos.AccountDAO;
import dtos.AccountDTO;
import dtos.AccountInvalidObj;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import utils.Utilities;

/**
 *
 * @author TNM
 */
public class RegisterController extends HttpServlet {

    private static Logger LOGGER = Logger.getLogger(RegisterController.class);
    private static final String SUCCESS = "Login.jsp";
    private static final String INVALID = "Register.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = INVALID;
        try {
            boolean valid = true;
            String id = request.getParameter("txtEmail");
            String password = request.getParameter("txtPassword");
            String name = request.getParameter("txtName");
            String passwordConfirm = request.getParameter("txtPasswordConfirm");
            AccountInvalidObj obj = new AccountInvalidObj();
            AccountDAO dao = new AccountDAO();
            if (!id.matches("[a-zA-Z0-9]{6,20}@fpt\\.edu\\.vn")) {
                valid = false;
                obj.setErrorEmail("Invalid Email.");
            }
            if (dao.findAccount(id) != null) {
                valid = false;
                obj.setErrorEmail("This Email has already been registered.");
            }
            if (password.length() < 6 || password.length() > 12) {
                valid = false;
                obj.setErrorPassword("Password must be between 6 - 12 characters.");
            } else if (!password.matches("[a-zA-Z0-9]{6,12}")) {
                valid = false;
                obj.setErrorPassword("Password can only contains numbers and letters.");
            } else if (!password.equals(passwordConfirm)) {
                valid = false;
                obj.setErrorPassword("Confirm password is incorrect.");
            }
            if (name.isEmpty()) {
                valid = false;
                obj.setErrorName("Name cannot be blank.");
            }
            if (valid) {
                id = id.toLowerCase();
                String encryptedPassword = Utilities.encryptPassword(password);
                AccountDTO dto = new AccountDTO(id, encryptedPassword, name, "Student", 1);
                if (dao.registerNewStudent(dto)) {
                    url = SUCCESS;
                } else {
                    LOGGER.error("\nFailed to register account");
                    request.setAttribute("ERROR", "An error has occured, please try again.");
                }
            } else {
                request.setAttribute("INVALID", obj);
            }
        } catch (Exception e) {
            log("Error at RegisterController: " + e.getMessage());
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
