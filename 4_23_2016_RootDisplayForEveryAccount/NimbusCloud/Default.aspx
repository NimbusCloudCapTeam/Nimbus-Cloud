<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Nimbus Cloud</title>
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
            <nav class="navbar navbar-dark" style="background-color:#1D2731; margin-top:20px" >
                <div class="col-md-3" style="margin-top:8px; margin-left:15%">
                     <input type="text" class="form-control" placeholder="Search"/>
               </div>  
                <button type="submit" class="btn btn-default" style="margin-top:8px">Submit</button>

                <ul class="nav navbar-nav navbar-right" style="margin-right:1.5%">
                    <li class="nav-item active">
                      <a class="nav-link" href="#" style="color:white">Sort <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#" style="color:white">Delete</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#" style="color:white">Settings</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#" style="color:white">Help</a>
                    </li>
                </ul>  
            </nav>
        </div>

        <div class="container-fluid" style="background-color:#D9B310; min-height:5px;"></div>
        <div class="row">
            <div class="container-fluid" >
                <div class="col-md-2"  style="background-color:#1D2731; min-height: 690px">
                   <h3 style="color:white"><center>Account</center></h3>
                    <div style="min-height:2px; background-color:white"></div>
                    <div style="min-height:20px"></div>
                    <center>
                       <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addAccountModal">Add</button>
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
                      <li class="nav-item" id="googleAccount" style="margin-left:25px;display:none">
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
                      <th> </th>
                      <th>File Name</th>
                      <th>Modified</th>
                      <th>File Type</th>
                      <th>File Size</th>
                    </tr>
                  </thead>
                  <tbody id="tableBody"></tbody>
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
        <div id="addAccountModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content modal-sm">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add Account</h4>
              </div>
              <div class="modal-body">

                  <div class="dropdown" style="margin-bottom:5%">
                      <button class="btn btn-default dropdown-toggle" type="button" id="dropdownAdd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                       Account Type
                        <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" runat="server">
                        <li><a href="#" id="boxAddWindow">Box</a></li>
                        <li><a href="#" id="dropboxAddWindow">DropBox</a></li>
                        <li><a href="#" id="googleAddWindow">Google Drive</a></li>
                        <li><a href="#" id="onedriveAddWindow">Microsoft OneDrive</a></li>                     
                      </ul>
                      <div id="accountType" style="margin-top:10px"><b>Selected Account:</b> None</div>
                   </div>
                    <div>
                        <input type="text" class="form-control" placeholder="Account Name" id="accountNameTextBox"/>
                   </div>  
              </div>

              <div class="modal-footer">
                <button type="submit" class="btn btn-primary" data-dismiss="modal" id="submitAddAccBtn">Submit</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" id="closeAddAccBtn">Close</button>
              </div>
            </div>

          </div>
        </div>
    </form>
</body>
<script>
    var openedNav;
    $('#accountMenu a').click(function (e) {
        e.preventDefault()
        if (this.id == "boxPan") {
            $('#boxAccount').html("<li>- Account1</li><li>- account2</li>");
            $('#dropboxAccount').empty();
            $('#googleAccount').css('display', 'none');
            $('#onedriveAccount').empty();
        }
        if (this.id == "dropboxPan") {
            $('#googleAccount').empty();
            $('#boxAccount').empty();
            $('#dropboxAccount').empty();
            $('#dropboxAccount').css('display', 'block');
            setDropBoxAccounts();
            openedNav = "DropBox";
        }
        if (this.id == "googlePan") {
            $('#boxAccount').empty();
            $('#googleAccount').empty();
            $('#dropboxAccount').empty();
            $('#googleAccount').css('display', 'block');
            setGoogleAccounts();
            openedNav = "Google Drive";
        }
        if (this.id == "onedrivePan") {
           $('#boxAccount').empty();
           $('#dropboxAccount').empty();
           $('#googleAccount').css('display', 'none');
           $('#onedriveAccount').html(" <li>- Account1</li><li>- account2</li>");
        }

    })
    var accountType;
    $(function () {

        $(".dropdown-menu li a").click(function () {
            $("#accountType").html('<b>Selected Account: </b> ' + $(this).text());
            accountType = $(this).text();
            addedType = $(this).text();
            
        });

    });
    var getResult = '';
    var addedType = "";

    //modal buttons
    $("#closeAddAccBtn").click(function () {
    });
    $("#submitAddAccBtn").click(function () {
        var newAccountName = $("#accountNameTextBox").val();

        $.ajax({
            type: "POST",
            url: "Default.aspx/setAuthorization",
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify({accountName: newAccountName, accountType : accountType}),
            dataType: 'json',
            success: function (result) {
                var json = $.parseJSON(result.d);
                if (addedType === "Google Drive") {
                    setGoogleAccounts()
                }
                if (addedType === "DropBox") {
                    setDropBoxAccounts();
                }

            },
            error: function (result) {
                alert("fail");
            }
        });

        
    });

    //modal close action
    $('#addAccountModal').on('hidden.bs.modal', function () {
        $("#accountType").html('<b>Selected Account: </b> None');
        $('#accountNameTextBox').val("")
    })

    

    $('#fileObj').on('click', function () {
        $.ajax({
            type: 'POST',
            url: 'Default.aspx/getNavTable',
            data: $('#fileObj').data('fileId'),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (files) {
                $('#tableBody').empty();
                //append to table body
                $.each(files.d, function (i, file) {
                    var date = new Date(parseInt(file.ModifiedTime.substr(6)));
                    var dateStr = (date.getMonth() + 1) + '-' + date.getDate() + '-' + date.getFullYear();

                    $('#tableBody').append('<tr id="fileObj" data-fileId="' + file.Id + '">');
                    $('#tableBody').append('<td> </td>');
                    $('#tableBody').append('<td>' + file.Name + '</td>');
                    $('#tableBody').append('<td>' + dateStr + '</td>');
                    $('#tableBody').append('<td>' + file.MimeType.substr(12) + '</td>');
                    $('#tableBody').append('<td>' + file.Size + '</td>');
                    $('#tableBody').append('</tr>');
                });
            },
            error: function () {
                alert('error loading files');
            }
        });
    });

    var accData;
    $(document).ready(function () {

    });


    function setData(data) {
        accData = data;
    }
    var googleList = [];

    function addGoogleList(accN, accL) {
        googleList.push({
            accName: accN,
            accLocal: accL
        });
    }
    function setGoogleAccounts() {
        $.ajax({
            url: 'accounts.json',
            type: 'get',
            dataType: 'json',
            cache: false,
            success: function (data) {
                setData(data);
                $(data).each(function (index, value) {
                    accType = JSON.stringify(value.AccountType);
                    if (accType === "\"Google Drive\"") {
                        $('#googleAccount').prepend("<a  style=\"color:white\" value=\"" + value.AccountName + "\" onclick=\"clickedAccount(this)\" id=\"" + value.AccountName + "\" >" + value.AccountName + "</a>");
                        addGoogleList(JSON.stringify(value.AccountName), JSON.stringify(value.Location));
                    }

                });
            }
        });
    }

    var dropboxList = [];
    function addDropboxList(accN, accL) {
        dropboxList.push({
            accName: accN,
            accLocal: accL
        });
    }
    function setDropBoxAccounts() {
        $.ajax({
            url: 'accounts.json',
            type: 'get',
            dataType: 'json',
            cache: false,
            success: function (data) {
                setData(data);
                $(data).each(function (index, value) {
                    accType = JSON.stringify(value.AccountType);
                    if (accType === "\"DropBox\"") {
                        $('#dropboxAccount').prepend("<a  style=\"color:white\" value=\"" + value.AccountName + "\" onclick=\"clickedAccount(this)\" id=\"" + value.AccountName + "\" >" + value.AccountName + "</a>");
                        addDropboxList(JSON.stringify(value.AccountName), JSON.stringify(value.Location));
                    }

                });
            }
        });
    }
    var sendback;
    function setSendBack(back) {
        sendback = back;
    }
    function getAddress(address) {
        var sendback;
        $.ajax({
            url: 'Scripts/accounts.json',
            type: 'get',
            dataType: 'json',
            cache: false,
            success: function (data) {
                setData(data);
                $(data).each(function (index, value) {
                    accName = JSON.stringify(value.AccountName);
                    if (accName === "\"" + address + "\"") {

                        setSendBack(JSON.stringify(value.Location));
                    }
                });
            }
        });
        //return sendback;
    }

    function clickedAccount(e) {
        var idClicked = e.id;
        var address;
        if (openedNav === "Google Drive") {
            for (var i in googleList) {
                if ("\"" + idClicked + "\"" === googleList[i].accName) {
                    var local = googleList[i].accLocal;
                    var accType = openedNav;

                    $.ajax({
                        type: "POST",
                        url: "Default.aspx/setService",
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({ accAddress: local, accountType: accType }),
                        dataType: 'json',
                        success: function (result) {

                            $.ajax({
                                type: 'POST',
                                url: 'Default.aspx/getNavTable',
                                data: '{}',
                                contentType: 'application/json; charset=utf-8',
                                dataType: 'json',
                                success: function (files) {
                                    $('#tableBody').empty();
                                    //append to table body
                                    $.each(files.d, function (i, file) {
                                        var date = new Date(parseInt(file.ModifiedTime.substr(6)));
                                        var dateStr = (date.getMonth() + 1) + '-' + date.getDate() + '-' + date.getFullYear();

                                        $('#tableBody').append('<tr id="fileObj" data-fileId="' + file.Id + '">');
                                        $('#tableBody').append('<td> </td>');
                                        $('#tableBody').append('<td>' + file.Name + '</td>');
                                        $('#tableBody').append('<td>' + dateStr + '</td>');
                                        $('#tableBody').append('<td>' + file.MimeType.substr(12) + '</td>');
                                        $('#tableBody').append('<td>' + file.Size + '</td>');
                                        $('#tableBody').append('</tr>');
                                    });
                                },
                                error: function () {
                                    alert('error loading files');
                                }
                            });
                            // var json = $.parseJSON(result.d);

                            // alert("Success Service");
                            //$('#googleAccount').empty();
                            //setGoogleAccounts();

                        },
                        error: function (result) {
                            alert("Failed Service");

                        }
                    });



                    return false;
                }

            }
        }

        if (openedNav === "DropBox") {
            for (var i in dropboxList) {
                if ("\"" + idClicked + "\"" === dropboxList[i].accName) {
                    var local = dropboxList[i].accLocal;
                    var accType = openedNav;
                    alert(local);
                    $.ajax({
                        type: "POST",
                        url: "Default.aspx/setService",
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({ accAddress: local, accountType: accType }),
                        dataType: 'json',
                        success: function (result) {
                            alert("Account Selected");
                           /* $.ajax({
                                type: 'POST',
                                url: 'Default.aspx/getNavTable',
                                data: '{}',
                                contentType: 'application/json; charset=utf-8',
                                dataType: 'json',
                                success: function (files) {
                                    $('#tableBody').empty();
                                    //append to table body
                                    $.each(files.d, function (i, file) {
                                        var date = new Date(parseInt(file.ModifiedTime.substr(6)));
                                        var dateStr = (date.getMonth() + 1) + '-' + date.getDate() + '-' + date.getFullYear();

                                        $('#tableBody').append('<tr id="fileObj" data-fileId="' + file.Id + '">');
                                        $('#tableBody').append('<td> </td>');
                                        $('#tableBody').append('<td>' + file.Name + '</td>');
                                        $('#tableBody').append('<td>' + dateStr + '</td>');
                                        $('#tableBody').append('<td>' + file.MimeType.substr(12) + '</td>');
                                        $('#tableBody').append('<td>' + file.Size + '</td>');
                                        $('#tableBody').append('</tr>');
                                    });
                                },
                                error: function () {
                                    alert('error loading files');
                                }
                            });*/
                            // var json = $.parseJSON(result.d);

                            // alert("Success Service");
                            //$('#googleAccount').empty();
                            //setGoogleAccounts();

                        },
                        error: function (result) {
                            alert("Failed Service");

                        }
                    });



                    return false;
                }

            }
        }

    }

</script>
</html>
