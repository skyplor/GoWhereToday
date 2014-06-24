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
public class ViewArticleController {

    public Object[] getArticleInfo(int id) {
        String sqlQuery;
        try {
            DBDriver db = new DBDriver();
            sqlQuery = "SELECT * FROM articles WHERE articleID=" + id;
            Article[] result = (Article[]) db.executeQuery(sqlQuery, "article");
            return result;

        } catch (Exception e) {
            return null;
        }
    }

    public Object[] getArticlePic(int id) {
        String sqlQuery;
        try {
            DBDriver db = new DBDriver();
            sqlQuery = "SELECT * FROM pictures WHERE articleID=" + id;
            Article[] result = (Article[]) db.executeQuery(sqlQuery, "pictures");
            return result;

        } catch (Exception e) {
            return null;
        }
    }
    public Object[] getArticleCat(int id) {
        String sqlQuery;
        try {
            DBDriver db = new DBDriver();
            sqlQuery = "SELECT * FROM category WHERE articleID=" + id;
            Article[] result = (Article[]) db.executeQuery(sqlQuery, "category");
            return result;
        } catch (Exception e) {
            return null;
        }
    }
}
