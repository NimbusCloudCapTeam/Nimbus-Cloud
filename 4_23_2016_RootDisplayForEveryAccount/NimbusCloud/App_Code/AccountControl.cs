using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

//This class countrols and maintains the data moving to and from the users account.

public class AccountControl
{
    //Constructor
    public AccountControl(){
    }

    //Temp Strings
    string returnString;
    int returnInt;

    public object JsonFormatter { get; private set; }

    public string getUserId() { return returnString;}

    public void addAccount(string accountType, string accountName) {
        string path = "C:/Users/Matthew/Desktop/NimbusCloudProject/Nimbus-Cloud-master/4_23_2016_RootDisplayForEveryAccount/NimbusCloud/accounts.json";
        string jsonData = File.ReadAllText(path);
        string fileStorage = accountType + "." + accountName + ".Auth.Store";
        string location = accountType + "." + accountName + ".Auth.Store";

        var list = JsonConvert.DeserializeObject<List<Account>>(jsonData);
        list.Add(new Account() { 
                AccountType = accountType,
                AccountName = accountName,
                Location = location

            });
        var convertedJson = JsonConvert.SerializeObject(list, Formatting.Indented);
        File.WriteAllText(path, convertedJson);

    }

    class Account
    {
        public string AccountType { get; set; }
        public string AccountName { get; set; }
        public string Location { get; set; }
    }


    public void removeAccount(string accountType, string accountName) { }

    public string getFiles(string accountType, string accountName) {return returnString; }

    public string getFileName() { return returnString; }

    public string getFileType(string fileName) { return returnString; }

    public int getFilesSize(string fileName) { return returnInt; }

    public string getFileData(string fileName) { return returnString; }

    public string getCurrentFileAddress() { return returnString; }

    public string getRootFileAddress() { return returnString; }

    public string getAccessToken() { return returnString; }

    void setAccessToken(string accountType, string accountName, int userID, string accessToken) { }

}