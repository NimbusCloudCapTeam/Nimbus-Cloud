using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//This class countrols and maintains the data moving to and from the users account.

public class AccountControl
{
    //Constructor
    public AccountControl(){
    }

    //Temp Strings
    String returnString;
    int returnInt;

    public String getUserId() { return returnString;}

    public void addAccount(String accountType, String accountName) { }

    public void removeAccount(String accountType, String accountName) { }

    public String getFiles(String accountType, String accountName) {return returnString; }

    public String getFileName() { return returnString; }

    public String getFileType(String fileName) { return returnString; }

    public int getFilesSize(String fileName) { return returnInt; }

    public String getFileData(String fileName) { return returnString; }

    public String getCurrentFileAddress() { return returnString; }

    public String getRootFileAddress() { return returnString; }

    public String getAccessToken() { return returnString; }

    void setAccessToken(String accountType, String accountName, int userID, String accessToken) { }

}