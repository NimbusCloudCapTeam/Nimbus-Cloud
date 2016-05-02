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
        string search, s1 = "'", s2 = "' in parents and trashed = false";

        search = s1 + parent + s2;

        return GetDriveFiles(search);
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

    public DropNet.Models.MetaData DropNavigate()
    {
        return GetDropFiles();
    }

    private DropNet.Models.MetaData GetDropFiles()
    {
        return dropClient.GetMetaData(null, true);
    }
}
