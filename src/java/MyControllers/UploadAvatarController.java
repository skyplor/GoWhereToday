package MyControllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import java.io.*;
import MyServlets.DBDriver;

/**
 *
 * @author jasonlv
 */
public class UploadAvatarController {
    public static void uploadAvatar(HttpServletRequest request, HttpServletResponse response){
        try {
            //to get the content type information from JSP Request Header
            String contentType = request.getContentType();

            /** here we are checking the content type is not equal to Null and
            as well as the passed data from mulitpart/form-data is greater than or
            equal to 0
             */
            if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
                DataInputStream in = new DataInputStream(request.getInputStream());

                //get the username with the cookies
                Cookie[] myCookies = request.getCookies();
                String username = "";
                for (int count0 = 0; count0 < myCookies.length; count0++) {
                    if (myCookies[count0].getName().equalsIgnoreCase("DWTUser")) {
                        username = myCookies[count0].getValue();
                    }
                }

                //we are taking the length of Content type data
                int formDataLength = request.getContentLength();
                byte dataBytes[] = new byte[formDataLength];
                int byteRead = 0;
                int totalBytesRead = 0;
                //this loop converting the uploaded file into byte code
                while (totalBytesRead < formDataLength) {
                    byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                    totalBytesRead += byteRead;
                }

                String file = new String(dataBytes);
                //for saving the file name
                String bufferName = file.substring(file.indexOf("filename=\"") + 10);
                bufferName = bufferName.substring(0, bufferName.indexOf("\n"));
                bufferName = bufferName.substring(bufferName.lastIndexOf("\\")
                        + 1, bufferName.indexOf("\""));

                //append a random number to the bufferName
                int randomNo = (int) (Math.random() * 100000);
                int position = bufferName.lastIndexOf(".");
                String finalName = bufferName.substring(0, position) + randomNo
                        + bufferName.substring(position);

                int lastIndex = contentType.lastIndexOf("=");
                String boundary = contentType.substring(lastIndex + 1, contentType.length());
                int pos;
                //extracting the index of file
                pos = file.indexOf("filename=\"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                int boundaryLocation = file.indexOf(boundary, pos) - 4;
                int startPos = ((file.substring(0, pos)).getBytes()).length;
                int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

                // creating a new file with the same name and writing the content in new file
                FileOutputStream fileOut = new FileOutputStream("C:/Users/Flyzz/Documents/NetBeansProjects/GoWhereToday/build/web/Avatars\\" + finalName);
                fileOut.write(dataBytes, startPos, (endPos - startPos));
                fileOut.flush();
                fileOut.close();
                FileOutputStream fileOut1 = new FileOutputStream("C:/Users/Flyzz/Documents/NetBeansProjects/GoWhereToday/web/Avatars\\" + finalName);
                fileOut1.write(dataBytes, startPos, (endPos - startPos));
                fileOut1.flush();
                fileOut1.close();

                DBDriver db = new DBDriver();

                if (username.equalsIgnoreCase("")) {
                    declareFailure(response);
                } else {
                    String sqlQuery = "UPDATE userinfo SET avatar = \"" + finalName + "\" WHERE username = \"" + username + "\"";
                    if (db.executeUpdate(sqlQuery)) {
                        declareSuccess(response);
                    }
                }
            } else {
                declareFailure(response);
            }
        } catch (Exception exception) {
            declareFailure(response);
        }
    }

    public static void declareSuccess(HttpServletResponse response) {
        try {
            Cookie cookie = new Cookie("UserAvatar", "success");
            cookie.setMaxAge(2);
            cookie.setPath("/GoWhereToday");
            response.addCookie(cookie);
            response.sendRedirect("../ControlPanel.jsp#");
        } catch (IOException iOException) {
            iOException.printStackTrace();
        }
    }

    public static void declareFailure(HttpServletResponse response) {
        try {
            Cookie cookie = new Cookie("UserAvatar", "failure");
            cookie.setMaxAge(2);
            cookie.setPath("/GoWhereToday");
            response.addCookie(cookie);
            response.sendRedirect("../ControlPanel.jsp#");
        } catch (IOException iOException) {
            iOException.printStackTrace();
        }
    }
}
