using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ct_project.Models
{
    public class Crime
    {
        string crimeTitle { set; get; }
        int Severity { set; get; }
        public Crime()
        {
            crimeTitle = ""; Severity = -1;
        }
        public Crime(string title,int severity)
        {
            crimeTitle = title; Severity = severity;
        }
    }
}