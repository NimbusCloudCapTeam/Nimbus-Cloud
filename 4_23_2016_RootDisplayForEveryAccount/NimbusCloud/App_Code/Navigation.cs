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

        return listRequest.Execute().Files;
    }

    public DropNet.Models.MetaData DropNavigate(string path)
    {
        return dropClient.GetMetaData(path, null, true, false);
    }

    public IList<File> DriveSearch(string search)
    {
        string s1 = "name contains '", s2 = "' and trashed = false";
        FilesResource.ListRequest listRequest = service.Files.List();

        listRequest.Q = s1 + search + s2;
        listRequest.Fields = "files(id,mimeType,modifiedTime,name,size),kind,nextPageToken";

        return listRequest.Execute().Files;
    }

    public List<DropNet.Models.MetaData> DropSearch(string search)
    {
        return dropClient.Search(search);
    }
}
