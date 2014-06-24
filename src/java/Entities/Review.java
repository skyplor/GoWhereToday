package Entities;

import MyServlets.*;

/**
 *
 * @author Weiliang
 */
public class Review {

    private int articleID;
    private String username;
    private String review;
    private String datetime;

    //constructor fof Article object.
    public Review() {
        articleID = 0;
        username = "";
        review = "";
        datetime = "";
    }

    //set articleID
    public void setArticleID(int id) {
        this.articleID = id;
    }

    public void setUsername(String name) {
        this.username = name;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    //get article id
    public int getArticleID() {
        return articleID;
    }

    //get username
    public String getUsername() {
        return username;
    }

    public String getReview() {
        return review;
    }

    public String getDatetime() {
        return datetime;
    }
}
