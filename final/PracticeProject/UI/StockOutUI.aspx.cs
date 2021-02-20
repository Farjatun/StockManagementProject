using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PracticeProject.BLL.Manager;
using PracticeProject.BLL.Model;

namespace PracticeProject.UI
{
    public partial class StockOut : System.Web.UI.Page
    {
        private StockOutManager stockOutManager;
        private StockOut_ stockOut = new StockOut_();
        private int quantityGride = 0;

        public StockOut()
        {
            stockOutManager = new StockOutManager();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReorderLevelTextBox.Enabled = false;
                availableQuantityTextBox.Enabled = false;
                BindCompanies();
                itemNameDropDownList.Items.Insert(0, new ListItem("Item Not Available", "0"));
                itemNameDropDownList.Enabled = false;
                availableQuantityTextBox.Text = 0.ToString();
            }

        }



        public void BindCompanies()
        {
            comapanyNameDropDownList.DataSource = stockOutManager.GetAllCompany();
            comapanyNameDropDownList.DataTextField = "Name";
            comapanyNameDropDownList.DataValueField = "CompanyId";
            comapanyNameDropDownList.DataBind();
            comapanyNameDropDownList.Items.Insert(0, new ListItem("Select Company", "0"));
        }




        protected void comapanyNameDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(comapanyNameDropDownList.SelectedValue);

            itemNameDropDownList.DataSource = stockOutManager.GetAllItem(id);
            itemNameDropDownList.DataTextField = "Name";
            itemNameDropDownList.DataValueField = "ItemId";
            itemNameDropDownList.DataBind();
            itemNameDropDownList.Items.Insert(0, new ListItem("Select Item", "0"));
            itemNameDropDownList.Enabled = true;

        }



        protected void itemNameDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(itemNameDropDownList.SelectedValue);

            if (id == 0)
            {
                ReorderLevelTextBox.Text = String.Empty;
            }
            else
            {
                Item item = stockOutManager.GetReoderLevel(id);
                ReorderLevelTextBox.Text = item.ReorderLevel.ToString();
            }


            BLL.Model.StockIn stock = stockOutManager.GetAvailableQuantity(id);
            int quantity = stock.AvailableQuantity;
            //CheckItemInGrid();
            if (CheckItemInGrid())
            {
                quantity = quantity - quantityGride;
            }
            availableQuantityTextBox.Text = quantity.ToString();
            //check = 0;
            quantityGride = 0;

        }









        public bool CheckItemInGrid()
        {
            if (ViewState["AddItemListVS"] != null)
            {
                List<StockOut_> checkGridList = (List<StockOut_>)(ViewState["AddItemListVS"]);

                foreach (StockOut_ VARIABLE in checkGridList)
                {
                    if (VARIABLE.CompanyName == comapanyNameDropDownList.SelectedItem.ToString()
                        && VARIABLE.ItemName == itemNameDropDownList.SelectedItem.ToString())
                    {
                        //check = 1;
                        quantityGride = VARIABLE.StockOutQuantity;
                        return true;
                    }
                }
            }

            return false;
        }


        public List<StockOut_> AddItemInGrid()
        {

            if (ViewState["AddItemListVS"] == null)
            {
                List<StockOut_> gridList = new List<StockOut_>();

                stockOut.ItemName = itemNameDropDownList.SelectedItem.Text;
                stockOut.CompanyName = comapanyNameDropDownList.SelectedItem.Text;
                stockOut.StockOutQuantity = Convert.ToInt32(stockOutQuantityTextBox.Text);
                stockOut.CompanyId = Convert.ToInt32(comapanyNameDropDownList.SelectedValue);
                stockOut.ItemId = Convert.ToInt32(itemNameDropDownList.SelectedValue);
                gridList.Add(stockOut);

                ViewState["AddItemListVS"] = gridList;
                return gridList;

            }
            else
            {
                List<StockOut_> secondGridList = (List<StockOut_>)(ViewState["AddItemListVS"]);
                if (CheckItemInGrid())
                {
                    foreach (StockOut_ VARIABLE in secondGridList)
                    {
                        if (VARIABLE.CompanyName == comapanyNameDropDownList.SelectedItem.ToString()
                            && VARIABLE.ItemName == itemNameDropDownList.SelectedItem.ToString())
                        {
                            VARIABLE.StockOutQuantity += Convert.ToInt32(stockOutQuantityTextBox.Text);
                            ViewState["AddItemListVS"] = secondGridList;
                        }
                    }
                }
                else
                {
                    stockOut.ItemName = itemNameDropDownList.SelectedItem.Text;
                    stockOut.CompanyName = comapanyNameDropDownList.SelectedItem.Text;
                    stockOut.StockOutQuantity = Convert.ToInt32(stockOutQuantityTextBox.Text);
                    stockOut.CompanyId = Convert.ToInt32(comapanyNameDropDownList.SelectedValue);
                    stockOut.ItemId = Convert.ToInt32(itemNameDropDownList.SelectedValue);
                    secondGridList.Add(stockOut);
                    ViewState["AddItemListVS"] = secondGridList;

                }
                return secondGridList;
            }
        }

        protected void addButton_Click1(object sender, EventArgs e)
        {
            if (comapanyNameDropDownList.SelectedIndex != 0)
            {
                if (itemNameDropDownList.SelectedIndex != 0)
                {
                    string text = stockOutQuantityTextBox.Text;

                    if (IsAlpha(text))
                    {
                        if (stockOutQuantityTextBox.Text != "" && Convert.ToInt32(stockOutQuantityTextBox.Text) > 0)
                        {
                            //Regex.IsMatch(stockOutQuantityTextBox.Text, "^[0-9]")
                            int id = Convert.ToInt32(itemNameDropDownList.SelectedValue);

                            if (Convert.ToInt32(stockOutQuantityTextBox.Text) <=
                                Convert.ToInt32(availableQuantityTextBox.Text))
                            {
                                showGridView.DataSource = AddItemInGrid();
                                showGridView.DataBind();

                                StockOut_ stockOut = new StockOut_();
                                stockOut.StockOutQuantity = Convert.ToInt32(stockOutQuantityTextBox.Text);

                                stockOutQuantityTextBox.Text = "";
                                availableQuantityTextBox.Text = "";
                                ReorderLevelTextBox.Text = "";

                                comapanyNameDropDownList.SelectedIndex = 0;
                                itemNameDropDownList.SelectedIndex = 0;



                            }
                            else
                            {
                                outputLabel.Text = "Stock out Quantity is too much";
                            }
                        }
                    }


                    else
                    {
                        outputLabel.Text = "Stock Out Quantity Invalid!";
                    }
                }
                else
                {
                    outputLabel.Text = "Please Select Item";
                }
            }
            else
            {
                outputLabel.Text = "Please Select Company";
            }
        }




        public bool IsAlpha(string text)
        {
            return Regex.IsMatch(text, "^[0-9]+$");
        }











        protected void sellButton_Click(object sender, EventArgs e)
        {

            List<StockOut_> stockOutList = (List<StockOut_>)(ViewState["AddItemListVS"]);
            if (ViewState["AddItemListVS"] == null)
            {
                outputLabel.Text = "First Add Your Item In Sell List";
            }
            else
            {
                foreach (StockOut_ stockOut in stockOutList)
                {

                    stockOut.ActionType = "Sell";

                    outputLabel.Text = stockOutManager.AddStockOut(stockOut);
                }
                ViewState["AddItemListVS"] = null;

                showGridView.DataSource = null;
                showGridView.DataBind();
            }


        }

        protected void damageButton_Click(object sender, EventArgs e)
        {
            List<StockOut_> stockOutList = (List<StockOut_>)(ViewState["AddItemListVS"]);

            if (ViewState["AddItemListVS"] == null)
            {
                outputLabel.Text = "First Add Your Item In Damage List";
            }
            else
            {
                foreach (StockOut_ stockOut in stockOutList)
                {

                    stockOut.ActionType = "Damage";

                    outputLabel.Text = stockOutManager.AddStockOut(stockOut);
                }
                ViewState["AddItemListVS"] = null;
                showGridView.DataSource = null;
                showGridView.DataBind();
            }
        }

        protected void lostButton_Click(object sender, EventArgs e)
        {
            List<StockOut_> stockOutList = (List<StockOut_>)(ViewState["AddItemListVS"]);

            if (ViewState["AddItemListVS"] == null)
            {
                outputLabel.Text = "First Add Your Item In Lost List";
            }
            else
            {
                foreach (StockOut_ stockOut in stockOutList)
                {

                    stockOut.ActionType = "Lost";

                    outputLabel.Text = stockOutManager.AddStockOut(stockOut);
                }
                ViewState["AddItemListVS"] = null;
                showGridView.DataSource = null;
                showGridView.DataBind();
            }
        }

        protected void frontPageButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllStoryIndexUI.aspx");
        }


    }
}