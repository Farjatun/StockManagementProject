using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using PracticeProject.BLL.Model;

namespace PracticeProject.DAL.Gateway
{
    public class ViewSalesGateway
    {
        private string connectionString =
            WebConfigurationManager.ConnectionStrings["ProjectDBConString"].ConnectionString;

        public List<StockOut_> GetAllDates(string fromDate, string toDate)
        {
            //DateTime  fromDateTime = Convert.ToDateTime(fromDate);
            //DateTime toDateTime = Convert.ToDateTime(toDate);
            SqlConnection Connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM StockOut WHERE  Date BETWEEN '" + fromDate +
                           "' AND '" + toDate + "' AND ActionType = 'Sell'";

            SqlCommand Command = new SqlCommand(query, Connection);

            Connection.Open();
            SqlDataReader Reader = Command.ExecuteReader();

            List<StockOut_> stockOutList = new List<StockOut_>();
            while (Reader.Read())
            {
                StockOut_ stockOut = new StockOut_();
                stockOut.ItemName = (Reader["ItemName"]).ToString();
                stockOut.StockOutQuantity = Convert.ToInt32(Reader["StockOutQuantity"]);


                //stockOut.Date = (Reader["Date"]).ToString();
                stockOut.Date = Convert.ToDateTime(Reader["Date"]);
                //stockOut.Date = (Reader["Date"]).ToString();
                //DateTime acquirementDate = DateTime.ParseExact(iDiscRow[TableNames.Discs.acquirementDate].ToString(), "yyyy-MM-dd", CultureInfo.InvariantCulture);

                //DateTime acquirementDate = (DateTime)iDiscRow[S.Discs.acquirementDate];
                //string fieldValueAsString = StockOut.Rows[rowNumber][fieldName].ToString();


                //stockOut.CompanyName = (Reader["ActionType"]).ToString();

                stockOutList.Add(stockOut);
            }
            Connection.Close();
            return stockOutList;
        }
    }
}