﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using Google.Apis.Drive.v2;
using Google.Apis.Drive.v2.Data;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Util.Store;
using Google.Apis.Services;

/// <summary>
/// Summary description for Upload
/// </summary>
public class Upload
{
    public Upload() { }
    //
    // TODO: Add constructor logic here
    //

    //// 
    /// Create a new Directory.
    /// Documentation: https://developers.google.com/drive/v2/reference/files/insert
    /// 
    /// a Valid authenticated DriveService
    /// The title of the file. Used to identify file or folder name.
    /// A short description of the file.
    /// Collection of parent folders which contain this file. 
    ///                       Setting this field will put the file in all of the provided folders. root folder.
    /// 
    public static File createDirectory(DriveService _service, string _title, string _description, string _parent)
    {

        File NewDirectory = null;

        // Create metaData for a new Directory
        File body = new File();
        body.Title = _title;
        body.Description = _description;
        body.MimeType = "application/vnd.google-apps.folder";
        body.Parents = new List<ParentReference> { new ParentReference() { Id = _parent } };
        try
        {
            FilesResource.InsertRequest request = _service.Files.Insert(body);
            NewDirectory = request.Execute();
        }
        catch (Exception e)
        {
            Console.WriteLine("An error occurred: " + e.Message);
        }

        return NewDirectory;
    }

    // tries to figure out the mime type of the file.
    private static string GetMimeType(string fileName)
    {
        string mimeType = "application/unknown";
        string ext = System.IO.Path.GetExtension(fileName).ToLower();
        Microsoft.Win32.RegistryKey regKey = Microsoft.Win32.Registry.ClassesRoot.OpenSubKey(ext);
        if (regKey != null && regKey.GetValue("Content Type") != null)
            mimeType = regKey.GetValue("Content Type").ToString();
        return mimeType;
    }
    /// 
    /// Uploads a file
    /// Documentation: https://developers.google.com/drive/v2/reference/files/insert
    /// 
    /// a Valid authenticated DriveService
    /// path to the file to upload
    /// Collection of parent folders which contain this file. 
    ///                       Setting this field will put the file in all of the provided folders. root folder.
    /// If upload succeeded returns the File resource of the uploaded file 
    ///          If the upload fails returns null
    public static File uploadFile(DriveService _service, string _uploadFile, string _parent)
    {

        if (System.IO.File.Exists(_uploadFile))
        {
            File body = new File();
            body.Title = System.IO.Path.GetFileName(_uploadFile);
            body.Description = "File uploaded by Diamto Drive Sample";
            body.MimeType = GetMimeType(_uploadFile);
            body.Parents = new List<ParentReference> { new ParentReference() { Id = _parent } };

            // File's content.
            byte[] byteArray = System.IO.File.ReadAllBytes(_uploadFile);
            System.IO.MemoryStream stream = new System.IO.MemoryStream(byteArray);
            try
            {
                FilesResource.InsertMediaUpload request = _service.Files.Insert(body, stream, GetMimeType(_uploadFile));
                request.Upload();
                return request.ResponseBody;
            }
            catch (Exception e)
            {
                Console.WriteLine("An error occurred: " + e.Message);
                return null;
            }
        }
        else {
            Console.WriteLine("File does not exist: " + _uploadFile);
            return null;
        }
    }

        /// 
        /// Updates a file
        /// Documentation: https://developers.google.com/drive/v2/reference/files/update
        /// 
        /// a Valid authenticated DriveService
        /// path to the file to upload
        /// Collection of parent folders which contain this file. 
        ///                       Setting this field will put the file in all of the provided folders. root folder.
        /// the resource id for the file we would like to update                      
        /// If upload succeeded returns the File resource of the uploaded file 
        ///          If the upload fails returns null
        public static File updateFile(DriveService _service, string _uploadFile, string _parent, string _fileId)
    {

        if (System.IO.File.Exists(_uploadFile))
        {
            File body = new File();
            body.Title = System.IO.Path.GetFileName(_uploadFile);
            body.Description = "File updated by Diamto Drive Sample";
            body.MimeType = GetMimeType(_uploadFile);
            body.Parents = new List<ParentReference> { new ParentReference() { Id = _parent } };

            // File's content.
            byte[] byteArray = System.IO.File.ReadAllBytes(_uploadFile);
            System.IO.MemoryStream stream = new System.IO.MemoryStream(byteArray);
            try
            {
                FilesResource.UpdateMediaUpload request = _service.Files.Update(body, _fileId, stream, GetMimeType(_uploadFile));
                request.Upload();
                return request.ResponseBody;
            }
            catch (Exception e)
            {
                Console.WriteLine("An error occurred: " + e.Message);
                return null;
            }
        }
        else
        {
            Console.WriteLine("File does not exist: " + _uploadFile);
            return null;
        }

    }


}