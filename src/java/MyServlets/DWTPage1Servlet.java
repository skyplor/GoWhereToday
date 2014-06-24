package MyServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import Entities.*;
import MyControllers.*;

/**
 *
 * @author Weiliang
 */
public class DWTPage1Servlet extends HttpServlet {

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
            Article article[] = new Article[8];
            Article categoryArticle = new Article();
            int categoryPos = 1;
            int articlePos = 0;

            if (request.getParameter("typeArts") != null) {
                Article temp = new Article();
                categoryArticle.setSpecificCategory(categoryPos++, "Arts");
                temp.setPara(0, request.getParameter("regionArts"));
                temp.setPara(1, request.getParameter("locationArts"));
                temp.setPara(2, request.getParameter("budgetArts"));
                temp.setWorkHours(request.getParameterValues("workHoursArts"));
                temp.setCategory(request.getParameterValues("subCateArts"));
                article[articlePos] = temp;
                articlePos++;
            }

            if (request.getParameter("typeFB") != null) {
                Article temp = new Article();
                categoryArticle.setSpecificCategory(categoryPos++, "Food & Beverage");
                temp.setPara(0, request.getParameter("regionFB"));
                temp.setPara(1, request.getParameter("locationFB"));
                temp.setPara(2, request.getParameter("budgetFB"));
                temp.setWorkHours(request.getParameterValues("workHoursFB"));
                temp.setCategory(request.getParameterValues("subCateFB"));
                article[articlePos] = temp;
                articlePos++;
            }

            if (request.getParameter("typeLeisure") != null) {
                Article temp = new Article();
                categoryArticle.setSpecificCategory(categoryPos++, "Leisure");
                temp.setPara(0, request.getParameter("regionLeisure"));
                temp.setPara(1, request.getParameter("locationLeisure"));
                temp.setPara(2, request.getParameter("budgetLeisure"));
                temp.setWorkHours(request.getParameterValues("workHoursLeisure"));
                article[articlePos] = temp;
                articlePos++;
            }

            if (request.getParameter("typePOI") != null) {
                Article temp = new Article();
                categoryArticle.setSpecificCategory(categoryPos++, "Places of Interest");
                temp.setPara(0, request.getParameter("regionPOI"));
                temp.setPara(1, request.getParameter("locationPOI"));
                temp.setPara(2, request.getParameter("budgetPOI"));
                temp.setWorkHours(request.getParameterValues("workHoursPOI"));
                article[articlePos] = temp;
                articlePos++;
            }

            if (request.getParameter("typeNightlife") != null) {
                Article temp = new Article();
                categoryArticle.setSpecificCategory(categoryPos++, "Nightlife");
                temp.setPara(0, request.getParameter("regionNightlife"));
                temp.setPara(1, request.getParameter("locationNightlife"));
                temp.setPara(2, request.getParameter("budgetNightlife"));
                temp.setWorkHours(request.getParameterValues("workHoursNightlife"));
                article[articlePos] = temp;
                articlePos++;
            }

            if (request.getParameter("typeShopping") != null) {
                Article temp = new Article();
                categoryArticle.setSpecificCategory(categoryPos++, "Shopping");
                temp.setPara(0, request.getParameter("regionShopping"));
                temp.setPara(1, request.getParameter("locationShopping"));
                temp.setPara(2, request.getParameter("budgetShopping"));
                temp.setWorkHours(request.getParameterValues("workHoursShopping"));
                temp.setCategory(request.getParameterValues("subCateShopping"));
                article[articlePos] = temp;
                articlePos++;
            }

            if (request.getParameter("typeSports") != null) {
                Article temp = new Article();
                categoryArticle.setSpecificCategory(categoryPos++, "Sports");
                temp.setPara(0, request.getParameter("regionSports"));
                temp.setPara(1, request.getParameter("locationSports"));
                temp.setPara(2, request.getParameter("budgetSports"));
                temp.setWorkHours(request.getParameterValues("workHoursSports"));
                article[articlePos] = temp;
                articlePos++;
            }

            if (request.getParameter("typeEvents") != null) {
                Article temp = new Article();
                categoryArticle.setSpecificCategory(categoryPos++, "Events");
                temp.setPara(0, request.getParameter("regionEvents"));
                temp.setPara(1, request.getParameter("locationEvents"));
                temp.setPara(2, request.getParameter("budgetEvents"));
                if (request.getParameter("Year") != null && request.getParameter("Month") != null && request.getParameter("Day") != null) {
                    String date = request.getParameter("Year") + "-" + request.getParameter("Month") + "-" + request.getParameter("Day");
                    temp.setPara(3, date);
                }
                temp.setCategory(request.getParameterValues("CateEvents"));
                article[articlePos] = temp;
                articlePos++;
            }

            categoryArticle.setSpecificCategory(0, Integer.toString(categoryPos - 1));
            DWTPage1Controller control = new DWTPage1Controller();
            Article[] result = (Article[]) control.getDocuments(categoryArticle, article);
            HttpSession session = request.getSession();
            session.setAttribute("DWTresult", result);
            response.sendRedirect("../DWT2.jsp#");
        } finally {
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
