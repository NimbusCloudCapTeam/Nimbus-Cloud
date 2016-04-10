using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static List<string> getAccounts() {
        List<string> accounts = new List<string>();
        /*XmlTextReader reader = new XmlTextReader(@"\\\" + "AccountFile.xml");
        XmlNodeType type;

        while (reader.Read())
        {
            type = reader.NodeType;

            if (type == XmlNodeType.Element)
            {
                if (reader.Name == "box")
                {
                    reader.Read();
                    accounts.Add(reader.Value);
                }
            }
        }
        reader.Close();*/

        //var list = new List<string>();
        var fileStream = new FileStream(@"C:\Users\Matthew\Documents\Visual Studio 2015\WebSites\NimbusCloud\Test_Files\AccountFile.txt", FileMode.Open, FileAccess.Read);
        using (var streamReader = new StreamReader(fileStream, System.Text.Encoding.UTF8))
        {
            string line;
            while ((line = streamReader.ReadLine()) != null)
            {
                accounts.Add(line);
            }
        }

       // string json = new JavaScriptSerializer().Serialize(accounts);
        return accounts;
    }
    [WebMethod]
    public static string getTest() {
        string accounts = "Hello";
        string json = new JavaScriptSerializer().Serialize(accounts);
        return json;
    }
}