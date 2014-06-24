package MyServlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import Entities.*;
import MyControllers.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

/**
 *
 * @author LU0006NG
 */
public class RegistrationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("text/html;charset=UTF-8");

            //distribute the "GET" and "POST" request
            if ("GET".equalsIgnoreCase(request.getMethod())) {
                doGet(request, response);
            } else if ("POST".equalsIgnoreCase(request.getMethod())) {
                doPost(request, response);
            }
        } catch (ServletException e) {
        } catch (IOException e) {
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
        //pass every request into the doPost
        doPost(request, response);
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
        String username = request.getParameter("username");
        String passwd = request.getParameter("password");
        String emailAddr = request.getParameter("emailAddr");
        String fullName = request.getParameter("fullName");
        char gender = request.getParameter("gender").charAt(0);
        String date = request.getParameter("BirthDate");
        String remoteAddr = request.getRemoteAddr();
        ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
        reCaptcha.setPrivateKey("6LeDGroSAAAAAEL0pL_MehGtAkwc9CocNVhmwmDM");

        String challenge = request.getParameter("recaptcha_challenge_field");
        String uresponse = request.getParameter("recaptcha_response_field");
        ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

        if (reCaptchaResponse.isValid()) {
            java.sql.Date DOB = null;
            try {
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                if(!date.equalsIgnoreCase(""))
                DOB = new java.sql.Date(formatter.parse(date).getTime());
                else
                    DOB = new java.sql.Date(formatter.parse("1800-13-50").getTime());
            } catch (ParseException e) {
            }

            java.sql.Date regdate = new java.sql.Date(new java.util.Date().getTime());

            User newUser = new User(username, passwd, emailAddr, fullName, gender, DOB, regdate, "User", " ", " ");
            RegisterController control = new RegisterController();
            switch (control.checkExistence(newUser)) {
                case 0:
                    writeSuccess(response);
                    break;
                case 1:
                    writeError_Username(response);
                    break;
                case 2:
                    writeError_EmailAddr(response);
                    break;
                case 3:
                    writeError_Unknown(response);
            }
        } else {
            writeError_Captcha(response);
        }
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "servlet to check the availability of the username and email address and to add the userinfo into the database";
    }// </editor-fold>

    protected void writeSuccess(HttpServletResponse response) throws ServletException, IOException {
        Cookie regcookie = new Cookie("DWTreg", "success");
        regcookie.setMaxAge(10);
        regcookie.setPath("/GoWhereToday");
        response.addCookie(regcookie);
        response.sendRedirect("../home.jsp#");
    }

    protected void writeError_Username(HttpServletResponse response) throws ServletException, IOException {
        Cookie regcookie = new Cookie("DWTreg", "eusername");
        regcookie.setMaxAge(10);
        regcookie.setPath("/GoWhereToday");
        response.addCookie(regcookie);
        response.sendRedirect("../Registration.jsp#");
    }

    protected void writeError_EmailAddr(HttpServletResponse response) throws ServletException, IOException {
        Cookie regcookie = new Cookie("DWTreg", "eemail");
        regcookie.setMaxAge(10);
        regcookie.setPath("/GoWhereToday");
        response.addCookie(regcookie);
        response.sendRedirect("../Registration.jsp#");
    }

    protected void writeError_Captcha(HttpServletResponse response) throws ServletException, IOException {
        Cookie regcookie = new Cookie("DWTreg", "captcha");
        regcookie.setMaxAge(10);
        regcookie.setPath("/GoWhereToday");
        response.addCookie(regcookie);
        response.sendRedirect("../Registration.jsp#");
    }

    protected void writeError_Unknown(HttpServletResponse response) throws ServletException, IOException {
        Cookie regcookie = new Cookie("DWTreg", "unknown");
        regcookie.setMaxAge(10);
        regcookie.setPath("/GoWhereToday");
        response.addCookie(regcookie);
        response.sendRedirect("../Registration.jsp#");
    }
}
