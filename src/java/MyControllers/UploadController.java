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
public class UploadController {

    public boolean UploadPic(String finalName) {
        WriteArticleController article = new WriteArticleController();
        int ID = article.getArticleID(); //get ID of last created article
        DBDriver db = new DBDriver();
        return db.executeUpdate("INSERT INTO pictures (articleID, ref_pic) VALUES ('" + ID + "', '" + finalName + "')");
    }
}
