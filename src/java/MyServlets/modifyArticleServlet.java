package MyServlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import MyControllers.modifyArticleController;
import javax.servlet.http.Cookie;

/**
 *
 * @author jasonlv
 */
public class modifyArticleServlet extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            modifyArticleController mACon = new modifyArticleController();
            String rest = request.getParameter("shouldDelete");
            out.print(rest);
            if (request.getParameter("approvalDicision") != null) {
                int targetId = Integer.parseInt(request.getParameter("articleId"));
                if (request.getParameter("approvalDicision").equalsIgnoreCase("Y")) {
                    if (mACon.approveArticleById(targetId) == false) {
                        declareAppFailure(response);
                    } else {
                        declareAppSuccess(response);
                    }
                } else {
                    if (mACon.deleteArticleById(targetId) == false) {
                        declareDelFailure(response);
                    } else {
                        declareDelSuccess(response);
                    }
                }
            }
            else if (!request.getParameter("shouldDelete").equalsIgnoreCase("nth")) {
                int delId = Integer.parseInt(request.getParameter("articleId"));
                if (mACon.deleteArticleById(delId) == true) {
                    declareDelSuccess(response);
                }
            } else {
                declareDelFailure(response);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void declareDelFailure(HttpServletResponse response) throws ServletException, IOException {
        Cookie delFailCookie = new Cookie("DelArt", "fail");
        delFailCookie.setMaxAge(10);
        delFailCookie.setPath("/GoWhereToday");
        response.addCookie(delFailCookie);
        response.sendRedirect("../home.jsp#");
    }

    private void declareAppFailure(HttpServletResponse response) throws ServletException, IOException {
        Cookie modFailCookie = new Cookie("ModArt", "fail");
        modFailCookie.setMaxAge(10);
        modFailCookie.setPath("/GoWhereToday");
        response.addCookie(modFailCookie);
        response.sendRedirect("../home.jsp#");
    }

    private void declareDelSuccess(HttpServletResponse response) throws ServletException, IOException {
        Cookie delsuccessCookie = new Cookie("DelArt", "success");
        delsuccessCookie.setMaxAge(10);
        delsuccessCookie.setPath("/GoWhereToday");
        response.addCookie(delsuccessCookie);
        response.sendRedirect("../ControlPanel.jsp#");
    }

    private void declareAppSuccess(HttpServletResponse response) throws ServletException, IOException {
        Cookie modSuccessCookie = new Cookie("ModArt", "success");
        modSuccessCookie.setMaxAge(10);
        modSuccessCookie.setPath("/GoWhereToday");
        response.addCookie(modSuccessCookie);
        response.sendRedirect("../ControlPanel.jsp#");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
