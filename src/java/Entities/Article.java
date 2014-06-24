package Entities;

import MyServlets.*;

/**
 *
 * @author Weiliang
 */
public class Article {

    private String[] articleInfo;
    private String[] category;
    private String[] workHours;
    private int articleID;

    //constructor fof Article object.
    public Article() {
        articleInfo = new String[21];
        category = new String[31];
        workHours = new String[3];
    }

    //set article parameters
    public void setPara(int count, String attribute) {
        articleInfo[count] = attribute;
    }

    //set category inputs
    public void setCategory(String[] items) {
        category = items;
    }

    //set articleID
    public void setID(int articleID) {
        this.articleID = articleID;
    }

    public void setSpecificCategory(int count, String item) {
        category[count] = item;
    }

    public void setWorkHours(String[] item) {
        workHours = item;
    }

    public String[] getWorkHours() {
        return workHours;
    }

    public int getWorkHoursLength() {
        return workHours.length;
    }

    public String getWorkHoursInfo(int num) {
        return workHours[num];
    }

    //get article parameters
    public String getPara(int count) {
        return articleInfo[count];
    }

    //get article categories
    public String getCategory(int i) {
        return category[i];
    }

    public int getCategoryLength() {
        return category.length;
    }

    //get article categories
    public String[] getCategoryArray() {
        return category;
    }

    //get articleID
    public int getID() {
        return articleID;
    }

    public int getLength() {
        return articleInfo.length;
    }
}
