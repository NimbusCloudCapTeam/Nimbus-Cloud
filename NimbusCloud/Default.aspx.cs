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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }


    [WebMethod]
    public static string setAuthorization(string accountName, string accountType) {
        Authentication authenticate = new Authentication();
        //AccountControl account = new AccountControl();
        bool tryAuth = false;
        try
        {
            authenticate.setAuth(accountName,accountType);
            tryAuth = true;
        }
        catch (Exception e) { }
        string returnString;
        if (tryAuth) { returnString = "true"; }
        else { returnString = "false"; }
        var json = new JavaScriptSerializer().Serialize(returnString);
        return json;
    }
}