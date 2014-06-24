package MyServlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import MyControllers.ControlPanelController;

/**
 *
 * @author jasonlv
 */
public class ControlPanelServlet extends HttpServlet {
   
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
            //String array to store all the attribute
            String[] newUserInfo = new String[6];
            newUserInfo[0] = request.getParameter("newFullName");
            newUserInfo[1] = request.getParameter("newGender");
            newUserInfo[2] = request.getParameter("newPwd");
            newUserInfo[3] = request.getParameter("BirthDate");
            newUserInfo[4] = request.getParameter("newAboutMe");
            newUserInfo[5] = request.getParameter("Email");

            ControlPanelController con = new ControlPanelController();
            if(con.updateUserInfo(newUserInfo)){
                declareSuccess(response);
            }else{
                declareFailure(response);
            }
        } finally { 
            out.close();
        }
    }

    private void declareSuccess(HttpServletResponse response){
        try {
            Cookie success = new Cookie("GWTupdate", "success");
            success.setMaxAge(2);
            success.setPath("/GoWhereToday");
            response.addCookie(success);
            response.sendRedirect("../ControlPanel.jsp#");
        } catch (IOException iOException) {
            iOException.printStackTrace();
        }
    }

    private void declareFailure(HttpServletResponse response){
        try {
            Cookie fail = new Cookie("GWTupdate", "failure");
            fail.setMaxAge(2);
            fail.setPath("/GoWhereToday");
            response.addCookie(fail);
            response.sendRedirect("../ControlPanel.jsp#");
        } catch (IOException iOException) {
            iOException.printStackTrace();
        }
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
        return "The servlet that collects new userinfo and update the database";
    }// </editor-fold>

}
