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
public class WriteArticleServlet extends HttpServlet {

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
            Article article = new Article();
            WriteArticleController write = new WriteArticleController();
            //pass parameters from request object into articleInfo array
            article.setPara(0, request.getParameter("name"));
            article.setPara(1, request.getParameter("address"));
            article.setPara(2, request.getParameter("postal"));
            if (request.getParameter("region").equals("selectRegion")) {
                article.setPara(3, "");
            } else {
                article.setPara(3, request.getParameter("region"));
            }
            if (request.getParameter("location").equals("selectLocation")) {
                article.setPara(4, "");
            } else {
                article.setPara(4, request.getParameter("location"));
            }
            String start = "o_1";
            String end = "o_2";
            article.setPara(5, checkTimeValidity(request, response, start, end));
            start = "o_3";
            end = "o_4";
            article.setPara(6, checkTimeValidity(request, response, start, end));
            start = "o_5";
            end = "o_6";
            article.setPara(7, checkTimeValidity(request, response, start, end));
            article.setPara(8, request.getParameter("budget"));
            article.setPara(9, request.getParameter("telNo"));
            article.setPara(10, request.getParameter("email"));
            article.setPara(11, request.getParameter("website"));
            article.setPara(12, request.getParameter("description"));
            java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
            article.setPara(13, date.toString());
            Cookie[] cookiesWA = request.getCookies();
            for (int i = 0; i < cookiesWA.length; i++) {
                if (cookiesWA[i].getName().equals("DWTuser")) {
                    article.setPara(14, cookiesWA[i].getValue());
                }
            }
            article.setPara(15, "N"); // set article to be hidden from all users
            article.setPara(16, checkDateValidity(request, "startDate"));
            article.setPara(17, checkDateValidity(request, "endDate"));
            //pass checkbox parameters from request object into category array
            article.setCategory(request.getParameterValues("checkInput"));

            //create a new entry in the database
            if (write.createArticle(article)) {
                Cookie cookie = new Cookie("DWTarticle", "success");
                cookie.setMaxAge(10);
                cookie.setPath("/GoWhereToday");
                response.addCookie(cookie);
                response.sendRedirect("../UploadPicture.jsp#");
            } else {
                Cookie cookie = new Cookie("DWTarticle", "fail");
                cookie.setMaxAge(10);
                cookie.setPath("/GoWhereToday");
                response.addCookie(cookie);
                response.sendRedirect("../WriteArticle.jsp#");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

     private String checkDateValidity(HttpServletRequest request, String date)
            throws ServletException, IOException {
         
         try{
            String begin = request.getParameter(date);
            if (begin!=null && !begin.isEmpty())
            {
                return begin;
            }
            else
            {
                begin="2001-01-01";
            }
          return begin;
         }

         finally {
        }
     } 
    /**
     * checkTimeValidity checks that the opening hours inputs are stored in database
     * if they were input correctly in the form. If the input was not made accurately,
     * the time will not be recorded. This method returns a String which contains the
     * time information.
     */
    private String checkTimeValidity(HttpServletRequest request, HttpServletResponse response, String start, String end)
            throws ServletException, IOException {
        try {
            String openHours = "";
            String begin = request.getParameter(start);
            String finish = request.getParameter(end);

            //if no input was made
            if (begin.equalsIgnoreCase("") || finish.equalsIgnoreCase("")) {
                openHours = "";
            } //input was made accurately
            else {
                String beginPrint = "";
                String finishPrint = "";
                String startInfo = "";
                String endInfo = "";
                String day = "";
                if (begin.length() == 4) {
                    beginPrint += begin.substring(0, 2) + ":" + begin.substring(2);
                }
                if (begin.length() == 3) {
                    beginPrint += begin.substring(0, 1) + ":" + begin.substring(1);
                }
                if (finish.length() == 4) {
                    finishPrint += finish.substring(0, 2) + ":" + finish.substring(2);
                }
                if (finish.length() == 3) {
                    finishPrint += finish.substring(0, 1) + ":" + finish.substring(1);
                }
                if (start.equals("o_1")) {
                    startInfo = "weekdayStartAmPm";
                    endInfo = "weekdayEndAmPm";
                    day = " for weekdays";
                } else if (start.equals("o_3")) {
                    startInfo = "saturdayStartAmPm";
                    endInfo = "saturdayEndAmPm";
                    day = " for Saturday";
                } else if (start.equals("o_5")) {
                    startInfo = "sundayStartAmPm";
                    endInfo = "sundayEndAmPm";
                    day = " for Sunday and public holidays";
                }
                openHours = beginPrint + " " + request.getParameter(startInfo) + " to "
                        + finishPrint + " " + request.getParameter(endInfo) + day;
            }
            return openHours;
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
