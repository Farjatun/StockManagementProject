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
    public partial class ItemIndex : System.Web.UI.Page
    {
       
        private ItemSetupManager itemSetupManager;

        public ItemIndex()
        {
         
            itemSetupManager=new ItemSetupManager();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                categoryDropDownList.DataSource = itemSetupManager.GetCategories();
                categoryDropDownList.DataTextField = "Name";
                categoryDropDownList.DataValueField = "CategoryID";
                categoryDropDownList.DataBind();
                categoryDropDownList.Items.Insert(0, new ListItem("<Select>", "0"));
                categoryDropDownList.SelectedIndex = 0;

                companyDropDownList.DataSource = itemSetupManager.GetAllCompanies();
                companyDropDownList.DataTextField = "Name";
                companyDropDownList.DataValueField = "CompanyId";
                companyDropDownList.DataBind();
                companyDropDownList.Items.Insert(0, new ListItem("<Select>", "0"));
                companyDropDownList.SelectedIndex = 0;

                recorderLevelTextBox.Text = "0";
            }
         }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            if (itemNameTextBox.Text != "" && recorderLevelTextBox.Text != "" && companyDropDownList.SelectedIndex != 0 && categoryDropDownList.SelectedIndex != 0)
            {
                if (itemSetupManager.IsNumeric(recorderLevelTextBox.Text))
                {
                    
                    Item itemSetup = new Item();
                    itemSetup.Name = itemNameTextBox.Text;
                    itemSetup.CategoryId = Convert.ToInt32(categoryDropDownList.SelectedValue);
                    itemSetup.CompanyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                    itemSetup.ReorderLevel = Convert.ToInt32(recorderLevelTextBox.Text);

                    string message = itemSetupManager.Save(itemSetup);
                    if (message == "Item Save Successful")
                    {
                        Response.Redirect("AllStoryIndexUI.aspx");
                    }
                    else
                    {
                        messageL.Text = message;
                    }
                }
                else
                {
                    messageL.Text = "Please Input Only Number in Reorder Text Box.";
                }


            }
            else
            {
                messageL.Text = "Please fill up all the text box Or Drop Down Box.";
            }

        }
    }
}