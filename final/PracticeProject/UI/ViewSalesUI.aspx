<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSalesUI.aspx.cs" Inherits="PracticeProject.UI.ViewSalesUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="Styles/Sales.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <style type="text/css">
        .col-md-3 {
            margin-left: 920px;
        }
    </style>
</head>
<body class="QBody">
<div class="container">
    <br/><div class="jumbotron jumbotron-fluid">
    <h1> <center> View Sales </center>  </h1> </div></div>
<form id="form1" runat="server">
  <center>
    <div class="formInside">
        <fieldset>

            <div class="workingBody">
            <div class="row">
                <div class="col-md-3">
            
            <asp:Button class="btn btn-danger" ID="frontPageButton" runat="server" Text="Go To Front Page" Width="218px" OnClick="frontPageButton_Click" Font-Bold="True" />
                </div>
                <div class="col-md-6"></div>
                    <div class="col-md-4">
           <br />
            <asp:Label ID="Label1" runat="server" Text="From Date" Font-Bold="True" Font-Size="Large" BackColor="#6699FF" ForeColor="White"></asp:Label>

            <asp:TextBox CssClass="UShape" ID="fromDateTextBox" runat="server"></asp:TextBox>
            <asp:Button class="btn btn-success" ID="fromDateButton" runat="server" OnClick="fromDateButton_Click" Text="Select" Width="88px" Font-Bold="True" />
            
            <br />
            <asp:Calendar ID="fromDateCalendar" runat="server" OnSelectionChanged="fromDateCalendar_SelectionChanged" style="margin-left: 225px; margin-right: 0px" Width="325px"></asp:Calendar>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="To Date" Font-Bold="True" Font-Size="Large" BackColor="#6699FF" ForeColor="White"></asp:Label>
            <asp:TextBox CssClass="UShape" ID="toDateTextBox" runat="server"></asp:TextBox>
            <asp:Button class="btn btn-success" ID="toDaetButton" runat="server" OnClick="toDaetButton_Click" Text="Select" Width="95px" Font-Bold="True" />
            <br />
            <br />
            <asp:Calendar ID="toDateCalendar" runat="server" OnSelectionChanged="toDateCalendar_SelectionChanged" style="margin-left: 226px" Width="325px"></asp:Calendar>
            <br />
            <asp:Button class="btn btn-success" ID="searchButton" runat="server" OnClick="searchButton_Click" Text="Search" Width="118px" Font-Bold="True" Height="47px" />
            <br />
            <br />
            <asp:Label ID="outputLabel" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label>
            &nbsp;
                    <br />
        <asp:GridView ID="showGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#000066" style="margin-left: 221px" Width="580px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" Font-Bold="True">
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
                    <asp:TemplateField HeaderText="Sell Quantity">
                        <ItemTemplate>
                            <asp:Label ID="stockOutQuantityLabel" runat="server" Text='<% #Eval("StockOutQuantity")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sell Date">
                        <ItemTemplate>
                            <asp:Label ID="DateLabel" runat="server" Text='<% #Eval("Date")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <br />
            <br />
  </div>
                    
                </div>
        </div>
        </fieldset>
    </div>

 
    <div>
    
    </div>
       </
    </center>
    </form>

</body>
</html>
