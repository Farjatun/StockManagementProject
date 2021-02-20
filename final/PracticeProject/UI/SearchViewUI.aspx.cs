using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PracticeProject.BLL.Manager;

namespace PracticeProject.UI
{
    public partial class SearchViewUI : System.Web.UI.Page
    {
        private SearchViewManager searchViewManager = new SearchViewManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCompanies();
                BindCategory();
            }
        }

        public void BindCompanies()
        {
            companyDropDownList.DataSource = searchViewManager.GetAllCompany();
            companyDropDownList.DataTextField = "Name";
            companyDropDownList.DataValueField = "CompanyId";
            companyDropDownList.DataBind();
            companyDropDownList.Items.Insert(0, new ListItem("-Select Company-", "0"));
        }

        public void BindCategory()
        {
            categoryDropDownList.DataSource = searchViewManager.GetAllCategory();
            categoryDropDownList.DataValueField = "CategoryId";
            categoryDropDownList.DataTextField = "Name";
            categoryDropDownList.DataBind();
            categoryDropDownList.Items.Insert(0, new ListItem("-Select Category-", "0"));
        }

        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(companyDropDownList.SelectedValue);

            categoryDropDownList.DataSource = searchViewManager.GetCategoryById(id);
            //if (showListGridView.Rows.Count == 0)
            //{
            //    outputLabel.Text = "There are no Recored";
            //    categoryDropDownList.Enabled = false;
            //}
            //else
            //{
                categoryDropDownList.DataTextField = "Name";
                categoryDropDownList.DataValueField = "CategoryId";
                categoryDropDownList.DataBind();
                categoryDropDownList.Items.Insert(0, new ListItem("-Select Category-", "0"));
            //}
            



        }
        protected void categoryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(categoryDropDownList.SelectedValue);
            if (companyDropDownList.SelectedIndex == 0)
            {
                //companyDropDownList.DataSource = searchViewManager.GetCompanyById(id);
                //companyDropDownList.DataTextField = "Name";
                //companyDropDownList.DataValueField = "CompanyId";
                //companyDropDownList.DataBind();
                //companyDropDownList.Items.Insert(0, new ListItem("-Select Company-", "0"));

                companyDropDownList.Enabled = false;
            }

        }



        protected void searchButton_Click(object sender, EventArgs e)
        {
            int companyId = Convert.ToInt32(companyDropDownList.SelectedValue);
            int categoryId = Convert.ToInt32(categoryDropDownList.SelectedValue);

            string companyName = companyDropDownList.SelectedItem.ToString();
            string categoryName = categoryDropDownList.SelectedItem.ToString();

            outputLabel.Text = "";



            if (companyId == 0 && categoryId == 0)
            {
                showListGridView.DataSource = searchViewManager.GetAllItem();
                showListGridView.DataBind();
            }
            else if (companyId != 0 && categoryId != 0)
            {
                showListGridView.DataSource = searchViewManager.GetAllCompanyAndCategoryByName(categoryName, companyName);
                showListGridView.DataBind();
            }
            else if (companyId != 0)
            {
                showListGridView.DataSource = searchViewManager.GetAllCompanyItemById(companyName);
                if (showListGridView.Rows.Count == 0)
                {
                    outputLabel.Text = "There are no Recored";
                }
                showListGridView.DataBind();
            }
            else if (categoryId != 0)
            {
                showListGridView.DataSource = searchViewManager.GetAllCategoryItemByName(categoryName);
                if (showListGridView.Rows.Count == 0)
                {
                    outputLabel.Text = "There are no Recored";
                }
                showListGridView.DataBind();
            }
            
            companyDropDownList.Enabled = true;
            BindCompanies();
            BindCategory();
        }

        protected void frontPageButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllStoryIndexUI.aspx");
        }


    }
}