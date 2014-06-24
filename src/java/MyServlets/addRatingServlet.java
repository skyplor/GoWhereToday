package MyServlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import Entities.*;
import MyControllers.*;

/**
 *
 * @author Sky
 */
public class addRatingServlet extends HttpServlet {

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
        try {
            double rateval;
            int articleid;
            String username;

            addRatingController article = new addRatingController();
            rateval = Double.parseDouble(request.getParameter("rating"));
            articleid = Integer.parseInt(request.getParameter("id"));
            username = request.getParameter("username");
            Article[] result = (Article[])article.setRating(rateval,articleid,username);
            if(result[0].getPara(1).equals("Y")){
            String destination = "../addcode.jsp?articleID="+result[0].getID()+"&count="+result[0].getPara(15)+"&avg="+result[0].getPara(14)+"&suc=Y";
            response.sendRedirect(response.encodeRedirectURL(destination));
            }
            else{
            String destination = "../addcode.jsp?articleID="+result[0].getID()+"&count="+result[0].getPara(15)+"&avg="+result[0].getPara(14)+"&suc=N";
            response.sendRedirect(response.encodeRedirectURL(destination));
            }

        } catch (Exception e) {
            e.printStackTrace();
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
        return "Short description";
    }// </editor-fold>
}
