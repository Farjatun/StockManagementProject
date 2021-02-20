using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using PracticeProject.BLL.Model;
using PracticeProject.DAL.Gateway;

namespace PracticeProject.BLL.Manager
{
    public class CategoryManeger
    {
        private CategoryGateway categoryGateway;

        public CategoryManeger()
        {
            categoryGateway=new CategoryGateway();
        }
        public bool IsAlpha(string input)
        {
            return Regex.IsMatch(input, "^[a-zA-Z ]+$");
        }
        public string Save(Category category)

        {
            if (IsAlpha(category.Name))
            {
            bool isNameExits = categoryGateway.IsNameExits(category.Name);
            if (isNameExits)
            {
                return "Name Already Exits";
            }
            else
            {
                int rowAffect = categoryGateway.Save(category);
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
            else
            {
                return "please enter only character.";
            }

         }

        public string Update(Category category)
        {
            if (IsAlpha(category.Name))
            {
                bool isNameExits = categoryGateway.IsNameExits(category.Name);
                if (isNameExits)
                {
                     return  "name already exist.";
                }
                else
                {
                    int rowAffect = categoryGateway.Update(category);
                    if (rowAffect > 0)
                    {
                        return "update successfully";
                    }
                    else
                    {
                        return  "Failed";
                    }
                }
            }
            else
            {
                return "please enter only character.";
            }
            }

        

       

        public List<Category> GetAllCategories()
        {
            return categoryGateway.GetAllCategories();

        }

        public Category GetCategoryById(int id)
        {
            return categoryGateway.GetCategoryById(id);
        }
        //public bool IsAlphaNumeric(string input)
        //{
        //    return Regex.IsMatch(input, "^[a-zA-Z0-9]+$");
        //}

        //public bool IsAlphaNumericWithUnderscore(string input)
        //{
        //    return Regex.IsMatch(input, "^[a-zA-Z0-9_]+$");
        //}
    }
}