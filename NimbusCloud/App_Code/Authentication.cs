using Google.Apis.Auth.OAuth2;
using Google.Apis.Drive.v3;
using Google.Apis.Services;
using Google.Apis.Util.Store;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;

/// <summary>
/// Summary description for Class1
/// </summary>
public class Authentication
{
    private DriveService service;

    public Authentication()
    {
        
    }
    public void setAuth(string accountType, string accountName) {
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
}