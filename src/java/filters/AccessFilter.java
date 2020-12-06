
package filters;

import dtos.AccountDTO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TNM
 */
public class AccessFilter implements Filter {
    
    private static final boolean debug = true;
    private static final String ERROR = "PageError.jsp";
    private static final String LOGIN = "Login.jsp";
    

    private FilterConfig filterConfig = null;
    
    public AccessFilter() {
    }    
    
    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
    }    
    
    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
            String url = "URL";
            boolean pathRedirect = false;
            HttpServletRequest req = (HttpServletRequest)request;
            HttpServletResponse res = (HttpServletResponse)response;
            HttpSession session = req.getSession();
            AccountDTO dto = (AccountDTO)session.getAttribute("USER");
            String action = req.getParameter("action");
            String uri = req.getRequestURI();
            String resource = uri.substring(uri.lastIndexOf("/")+1);
            if(dto == null) {
//                if(action == null) {
//                    url = LOGIN;
//                    req.getRequestDispatcher(url).forward(req, res);
//                } else 
                if (resource.length()>0 && !resource.equals("AccountController")
                                               && !resource.equals("RegisterController")) {
                    pathRedirect = true;
                    url = ERROR;
                }
            } else if(dto.getRole().equals("admin")) {
                if(resource.contains("Student.jsp")||resource.contains("Record.jsp")||
                   resource.contains("QuizPage.jsp")||resource.contains("RecordController")||
                   resource.contains("QuizController")) {
                    pathRedirect = true;
                    url = ERROR;
                }
            } else {
                if(resource.contains("Admin.jsp")||resource.contains("CreateQuestion.jsp")||
                   resource.contains("SearchQuestion.jsp")||resource.contains("UpdateQuestion.jsp")||
                   resource.contains("QuestionController")||resource.contains("SearchController")) {
                    pathRedirect = true;
                    url = ERROR;
                }
            }
            if(!pathRedirect) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(url);
            }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {        
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {        
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {                
                log("AccessFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AccessFilter()");
        }
        StringBuffer sb = new StringBuffer("AccessFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }
    
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);        
        
        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);                
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");                
                pw.print(stackTrace);                
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }
    
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }
    
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);        
    }
    
}
