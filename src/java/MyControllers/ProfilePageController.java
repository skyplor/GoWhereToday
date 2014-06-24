
package MyControllers;

import MyServlets.DBDriver;
import Entities.*;
import java.sql.SQLException;
/**
 *
 * @author jasonlv
 */
public class ProfilePageController {

    public User findUserByUsername(String name){
        try {
            DBDriver db = new DBDriver();
            String sqlString = "SELECT * FROM UserInfo WHERE username=\"" + name + "\"";
            User[] result = (User[]) db.executeQuery(sqlString, "user");
            return result[0];
        } catch (SQLException e) {
            System.out.println("SQLException!" + e.getMessage());
            return null;
        } catch (ClassNotFoundException e) {
            System.out.println("Class not found!" + e.getMessage());
            return null;
        }
    }

    public Article[] findArticleByUsername(String name){
        try {
            DBDriver db = new DBDriver();
            String sqlString = "SELECT * FROM articles WHERE username=\"" + name + "\"AND approved='Y'";
            Article[] result = (Article[]) db.executeQuery(sqlString, "article");
            return result;
        } catch (SQLException e) {
            System.out.println("SQLException!" + e.getMessage());
            return null;
        } catch (ClassNotFoundException e) {
            System.out.println("Class not found!" + e.getMessage());
            return null;
        }
    }
    public Article[] findAllArticleByUsername(String name){
        try {
            DBDriver db = new DBDriver();
            String sqlString = "SELECT * FROM articles WHERE username=\"" + name + "\"";
            Article[] result = (Article[]) db.executeQuery(sqlString, "article");
            return result;
        } catch (SQLException e) {
            System.out.println("SQLException!" + e.getMessage());
            return null;
        } catch (ClassNotFoundException e) {
            System.out.println("Class not found!" + e.getMessage());
            return null;
        }
    }
}
