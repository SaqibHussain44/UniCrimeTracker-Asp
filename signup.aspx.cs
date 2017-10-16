using ct_project.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ct_project
{
    public partial class signup : System.Web.UI.Page
    {
        DBConnection conn;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        public string Hash(string password)
        {
            var bytes = new System.Text.UTF8Encoding().GetBytes(password);
            byte[] hashBytes;
            using (var algorithm = new System.Security.Cryptography.SHA512Managed())
            {
                hashBytes = algorithm.ComputeHash(bytes);
            }
            return Convert.ToBase64String(hashBytes);
        }
        
        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            String userName, CNIC, City, Address, Email, Gender, Password, Contact, cPassword;
            userName = this.txtName.Text; CNIC = this.txtCNIC.Text; City = this.DropDownCity.Text;
            Address = this.txtAddress.Text; Email = this.txtEmail.Text; Password = this.txtPassword.Text;
            Contact = this.txtContact.Text; cPassword = txtcPassword.Text;
            if (this.RadioGender.Checked)
            {
                Gender = "M";
            }
            else 
            {
                Gender = "F";
            }
            User user = new User(userName,CNIC,Contact,City,Address,Email,Gender,Password);
            bool validCNIC=user.validatte_CNIC(CNIC);
            bool validContact = user.validatte_Contact(Contact);
            if (cPassword != Password)
            {
                Response.Redirect("signup.aspx?msg=PDM");
            }
            else if (!validCNIC)
            {
                Response.Redirect("signup.aspx?msg=CN");
            }
            else if (!validContact)
            {
                Response.Redirect("signup.aspx?msg=CON");
            }
            else
            {
                //Password = Hash(Password);
                conn = new DBConnection();
                ds = conn.getTable("Users", "SELECT * FROM Users");
                DataTable table = ds.Tables["Users"];
                string temp;
                if (ds != null && ds.Tables["Users"] != null)
                {
                    temp = ds.Tables["Users"].TableName;
                    DataRow row = ds.Tables["Users"].NewRow();
                    row["UserName"] = userName;
                    row["CNIC"] = CNIC;
                    row["City"] = City;
                    row["Contact"] = Contact;
                    row["Address"] = Address;
                    row["Email"] = Email;
                    row["Gender"] = Gender;
                    row["Type"] = "U";
                    row["Password"] = Password;
                    ds.Tables["Users"].Rows.Add(row);
                    if (conn.Commit(ds.Tables["Users"].ToString()))
                    {
                        Session["user"] = user;
                        Session["userName"] = user.userName;
                        Response.Redirect("index.aspx?msg=UR");
                    }
                    else
                    {
                        Response.Redirect("signup.aspx?msg=RF");
                    }
                }
            }


        }
    }
}