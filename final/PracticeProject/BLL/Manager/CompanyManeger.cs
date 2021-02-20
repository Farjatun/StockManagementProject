using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using PracticeProject.BLL.Model;
using PracticeProject.DAL.Gateway;

namespace PracticeProject.BLL.Manager
{
    public class CompanyManeger
    {
        private CompanyGateway companyGateway;

        public CompanyManeger()
        {
            companyGateway=new CompanyGateway();
        }

        public string Save(Company company)

        {
            if (IsAlpha(company.Name))
            {
                bool isNameExits = companyGateway.IsNameExits(company.Name);
            if (isNameExits)
            {
                return "Name Already Exits";
            }
            else
            {
                int rowAffect = companyGateway.Save(company);
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

        public List<Company> GetAllCompanies()
        {
            return companyGateway.GetAllCompanies();

        }
        public bool IsAlpha(string input)
        {
            return Regex.IsMatch(input, "^[a-zA-Z ]+$");
        }
    }
}