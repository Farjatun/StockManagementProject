using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using PracticeProject.BLL.Model;
using PracticeProject.BLL.Model.ViewModel;

namespace PracticeProject.DAL.Gateway
{
    public class StockInGateway
    {
        private string connectionString =  WebConfigurationManager.ConnectionStrings["ProjectDBConString"].ConnectionString;

        public List<Company> GetAllCompanies()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM Company";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<Company> companieList = new List<Company>();

            while (reader.Read())
            {
                Company company = new Company();
                company.CompanyId = Convert.ToInt32(reader["CompanyId"]);
                company.Name = reader["Name"].ToString();


                companieList.Add(company);

            }
            connection.Close();
            return companieList;

        }

        public List<Item> GetAllItem()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM Item";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<Item> itemSetupList = new List<Item>();

            while (reader.Read())
            {
                Item itemSetup = new Item();
                itemSetup.ItemId = Convert.ToInt32(reader["ItemId"]);
                itemSetup.Name = reader["Name"].ToString();


                itemSetupList.Add(itemSetup);

            }
            connection.Close();
            return itemSetupList;
        }

        public List<Item> GetAllItemById(int id)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM Item WHERE CompanyId='" + id + "'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<Item> itemSetupList = new List<Item>();

            while (reader.Read())
            {
                Item itemSetup = new Item();
                itemSetup.ItemId = Convert.ToInt32(reader["ItemId"]);
                itemSetup.Name = reader["Name"].ToString();


                itemSetupList.Add(itemSetup);

            }
            connection.Close();
            return itemSetupList;
        }

        public GetItemInfo getItemInfo(int id)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM GetItemInfo WHERE ItemId='" + id + "'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            GetItemInfo getItemInfo = null;

            if (reader.Read())
            {
                getItemInfo = new GetItemInfo();
                getItemInfo.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);
                getItemInfo.AvailableQuantity = Convert.ToInt32(reader["AvailableQuantity"]);
            }
            connection.Close();
            return getItemInfo;

        }

        public int Save(int itemValue, int companyValue, int newQuantity)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            String query = "INSERT INTO StockIn(CompanyId, ItemId, AvailableQuantity) VALUES('" + companyValue + "','" + itemValue + "','" + newQuantity + "')";
            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }

        public bool IsIdExits(int id)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM StockIn WHERE ItemId='" + id + "'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            bool isIdExits = reader.HasRows;
            connection.Close();
            return isIdExits;
        }

        public int Update(int itemValue, int newQuantity)
        {


            SqlConnection connection = new SqlConnection(connectionString);
            String query = "UPDATE StockIn SET AvailableQuantity='" + newQuantity + "' WHERE  ItemId= " + itemValue;
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }

        public Item itemSetup(int id)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM Item WHERE ItemId='" + id + "'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            Item itemSetup = null;

            if (reader.Read())
            {
                itemSetup = new Item();
                itemSetup.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);
                
            }
            connection.Close();
            return itemSetup;

        }
    }
}