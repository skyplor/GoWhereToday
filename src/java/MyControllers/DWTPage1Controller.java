package MyControllers;

import Entities.*;
import MyServlets.*;

/**
 *
 * @author Weiliang
 */
public class DWTPage1Controller {

    public Object[] getDocuments(Article categoryArticle, Article articles[]) {
        DBDriver db = new DBDriver();
        String sqlQuery = "";
        String categoryName = "";
        String categoryInfo[] = categoryArticle.getCategoryArray();
        int numOfCate = Integer.parseInt(categoryInfo[0]);

        Article[] result = new Article[1];
        result[0] = new Article();
        result[0].setPara(0, Integer.toString(numOfCate));
        int lastCategoryPos = 1;

        for (int i = 0; i < numOfCate; i++) {
            sqlQuery = "SELECT DISTINCT A.articleID, A.name, A.description, A.averageRating, A.timingWd, A.timingSat, A.timingPh, A.startDate, A.endDate FROM ";
            //Arts
            if (categoryInfo[i + 1].equalsIgnoreCase("Arts")) {
                categoryName = "Arts";
                if (articles[i].getCategoryArray() == null) {
                    sqlQuery += "articles AS A, category AS C WHERE A.articleID=C.articleID AND C.cname='" + categoryName + "' AND ";
                } else {
                    sqlQuery += "articles AS A, category AS C, category AS D WHERE A.articleID=C.articleID AND A.articleID=D.articleID AND (";
                    for (int j = 0; j < articles[i].getCategoryLength(); j++) {
                        String cateInfo = articles[i].getCategory(j);
                        sqlQuery += "(C.cname='" + categoryName + "' AND D.cname='" + cateInfo + "') OR ";
                    }
                    int pos = sqlQuery.lastIndexOf(") OR ");
                    sqlQuery = sqlQuery.substring(0, pos) + ")) AND ";
                }
                if (!(articles[i].getPara(0)).equalsIgnoreCase("selectRegion")) {
                    sqlQuery += "region='" + articles[i].getPara(0) + "' AND ";
                }
                if (!(articles[i].getPara(1)).equalsIgnoreCase("selectLocation")) {
                    sqlQuery += "location='" + articles[i].getPara(1) + "' AND ";
                }
                if (articles[i].getPara(2).equalsIgnoreCase("$$$$$")) {
                    sqlQuery += "(budget='$' OR budget='$$' OR budget='$$$' OR budget='$$$$' OR budget='$$$$$') AND ";
                } else if (articles[i].getPara(2).equalsIgnoreCase("$100 and Below")) {
                    sqlQuery += "(budget='$' OR budget='$$' OR budget='$$$' OR budget='$$$$') AND ";
                } else if (articles[i].getPara(2).equalsIgnoreCase("$50 and Below")) {
                    sqlQuery += "(budget='$' OR budget='$$' OR budget='$$$') AND ";
                } else if (articles[i].getPara(2).equalsIgnoreCase("$20 and Below")) {
                    sqlQuery += "(budget='$' OR budget='$$') AND ";
                } else {
                    sqlQuery += "budget='$' AND ";
                }
                if (articles[i].getWorkHours() != null) {   //CHECK NULL
                    for (int j = 0; j < articles[i].getWorkHoursLength(); j++) {
                        if ((articles[i].getWorkHoursInfo(j)).equalsIgnoreCase("timingWd")) {
                            sqlQuery += "timingWd is not null AND ";
                        } else if ((articles[i].getWorkHoursInfo(j)).equalsIgnoreCase("timingSat")) {
                            sqlQuery += "timingSat is not null AND ";
                        } else if ((articles[i].getWorkHoursInfo(j)).equalsIgnoreCase("timingPh")) {
                            sqlQuery += "timingPh is not null AND ";
                        }
                    }
                }
            }

            //Food & Beverage
            if (categoryInfo[i + 1].equalsIgnoreCase("Food & Beverage")) {
                categoryName = "Food & Beverage";
                if (articles[i].getCategoryArray() == null) {
                    sqlQuery += "articles AS A, category AS C WHERE A.articleID=C.articleID AND C.cname='" + categoryName + "' AND ";
                } else {
                    sqlQuery += "articles AS A, category AS C, category AS D WHERE A.articleID=C.articleID AND A.articleID=D.articleID AND (";
                    for (int j = 0; j < articles[i].getCategoryLength(); j++) {
                        String cateInfo = articles[i].getCategory(j);
                        sqlQuery += "(C.cname='" + categoryName + "' AND D.cname='" + cateInfo + "') OR ";
                    }
                    int pos = sqlQuery.lastIndexOf(") OR ");
                    sqlQuery = sqlQuery.substring(0, pos) + ")) AND ";
                }
                if (!(articles[i].getPara(0)).equalsIgnoreCase("selectRegion")) {
                    sqlQuery += "region='" + articles[i].getPara(0) + "' AND ";
                }
                if (!(articles[i].getPara(1)).equalsIgnoreCase("selectLocation")) {
                    sqlQuery += "location='" + articles[i].getPara(1) + "' AND ";
                }
                if (articles[i].getPara(2).equalsIgnoreCase("$$$$$")) {
                    sqlQuery += "(budget='$' OR budget='$$' OR budget='$$$' OR budget='$$$$' OR budget='$$$$$') AND ";
                } else if (articles[i].getPara(2).equalsIgnoreCase("$100 and Below")) {
                    sqlQuery += "(budget='$' OR budget='$$' OR budget='$$$' OR budget='$$$$') AND ";
                } else if (articles[i].getPara(2).equalsIgnoreCase("$50 and Below")) {
                    sqlQuery += "(budget='$' OR budget='$$' OR budget='$$$') AND ";
                } else if (articles[i].getPara(2).equalsIgnoreCase("$20 and Below")) {
                    sqlQuery += "(budget='$' OR budget='$$') AND ";
                } else {
                    sqlQuery += "budget='$' AND ";
                }
                if (articles[i].getWorkHours() != null) {
                    for (int j = 0; j < articles[i].getWorkHoursLength(); j++) {
                        if ((articles[i].getWorkHoursInfo(j)).equalsIgnoreCase("timingWd")) {
                            sqlQuery += "timingWd is not null AND ";
                        } else if ((articles[i].getWorkHoursInfo(j)).equalsIgnoreCase("timingSat")) {
                            sqlQuery += "timingSat is not null AND ";
                        } else if ((articles[i].getWorkHoursInfo(j)).equalsIgnoreCase("timingPh")) {
                            sqlQuery += "timingPh is not null AND ";
                        }
                    }
                }
            }

            //Leisure OR Places of Interest OR Nightlife OR Sports
            if (categoryInfo[i + 1].equalsIgnoreCase("Leisure") || categoryInfo[i + 1].equalsIgnoreCase("Places of Interest") || categoryInfo[i + 1].equalsIgnoreCase("Nightlife") || categoryInfo[i + 1].equalsIgnoreCase("Sports")) {
                categoryName = categoryInfo[i + 1];
                sqlQuery += "articles AS A, category AS C WHERE A.articleID=C.articleID AND C.cname='" + categoryName + "' AND ";
                if (!(articles[i].getPara(0)).equalsIgnoreCase("selectRegion")) {
                    sqlQuery += "region='" + articles[i].getPara(0) + "' AND ";
                }
                if (!(articles[i].getPara(1)).equalsIgnoreCase("selectLocation")) {
                    sqlQuery += "location='" + articles[i].getPara(1) + "' AND ";
                }
                if (articles[i].getPara(2).equalsIgnoreCase("$$$$$")) {
                    sqlQuery += "(budget='$' OR budget='$$' OR budget='$$$' OR budget='$$$$' OR budget='$$$$$') AND ";
                } else if (articles[i].getPara(2).equalsIgnoreCase("$100 and Below")) {
                    sqlQuery += "(budget='$' OR budget='$$' OR budget='$$$' OR budget='$$$$') AND ";
                } else if (articles[i].getPara(2).equalsIgnoreCase("$50 and Below")) {
                    sqlQuery += "(budget='$' OR budget='$$' OR budget='$$$') AND ";
                } else if (articles[i].getPara(2).equalsIgnoreCase("$20 and Below")) {
                    sqlQuery += "(budget='$' OR budget='$$') AND ";
                } else {
                    sqlQuery += "budget='$' AND ";
                }
                if (articles[i].getWorkHours() != null) {   //CHECK NULL
                    for (int j = 0; j < articles[i].getWorkHoursLength(); j++) {
                        if ((articles[i].getWorkHoursInfo(j)).equalsIgnoreCase("timingWd")) {
                            sqlQuery += "timingWd is not null AND ";
                        } else if ((articles[i].getWorkHoursInfo(j)).equalsIgnoreCase("timingSat")) {
                            sqlQuery += "timingSat is not null AND ";
                        } else if ((articles[i].getWorkHoursInfo(j)).equalsIgnoreCase("timingPh")) {
                            sqlQuery += "timingPh is not null AND ";
                        }
                    }
                }
            }

            //Shopping
            if (categoryInfo[i + 1].equalsIgnoreCase("Shopping")) {
                categoryName = "Shopping";
                if (articles[i].getCategoryArray() == null) {
                    sqlQuery += "articles AS A, category AS C WHERE A.articleID=C.articleID AND C.cname='" + categoryName + "' AND ";
                } else {
                    sqlQuery += "articles AS A, category AS C, category AS D WHERE A.articleID=C.articleID AND A.articleID=D.articleID AND (";
                    for (int j = 0; j < articles[i].getCategoryLength(); j++) {
                        String cateInfo = articles[i].getCategory(j);
                        sqlQuery += "(C.cname='" + categoryName + "' AND D.cname='" + cateInfo + "') OR ";
                    }
                    int pos = sqlQuery.lastIndexOf(") OR ");
                    sqlQuery = sqlQuery.substring(0, pos) + ")) AND ";
                }
                if (!(articles[i].getPara(0)).equalsIgnoreCase("selectRegion")) {
                    sqlQuery += "region='" + articles[i].getPara(0) + "' AND ";
                }
                if (!(articles[i].getPara(1)).equalsIgnoreCase("selectLocation")) {
                    sqlQuery += "location='" + articles[i].getPara(1) + "' AND ";
                }
                if (articles[i].getPara(2).equalsIgnoreCase("$$$$$")) {
                    sqlQuery += "(budget='$' OR budget='$$' OR budget='$$$' OR budget='$$$$' OR budget='$$$$$') AND ";
                } else if (articles[i].getPara(2).equalsIgnoreCase("$100 and Below")) {
                    sqlQuery += "(budget='$' OR budget='$$' OR budget='$$$' OR budget='$$$$') AND ";
                } else if (articles[i].getPara(2).equalsIgnoreCase("$50 and Below")) {
                    sqlQuery += "(budget='$' OR budget='$$' OR budget='$$$') AND ";
                } else if (articles[i].getPara(2).equalsIgnoreCase("$20 and Below")) {
                    sqlQuery += "(budget='$' OR budget='$$') AND ";
                } else {
                    sqlQuery += "budget='$' AND ";
                }
                if (articles[i].getWorkHours() != null) {
                    for (int j = 0; j < articles[i].getWorkHoursLength(); j++) {
                        if ((articles[i].getWorkHoursInfo(j)).equalsIgnoreCase("timingWd")) {
                            sqlQuery += "timingWd is not null AND ";
                        } else if ((articles[i].getWorkHoursInfo(j)).equalsIgnoreCase("timingSat")) {
                            sqlQuery += "timingSat is not null AND ";
                        } else if ((articles[i].getWorkHoursInfo(j)).equalsIgnoreCase("timingPh")) {
                            sqlQuery += "timingPh is not null AND ";
                        }
                    }
                }
            }

            //Events
            if (categoryInfo[i + 1].equalsIgnoreCase("Events")) {
                categoryName = "Events";
                if (articles[i].getCategoryArray() == null) {
                    sqlQuery += "articles AS A, category AS C WHERE A.articleID=C.articleID AND C.cname='" + categoryName + "' AND ";
                } else {
                    sqlQuery += "articles AS A, category AS C, category AS D WHERE A.articleID=C.articleID AND A.articleID=D.articleID AND (";
                    for (int j = 0; j < articles[i].getCategoryLength(); j++) {
                        String cateInfo = articles[i].getCategory(j);
                        sqlQuery += "(C.cname='" + categoryName + "' AND D.cname='" + cateInfo + "') OR ";
                    }
                    int pos = sqlQuery.lastIndexOf(") OR ");
                    sqlQuery = sqlQuery.substring(0, pos) + ")) AND ";
                }
                if (!(articles[i].getPara(0)).equalsIgnoreCase("selectRegion")) {
                    sqlQuery += "region='" + articles[i].getPara(0) + "' AND ";
                }
                if (!(articles[i].getPara(1)).equalsIgnoreCase("selectLocation")) {
                    sqlQuery += "location='" + articles[i].getPara(1) + "' AND ";
                }
                if (articles[i].getPara(2).equalsIgnoreCase("$$$$$")) {
                    sqlQuery += "(budget='$' OR budget='$$' OR budget='$$$' OR budget='$$$$' OR budget='$$$$$') AND ";
                } else if (articles[i].getPara(2).equalsIgnoreCase("$100 and Below")) {
                    sqlQuery += "(budget='$' OR budget='$$' OR budget='$$$' OR budget='$$$$') AND ";
                } else if (articles[i].getPara(2).equalsIgnoreCase("$50 and Below")) {
                    sqlQuery += "(budget='$' OR budget='$$' OR budget='$$$') AND ";
                } else if (articles[i].getPara(2).equalsIgnoreCase("$20 and Below")) {
                    sqlQuery += "(budget='$' OR budget='$$') AND ";
                } else {
                    sqlQuery += "budget='$' AND ";
                }
                if (!(articles[i].getPara(3)).equalsIgnoreCase("")) {
                    sqlQuery += "'" + articles[i].getPara(3) + "' BETWEEN startDate AND endDate AND ";
                }
            }

            try {
                sqlQuery += "A.approved='Y'";
                Article[] sqlResult = (Article[]) db.executeQuery(sqlQuery, "DWT");
                result[0].setPara(lastCategoryPos++, categoryName);
                if (sqlResult != null) {
                    result[0].setPara(lastCategoryPos++, Integer.toString(sqlResult.length));
                    Article[] temp = new Article[sqlResult.length + result.length];
                    System.arraycopy(result, 0, temp, 0, result.length);
                    System.arraycopy(sqlResult, 0, temp, result.length, sqlResult.length);
                    result = temp;
                } else {
                    result[0].setPara(lastCategoryPos++, Integer.toString(0));
                }
            } catch (Exception e) {
                return null;
            }
        }
        return result;
    }
}
