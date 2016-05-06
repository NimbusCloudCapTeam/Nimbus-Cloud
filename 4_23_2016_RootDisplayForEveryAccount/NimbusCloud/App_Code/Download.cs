using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Google.Apis.Drive.v3;
using Google.Apis.Drive.v3.Data;
using Google.Apis.Download;
using System.Net;
using Newtonsoft.Json.Linq;
using DropNet;

/// <summary>
/// Summary description for Download
/// </summary>
public class Download
{
    public Download()
    { }
    /// 
    /// Download a file
    /// Documentation: https://developers.google.com/drive/v2/reference/files/get
    /// 
    /// a Valid authenticated DriveService
    /// File resource of the file to download
    /// location of where to save the file including the file name to save it as.
    /// 
    public void downloadGoogleFile(DriveService service, string name, string fileResource)
    {

        var path = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + "/tempMeta.json";
        var x = service.HttpClient.GetByteArrayAsync("https://www.googleapis.com/drive/v2/files/" + fileResource);
        byte[] arrBytes = x.Result;
        System.IO.File.WriteAllBytes(path, arrBytes);

        JObject files = JObject.Parse(System.IO.File.ReadAllText(path));

        JToken dlLink = files.SelectToken("$.downloadUrl");


            try
            {
                var x2 = service.HttpClient.GetByteArrayAsync(dlLink.ToString());
                byte[] arrBytes2 = x2.Result;
                System.IO.File.WriteAllBytes("C:/Users/Matthew/Downloads/" + name, arrBytes2);

            }
            catch (Exception e)
            {
                Console.WriteLine("An error occurred: " + e.Message);

            }
      }

    public void downloadDropboxFile(DropNetClient client, string name, string fileResource) {

        var fileBytes = client.GetFile(fileResource);
        byte[] arrBytes2 = fileBytes;
        System.IO.File.WriteAllBytes("C:/Users/Matthew/Downloads/" + name, arrBytes2);
    }


}