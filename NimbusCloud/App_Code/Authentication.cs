using Google.Apis.Auth.OAuth2;
using Google.Apis.Drive.v3;
using Google.Apis.Services;
using Google.Apis.Util.Store;
using System;
using DropNet;
using System.IO;
using Newtonsoft.Json;
using System.Diagnostics;
using System.Threading.Tasks;
using System.Threading;

/// <summary>
/// Summary description for Class1
/// </summary>
public class Authentication
{
    private const string ConsumerKey = "your application key";
    private const string ConsumerSecret = "your application secret";
    private DriveService service;
    private DropNetClient dropClient;
    DropNet.Models.UserLogin accessToken;


    public Authentication()
    {

    }
    public void setAuth(string accountType, string accountName)
    {
        //Scopes for use with the Google Drive API
        string[] scopes = new string[] { DriveService.Scope.Drive,
                                 DriveService.Scope.DriveFile};
        var clientId = "127333015779-0qkhtmhf5n0i5fcq2nlendcum9aq62n7.apps.googleusercontent.com";      // From https://console.developers.google.com
        var clientSecret = "_hOQOoUit11eM5P7VlZUc6-F";          // From https://console.developers.google.com
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
    public DriveService getService()
    {
        return service;
    }

    public void getAuth(string accountLocal)
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
    public void getDBAuth() {
        Task t =Task.Run(() => ConnectToDropbox());
        t.Wait();
    }
    public void ConnectToDropbox()
    {

        dropClient = new DropNetClient("31wzgplwlbyqmvv", "jewcdovpvhmqrb1");
        dropClient.GetToken();
        var url = dropClient.BuildAuthorizeUrl();

        // Prompt for user to auth

        Process.Start(url);
        Thread.Sleep(2000);

        // If the user authed, let's get that token
        bool Cont = false;
        while (!Cont) { 
            try
            {
                accessToken = dropClient.GetAccessToken();
                if (accessToken != null) {
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

        string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "Dropbox.new.Service/ACCESSTOKEN.json");

        Directory.CreateDirectory(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "Dropbox.new.Service"));

        //string json = JsonConvert.SerializeObject(_data, Formatting.Indented);
        File.WriteAllText(path, json);

    }
    
    public DropNetClient getDropClient()
    {
        return dropClient;
    }
}
