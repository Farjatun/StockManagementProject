using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PracticeProject.BLL.Manager;
using PracticeProject.BLL.Model;
using PracticeProject.BLL.Model.ViewModel;

namespace PracticeProject.UI
{
    public partial class StockIn : System.Web.UI.Page
    {
        private StockInManager stockInManager;
        public StockIn()
        {
            stockInManager=new StockInManager();
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCompany();
                itemDropDownList.Items.Insert(0, "No Item Available");
            }
        }

        public void GetCompany()
        {

            if (stockInManager.GetAllCompanies().Count > 0)
            {
                companyDropDownList.DataSource = stockInManager.GetAllCompanies();
                companyDropDownList.DataTextField = "Name";
                companyDropDownList.DataValueField = "CompanyId";
                companyDropDownList.DataBind();
                companyDropDownList.Items.Insert(0, new ListItem("Choose Company", "0"));
                companyDropDownList.SelectedIndex = 0;
            }
            else
            {
                messageL.Text = "No Company Available";
            }
        }
        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string companyName;
            companyName = companyDropDownList.SelectedItem.Text;
            int companyValue = Convert.ToInt32(companyDropDownList.SelectedValue);
            if (companyValue > 0)
            {
                if (stockInManager.GetAllItem().Count > 0)
                {

                    itemDropDownList.DataSource = stockInManager.GetAllItemById(Convert.ToInt32(companyValue));
                    itemDropDownList.DataTextField = "Name";
                    itemDropDownList.DataValueField = "ItemId";

                    itemDropDownList.DataBind();

                    itemDropDownList.Items.Insert(0, new ListItem("Choose " + companyName.ToString() + " Item ", "0"));
                    itemDropDownList.SelectedIndex = 0;
                }
                else
                {
                    messageL.Text = "No Item Available";
                }
                
            }
            else
            {
                itemDropDownList.Items.Clear();
                itemDropDownList.Items.Insert(0, "No Items Available");
                itemDropDownList.SelectedIndex = 0;
                reorderLevelTextBox.Text = "";
                availableQuantityTextBox.Text = "";
            }
        }

        protected void itemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string itemName, itemValue;
            itemName = itemDropDownList.SelectedItem.Text;
            itemValue = itemDropDownList.SelectedValue;
            if (stockInManager.IsIdExits(Convert.ToInt32(itemValue)))
            {
                GetItemInfo getItemInfo = stockInManager.getItemInfo(Convert.ToInt32(itemValue));
                reorderLevelTextBox.Text = Convert.ToString(getItemInfo.ReorderLevel);
                availableQuantityTextBox.Text = getItemInfo.AvailableQuantity.ToString();
            }
            else
            {
                Item itemSetup = stockInManager.itemSetup(Convert.ToInt32(itemValue));
                reorderLevelTextBox.Text = Convert.ToString(itemSetup.ReorderLevel);
                availableQuantityTextBox.Text = "0";
            }
            
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            if (reorderLevelTextBox.Text != "" && availableQuantityTextBox.Text != "" &&
                stockInQuantityTextBox.Text != "")
            {
                string itemValue,companyValue, stockInQuantity;
                int    availableQuantity, newQuantity;
                companyValue = companyDropDownList.SelectedValue;
                itemValue = itemDropDownList.SelectedValue;
                stockInQuantity = stockInQuantityTextBox.Text;
                if (stockInManager.IsAlpha(stockInQuantity))
                {
                    if (Convert.ToInt32(stockInQuantity) > 0)
                    {
                        availableQuantity = Convert.ToInt32(availableQuantityTextBox.Text);
                        newQuantity =(Convert.ToInt32(stockInQuantity) + availableQuantity);
                        string message = stockInManager.Save(Convert.ToInt32(itemValue), Convert.ToInt32(companyValue), newQuantity);
                        if (message == "Save Successful" || message == "Update SuccessFull")
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
                        messageL.Text = "please input positive integer value.";
                    }
                }
                else
                {
                    messageL.Text = "Please enter only positive integer in Stock in Quantity box";
                    
                }
                
            }
            else
            {
                messageL.Text = "Please fill up all the box";
            }

        }
    }
}