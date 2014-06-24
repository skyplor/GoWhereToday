/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class reviewArticleServlet extends HttpServlet {

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
            String review;
            int articleid;
            String username;
            String date;
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession();
            reviewArticleController reviews = new reviewArticleController();
            boolean resultReview = false;
            Review[] rs = null;
            review = request.getParameter("reviews");
            date = request.getParameter("date");
            username = request.getParameter("username");
            articleid = Integer.parseInt(request.getParameter("id"));
            resultReview = reviews.setReview(review, articleid, username, date);
            if (!resultReview) {
                out.println("Unable to review.");
            }
            rs = (Review[]) reviews.getReviewList(articleid);
            session.setAttribute("result", rs);
            String destination = "../reviewArticle.jsp?articleID=" + articleid;
            response.sendRedirect(response.encodeRedirectURL(destination));
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
            throws ServletException,
            IOException {
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
            throws ServletException,
            IOException {
        processRequest(request, response);
    }
    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
//        @Override
//        public String getServletInfo
//
//             () {
//        return "Short description";
//        }// </editor-fold>
}
