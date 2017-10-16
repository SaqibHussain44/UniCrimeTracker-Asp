using ct_project.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ct_project
{
    public partial class login : System.Web.UI.Page
    {
        DBConnection conn;
        DataSet ds;
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
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButtonSubmit_Click1(object sender, EventArgs e)
        {
            if (Request.Form["email"] != null && Request.Form["password"] != null)
            {
                string email = Request.Form["email"];
                string password = Request.Form["password"];
                conn = new DBConnection();
                ds = conn.getTable("Users", "SELECT * FROM Users WHERE Email = '" + email + "'");
                if (ds != null)
                {
                    string type = ""; User user = new User();
                    DataTable table = ds.Tables["Users"];
                    DataRow row;
                    if (table.Rows.Count > 0)
                    {
                        row = table.Rows[0];
                        user.userName = row["UserName"].ToString();
                        user.CNIC = row["CNIC"].ToString();
                        user.City = row["City"].ToString();
                        user.Contact = row["Contact"].ToString();
                        user.Address = row["Address"].ToString();
                        user.Email = row["Email"].ToString();
                        user.Gender = row["Gender"].ToString();
                        type = row["Type"].ToString();
                        if (type == "A")
                        {
                            Session["admin"] = "true";
                        }
                        string pwd = row["Password"].ToString();
                        user.Password = pwd;
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert" + UniqueID, "alert('" + pwd + "');", true);
                        if (password == pwd)
                        {
                            Session["user"] = user;
                            Session["userName"] = user.userName;
                            if (Session["admin"] != null)
                            {
                                Response.Redirect("Admin.aspx");
                            }
                            else
                            {
                                Response.Redirect("index.aspx?msg=LI");
                            }
                        }
                        else
                        {
                            Response.Redirect("login.aspx?msg=PI");
                        }
                    }
                    else
                    {
                        Response.Redirect("login.aspx?msg=UNR");
                    }
                }// end of id dataset is not null
            } //end of if fields are not blank
        }
    }// end of function
}
