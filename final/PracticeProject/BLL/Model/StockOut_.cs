using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PracticeProject.BLL.Model
{
    [Serializable]
    public class StockOut_
    {

        public int StockOutId { get; set; }
        public string ItemName { get; set; }
        public string CompanyName { get; set; }
        public int StockOutQuantity { get; set; }

        public DateTime Date { get; set; }
        public string ActionType { get; set; }

        public int CompanyId { get; set; }
        public int ItemId { get; set; }
    }
}