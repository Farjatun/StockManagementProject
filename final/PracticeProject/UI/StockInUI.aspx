<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockInUI.aspx.cs" Inherits="PracticeProject.UI.StockIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>:
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="Styles/Stockin.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body class="VBody">
<div class="container">
    <br/>
    <h1><center>Stock In </center></h1>  </div></div>
<form id="form1" runat="server">
    <center>
    <div class="formInside">
        <fieldset>

            <div class="workingBody">
            <div class="row">
                <div class="col-md-6">
                <div class="col-md-6"></div>
           <br />
           <br />
                
       
        <asp:Label ID="Label1" runat="server" Text="Company" Font-Bold="True" Font-Size="XX-Large" ForeColor="White"></asp:Label>
        
        <asp:DropDownList ID="companyDropDownList" runat="server" AutoPostBack="True" Width="200px" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged">
        </asp:DropDownList>
            ;<br />
                    <br />
            <asp:Label ID="Label2" runat="server" Text="Item" Font-Bold="True" Font-Size="XX-Large" ForeColor="White"></asp:Label>
        <asp:DropDownList ID="itemDropDownList" runat="server" Width="221px" AutoPostBack="True" OnSelectedIndexChanged="itemDropDownList_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <br />
            <asp:Label ID="Label3" runat="server" Text="Reorder Level" Font-Bold="True" Font-Size="XX-Large" ForeColor="White"></asp:Label>
        <asp:TextBox ID="reorderLevelTextBox" runat="server" Width="188px" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
            <asp:Label ID="Label4" runat="server" Text="Available Quantity" Font-Bold="True" Font-Size="XX-Large" ForeColor="White"></asp:Label>
        <asp:TextBox ID="availableQuantityTextBox" runat="server" Width="188px" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
            <asp:Label ID="Label5" runat="server" Text="Stock In Quatity" Font-Bold="True" Font-Size="XX-Large" ForeColor="White"></asp:Label>
        <asp:TextBox ID="stockInQuantityTextBox" runat="server" Width="188px"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="saveButton" runat="server" OnClick="saveButton_Click" Text="Save" Width="100px" Font-Bold="True" />
    
                    <br />
                    <br />
                    <asp:Label ID="messageL" runat="server" Font-Size="Large" ForeColor="White"></asp:Label>
    
        <br />        </div>
            </div>
            </div>

        </fieldset>
    </div>
    </center>
</form>

</body>
</html>
