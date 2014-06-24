package MyServlets;

import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
import java.io.PrintWriter;
import Entities.*;
import MyControllers.*;

public class ValidateLogin extends HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) {
        try {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html;charset=UTF-8");
            out.println("getting");
            if ("GET".equalsIgnoreCase(request.getMethod())) {
                out.println("get");
                doGet(request, response);
            } else if ("POST".equalsIgnoreCase(request.getMethod())) {
                out.println("post");
                doPost(request, response);
            }
        } catch (ServletException e) {
        } catch (IOException e) {
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        //pass every request into the doPost
        out.println("doget");
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println("dopost");

        response.setContentType("text/html");
        try {
            String userEmail = request.getParameter("Email");
            String userPwd = request.getParameter("Password");
            ValidateController validate = new ValidateController();
            User result = validate.ValidateInfo(userEmail, userPwd);
            if (result != null) {
                Cookie cookie = new Cookie("DWT", "true");
                cookie.setMaxAge(3600);
                cookie.setPath("/GoWhereToday");
                response.addCookie(cookie);
                Cookie ucookie = new Cookie("DWTuser", result.getUsername());
                ucookie.setMaxAge(3600);
                ucookie.setPath("/GoWhereToday");
                response.addCookie(ucookie);
                Cookie tcookie = new Cookie("DWTtype", result.getUserType());
                tcookie.setMaxAge(3600);
                tcookie.setPath("/GoWhereToday");
                response.addCookie(tcookie);
                Cookie killhomec = new Cookie("DWTreg", "");
                killhomec.setPath("/GoWhereToday");
                killhomec.setMaxAge(0);
                response.addCookie(killhomec);
                response.sendRedirect("../home.jsp#");
            } else {
                Cookie cookie = new Cookie("DWT", "false");
                cookie.setMaxAge(3600);
                cookie.setPath("/GoWhereToday");
                response.addCookie(cookie);
                response.sendRedirect("../home.jsp#");
            }
        } catch (Exception e) {
            out.println("Exception is ;" + e);
        }
    }
}
