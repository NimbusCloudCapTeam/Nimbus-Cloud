<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Time Entry</title>
   <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width, initial-scale=1"/>
   <script src="Scripts/jquery-1.9.1.min.js"></script>
   <link rel="stylesheet" href="Content/bootstrap.css"/>
   <script src="Scripts/bootstrap.min.js"></script>
   <link rel="stylesheet" href="Content/bootstrap-theme.min.css"/>
</head>
<body>
    <form id="bodyContainer" runat="server" >
            <div class="page-header" style="margin-left:5px" >
              <h1><span class="glyphicon glyphicon-cloud" aria-hidden="true"></span>Nimbus Cloud <small>Many Clouds, One Service</small></h1>
            </div>
        <div class="container-fluid" style="background-color:#328CC1; min-height:20px;"></div>

        <!--Nav Bar-->
        <div class="container-fluid" style="background-color:#0B3C5D;">
            <nav class="navbar navbar-dark" style="background-color:#1D2731; margin-top:15px" >
                <ul class="nav navbar-nav">
                    <li class="nav-item active">
                      <a class="nav-link" href="#" style="color:white">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#" style="color:white">Features</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#" style="color:white">Pricing</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#" style="color:white">About</a>
                    </li>
                </ul>
                <div class="col-md-3" style="margin-top:8px">
                     <input type="text" class="form-control" placeholder="Search"/>
               </div>  
                <button type="submit" class="btn btn-default" style="margin-top:8px">Submit</button>
            </nav>
        </div>

        <div class="container-fluid" style="background-color:#D9B310; min-height:5px;"></div>
        <div class="row">
            <div class="container-fluid" >
                <div class="col-md-2"  style="background-color:#1D2731; min-height: 690px;">
                   <h3 style="color:white"><center>Account</center></h3>
                    <div style="min-height:2px; background-color:white"></div>
                    <div style="min-height:20px"></div>
                    <center>
                       <button type="button" class="btn btn-primary">Add</button>
                       <button type="button" class="btn btn-primary">Remove </button>
                    </center>
                   <div style="min-height:20px"></div>

                  <ul class="nav nav-pills nav-stacked" id="accountMenu" role="tablist">
                      <li class="nav-item">
                        <a class="nav-link active" href="#box" style="color:white" role="tab" data-toggle="tab" id="boxPan">Box</a>
                      </li>     
                       
                      <li class="nav-item" id="boxAccount" style="color:white; margin-left:25px;">
                      </li>      
                      <li class="nav-item">
                        <a class="nav-link" href="#dropbox" style="color:white" role="tab" data-toggle="tab" id="dropboxPan">DropBox</a>
                      </li>
                      <li class="nav-item" id="dropboxAccount" style="color:white;margin-left:25px">
                      </li>   
                      <li class="nav-item">
                        <a class="nav-link" href="#googleDrive" style="color:white" role="tab" data-toggle="tab" id="googlePan">Google Drive</a>
                      </li>
                      <li class="nav-item" id="googleAccount" style="color:white;margin-left:25px">
                      </li>   
                      <li class="nav-item">
                        <a class="nav-link disabled" href="#onedrive" style="color:white" role="tab" data-toggle="tab" id="onedrivePan">Microsoft OneDrive</a>
                      </li>
                      <li class="nav-item" id="onedriveAccount" style="color:white;margin-left:25px">
                      </li>   
                 </ul>
                 <div class="tab-content">
                     <div class="tab-pane" id="box" role="tabpanel" style="color:white"></div>
                     <div class="tab-pane" id="dropbox" role="tabpanel" style="color:white"></div>
                     <div class="tab-pane" id="googleDrive" role="tabpanel" style="color:white"></div>
                     <div class="tab-pane" id="onedrive" role="tabpanel" style="color:white"></div>
                 </div>
            </div>


            <div class="col-md-8"  style="background-color:white; min-height: 690px;">
                <table class="table" >
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>File Name</th>
                      <th>Modified</th>
                      <th>File Type</th>
                      <th>File Size</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">1</th>
                      <td>File</td>
                      <td>3/3/2012</td>
                      <td>JPEG</td>
                      <td>120KB</td>
                    </tr>
                    <tr>
                      <th scope="row">2</th>
                      <td>File2</td>
                      <td>3/5/2013</td>
                      <td>TXT</td>
                      <td>33MB</td>
                    </tr>
                    <tr>
                      <th scope="row">3</th>
                      <td>Folder</td>
                      <td>6/3/2012</td>
                      <td>FOLDER</td>
                      <td>1.2G</td>
                    </tr>
                  </tbody>
                </table>
            </div>
            <div class="col-md-2"  style="background-color:#1D2731; min-height: 690px;">
                <h3 style="color:white"><center> Details </center></h3>
                <div style="background-color:white; min-height:2px"></div>
                <div style="min-height:20px"></div>
                <p style="color:white">File Name:</p>
                <p style="color:white">Type:</p>
                <p style="color:white">Size:</p>
                <p style="color:white">Date:</p>
                <div style="min-height:20px"></div>
                <center>
                    <button type="button" class="btn btn-primary">Upload</button>
                    <button type="button" class="btn btn-primary">Download </button>
                </center>
            </div>
        </div>
        </div>
        <div class="container-fluid" style="background-color:#D9B310; min-height:10px;"></div>
    </form>
</body>
<script>
    $('#accountMenu a').click(function (e) {
        e.preventDefault()
        if (this.id == "boxPan") {
            $('#boxAccount').html("<li>- Account1</li><li>- account2</li>");
            $('#dropboxAccount').empty();
            $('#googleAccount').empty();
            $('#onedriveAccount').empty();
        }
        if (this.id == "dropboxPan") {
            $('#boxAccount').empty();
            $('#dropboxAccount').html("<li>- Account1</li><li>- account2</li>");
            $('#googleAccount').empty();
            $('#onedriveAccount').empty();
        }
        if (this.id == "googlePan") {
            $('#boxAccount').empty();
            $('#dropboxAccount').empty();
            $('#googleAccount').html(" <li>- Account1</li><li>- account2</li>");
            $('#onedriveAccount').empty();
        }
        if (this.id == "onedrivePan") {
           $('#boxAccount').empty();
           $('#dropboxAccount').empty();
           $('#googleAccount').empty();
           $('#onedriveAccount').html(" <li>- Account1</li><li>- account2</li>");
        }

    })
</script>
</html>
