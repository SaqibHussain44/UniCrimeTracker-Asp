using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ct_project.Models
{
    public class Report
    {
        string CrimeTitle { set; get; }
        string SubmittedBy { set; get; }
        string CNIC { set; get; }
        string Date { set; get; }
        string Time { set; get; }
        string City { set; get; }
        string Description { set; get; }
        string Location { set; get; }
        int DamageWorth { set; get; }
        public Report()
        {
            CrimeTitle = SubmittedBy = CNIC = Date = Time = City = Description = Location = "";
            DamageWorth = -1;
        }
        public Report(string title,string subBy,string cnic,string date,string time,string city,string description,string location,int damageWorth)
        {
            CrimeTitle = title; SubmittedBy = subBy;  CNIC = cnic; Date = date; Time = time; City = city; Description = description; Location = location;
            DamageWorth = damageWorth;
        }
    }
}