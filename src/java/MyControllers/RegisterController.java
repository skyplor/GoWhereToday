/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MyControllers;

import Entities.*;
import MyServlets.DBDriver;
import java.sql.SQLException;

/**
 *
 * @author Flyzz
 */
public class RegisterController {

    public int checkExistence(User newUser) {
        //returns an integer value, 0 means success, i.e.username/email doesn't exist,
        //1 for existence of username,
        //2 for existence of email address
        try {
            String sqlString; // string to represent the SQL statement
            DBDriver driver = new DBDriver();
            int result;

            //constructing the SQL statement
            sqlString = "SELECT * FROM UserInfo WHERE username=\"" + newUser.getUsername() + "\"";
            User[] results = (User[]) driver.executeQuery(sqlString, "user");
            if (results == null) { //changes
                result = 0;
            } else {
                result = 1;
                return result;
            }

            //checking the existence of the email address
            sqlString = "SELECT * FROM UserInfo WHERE EmailAdd=\"" + newUser.getEmailAddr() + "\"";
            User[] results1 = (User[]) driver.executeQuery(sqlString, "user");
            if (results1 == null) { //changes
                result = 0;
            } else {
                result = 2;
                return result;
            }
            if (result == 0) {
                if (addUser(newUser)) {
                    return 0;
                } else {
                    return 3;
                }
            }
            return result;
        } catch (SQLException sQLException) {
            return 3;
        } catch (ClassNotFoundException classNotFoundException) {
            return 3;
        }
    }

    public boolean addUser(User newUser) {
        String sqlString = "INSERT INTO userinfo (full_name, EmailAdd, DOB, gender, password, registration_date, username, user_type, avatar)";
        sqlString += " VALUES ('" + newUser.getFullName() + "', " + "'" + newUser.getEmailAddr() + "', " + "'" + newUser.getDOB() + "', " + "'" + newUser.getGender() + "', " + "'" + newUser.getPassword() + "', " + "'" + newUser.getRegDate() + "', " + "'" + newUser.getUsername() + "', " + "'User'" + ",'defaultAvatar.png')";

        DBDriver driver = new DBDriver();
        if (driver.executeUpdate(sqlString)) {
            return true;
        } else {
            return false;
        }
    }
}
