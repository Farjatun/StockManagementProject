using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using PracticeProject.BLL.Manager;
using PracticeProject.BLL.Model;
using PracticeProject.DAL.Gateway;

namespace PracticeProject
{
    public partial class Company_Index : System.Web.UI.Page
    {
        private CompanyManeger companyManeger;

        public Company_Index()
        {
            companyManeger=new CompanyManeger();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            companyGridView.DataSource = companyManeger.GetAllCompanies();
            companyGridView.DataBind();
        }

        protected void companySaveButton_Click(object sender, EventArgs e)
        {
            Company company= new Company();
            company.Name = companyNaneTextBox.Text;
            
            string message = companyManeger.Save(company);
            
            if (message == "Save Successful")
            {
                Response.Redirect("AllStoryIndexUI.aspx");
            }
            else
            {
                companyNaneTextBox.Text = "";
                messageL.Text = message;
            }
            

        }

        
    }
}