<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Category_IndexUI.aspx.cs" Inherits="PracticeProject.Index" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="Styles/Category.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body class="CBody">
<div class="container">
<form id="form1" runat="server">
    <center>
    <div class="formInside">
        <fieldset>

            <div class="workingBody">
            <div class="row">
                <div class="col-md-6">
                <div class="col-md-6"></div>
                    <br/> 
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Name" Font-Bold="True" Font-Names="Cursive" Font-Size="XX-Large" Font-Strikeout="False" ForeColor="Aqua"></asp:Label>
                    <asp:TextBox ID="categoryNameTextBox" runat="server"></asp:TextBox>
                    <br/> <asp:Label ID="messageL" runat="server" Font-Bold="True" Font-Names="cursive" Font-Size="XX-Large" ForeColor="White"></asp:Label>

                    <br/> <asp:Button ID="categorySaveButton" CssClass="categoryBtn" runat="server" Text="Save" OnClick="categorySaveButton_Click" Font-Bold="True"/>
                    <br/>
                    <asp:GridView ID="categoryGridView" runat="server" style="margin-top: 44px;" Width="350px" AutoGenerateColumns="False" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Bold="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">

                        <AlternatingRowStyle BackColor="#CCCCCC"/>

                        <Columns>

                            <asp:TemplateField>
                                <HeaderTemplate>
                                <div style="text-align: Center; padding-left:10px ">SL</div>
                            </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex +1 %>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>

                            <asp:TemplateField>
                                 <HeaderTemplate>
                                <div style="text-align: left; padding-left:10px ">Name</div>
                            </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label CssClass="pd" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                    <asp:HiddenField ID="idHiddenField" runat="server" Value='<%#Eval("CategoryID") %>'/>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <HeaderTemplate>
                                <div style="text-align: center;">Action</div>
                            </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton CssClass="button" ID="updateLinkButton" runat="server" OnClick="updateLinkButton_OnClick">Update</asp:LinkButton>
                                </ItemTemplate>
                                <ControlStyle Width="190px" />
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="150px"  />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC"/>
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"/>
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center"/>
                        <RowStyle HorizontalAlign="Center"/>
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"/>
                        <SortedAscendingCellStyle BackColor="#F1F1F1"/>
                        <SortedAscendingHeaderStyle BackColor="#808080"/>
                        <SortedDescendingCellStyle BackColor="#CAC9C9"/>
                        <SortedDescendingHeaderStyle BackColor="#383838"/>
                    </asp:GridView>
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