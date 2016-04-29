using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Google.Apis.Drive.v3;
using Google.Apis.Drive.v3.Data;

public class Navigation
{
    private DriveService service;

    public Navigation(DriveService service)
    {
        this.service = service;
    }

    public IList<File> Navigate(string parent)
    {
        string search, s1 = "'", s2 = "' in parents and trashed = false";

        search = s1 + parent + s2;

        return GetFiles(search);
    }

    private IList<File> GetFiles(string search)
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
}
