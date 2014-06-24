package Entities;

/**
 *
 * @author jasonlv
 */
import java.sql.Date;
import MyServlets.*;
import java.sql.SQLException;

public class User {

    private String username;
    private String password;
    private String EmailAddr;
    private String fullName;
    private char gender;
    private Date DOB;
    private Date regDate;
    private String type;
    private String avatar;
    private String aboutMe;

    public User(String name, String pwd, String email, String fname, char gend, Date dob, Date regisDate, String utype, String avaPath, String aboutme) {
        username = name;
        password = pwd;
        EmailAddr = email;
        fullName = fname;
        gender = gend;
        DOB = dob;
        regDate = regisDate;
        type = utype;
        avatar = avaPath;
        aboutMe = aboutme;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the EmailAddr
     */
    public String getEmailAddr() {
        return EmailAddr;
    }

    /**
     * @param EmailAddr the EmailAddr to set
     */
    public void setEmailAddr(String EmailAddr) {
        this.EmailAddr = EmailAddr;
    }

    /**
     * @return the fullName
     */
    public String getFullName() {
        return fullName;
    }

    /**
     * @param fullName the fullName to set
     */
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    /**
     * @return the gender
     */
    public char getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(char gender) {
        this.gender = gender;
    }

    /**
     * @return the DOB
     */
    public Date getDOB() {
        return DOB;
    }

    /**
     * @param DOB the DOB to set
     */
    public void setDOB(Date DOB) {
        this.DOB = DOB;
    }

    /**
     * @return the regDate
     */
    public Date getRegDate() {
        return regDate;
    }

    /**
     * @param regDate the regDate to set
     */
    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    /**
     * @return the Usertype
     */
    public String getUserType() {
        return type;
    }

    /**
     * @param usertype the usertype to set
     */
    public void setUserType(String usertype) {
        this.type = usertype;
    }

    /**
     * @return the avatar
     */
    public String getAvatar() {
        return avatar;
    }

    /**
     * @param avatar the avatar to set
     */
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    /**
     * @return the aboutMe
     */
    public String getAboutMe() {
        return aboutMe;
    }

    /**
     * @param aboutMe the aboutMe to set
     */
    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }
}
