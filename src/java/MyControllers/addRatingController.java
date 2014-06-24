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
public class addRatingController {
    public Object[] setRating(double rate, int ID, String name) {
        Article[] result = null;
        Article[] article = null;
        boolean flag = false, flagRate = false;
        try {
            //instantiate a new database object
            DBDriver db = new DBDriver();
            String sqlQuery1, sqlQuery2, sqlQuery3;
            sqlQuery1 = "SELECT * FROM articles WHERE articleID=" + ID;
            result = (Article[]) db.executeQuery(sqlQuery1, "article");
            int numrating = Integer.parseInt(result[0].getPara(15));
            double accumrating = Double.parseDouble(result[0].getPara(16));
            int newnumrating = numrating + 1;
            double newaccumrating = accumrating + rate;
            double newavgrating = newaccumrating / newnumrating;

            sqlQuery3 = "INSERT INTO rating VALUES ( '" + ID + "', '" + name + "' )";
            flagRate = db.executeUpdate(sqlQuery3);
            if (!flagRate) {
                result[0].setPara(1, "N");
                return result;
            } else {
                // insert rating
                sqlQuery2 = "UPDATE articles SET averageRating=" + newavgrating + ",numRatings=" + newnumrating + ",accumRating=" + newaccumrating + " WHERE articleID = " + ID;
                //actual insertion into table
                flag = db.executeUpdate(sqlQuery2);
                if (flag) {
                    article = (Article[]) db.executeQuery(sqlQuery1, "article");
                    article[0].setPara(1, "Y");
                    return article;
                } else {
                    result[0].setPara(1, "N");
                    return result;
                }
            }
        } catch (Exception e) {
            result[0].setPara(1, "N");
            return result;
        }
    }
}
