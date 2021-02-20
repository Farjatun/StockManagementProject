using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PracticeProject.BLL.Model.ViewModel
{
    public class GetItemInfo
    {
        public int ItemId { get; set; }
        public int Company_Id { get; set; }
        public string Name { get; set; }
        public int ReorderLevel { get; set; }
        public int AvailableQuantity{ get; set; }
    }
}