using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PracticeProject.BLL.Manager;

namespace PracticeProject.UI
{
    public partial class ViewSalesUI : System.Web.UI.Page
    {
        ViewSalesManager viewSalesManager = new ViewSalesManager();
        public string fromDate;
        public string toDate;

        protected void Page_Load(object sender, EventArgs e)
        {
            fromDateCalendar.Visible = false;
            toDateCalendar.Visible = false;
            fromDateTextBox.Enabled = false;
            toDateTextBox.Enabled = false;
        }



        protected void fromDateButton_Click(object sender, EventArgs e)
        {
            fromDateCalendar.Visible = true;
            //fromDateTextBox.Visible = true;
        }

        protected void fromDateCalendar_SelectionChanged(object sender, EventArgs e)
        {
            fromDateTextBox.Text = fromDateCalendar.SelectedDate.ToString("yyyy-MM-dd");
            fromDateCalendar.Visible = false;
        }

        protected void toDaetButton_Click(object sender, EventArgs e)
        {
            toDateCalendar.Visible = true;
            //toDateTextBox.Visible = true;
        }
        protected void toDateCalendar_SelectionChanged(object sender, EventArgs e)
        {
            toDateTextBox.Text = toDateCalendar.SelectedDate.ToString("yyyy-MM-dd");
            toDateCalendar.Visible = false;
        }









        protected void searchButton_Click(object sender, EventArgs e)
        {
            fromDate = fromDateTextBox.Text;
            toDate = toDateTextBox.Text;

            if (fromDate == "" || toDate == "")
            {


                {
                    outputLabel.Text = "Please Select Date";
                }
            }

            else
            {
                DateTime dt1 = DateTime.Parse(fromDate);
                DateTime dt2 = DateTime.Parse(toDate);

                if (dt1.Date > dt2.Date)
                {
                    outputLabel.Text = "From Date is Larger Then To Date";
                    showGridView.DataSource = null;
                    showGridView.DataBind();

                }
                else
                {
                    outputLabel.Text = "";
                    showGridView.DataSource = viewSalesManager.GetAllDates(fromDate, toDate);

                    showGridView.DataBind();
                    if (showGridView.Rows.Count == 0)
                    {
                        outputLabel.Text = "There are no Recored From Those Days";
                    }
                }
            }
        }

        protected void frontPageButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllStoryIndexUI.aspx");
        }


    }
}