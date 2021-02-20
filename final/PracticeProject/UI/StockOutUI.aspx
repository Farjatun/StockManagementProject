<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockOutUI.aspx.cs" Inherits="PracticeProject.UI.StockOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="Styles/Stockout.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body class="ZBody">
<div class="container">
    <form id="form1" runat="server">
        <center>
        <div class="formInside">
    <fieldset>
        <div class="workingBody">
            <div class="row">
                <div class="col-md-6">
                <div class="col-md-6"></div>
            <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
            <asp:Button class="btn btn-dark" ID="frontPageButton" runat="server" Text="Go To Front Page" Width="190px" OnClick="frontPageButton_Click" Font-Bold="True" />
                    <br/><br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Company" Font-Size="X-Large"></asp:Label>
       
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList  CssClass="shape" ID="comapanyNameDropDownList" runat="server" Width="210px" height="40px" AutoPostBack="True" OnSelectedIndexChanged="comapanyNameDropDownList_SelectedIndexChanged" BackColor="#CCCCCC">
        </asp:DropDownList>
           
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Item" Font-Size="X-Large"></asp:Label>
       
                    &nbsp;&nbsp;&nbsp;<asp:DropDownList  CssClass="shape" ID="itemNameDropDownList" runat="server" Width="222px" height="40px" AutoPostBack="True" OnSelectedIndexChanged="itemNameDropDownList_SelectedIndexChanged" BackColor="#CCCCCC">
        </asp:DropDownList>
            
        <br />
                    <br />
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Reorder Level" Font-Size="X-Large"></asp:Label>
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:TextBox  CssClass="shape" ID="ReorderLevelTextBox" runat="server" height="40px" Width="188px" BackColor="#CCCCCC"></asp:TextBox>
        <br />
                    <br />

        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Available Quantity" Font-Size="X-Large"></asp:Label>
       
        <asp:TextBox  CssClass="shape" ID="availableQuantityTextBox" runat="server" height="40px"  Width="188px" BackColor="#CCCCCC"></asp:TextBox>
        <br />
        <br />

        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Stock Out Quantity" Font-Size="X-Large"></asp:Label>
       
        <asp:TextBox  CssClass="shape" ID="stockOutQuantityTextBox" runat="server" height="40px" Width="188px" BackColor="#CCCCCC"></asp:TextBox>
        <br />
        <br />
        <br />

        <asp:Button class="btn btn-dark" ID="addButton" runat="server" Text="Add" Width="100px" OnClick="addButton_Click1" Font-Bold="True" />
                    <br />
                    <br />
            
            <asp:Label ID="outputLabel" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
        <br />
        <br />
         <asp:GridView  CssClass="shape" ID="showGridView" runat="server" AutoGenerateColumns="False" CellPadding="3" ForeColor="Black" GridLines="Vertical" style="margin-left: 220px" Width="580px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Font-Size="X-Large" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:TemplateField HeaderText="SL">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex +1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                
                 
                                 <asp:TemplateField HeaderText="Item">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Bind("ItemId") %>' />
                                            <asp:Label ID="ItemNameLabel" runat="server" Text='<% #Eval("ItemName")%>'></asp:Label>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
            

                                    <asp:TemplateField HeaderText="Company">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("CompanyId") %>' />
                                            <asp:Label ID="companyNameLabel" runat="server" Text='<% #Eval("CompanyName")%>'></asp:Label>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                
                                <asp:TemplateField HeaderText="Quantity">
                                        <ItemTemplate>
                                            <asp:Label ID="quantityLabel" runat="server" Text='<% #Eval("StockOutQuantity")%>'></asp:Label>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                

                                </Columns>

                               
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />

                               
        </asp:GridView>
        
       
       <p style="margin-left: 480px">
       <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-3">
                
       <asp:Button class="btn btn-success"  ID="sellButton" runat="server" style="margin-left: 0px" Text="Sell" Width="100px" OnClick="sellButton_Click" />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Button class="btn btn-danger" ID="damageButton" runat="server" Text="Damage" OnClick="damageButton_Click" Width="100px" />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Button class="btn btn-warning" ID="lostButton" runat="server" Text="Lost" Width="100px" OnClick="lostButton_Click" /></div></div></div>
        
        </p>
                </div>
            </div>
    </fieldset>
        </div>
        </center>
    


</div>
        <p style="margin-left: 40px">

        </p>
    </form>
</body>
</html>
