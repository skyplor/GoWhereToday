package MyControllers;

import Entities.*;
import MyServlets.DBDriver;
import java.sql.SQLException;
/**
 *
 * @author jasonlv
 */
public class ControlPanelController {
    public Article[] getUnapprovedArticles(){
        String sqlQeury = "SELECT * FROM articles WHERE approved=\'N\'";
        DBDriver db = new DBDriver();
        try {
            Article[] results = (Article[]) db.executeQuery(sqlQeury, "article");
            return results;
        } catch (SQLException sQLException) {
            System.out.println(sQLException.getMessage());
            return null;
        } catch (ClassNotFoundException classNotFoundException) {
            System.out.println(classNotFoundException.getMessage());
            return null;
        }
    }

    public boolean updateUserInfo(String[] newInfo){
        StringBuffer buffer = new StringBuffer("UPDATE userinfo SET WHERE EmailAdd = \"" + newInfo[5] + "\"");
        DBDriver db = new DBDriver();
        String sqlQuery;
        if(!newInfo[0].equalsIgnoreCase("")){
            buffer = processSQL(buffer, "full_name", newInfo[0]);
        }
        if(newInfo[1] != null){
            buffer = processSQL(buffer, "gender", newInfo[1]);
        }
        if(!newInfo[2].equalsIgnoreCase("")){
            buffer = processSQL(buffer, "password", newInfo[2]);
        }
        if(!newInfo[3].equalsIgnoreCase("")){
            buffer = processSQL(buffer, "DOB", newInfo[3]);
        }
        //error prone since the user cannot write anything begins with this string....
        if(!newInfo[4].equalsIgnoreCase("")){
            buffer = processSQL(buffer, "aboutMe", newInfo[4]);
        }
        
        int position = buffer.indexOf("WHERE");
        // to address the problem in method processSQL
        buffer.setCharAt(position - 2, ' ');
        sqlQuery = buffer.toString();
        if(!db.executeUpdate(sqlQuery)) return false;
        else return true;
    }

    private StringBuffer processSQL(StringBuffer buffer, String attribute, String value){
        int position = buffer.indexOf("WHERE");
        // for every attribute, a comma is added, the last comma is gonna screw up the query
        buffer.insert(position, attribute + " = \"" + value + "\", ");
        return buffer;
    }
}
