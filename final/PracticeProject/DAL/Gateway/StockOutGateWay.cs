using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using PracticeProject.BLL.Model;

namespace PracticeProject.DAL.Gateway
{
    public class StockOutGateway
    {
        private string connectionString =
            WebConfigurationManager.ConnectionStrings["ProjectDBConString"].ConnectionString;

        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataReader reader;

        public List<Company> GetAllCompany()
        {
            connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM Company";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<Company> companyList = new List<Company>();

            while (reader.Read())
            {
                Company company = new Company();
                company.CompanyId = Convert.ToInt32(reader["CompanyId"]);
                company.Name = reader["Name"].ToString();

                companyList.Add(company);

            }
            connection.Close();
            return companyList;

        }


        public List<Item> GetAllItem(int id)
        {
            connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM Item Where CompanyId = '" + id + "'";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<Item> itemList = new List<Item>();

            while (reader.Read())
            {
                Item item = new Item();
                item.ItemId = Convert.ToInt32(reader["ItemId"]);
                item.Name = reader["Name"].ToString();
                item.CategoryId = Convert.ToInt32(reader["CategoryId"]);
                item.CompanyId = Convert.ToInt32(reader["CompanyId"]);
                item.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);


                itemList.Add(item);

            }
            connection.Close();
            return itemList;

        }



        public Item GetReorderLevel(int itemId)
        {
            connection = new SqlConnection(connectionString);
            string query = "SELECT ReorderLevel From  Item WHERE ItemId = " + itemId;
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();

            Item item = new Item();
            while (reader.Read())
            {
                item.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);
            }
            connection.Close();
            return item;
        }


        public StockIn GetAvailableQuantity(int itemId)
        {
             connection = new SqlConnection(connectionString);
            string query = "SELECT AvailableQuantity From  StockIn WHERE ItemId = " + itemId;
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();

            StockIn stock = new StockIn();
            while (reader.Read())
            {
                stock.AvailableQuantity= Convert.ToInt32(reader["AvailableQuantity"]);
            }
            connection.Close();
            return stock;
        }




        public int AddStockOut(StockOut_ stockOut)
        {
            connection = new SqlConnection(connectionString);

            string query = "Insert Into StockOut Values('" + stockOut.ItemName + "','" + stockOut.CompanyName + "','" +
                           stockOut.StockOutQuantity + "',SYSDATETIME(),'" + stockOut.ActionType + "')";

            string query2 = "UPDATE StockIn SET Availablequantity -= " + stockOut.StockOutQuantity + "WHERE companyId = " +
                            stockOut.CompanyId + " and ItemId = " + stockOut.ItemId;

            command = new SqlCommand(query, connection);
            SqlCommand command2 = new SqlCommand(query2, connection);

            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            command2.ExecuteNonQuery();
            connection.Close();

            return rowAffect;

        }




    }
}
