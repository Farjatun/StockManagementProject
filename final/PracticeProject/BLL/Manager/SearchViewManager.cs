using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PracticeProject.BLL.Model;
using PracticeProject.BLL.Model.ViewModel;
using PracticeProject.DAL.Gateway;
namespace PracticeProject.BLL.Manager
{
    public class SearchViewManager
    {

        private static SearchViewGateway searchandviewGateway;

        public SearchViewManager()
        {
            searchandviewGateway = new SearchViewGateway();
        }


        public List<Company> GetAllCompany()
        {
            return searchandviewGateway.GetAllCompany();
        }

        public List<Category> GetAllCategory()
        {
            return searchandviewGateway.GetAllCategory();
        }

        public List<Category> GetCategoryById(int companyId)
        {
            return searchandviewGateway.GetCategoryById(companyId);
        }
        //public List<Company> GetCompanyById(int cateogryId)
        //{
        //    return searchandviewGateway.GetCompanyById(cateogryId);

        //}




        public List<SearchItemViewModel> GetAllItem()
        {
            return searchandviewGateway.GetAllItem();
        }

        public List<SearchItemViewModel> GetAllCompanyItemById(string companyName)
        {
            return searchandviewGateway.GetAllCompanyItemByName(companyName);
        }

        public List<SearchItemViewModel> GetAllCategoryItemByName(string catergoryName)
        {
            return searchandviewGateway.GetAllCategoryItemByName(catergoryName);
        }

        public List<SearchItemViewModel> GetAllCompanyAndCategoryByName(string catergoryName, string companyName)
        {
            return searchandviewGateway.GetAllCompanyAndCategoryByName(catergoryName, companyName);
        }







    }
}