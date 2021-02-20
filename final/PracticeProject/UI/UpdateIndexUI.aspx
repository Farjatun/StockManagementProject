<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateIndexUI.aspx.cs" Inherits="PracticeProject.UI.UpdateIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="Styles/Update.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body class="MBody">
<div class="container">
    <form id="form1" runat="server">
      <center>
    <div class="formInside">
        <fieldset>
            <div class="workingBody">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3"></div>
                <div class="col-md-3">
           <br />
                    
                    <h1 >Update Index</h1>
           <br />
        <asp:Label ID="Label1" runat="server" Text="Name" Font-Bold="True" Font-Names="cursive" Font-Size="X-Large"></asp:Label>
        
        
        <asp:TextBox ID="nameTextbox" runat="server" Width="200px"></asp:TextBox>
        <asp:Label ID="messageL" runat="server" Font-Size="X-Large"></asp:Label>
        <br>
        
            <br />
            <br />
        <br>
        
        <asp:Button ID="updateButton" runat="server" OnClick="updateButton_Click" Text="Update" Width="100px" />
    
        <br />
            <br />
        
        <asp:HiddenField ID="idHiddenField" runat="server" />
                </div>
            </div>
            </div>

        </fieldset>
        </div>
      </center>
    </form>
</div>
    
    

</body>
</html>
