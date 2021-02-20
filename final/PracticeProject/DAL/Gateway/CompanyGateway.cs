using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using PracticeProject.BLL.Model;

namespace PracticeProject.DAL.Gateway
{
    public class CompanyGateway
    {
        private string connectionString =
            WebConfigurationManager.ConnectionStrings["ProjectDBConString"].ConnectionString;

        public int Save(Company company)
        {


            SqlConnection connection = new SqlConnection(connectionString);

            String query = "INSERT INTO Company VALUES('" + company.Name + "')";
            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }

        public bool IsNameExits(string name)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM Company WHERE Name='" + name + "'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            bool isNameExits = reader.HasRows;
            connection.Close();
            return isNameExits;
        }

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
    }
}