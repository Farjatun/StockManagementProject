using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PracticeProject
{
    public partial class AllStoryIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void categoryButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Category_IndexUI.aspx");
        }

        protected void companyButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Company_IndexUI.aspx");
        }

        protected void itemSetupButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ItemIndexUI.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("StockInUI.aspx");
        }

        protected void stockOutButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("StockOutUI.aspx");
        }

        protected void searchViewButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("SearchViewUI.aspx");
        }

        protected void viewSalesButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewSalesUI.aspx");
        }
    }
}