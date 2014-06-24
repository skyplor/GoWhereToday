package MyControllers;

import MyServlets.DBDriver;

/**
 *
 * @author jasonlv
 */
public class modifyArticleController {
    public boolean deleteArticleById(int delId){
        DBDriver db = new DBDriver();
        String sqlQuery = "DELETE FROM articles WHERE articleID = " + delId;
        return db.executeUpdate(sqlQuery);
    }
    public boolean approveArticleById(int targetId){
        DBDriver db = new DBDriver();
        String sqlQuery = "UPDATE articles SET approved = \'Y\' WHERE articleID = " + targetId;
        return db.executeUpdate(sqlQuery);
    }
}
