using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PracticeProject.BLL.Model;
using PracticeProject.DAL.Gateway;

namespace PracticeProject.BLL.Manager
{
    public class ViewSalesManager
    {
        
        ViewSalesGateway viewSalesGateway = new ViewSalesGateway();
        public List<StockOut_> GetAllDates(string fromDate, string toDate)
        {
            return viewSalesGateway.GetAllDates(fromDate, toDate);
        }
    }
}
