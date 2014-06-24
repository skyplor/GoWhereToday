package MyServlets;

import java.sql.*;
import Entities.*;

/**
 *
 * @author jasonlv
 */
public class DBDriver {

    public Object[] executeQuery(String sql, String className) throws SQLException, ClassNotFoundException {

        //use java reflection to get a class of the JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        //to establish a connection, i.e. create the connection object
        Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/gowheretoday", "root", "freeze");
        //to create the SQL statement object (having only a SQL String is far not enough as it cannot execute anything)
        //the parameters are not necessary, but the query can be controlled better in this way
        Statement sqlStatement = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        //execute the statement and use rs to contain the result
        ResultSet rs = sqlStatement.executeQuery(sql);

        rs.last(); //changes
        int length = rs.getRow();
        rs.beforeFirst();
        if (length > 0) {
            if (className.equals("user")) {

                User[] users = new User[length];
                int count = 0;
                while (rs.next()) {
                    String name = rs.getString("username");
                    String pwd = rs.getString("password");
                    String email = rs.getString("EmailAdd");
                    String fname = rs.getString("full_name");
                    char gend = rs.getString("gender").charAt(0);
                    Date dob = rs.getDate("DOB");
                    Date regisDate = rs.getDate("registration_date");
                    String type = rs.getString("user_type");
                    String avatar = rs.getString("avatar");
                    String aboutMe = rs.getString("aboutMe");

                    User buffer = new User(name, pwd, email, fname, gend, dob, regisDate, type, avatar, aboutMe);
                    users[count] = buffer;
                    count++;
                }
                con.close();
                return users;
            } else if (className.equals("ID")) {
                rs.last(); //changes
                int num = rs.getInt("articleID");
                rs.beforeFirst();
                Article[] articlesnum = new Article[1];
                articlesnum[0] = new Article();
                articlesnum[0].setID(num);
                return articlesnum;
            } else if (className.equals("pictures")) {
                Article[] articles = new Article[1];
                articles[0] = new Article();
                int count2 = 1;
                while (rs.next()) {

                    articles[0].setPara(count2, rs.getString("ref_pic"));

                    count2++;
                }
                articles[0].setPara(0, Integer.toString(count2));
                con.close();
                return articles;
            } else if (className.equals("category")) {
                Article[] articles = new Article[1];
                articles[0] = new Article();
                int count3 = 1;
                while (rs.next()) {
                    articles[0].setPara(count3, rs.getString("cname"));
                    count3++;
                }
                articles[0].setPara(0, Integer.toString(count3));
                con.close();
                return articles;
            } else if (className.equals("reviews")) {
                Review[] reviews = new Review[length];
                int count4 = 0;
                while (rs.next()) {
                    reviews[count4] = new Review();
                    reviews[count4].setArticleID(Integer.parseInt(rs.getString("articleID")));
                    reviews[count4].setUsername(rs.getString("username"));
                    reviews[count4].setReview(rs.getString("review"));
                    reviews[count4].setDatetime(rs.getString("datetime"));
                    count4++;
                }
                con.close();
                return reviews;
            } else if (className.equals("DWT")) {
                Article[] articles = new Article[length];
                int DWTcount = 0;
                while (rs.next()) {
                    articles[DWTcount] = new Article();
                    articles[DWTcount].setPara(0, rs.getString("name"));
                    articles[DWTcount].setPara(1, rs.getString("description"));
                    articles[DWTcount].setPara(2, rs.getString("averageRating"));
                    articles[DWTcount].setPara(3, rs.getString("timingWd"));
                    articles[DWTcount].setPara(4, rs.getString("timingSat"));
                    articles[DWTcount].setPara(5, rs.getString("timingPh"));
                    articles[DWTcount].setPara(6, rs.getString("startDate"));
                    articles[DWTcount].setPara(7, rs.getString("endDate"));
                    articles[DWTcount].setID(rs.getInt("articleID"));
                    DWTcount++;
                }
                con.close();
                return articles;
            } else {
                Article[] articles = new Article[length];
                int count1 = 0;

                while (rs.next()) {
                    articles[count1] = new Article();
                    articles[count1].setPara(0, rs.getString("name"));
                    articles[count1].setPara(1, rs.getString("address"));
                    articles[count1].setPara(2, rs.getString("postalCode"));
                    articles[count1].setPara(3, rs.getString("region"));
                    articles[count1].setPara(4, rs.getString("location"));
                    articles[count1].setPara(5, rs.getString("timingWd"));
                    articles[count1].setPara(6, rs.getString("timingSat"));
                    articles[count1].setPara(7, rs.getString("timingPh"));
                    articles[count1].setPara(8, rs.getString("budget"));
                    articles[count1].setPara(9, rs.getString("telNo"));
                    articles[count1].setPara(10, rs.getString("email"));
                    articles[count1].setPara(11, rs.getString("website"));
                    articles[count1].setPara(12, rs.getString("description"));
                    articles[count1].setPara(13, rs.getString("approved"));
                    articles[count1].setID(rs.getInt("articleID"));
                    articles[count1].setPara(14, rs.getString("averageRating"));
                    articles[count1].setPara(15, rs.getString("numRatings"));
                    articles[count1].setPara(16, rs.getString("accumRating"));
                    articles[count1].setPara(17, rs.getString("username"));
                    articles[count1].setPara(18, rs.getString("articleDate"));
                    articles[count1].setPara(19, rs.getString("startDate"));
                    articles[count1].setPara(20, rs.getString("endDate"));

                    count1++;
                }
                con.close();
                return articles;
            }
        } else {
            return null;
        }

    }

    public boolean executeUpdate(String sql) {
        try {
            //use java reflection to get a class of the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
        }
        try {
            //to establish a connection, i.e. create the connection object
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/gowheretoday", "root", "freeze");
            Statement sqlStatement = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            sqlStatement.executeUpdate(sql);
            con.close();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }
}
