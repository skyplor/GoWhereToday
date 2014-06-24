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
public class reviewArticleController {


    public Object[] getReviewList(int ID) {
        String sqlQuery;
        try {
            DBDriver db = new DBDriver();
            sqlQuery = "SELECT * FROM reviews WHERE articleID = " + ID;
            Review[] result = (Review[]) db.executeQuery(sqlQuery, "reviews");
            return result;

        } catch (Exception e) {
            return null;
        }
    }

    public boolean setReview(String review, int ID, String username, String date) {
        boolean flagreview = false;
        try {
            //instantiate a new database object
            DBDriver db = new DBDriver();
            String sqlQuery;
            sqlQuery = "INSERT INTO reviews (articleID, username, review, datetime) VALUES ( '" + ID + "', '" + username + "', '" + review + "', '" + date + "' )";
            flagreview = db.executeUpdate(sqlQuery);
        } catch (Exception e) {
            return flagreview;
        }
        return flagreview;
    }
}
