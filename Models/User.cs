using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace ct_project.Models
{
    public class User
    {
        public User()
        {
            userName = CNIC = City = Contact = Address = Gender = Email = Password = "";
        }
        public User(string name,string cnic,string contact, string city, string address, string email, string gender,string pwd)
        {
            userName = name;
            CNIC = cnic;
            City = city;
            Contact = contact;
            Address = address;
            Email = email;
            Gender = gender;
            Password = pwd;
        }
        
        public string userName { set; get; }
        public string CNIC { set; get; }
        public string City { set; get; }
        public string Contact { set; get; }
        public string Address { set; get; }
        public string Email { set; get; }
        public string Gender { set; get; }
        public string Password { set; get; }
        public bool validatte_Contact(string cont)
        {
            Regex check = new Regex(@"^[0-9]{4}-[0-9]{7}$");
            return check.IsMatch(cont);
        }
        public bool validatte_CNIC(string cnic)
        {
            Regex check = new Regex(@"^[0-9]{5}-[0-9]{7}-[0-9]{1}$");
            return check.IsMatch(cnic); 
        }
    }
}