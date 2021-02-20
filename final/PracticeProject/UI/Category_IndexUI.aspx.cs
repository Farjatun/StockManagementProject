using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PracticeProject.BLL.Manager;
using PracticeProject.BLL.Model;

namespace PracticeProject
{
    public partial class Index : System.Web.UI.Page
    {
        private CategoryManeger categoryManeger;
        public Index()
        {
            categoryManeger=new CategoryManeger();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            categoryGridView.DataSource = categoryManeger.GetAllCategories();
            categoryGridView.DataBind();
        }

        protected void categorySaveButton_Click(object sender, EventArgs e)
        {
            Category category= new Category();
            category.Name = categoryNameTextBox.Text;
            
            string message = categoryManeger.Save(category);
            if (message == "Save Successful")
            {
                Response.Redirect("AllStoryIndexUI.aspx");
            }
            else
            {
                categoryNameTextBox.Text = "";
                messageL.Text = message;
            }


        }
        
        protected void updateLinkButton_OnClick(object sender, EventArgs e)
        {
            LinkButton updateLinkButton = (LinkButton)sender;
            DataControlFieldCell cell = updateLinkButton.Parent as DataControlFieldCell;
            GridViewRow row = cell.Parent as GridViewRow;
            HiddenField idHiddenField = row.FindControl("idHiddenField") as HiddenField;
            Response.Redirect("UpdateIndexUI.aspx?Id=" + idHiddenField.Value);     //Query String=  "?Id="+idHiddenField.Value;"
        }
    }
}