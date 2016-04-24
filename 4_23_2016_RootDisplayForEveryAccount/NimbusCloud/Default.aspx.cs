﻿using System;
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

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    private static DriveService service;

    [WebMethod]
    public static string setAuthorization(string accountName, string accountType) {
        Authentication authenticate = new Authentication();
        //AccountControl account = new AccountControl();
        //bool tryAuth = false;
        try
        {
            authenticate.setAuth(accountType, accountName);
            //tryAuth = true;
        }
        catch (Exception e) { }
        AccountControl account = new AccountControl();
        account.addAccount(accountType, accountName);

        service = authenticate.getService();

        return "0";
    }

    [WebMethod]
    public static IList<Google.Apis.Drive.v3.Data.File> getNavTable()
    {
        Navigation navigator = new Navigation(service);
        return navigator.Navigate("root");
    }

    //loads nav data on click
    protected void DriveButton_Click(object sender, EventArgs e)
    {
        getNavTable();
    }

    [WebMethod]
    public static string setService(string accAddress)
    {

        Authentication authenticate = new Authentication();
        string account = JsonConvert.DeserializeObject<string>(accAddress);
        authenticate.getAuth(account);
        service = authenticate.getService();
        return "";
    }
}