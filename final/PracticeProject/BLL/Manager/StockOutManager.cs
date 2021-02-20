using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PracticeProject.BLL.Model;
using PracticeProject.DAL.Gateway;
using PracticeProject.UI;
using StockIn = PracticeProject.UI.StockIn;

namespace PracticeProject.BLL.Manager
{
    public class StockOutManager
    {

        private StockOutGateway stockOutGateWay;

        public StockOutManager()
        {
            stockOutGateWay = new StockOutGateway();
        }


        public List<Company> GetAllCompany()
        {
            return stockOutGateWay.GetAllCompany();
        }

        public List<Item> GetAllItem(int id)
        {
            return stockOutGateWay.GetAllItem(id);
        }

        public Item GetReoderLevel(int itemId)
        {
            return stockOutGateWay.GetReorderLevel(itemId);
        }

        public Model.StockIn GetAvailableQuantity(int itemid)
        {
            return stockOutGateWay.GetAvailableQuantity(itemid);
        }

        public string AddStockOut(StockOut_ stockOut)
        {
            int rowAffect = stockOutGateWay.AddStockOut(stockOut);
            if (rowAffect > 0)
            {
                return "Stock Out Succesful";
            }
            else
            {
                return "Stock Out Failed";
            }
        }

    }
}