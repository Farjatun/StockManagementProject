<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemIndexUI.aspx.cs" Inherits="PracticeProject.UI.ItemIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="Styles/Item.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body class="IBody">
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
                    
                    <h1 class="glow">Item Setup</h1>
           <br />
          
        <asp:Label CssClass="label" ID="Label4" runat="server" Text="Category Name" Font-Bold="True"  > </asp:Label>
       
        <asp:DropDownList CssClass="dropdown" ID="categoryDropDownList" runat="server" Width="400px" height="30px" >
         
        </asp:DropDownList>
          
        <br />
            <br />
            <asp:Label CssClass="label" ID="Label5" runat="server" Text="Company Name" Font-Bold="True"></asp:Label>
      
        <asp:DropDownList CssClass="dropdown" ID="companyDropDownList" runat="server" Width="400px" height="30px" >
        </asp:DropDownList>
                    <br />
                    <br />

            <asp:Label CssClass="label" ID="Label3" runat="server" Text="Item Name" Font-Bold="True"></asp:Label>
     
            <asp:TextBox CssClass="align-items-end" ID="itemNameTextBox" runat="server" Width="400px"  ></asp:TextBox>
        <br />
    
            <br />

            <asp:Label CssClass="label" ID="Label2" runat="server" Text="Reorder Level" Font-Bold="True"></asp:Label>
        
        <asp:TextBox CssClass="align-items-end"  ID="recorderLevelTextBox" runat="server" Width="400px"></asp:TextBox>
            <br />

                      <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Button class="btn btn-danger" ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" Width="200px" />
    
                    <br />
                    <br />
                    <br />
          
        <asp:Label ID="messageL" runat="server" Font-Bold="True" font-size="Medium"></asp:Label>
    
            
        <br />
                    </div></div>
                </div>
    </fieldset>
        
    </div>
        
     </center>
    </form>

    </div>
    
</body>
</html>
