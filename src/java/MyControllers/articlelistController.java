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
public class articlelistController {

    public Object[] getArticleList(String type) {
        String sqlQuery;
        try {
            DBDriver db = new DBDriver();
            if (type.equalsIgnoreCase("All Articles")) {
                sqlQuery = "SELECT * FROM articles WHERE articleID IN (SELECT DISTINCT articleID FROM category) AND approved='Y' ORDER BY name ASC";
            } else {
                sqlQuery = "SELECT * FROM articles WHERE articleID IN (SELECT articleID FROM category  WHERE cname=\'" + type + "\') AND approved='Y' ORDER BY name ASC";
            }
            Article[] result = (Article[]) db.executeQuery(sqlQuery, "article");
            return result;

        } catch (Exception e) {
            return null;
        }
    }
}
