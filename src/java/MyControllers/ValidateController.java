/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package MyControllers;

import Entities.*;
import MyServlets.DBDriver;
/**
 *
 * @author Flyzz
 */
public class ValidateController {

    public User ValidateInfo(String userEmail, String userPwd) {
        try {
            String sqlString;
            DBDriver db = new DBDriver();
            sqlString = "SELECT * from userinfo";
            User[] result = (User[]) db.executeQuery(sqlString, "user");
            for (int y = 0; y < result.length; y++) {
            if (result[y].getEmailAddr().equals(userEmail)) {
                    if (result[y].getEmailAddr().equals(userEmail) && result[y].getPassword().equals(userPwd)) {
                        User user = result[y];
                        return user;
                    }
                }
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }

}
