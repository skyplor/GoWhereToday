package MyServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import Entities.*;

/**
 *
 * @author Timothy
 */
public class DWT2Servlet extends HttpServlet {

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
            int position = 0;
            String[] id = request.getParameterValues("filter");
            Article[] filteredSet = new Article[id.length];
            HttpSession session = request.getSession();
            Article[] rs = (Article[]) session.getAttribute("DWTresult");
            for(int i=0; i<id.length; i++){
                for(int j=0; j<rs.length; j++){
                    if(Integer.parseInt(id[i]) == rs[j].getID())
                        filteredSet[i]=rs[j];
                }
            }
            session.setAttribute("DWTfiltered", filteredSet);
            response.sendRedirect("../DWT3.jsp#");

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
