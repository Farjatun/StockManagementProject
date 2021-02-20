using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using PracticeProject.BLL.Model;
using PracticeProject.DAL.Gateway;

namespace PracticeProject.BLL.Manager
{
    public class ItemSetupManager
    {
        private ItemGateway itemSetupGateway;

        public ItemSetupManager()
        {
            itemSetupGateway = new ItemGateway();
        }


        public List<Company> GetAllCompanies()
        {
            return itemSetupGateway.GetAllCompanies();
        }

        public List<Category> GetCategories()
        {
            return itemSetupGateway.GetAllCategories();
        }

        
        public bool IsAlpha(string input)
        {
            return Regex.IsMatch(input, "^[a-zA-Z ]+$");
        }
        public bool IsNumeric(string input)
        {
            return Regex.IsMatch(input, "^[0-9]+$");
        }
        public string Save(Item itemSetup)
        {
            if (IsAlpha(itemSetup.Name))
            {
            bool isNameExits = itemSetupGateway.IsNameExits(itemSetup.Name);
            if (isNameExits)
            {
                return "Name Already Exits";
            }
            else
            {
                int rowAffect = itemSetupGateway.Save(itemSetup);
                if (rowAffect > 0)
                {
                    return "Item Save Successful";
                }
                else
                {
                    return "Failed";
                }
            }
            }
            else
            {
                return "please enter only character in Item Name text box.";
            }

        }
    }
}