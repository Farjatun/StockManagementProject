<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchViewUI.aspx.cs" Inherits="PracticeProject.UI.SearchViewUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="Styles/Search.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    </head>
<body class="WBody">
<div class="container">
<form id="form1" runat="server">
    <center>
    <div class="formInside">
        <fieldset> 
                <div class="workingBody">


                    <br/><br/><br/><br/><br/><br/><br/> <br/><br/>
                <asp:Label ID="Label1" runat="server" Text="Company" Font-Bold="True" Font-Size="X-Large" ForeColor="White"></asp:Label>
                <asp:DropDownList CssClass="bradius" ID="companyDropDownList" runat="server" Height="30px" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged" Width="210px" AutoPostBack="True" style="margin-left: 0px">
                </asp:DropDownList>
                <asp:Button class="btn btn-light" ID="frontPageButton" runat="server" Text="Go To Front Page" Width="190px" OnClick="frontPageButton_Click" />
                 <br />
                  <br />
                        <asp:Label ID="Label2" runat="server" Text="Category" Font-Bold="True" Font-Names="cursive" Font-Size="X-Large" ForeColor="White"></asp:Label>
                    
                        <asp:DropDownList CssClass="bradius" ID="categoryDropDownList" runat="server" Height="30px" Width="210px" AutoPostBack="True" OnSelectedIndexChanged="categoryDropDownList_SelectedIndexChanged">
                        </asp:DropDownList>
                                
                        &nbsp;<asp:Label ID="outputLabel" runat="server" Font-Bold="True" Font-Names="Cursive" Font-Size="Large" Font-Underline="True" ForeColor="White"></asp:Label>
                    
            <br /><br /><br />
                        <asp:Button class="btn btn-light" ID="searchButton" runat="server" OnClick="searchButton_Click" Text="Search" Width="100px" />
                    
                        <br />
            <br />
            <br />
                    
                        <br />
        <asp:GridView CssClass="bradius" ID="showListGridView" runat="server" AutoGenerateColumns="False" style="margin-left: 220px" Width="580px" Font-Bold="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Font-Size="Medium" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                        <%#Container.DataItemIndex +1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Item">
                    <ItemTemplate>
                        <asp:Label ID="ItemNameLabel" runat="server" Text='<% #Eval("ItemName")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Company">
                    <ItemTemplate>
                        <asp:Label ID="companyNameLabel" runat="server" Text='<% #Eval("CompanyName")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Available Quantity">
                    <ItemTemplate>
                        <asp:Label ID="availableQuantityLabel" runat="server" Text='<% #Eval("AvailableQuantity")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Reorder Level">
                    <ItemTemplate>
                        <asp:Label ID="reorderLevelLabel" runat="server" Text='<% #Eval("ReorderLevel")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
            <br />
                
        </div>

        </fieldset>
        
        <br />
        <br />
        </div></center>
    </form>
    </div>
</body>
</html>
