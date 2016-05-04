using DropNet;
using DropNet.Models;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Drive.v3;
using Google.Apis.Services;
using Google.Apis.Util.Store;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;

/// <summary>
/// Summary description for Class1
/// </summary>
public class Authentication
{
    private DriveService service;
    DropNet.Models.UserLogin accessToken;
    DropNetClient client = new DropNetClient("31wzgplwlbyqmvv", "jewcdovpvhmqrb1");


    public Authentication()
    {
        
    }
    public void setGoogleAuth(string accountType, string accountName) {
        //Scopes for use with the Google Drive API
        string[] scopes = new string[] { DriveService.Scope.Drive,
                                 DriveService.Scope.DriveFile};
        var clientId = "127333015779-0qkhtmhf5n0i5fcq2nlendcum9aq62n7.apps.googleusercontent.com";    
        var clientSecret = "_hOQOoUit11eM5P7VlZUc6-F";        
        string fileStorage = accountType + "." + accountName + ".Auth.Store";                                                
        // here is where we Request the user to give us access, or use the Refresh Token that was previously stored in %AppData%
        var credential = GoogleWebAuthorizationBroker.AuthorizeAsync(new ClientSecrets
        {
            ClientId = clientId,
            ClientSecret = clientSecret
            
        },
                                                                    scopes,
                                                                    Environment.UserName,
                                                                    CancellationToken.None,
                                                                    new FileDataStore(fileStorage)).Result;
        service = new DriveService(new BaseClientService.Initializer()
        {
            HttpClientInitializer = credential,
            ApplicationName = "Nimbus Cloud Web Application",
        });
    }

    //gets service so that it can be used to make api calls in other objects
    public DriveService getGoogleService()
    {
        return service;
    }

    public void getGoogleAuth(string accountLocal)
    {
        string[] scopes = new string[] { DriveService.Scope.Drive,
                                 DriveService.Scope.DriveFile};
        var clientId = "127333015779-0qkhtmhf5n0i5fcq2nlendcum9aq62n7.apps.googleusercontent.com";      // From https://console.developers.google.com
        var clientSecret = "_hOQOoUit11eM5P7VlZUc6-F";          // From https://console.developers.google.com
        accountLocal = accountLocal.Replace(@"\", " ");

        var credential = GoogleWebAuthorizationBroker.AuthorizeAsync(new ClientSecrets
        {
            ClientId = clientId,
            ClientSecret = clientSecret

        },
                                                                    scopes,
                                                                    Environment.UserName,
                                                                    CancellationToken.None,
                                                                    new FileDataStore(accountLocal)).Result;
        service = new DriveService(new BaseClientService.Initializer()
        {
            HttpClientInitializer = credential,
            ApplicationName = "Nimbus Cloud Web Application",
        });
        // return "";
    }

    public void setDropboxAuth(string accountType, string accountName)
    {

        
        client.GetToken();
        var url = client.BuildAuthorizeUrl();

        // Prompt for user to auth

        Process.Start(url);
        Thread.Sleep(2000);

        // If the user authed, let's get that token
        bool Cont = false;
        while (!Cont)
        {
            try
            {
                accessToken = client.GetAccessToken();
                if (accessToken != null)
                {
                    Cont = true;
                }

            }
            catch (Exception e)
            {
                Thread.Sleep(2000);


            }
            // save for later
        }


        string json = JsonConvert.SerializeObject(accessToken);

        string storage = accountType + "." + accountName + ".Auth.Store";

        string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), storage+ "/ACCESSTOKEN.json");

        Directory.CreateDirectory(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), storage));

        File.WriteAllText(path, json);

    }
    public void getDropboxAuth(string accLocal)
    {
        List<Account> accounts;
        using (StreamReader r = new StreamReader("C:/Users/Matthew/Desktop/NimbusCloudProject/Nimbus-Cloud-master/NimbusCloud/accounts.json"))
        {
            string json = r.ReadToEnd();
            accounts = JsonConvert.DeserializeObject<List<Account>>(json);
           
        }
        foreach (var item in accounts)
        {
            if (item.Location == accLocal)
            {
                string token;
                string secret;
                string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), accLocal + "/ACCESSTOKEN.json");
                dynamic user ="";
                using (StreamReader r = new StreamReader(path))
                {
                       
                    string json = r.ReadToEnd();
                    user = JsonConvert.DeserializeObject(json);
                    token = user.Token;
                    secret = user.Secret;

                }

                client = new DropNetClient("31wzgplwlbyqmvv", "jewcdovpvhmqrb1", token, secret);
                //client = new DropNetClient("31wzgplwlbyqmvv", "jewcdovpvhmqrb1");
                //client.UserLogin = new UserLogin { Token = token, Secret = secret };


            }
        }
    }
    class Account
    {
        public string AccountType { get; set; }
        public string AccountName { get; set; }
        public string Location { get; set; }
    }

    public DropNetClient getDropboxService()
    {
        return client;
    }

}

