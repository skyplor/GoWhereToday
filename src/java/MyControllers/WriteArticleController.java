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
public class WriteArticleController {

    /**
     * createArticle() will produce the sql query to insert the article into the
     * database. It does so in three main steps - 1.insert into article table, 2.retrieve
     * article's id, 3.insert into category table.
     */
    public boolean createArticle(Article article) {
        //instantiate a new database object
        DBDriver db = new DBDriver();
        String sqlQuery;
        String temp;
        boolean errorFlag = true;

        //1. insert into article table
        sqlQuery = "INSERT INTO articles (name, address, postalCode, region, "
                + "location, timingWd, timingSat, timingPh, budget, telNo, email, "
                + "website, description, articleDate, username, approved, startDate, endDate) VALUES (";
        //traverse articleInfo array and retrieve variables to concat into sqlQuery
        for (int i = 0; i < article.getLength() - 3; i++) {
            if (article.getPara(i).equals("")) { //if there is nothing in array location
                temp = null;
            } else { //array location contains input data
                temp = article.getPara(i);
            }
            sqlQuery += "'" + temp + "', ";
            //concat the input data behind sqlQuery
        }
        //the next two lines changes the last character in the string
        int pos = sqlQuery.lastIndexOf(",");
        sqlQuery = sqlQuery.substring(0, pos) + ")";
        //actual insertion into articles table
        errorFlag = db.executeUpdate(sqlQuery);

        //2. get the ID for the article that was just created, it is inserted into next table

        int ID = getArticleID();

        //3. insert into category table
        if (errorFlag == true) {
            for (int i = 0; i < article.getCategoryLength(); i++) {
                sqlQuery = "INSERT INTO category (articleID, cname) VALUES ( '" + ID + "', ";
                temp = article.getCategory(i);
                sqlQuery += "'" + temp + "')";
                //actual insertion into category table
                errorFlag = db.executeUpdate(sqlQuery);
            }
        }
        return errorFlag;

    }
    //used only in createArticle() and returns the last article that was added in db

    public int getArticleID() {
        String sqlQuery;
        try {
            DBDriver db = new DBDriver();
            sqlQuery = "SELECT * FROM articles";
            int n = 0;

            //get articleID from the database
            Article[] result = (Article[]) db.executeQuery(sqlQuery, "ID");
            n = result[0].getID();
            return n;
        } catch (Exception e) {
            return -1;
        }
    }
}
