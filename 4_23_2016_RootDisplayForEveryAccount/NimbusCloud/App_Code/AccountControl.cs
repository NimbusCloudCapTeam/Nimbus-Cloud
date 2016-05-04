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
        string path = "C:/Users/Matthew/Desktop/NimbusCloudProject/Nimbus-Cloud-master/NimbusCloud/accounts.json";
        string jsonData = File.ReadAllText(path);
        string fileStorage = accountType + "." + accountName + ".Auth.Store";
        //string location = accountType + "." + accountName + ".Auth.Store";

        var list = JsonConvert.DeserializeObject<List<Account>>(jsonData);
        list.Add(new Account() { 
                AccountType = accountType,
                AccountName = accountName,
                Location = fileStorage

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


    public void removeAccount(string accountName, string accountType) {
        List<Account> accounts;
        string fileStorage = accountType + "." + accountName + ".Auth.Store";
        using (StreamReader r = new StreamReader("C:/Users/Matthew/Desktop/NimbusCloudProject/Nimbus-Cloud-master/NimbusCloud/accounts.json"))
        {
            string json = r.ReadToEnd();
            accounts = JsonConvert.DeserializeObject<List<Account>>(json);

        }
        foreach (var item in accounts.ToList())
        {
            if (item.Location == fileStorage)
            {
                accounts.Remove(item);
            }
        }
        var convertedJson = JsonConvert.SerializeObject(accounts, Formatting.Indented);
        File.WriteAllText("C:/Users/Matthew/Desktop/NimbusCloudProject/Nimbus-Cloud-master/NimbusCloud/accounts.json", convertedJson);

        string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), fileStorage);
        Directory.Delete(path, true);
    }

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