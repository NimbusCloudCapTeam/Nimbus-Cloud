using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//This class countrols and maintains the data moving to and from the users account.

public class AccountControl
{
    //Constructor
    public AccountControl(){}

    //Temp Strings
    String returnString;
    int returnInt;

    private String getUserId() { return returnString;}

    void addAccount(String accountType, String accountName) { }

    void removeAccount(String accountType, String accountName) { }

    private String getFiles(String accountType, String accountName) {return returnString; }

    private String getFileName() { return returnString; }

    private String getFileType(String fileName) { return returnString; }

    private int getFilesSize(String fileName) { return returnInt; }

    private String getFileData(String fileName) { return returnString; }

    private String getCurrentFileAddress() { return returnString; }

    private String getRootFileAddress() { return returnString; }

    private String getAccessToken() { return returnString; }

    void setAccessToken(String accountType, String accountName, int userID, String accessToken) { }

}