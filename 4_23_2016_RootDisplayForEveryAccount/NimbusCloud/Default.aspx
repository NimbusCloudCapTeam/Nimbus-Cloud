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
                       <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#removeAccountModal">Remove </button>
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
                <div style="min-height:15px"></div>
                <button id="backBtn" type="button" class="btn btn-primary btn-sm">
                    <span class="glyphicon glyphicon-chevron-left"></span> Back</button>
                <table class="table" id="navTable">
                  <thead>
                    <tr>
                      <th> </th>
                      <th>File Name</th>
                      <th>Modified</th>
                      <th>File Type</th>
                      <th>File Size</th>
                    </tr>
                  </thead>
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
         <!-- Modal content-->
        <div id="addAccountModal" class="modal fade" role="dialog" >
          <div class="modal-dialog">
            <div class="modal-content modal-sm">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add Account</h4>
              </div>
              <div class="modal-body">

                  <div class="dropdown" style="margin-bottom:5%" >
                      <button class="btn btn-default dropdown-toggle" type="button" id="dropdownAdd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                       Account Type
                        <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" runat="server" id="addAccountDropDown">
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

        <div id="removeAccountModal" class="modal fade" role="dialog">
          <div class="modal-dialog">
            <div class="modal-content modal-sm">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Remove Account</h4>
              </div>
              <div class="modal-body">

                  <div class="dropdown" style="margin-bottom:5%">
                      <button class="btn btn-default dropdown-toggle" type="button" id="dropdownRemoveType" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                       Account Type
                        <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuRemoveType" runat="server" id="dropdownMenuRemoveType">
                        <li><a href="#" id="boxRemoveWindow">Box</a></li>
                        <li><a href="#" id="dropboxRemoveWindow">DropBox</a></li>
                        <li><a href="#" id="googleRemoveWindow">Google Drive</a></li>
                        <li><a href="#" id="onedriveRemoveWindow">Microsoft OneDrive</a></li>                     
                      </ul>
                      <div id="accountRemoveType" style="margin-top:10px"><b>Selected Type:</b> None</div>
                   </div>

                   <div class="dropdown" style="margin-bottom:5%">
                      <button class="btn btn-default dropdown-toggle" type="button" id="dropdownRemoveName" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                       Account Type
                        <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu" id="dropdownMenuRemoveName">
                 
                      </ul>
                      <div id="accountRemoveName" style="margin-top:10px"><b>Selected Type:</b> None</div>
                   </div>

                  
              </div>

              <div class="modal-footer">
                <button type="submit" class="btn btn-primary" data-dismiss="modal" id="submitRemoveAccBtn">Submit</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" id="closeRemoveAccBtn">Close</button>
              </div>
            </div>

          </div>
        </div>
    </form>
</body>
<script>
    var openedNav;
    var removeName;
    var removeType;
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

        $("#addAccountDropDown li a").click(function () {
            $("#accountType").html('<b>Selected Account: </b> ' + $(this).text());
            accountType = $(this).text();
            addedType = $(this).text();
            
        });

        $('#dropdownMenuRemoveName').on('click', 'li', function () {
            $("#accountRemoveName").html('<b>Selected Type: </b> ' + $(this).text());
            removeName = $(this).text();
        });

        $("#dropdownMenuRemoveType li a").click(function () {
            $("#accountRemoveType").html('<b>Selected Type: </b> ' + $(this).text());
            removeType = $(this).text();
            $("#dropdownMenuRemoveName").empty();
            if ($(this).text() === "DropBox") {
                for (var i in dropboxList) {
                    var name = dropboxList[i].accName;
                    name = name.replace('"', "");
                    name = name.replace('"', "");
                    $("#dropdownMenuRemoveName").append("<li><a href=\"#\" id=\"" + name + "\">" + name + "</a></li>");
                }
            }
            if ($(this).text() === "Google Drive") {
                for (var i in googleList) {
                    var name = googleList[i].accName;
                    name = name.replace('"', "");
                    name = name.replace('"', "");
                    $("#dropdownMenuRemoveName").append("<li><a href=\"#\" id=\"" + name + "\">" + name + "</a></li>");
                }
            }
        });
       

    });



    var getResult = '';
    var addedType = "";

    //modal buttons
    $("#submitRemoveAccBtn").click(function () {
        $.ajax({
            type: "POST",
            url: "Default.aspx/removeAccount",
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify({ accountName: removeName, accountType: removeType }),
            dataType: 'json',
            success: function (result) {
                alert("Account Successfully Removed");

            },
            error: function (result) {
                alert("Failed to Remove Account");
            }
        });



    });
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

    var accData;
    $(document).ready(function () {
        setDropBoxAccounts();
        setGoogleAccounts();
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
                            getDriveRoot();

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
                    //alert(local);
                    $.ajax({
                        type: "POST",
                        url: "Default.aspx/setService",
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({ accAddress: local, accountType: accType }),
                        dataType: 'json',
                        success: function (result) {
                            getDropRoot();
                            //alert("Account Selected");

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

    //navigation scripts--------------------------------------------------------
    var navTable = null;
    var navPath = [];
    var navParent = null;

    function getDriveRoot() {
        navParent = "root";

        $.ajax({
            type: 'POST',
            url: 'Default.aspx/getDriveFolder',
            data: JSON.stringify({ id: "root" }),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (files) {
                setTable(files);
                writeTable();
            },
            error: function () {
                console.log('error loading root files');
            }
        });
    }

    function getDropRoot() {
        navParent = "/";

        $.ajax({
            type: 'POST',
            url: 'Default.aspx/getDropFolder',
            data: JSON.stringify({ path: "/" }),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (files) {
                setTable(files);
                writeTable();
            },
            error: function () {
                console.log('error loading root files');
            }
        });
    }

    $('#navTable').on('mouseenter mouseleave', 'tbody tr', function () {
        $(this).toggleClass('active');
    });

    $('#navTable').on('click', 'tbody tr', function () {
        $(this).toggleClass('info');
        $(this).siblings('tr').removeClass('info');
    });

    $('#navTable').on('dblclick', 'tbody tr', function () {
        if (openedNav === "Google Drive") {
            if (getType($(this).data('i')) == 'application/vnd.google-apps.folder') {
                navPath.push(navParent);

                navParent = getId($(this).data('i'));

                $.ajax({
                    type: 'POST',
                    url: 'Default.aspx/getDriveFolder',
                    data: JSON.stringify({ id: getId($(this).data('i')) }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (files) {
                        setTable(files);
                        writeTable();
                    },
                    error: function (navError) {
                        console.log('error loading folder files');
                    },
                    async: false
                });
            } else {
                writeTable();
            }
        } else if (openedNav === "DropBox") {
            if (isDir($(this).data('i')) == true) {
                navPath.push(navParent);

                navParent = getPath($(this).data('i'));

                $.ajax({
                    type: 'POST',
                    url: 'Default.aspx/getDropFolder',
                    data: JSON.stringify({ path: getPath($(this).data('i')) }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (files) {
                        setTable(files);
                        writeTable();
                    },
                    error: function (navError) {
                        console.log('error loading folder files');
                    },
                    async: false
                });
            } else {
                writeTable();
            }
        } else {
            console.log("Row Navigation: Unknown openedNav");
        }
    });

    $('#backBtn').on('click', function () {
        if (navPath.length > 0) {
            navParent = navPath.pop();

            if (openedNav === "Google Drive") {
                $.ajax({
                    type: 'POST',
                    url: 'Default.aspx/getDriveFolder',
                    data: JSON.stringify({ id: navParent }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (files) {
                        setTable(files);
                        writeTable();
                    },
                    error: function (navError) {
                        console.log('error loading folder files on back');
                        console.log(navError)
                    }
                });
            } else if (openedNav === "DropBox") {
                $.ajax({
                    type: 'POST',
                    url: 'Default.aspx/getDropFolder',
                    data: JSON.stringify({ path: navParent }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (files) {
                        setTable(files);
                        writeTable();
                    },
                    error: function (navError) {
                        console.log('error loading folder files on back');
                        console.log(navError)
                    }
                });
            } else {
                console.log("Back Navigation: Unknown openedNav");
            }
        }
    });

    function setTable(files) {
        if (openedNav === "Google Drive") {
            navTable = files.d;

            navTable.sort(function (a, b) {
                if (a.MimeType == 'application/vnd.google-apps.folder' && b.MimeType != 'application/vnd.google-apps.folder')
                    return -1;
                else if (a.MimeType != 'application/vnd.google-apps.folder' && b.MimeType == 'application/vnd.google-apps.folder')
                    return 1;
                else if (a.Name.toLowerCase() < b.Name.toLowerCase())
                    return -1;
                else if (a.Name.toLowerCase() > b.Name.toLowerCase())
                    return 1;
                else
                    return 0;
            });
        } else if (openedNav === "DropBox") {
            navTable = files.d.Contents;

            navTable.sort(function (a, b) {
                if (a.Is_Dir == true && b.Mime_Type == false)
                    return -1;
                else if (a.Is_Dir == false && b.Is_Dir == true)
                    return 1;
                else if (a.Name.toLowerCase() < b.Name.toLowerCase())
                    return -1;
                else if (a.Name.toLowerCase() > b.Name.toLowerCase())
                    return 1;
                else
                    return 0;
            });
        } else {
            console.log("Navigation setTable: Unknown openedNav");
        }
    }

    function writeTable() {
        var outNavTable = $('<tbody></tbody>');
        if (openedNav === "Google Drive") {
            $.each(navTable, function (i, file) {
                var row = $('<tr data-i="' + i + '"></tr>');
                var date = new Date(parseInt(file.ModifiedTime.substr(6)));
                var dateStr = (date.getMonth() + 1) + '-' + date.getDate() + '-' + date.getFullYear();

                row.append('<td> </td>');
                row.append('<td>' + file.Name + '</td>');
                row.append('<td>' + dateStr + '</td>');
                row.append('<td>' + file.MimeType + '</td>');
                row.append('<td>' + file.Size + '</td>');

                outNavTable.append(row);
            });
        } else if (openedNav === "DropBox") {
            $.each(navTable, function (i, file) {
                var row = $('<tr data-i="' + i + '"></tr>');
                var date = new Date(parseInt(file.ModifiedDate.substr(6)));
                var dateStr = (date.getMonth() + 1) + '-' + date.getDate() + '-' + date.getFullYear();

                row.append('<td> </td>');
                row.append('<td>' + file.Name + '</td>');
                row.append('<td>' + dateStr + '</td>');
                row.append('<td>' + file.Mime_Type + '</td>');
                row.append('<td>' + file.Size + '</td>');

                outNavTable.append(row);
            });
        } else {
            console.log("Navigation writeTable: Unknown openedNav");
        }

        $('#navTable tbody').remove();
        $('#navTable').append(outNavTable);
    }

    function getType(i) {
        return navTable[i].MimeType;
    }

    function getId(i) {
        return navTable[i].Id;
    }

    function isDir(i) {
        return navTable[i].Is_Dir;
    }

    function getPath(i) {
        return navTable[i].Path;
    }
</script>
</html>
