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
    public class SearchViewGateway
    {

        private string connectionString =
            WebConfigurationManager.ConnectionStrings["ProjectDBConString"].ConnectionString;

        private SqlCommand Command;
        private SqlConnection connection;
        private SqlDataReader Reader;

        public List<Company> GetAllCompany()
        {
            connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM Company";
            Command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = Command.ExecuteReader();
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

        public List<Category> GetAllCategory()
        {
            connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM Category";
            Command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = Command.ExecuteReader();
            List<Category> categoryList = new List<Category>();

            while (reader.Read())
            {
                Category category = new Category();
                category.CategoryId = Convert.ToInt32(reader["CategoryID"]);
                category.Name = reader["Name"].ToString();

                categoryList.Add(category);

            }
            connection.Close();
            return categoryList;

        }

        public List<Category> GetCategoryById(int id)
        {
            connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM SearchItem Where CompanyId = '" + id + "'";
            Command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = Command.ExecuteReader();
            List<Category> categoryList = new List<Category>();
                        
            while (reader.Read())
            {
                if (reader["CategoryName"].ToString() == "")
                {

                }
                else
                {
                    Category category = new Category();
                    category.CategoryId = Convert.ToInt32(reader["CategoryId"]);
                    category.Name = reader["CategoryName"].ToString();

                    categoryList.Add(category);
                }
                
            }
            connection.Close();
            return categoryList;

        }
        //public List<Company> GetCompanyById(int id)
        //{
        //    SqlConnection connection = new SqlConnection(connectionString);
        //    string query = "SELECT * FROM SearchItem Where CategoryName = '" + id + "'";
        //    SqlCommand command = new SqlCommand(query, connection);
        //    connection.Open();
        //    SqlDataReader reader = command.ExecuteReader();
        //    List<Company> companieList = new List<Company>();

        //    while (reader.Read())
        //    {
        //        Company company = new Company();
        //        company.CompanyId = Convert.ToInt32(reader["CompanyId"]);
        //        company.Name = reader["Name"].ToString();

        //        companieList.Add(company);

        //    }
        //    connection.Close();
        //    return companieList;

        //}

        public List<SearchItemViewModel> GetAllItem()
        {
            connection = new SqlConnection(connectionString);
            string query = "SELECT * From SearchItem";
            Command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader Reader = Command.ExecuteReader();
            List<SearchItemViewModel> itemList = new List<SearchItemViewModel>();
            while (Reader.Read())
            {
                if (Reader["ItemName"].ToString() != "")
                {
                    SearchItemViewModel item = new SearchItemViewModel();
                    item.ItemName = Reader["ItemName"].ToString();
                    item.CompanyName = Reader["CompanyName"].ToString();
                    item.CategoryName = Reader["CategoryName"].ToString();

                    string reorder = Reader["ReorderLevel"].ToString();
                    item.AvailableQuantity = reorder == "" ? 0 : Convert.ToInt32(Reader["ReorderLevel"]);
                    //item.ReorderLevel = Convert.ToInt32(Reader["ReorderLevel"]);
                    //item.AvailableQuantity = Convert.ToInt32(Reader["AvailableQuantity"]);
                    string value = Reader["AvailableQuantity"].ToString();
                    item.AvailableQuantity = value == "" ? 0 : Convert.ToInt32(Reader["AvailableQuantity"]);

                    itemList.Add(item);
                }
                
            }
            Reader.Close();
            connection.Close();
            return itemList;
        }


        public List<SearchItemViewModel> GetAllCompanyItemByName(string companyName)
        {
            connection = new SqlConnection(connectionString);
            string query = "SELECT * From SearchItem Where CompanyName = '" + companyName + "'";
            Command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader Reader = Command.ExecuteReader();
            List<SearchItemViewModel> itemList = new List<SearchItemViewModel>();
            while (Reader.Read())
            {
                if (Reader["ItemName"].ToString() != "")
                {
                    SearchItemViewModel item = new SearchItemViewModel();
                    item.ItemName = Reader["ItemName"].ToString();
                    item.CompanyName = Reader["CompanyName"].ToString();
                    item.CategoryName = Reader["CategoryName"].ToString();
                    item.ReorderLevel = Convert.ToInt32(Reader["ReorderLevel"]);
                    //item.AvailableQuantity = Convert.ToInt32(Reader["AvailableQuantity"]);
                    string value = Reader["AvailableQuantity"].ToString();
                    item.AvailableQuantity = value == "" ? 0 : Convert.ToInt32(Reader["AvailableQuantity"]);

                    itemList.Add(item);
                }
            }
            Reader.Close();
            connection.Close();
            return itemList;
        }


        public List<SearchItemViewModel> GetAllCategoryItemByName(string catergoryName)
        {
            connection = new SqlConnection(connectionString);
            string query = "SELECT * From SearchItem Where CategoryName = '" + catergoryName + "'";
            Command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader Reader = Command.ExecuteReader();
            List<SearchItemViewModel> itemList = new List<SearchItemViewModel>();
            while (Reader.Read())
            {
                if (Reader["ItemName"].ToString() != "")
                {
                    SearchItemViewModel item = new SearchItemViewModel();
                    item.ItemName = Reader["ItemName"].ToString();
                    item.CompanyName = Reader["CompanyName"].ToString();
                    item.CategoryName = Reader["CategoryName"].ToString();
                    //item.ReorderLevel = Convert.ToInt32(Reader["ReorderLevel"]);
                    string value = Reader["ReorderLevel"].ToString();
                    item.ReorderLevel = value == "" ? 0 : Convert.ToInt32(Reader["ReorderLevel"]);

                    value = Reader["AvailableQuantity"].ToString();
                    item.AvailableQuantity = value == "" ? 0 : Convert.ToInt32(Reader["AvailableQuantity"]);


                    itemList.Add(item);
                }               
                
            }
            Reader.Close();
            connection.Close();
            return itemList;
        }

        public List<SearchItemViewModel> GetAllCompanyAndCategoryByName(string catergoryName, string companyName)
        {
            connection = new SqlConnection(connectionString);
            string query = "SELECT * From SearchItem Where CategoryName = '" + catergoryName + "' AND CompanyName = '" + companyName + "'";
            Command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader Reader = Command.ExecuteReader();
            List<SearchItemViewModel> itemList = new List<SearchItemViewModel>();
            while (Reader.Read())
            {
                SearchItemViewModel item = new SearchItemViewModel();
                item.ItemName = Reader["ItemName"].ToString();
                item.CompanyName = Reader["CompanyName"].ToString();
                item.CategoryName = Reader["CategoryName"].ToString();
                item.ReorderLevel = Convert.ToInt32(Reader["ReorderLevel"]);
                //item.AvailableQuantity = Convert.ToInt32(Reader["AvailableQuantity"]);
                string value = Reader["AvailableQuantity"].ToString();
                item.AvailableQuantity = value == "" ? 0 : Convert.ToInt32(Reader["AvailableQuantity"]);

                itemList.Add(item);
            }
            Reader.Close();
            connection.Close();
            return itemList;
        }
    }
}