package MyServlets;

import java.io.*;
import java.util.*;
import java.util.regex.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.*;
import Entities.*;
import MyControllers.*;

/**
 *
 * @author Weiliang
 */
public class UploadPictureServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //make sure that the HTTP request is encoded in multipart format
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        boolean success = false;
        UploadController uploadpicture = new UploadController();
        //if request is not multipart
        if (!isMultipart) {
            System.out.println("File Not Uploaded");
        } else { //else request is multipart, parse the form data contained in the HTTP request
            ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
            List items = null;

            /**
             * items contain a list of file items that may contain
             * an uploaded file or a simple name-value pair of a form field.
             */
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }

            //iterate through file items, process items
            Iterator itr = items.iterator();
            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();

                /**
                 * If file item contains a simple name-value pair of an ordinary
                 * form field, we retrieve its name and value using the getFieldName()
                 * method and the getString() method respectively
                 */
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString();
                    System.out.println("name: " + name + ", value: " + value);
                } else {
                    try {
                        String itemName = item.getName();
                        /**
                         * create a random sequence of integers which will be appended
                         * behind filename to different files with same name
                         */
                        Random generator = new Random();
                        int r = Math.abs(generator.nextInt());

                        /**
                         * this section of code appends the random sequence of integers
                         * created before to the filename
                         */
                        String reg = "[.*]";
                        String replacingtext = "";
                        Pattern pattern = Pattern.compile(reg);
                        Matcher matcher = pattern.matcher(itemName);
                        StringBuffer buffer = new StringBuffer();
                        while (matcher.find()) {
                            matcher.appendReplacement(buffer, replacingtext);
                        }
                        int IndexOf = itemName.indexOf(".");                    //position of last character before period.
                        String domainName = itemName.substring(IndexOf);        //get domain of file eg .jpg
                        String finalName = buffer.toString() + "_" + r + domainName;

                        File savedFile = new File("C:/Users/Flyzz/Desktop/GWT alt version 0.5/GoWhereToday/build/web/articleImages\\" + finalName);
                        item.write(savedFile);
//                        File savedFile1 = new File("C:/Users/Flyzz/Documents/NetBeansProjects/GoWhereToday/web/articleImages\\" + finalName);
//                        item.write(savedFile1);

                        /**
                         * link to override - paste your link in this comment section
                         * Weiliang - C:/Users/Weiliang/Desktop/GoWhereToday/build/web/articleImages\\
                         */
                        success = uploadpicture.UploadPic(finalName);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
            if (success) {
                Cookie cookie = new Cookie("DWTpicture", "success");
                cookie.setMaxAge(10);
                cookie.setPath("/GoWhereToday");
                response.addCookie(cookie);
                response.sendRedirect("../UploadPicture.jsp#");
            } else {
                Cookie cookie = new Cookie("DWTpicture", "fail");
                cookie.setMaxAge(10);
                cookie.setPath("/GoWhereToday");
                response.addCookie(cookie);
                response.sendRedirect("../UploadPicture.jsp#");
            }
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
