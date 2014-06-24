/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package MyControllers;

import MyServlets.DBDriver;
import Entities.*;
import java.sql.SQLException;
/**
 *
 * @author Flyzz
 */
public class TopArticleController {
    public Object[] getTopArticle(String type) {
        String sqlQuery;
        try {
            DBDriver db = new DBDriver();
            sqlQuery = "SELECT * FROM articles WHERE approved='Y' AND articles.`averageRating` = (SELECT max(averageRating) FROM articles WHERE articleID IN (SELECT articleID FROM category  WHERE cname=\'" + type + "\')) AND articles.`articleID` IN (SELECT articleID FROM category  WHERE cname=\'" + type + "\')";
            Article[] result = (Article[]) db.executeQuery(sqlQuery, "article");
            return result;

        } catch (Exception e) {
            return null;
        }
    }
}
