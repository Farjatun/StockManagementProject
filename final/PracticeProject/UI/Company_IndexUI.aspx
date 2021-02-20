<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Company_IndexUI.aspx.cs" Inherits="PracticeProject.Company_Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="Styles/Company.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body class="YBody">
<div class="container">
    <br/>
    <h1><center>Company</center></h1> </div></div>
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
        <asp:Label runat="server" Text="Name" Font-Bold="True" Font-Names="cursive" Font-Size="XX-Large"></asp:Label>
        &nbsp;
        <asp:TextBox ID="companyNaneTextBox" runat="server" style="margin-left: 0px" Width="195px"></asp:TextBox>
        &nbsp;<asp:Label ID="messageL" runat="server" Font-Bold="True" Font-Names="cursive" Font-Size="X-Large" ForeColor="Blue"></asp:Label>
            <br/>
            <br />
            <br />
        <asp:Button class="btn btn-success" ID="companySaveButton" runat="server" Text="Save" OnClick="companySaveButton_Click" Width="100px" Font-Bold="True" Font-Names="Cursive" Font-Size="X-Large" />
                
        <asp:GridView ID="companyGridView" runat="server" style="margin-top: 44px; margin-left: 85px;" Width="337px" AutoGenerateColumns="False" CellPadding="3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Height="138px" CellSpacing="2" Font-Bold="True" Font-Italic="False" Font-Names="Cursive" Font-Size="X-Large">
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
                                <div style="text-align: left; padding-left:10px "> <Center>Name</Center></div>
                            </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label CssClass="pd" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                     </ItemTemplate>
                  </asp:TemplateField>
         </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <br />
                </div>
            </div>
            </div>

        </fieldset>
    
    
    </div>
    </center>
</form>
</body>
</html>
