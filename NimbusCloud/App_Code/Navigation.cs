using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Google.Apis.Drive.v3;
using Google.Apis.Drive.v3.Data;

namespace ConsoleApplication1
{
    class Navigation
    {
        private DriveService service;

        public Navigation(DriveService service)
        {
            this.service = service;
        }

        public IList<File> Navigate(string parent)
        {
            string search, s1 = "'", s2 = "' in parents";

            search = s1 + parent + s2;

            return this.GetFiles(search);
        }

        private IList<File> GetFiles(string search)
        {
            FilesResource.ListRequest listRequest = this.service.Files.List();

            if (search != null)
            {
                listRequest.Q = search;
            }
            else
            {
                listRequest.Q = "'root' in parents";
            }

            IList<File> files = listRequest.Execute().Files;

            return files;
        }
    }
}
