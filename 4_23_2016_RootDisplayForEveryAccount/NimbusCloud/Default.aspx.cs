using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Apis.Drive.v3;
using Google.Apis.Drive.v3.Data;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Util.Store;
using System.Threading;
using Google.Apis.Services;
using System.Net;
using System.IO;
using System.Web.Services;
using System.Web.Script.Serialization;
using Google.Apis.Plus.v1;
using System.Text;
using Newtonsoft.Json;
using DropNet;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    private static DriveService service;
    private static DropNetClient client;

    [WebMethod]
    public static string setAuthorization(string accountName, string accountType) {
        Authentication authenticate = new Authentication();
        //AccountControl account = new AccountControl();
        //bool tryAuth = false;

        if (accountType == "Google Drive") { 
            authenticate.setGoogleAuth(accountType, accountName);
            service = authenticate.getGoogleService();
         }
        if (accountType == "DropBox")
            {
                authenticate.setDropboxAuth(accountType, accountName);
                client = authenticate.getDropboxService();
            }

        AccountControl account = new AccountControl();
        account.addAccount(accountType, accountName);



        return "0";
    }

    [WebMethod]
    public static IList<Google.Apis.Drive.v3.Data.File> getDriveRoot()
    {
        Navigation navigator = new Navigation(service);
        return navigator.DriveNavigate("root");
    }

    [WebMethod]
    public static string setService(string accAddress, string accountType)
    {

        Authentication authenticate = new Authentication();
        string account = JsonConvert.DeserializeObject<string>(accAddress);

        if (accountType == "Google Drive")
        {
            authenticate.getGoogleAuth(account);
            service = authenticate.getGoogleService();
        }
        if (accountType == "DropBox")
        {
            authenticate.getDropboxAuth(account);
            client = authenticate.getDropboxService();
        }
        return "";
    }

    [WebMethod]
    public static IList<Google.Apis.Drive.v3.Data.File> getDriveFolder(string id)
    {
        Navigation navigator = new Navigation(service);
        return navigator.DriveNavigate(id);
    }

    [WebMethod]
    public static DropNet.Models.MetaData getDropRoot()
    {
        Navigation navigator = new Navigation(client);
        return navigator.DropNavigate();
    }
}