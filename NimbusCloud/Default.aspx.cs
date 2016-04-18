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

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.getEmptyNavTable();
    }

    private static IList<Google.Apis.Drive.v3.Data.File> files;
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

    //loads placeholders for nav data
    private void getEmptyNavTable()
    {
        StringBuilder tableOutput = new StringBuilder("<tbody>");

        tableOutput.Append("<tr>");
        tableOutput.Append("<td> </td>");
        tableOutput.Append("<td>--</td>");
        tableOutput.Append("<td>--</td>");
        tableOutput.Append("<td>--</td>");
        tableOutput.Append("<td>--</td>");
        tableOutput.Append("</tr>");
        tableOutput.Append("</tbody>");

        tableBody.Text = tableOutput.ToString();
    }

    //loads nav data
    private void getNavTable()
    {
        StringBuilder tableOutput = new StringBuilder("<tbody>");

        Navigation navigator = new Navigation(service);
        files = navigator.Navigate("root");

        
        foreach (var file in files)
        {
            tableOutput.Append("<tr>");
            tableOutput.Append("<td> </td>");
            tableOutput.AppendFormat("<td>{0}</td>", file.Name);
            tableOutput.AppendFormat("<td>{0}</td>", file.ModifiedTime);
            tableOutput.AppendFormat("<td>{0}</td>", file.MimeType);
            tableOutput.AppendFormat("<td>{0}</td>", file.Size);
            tableOutput.Append("</tr>");
        }

        tableOutput.Append("</tbody>");

        tableBody.Text = tableOutput.ToString();
    }

    //loads nav data on click
    protected void DriveButton_Click(object sender, EventArgs e)
    {
        getNavTable();
    }
}