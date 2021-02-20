using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PracticeProject.BLL.Model
{
    public class Item
    {
        public int ItemId { get; set; }
        public string Name { get; set; }
        public int ReorderLevel { get; set; }
        public int CategoryId { get; set; }
        public int CompanyId { get; set; }
        
        
    }
}