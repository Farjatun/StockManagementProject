using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PracticeProject.BLL.Model.ViewModel
{
    public class SearchItemViewModel
    {
        public string ItemName { get; set; }
        public string CompanyName { get; set; }
        public string CategoryName { get; set; }
        public int ReorderLevel { get; set; }
        public int AvailableQuantity { get; set; }
    }
}