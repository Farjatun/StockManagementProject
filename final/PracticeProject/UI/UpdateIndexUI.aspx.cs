using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PracticeProject.BLL.Manager;
using PracticeProject.BLL.Model;

namespace PracticeProject.UI
{
    public partial class UpdateIndex : System.Web.UI.Page
    {
        public CategoryManeger CategoryManeger;

        public UpdateIndex()
        {
            CategoryManeger=new CategoryManeger();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["Id"]);

                Category category = CategoryManeger.GetCategoryById(id);

                idHiddenField.Value = category.CategoryId.ToString();
                nameTextbox.Text = category.Name;
             }
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            Category category=new Category();
            category.CategoryId = Convert.ToInt32(idHiddenField.Value);
            category.Name = nameTextbox.Text;
            string message = CategoryManeger.Update(category);
            if (message == "update successfully")
            {
                
                Response.Redirect("AllStoryIndexUI.aspx");
            }
            else
            {
                messageL.Text = message;
            }
            
        }
    }
}