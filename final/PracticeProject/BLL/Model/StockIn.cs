using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PracticeProject.BLL.Model
{
    [Serializable]
    public class StockIn
    {
        public int StockInId { get; set; }
        public int AvailableQuantity { get; set; }
        public int ItemId { get; set; }
        public int CompanyId { get; set; }
        
        
    }
}