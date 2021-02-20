using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using PracticeProject.BLL.Model;
using PracticeProject.BLL.Model.ViewModel;
using PracticeProject.DAL.Gateway;

namespace PracticeProject.BLL.Manager
{
    public class StockInManager
    {
        private StockInGateway stockInGateway;

        public StockInManager()
        {
            stockInGateway=new StockInGateway();
        }

        public List<Company> GetAllCompanies()
        {
            return stockInGateway.GetAllCompanies();
        }

        public List<Item> GetAllItem()
        {
            return stockInGateway.GetAllItem();
        }
        public List<Item> GetAllItemById(int id)
        {
            return stockInGateway.GetAllItemById(id);
        }

        public GetItemInfo getItemInfo(int id)
        {
            return stockInGateway.getItemInfo(id);
        }

        public Item itemSetup(int id)
        {
            return stockInGateway.itemSetup(id);
        }

        public  bool IsIdExits(int id)
            {
                return stockInGateway.IsIdExits(id);
            }



        public string Save(int itemValue, int companyValue, int newQuantity)
        {
            bool isIdExits = stockInGateway.IsIdExits(itemValue);
            if (isIdExits)
            {
                int rowAffect = stockInGateway.Update(itemValue,newQuantity);
                return "Update SuccessFull";
            }
            else
            {
                int rowAffect = stockInGateway.Save(itemValue, companyValue,newQuantity);
                if (rowAffect > 0)
                {
                    return "Save Successful";
                }
                else
                {
                    return "Save Failed";
                }
            }
           
        }
        public bool IsAlpha(string input)
        {
            return Regex.IsMatch(input, "^[0-9]+$");
        }

    }
}