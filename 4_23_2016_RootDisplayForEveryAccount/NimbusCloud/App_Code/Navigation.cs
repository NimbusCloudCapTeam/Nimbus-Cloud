using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Google.Apis.Drive.v3;
using Google.Apis.Drive.v3.Data;
using DropNet;

public class Navigation
{
    private DriveService service;
    private DropNetClient dropClient;

    public Navigation(DriveService service)
    {
        this.service = service;
    }

    public Navigation(DropNetClient dropClient)
    {
        this.dropClient = dropClient;
    }

    public IList<File> DriveNavigate(string parent)
    {
        string s1 = "'", s2 = "' in parents and trashed = false";
        FilesResource.ListRequest listRequest = service.Files.List();

        listRequest.Q = s1 + parent + s2;        
        listRequest.Fields = "files(id,mimeType,modifiedTime,name,size),kind,nextPageToken";

        IList<File> files = listRequest.Execute().Files;

        return files;
    }

    private IList<File> GetDriveFiles(string search)
    {
        FilesResource.ListRequest listRequest = service.Files.List();

        if (search != null)
        {
            listRequest.Q = search;
        }
        else
        {
            listRequest.Q = "'root' in parents and trashed = false";
        }

        listRequest.Fields = "files(id,mimeType,modifiedTime,name,size),kind,nextPageToken";

        IList<File> files = listRequest.Execute().Files;

        return files;
    }

    public DropNet.Models.MetaData DropNavigate(string path)
    {
        return dropClient.GetMetaData(path, null, true, false);
    }
}
