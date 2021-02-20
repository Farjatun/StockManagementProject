<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllStoryIndexUI.aspx.cs" Inherits="PracticeProject.AllStoryIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="Styles/AllStoryIndexes.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body class="SBody">
<div class="container">
    <form id="form1" runat="server">
        <center>
        <div class="formInside">
    <fieldset>
        <div class="workingBody">
                <div class="row">
                    <div class="col-md-3"></div>

                    <div class="col-md-6"></div>
                    <div class="col-md-3">
                        <br/> <asp:Button CssClass="btnC" ID="categoryButton" runat="server" OnClick="categoryButton_Click" Text="Category" BackColor="#ededf2"  Width="342px" BorderStyle="Ridge" Height="51px" />
        <br /> <asp:Button CssClass="btnC" ID="stockOutButton" runat="server" OnClick="stockOutButton_Click" Text="Stock Out"  Width="342px" BackColor="#ededf2" BorderStyle="Ridge" Height="50px" />
        <br /><asp:Button CssClass="btnC" ID="companyButton" runat="server" OnClick="companyButton_Click" Text="Company" BackColor="#ededf2" Width="341px" BorderStyle="Ridge" Height="50px" />
        <br /><asp:Button CssClass="btnC" ID="searchViewButton" runat="server" OnClick="searchViewButton_Click" Text="Search View"  Width="343px" BackColor="#ededf2" BorderStyle="Ridge" Height="50px" />
        <br /><asp:Button CssClass="btnC" ID="itemSetupButton" runat="server" OnClick="itemSetupButton_Click" Text="Item Set Up" BackColor="#ededf2" Width="342px" BorderStyle="Ridge" Height="50px" />
        <br /><asp:Button CssClass="btnC" ID="viewSalesButton" runat="server" OnClick="viewSalesButton_Click" Text="View Sales" Width="342px" BackColor="#ededf2" BorderStyle="Ridge" Height="50px" />
        <br /><asp:Button CssClass="btnC" ID="Button1" runat="server" OnClick="Button1_Click" Text="Stock In" BackColor="#ededf2" Width="342px" BorderStyle="Ridge" Height="50px" />
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