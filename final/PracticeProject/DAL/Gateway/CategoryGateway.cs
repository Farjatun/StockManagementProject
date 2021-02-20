using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using PracticeProject.BLL.Model;

namespace PracticeProject.DAL.Gateway
{
    public class CategoryGateway
    {
       

        private string connectionString = WebConfigurationManager.ConnectionStrings["ProjectDBConString"].ConnectionString;

        public int Save(Category category)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            String query = "INSERT INTO Category VALUES('" + category.Name + "')";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }

        public bool IsNameExits(string name)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM Category WHERE Name='" + name + "'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            bool isNameExits = reader.HasRows;
            connection.Close();
            return isNameExits;
        }

        public List<Category> GetAllCategories()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM Category";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<Category> categorieList=new List<Category>();

            while (reader.Read())
            {
                Category category =new Category();
                category.CategoryId = Convert.ToInt32(reader["CategoryId"]);
                category.Name = reader["Name"].ToString();
                

                categorieList.Add(category);

            }
            connection.Close();
            return categorieList;
            
        }


        public Category GetCategoryById(int id)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM Category WHERE CategoryId=" + id;
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            Category category = null;
            if (reader.Read())
            {
                category = new Category();
                category.CategoryId = Convert.ToInt32(reader["CategoryId"]);
                category.Name = reader["Name"].ToString();
                
            }
            connection.Close();
            return category;
        }

        public int Update(Category category)
        {

            SqlConnection connection = new SqlConnection(connectionString);
            String query = "UPDATE Category SET Name='" + category.Name + "' WHERE CategoryId= "+category.CategoryId;
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }


       }
}
