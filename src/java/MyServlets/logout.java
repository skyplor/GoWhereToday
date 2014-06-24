package MyServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;

public class logout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("DWT")) {
                cookies[i].setPath("/GoWhereToday");
                cookies[i].setMaxAge(0);
                response.addCookie(cookies[i]);
            }
            if (cookies[i].getName().equals("DWTuser")) {
                cookies[i].setPath("/GoWhereToday");
                cookies[i].setMaxAge(0);
                response.addCookie(cookies[i]);
            }
            if (cookies[i].getName().equals("DWTtype")) {
                cookies[i].setPath("/GoWhereToday");
                cookies[i].setMaxAge(0);
                response.addCookie(cookies[i]);
            }
        }
        response.sendRedirect("../home.jsp#");
    }
}

