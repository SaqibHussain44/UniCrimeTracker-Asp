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

    public partial class submitReport : System.Web.UI.Page
    {
        DBConnection conn;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            String title, date, time, location, city, description, damageWorth;
            title = this.dropDownTitle.Text; date = this.Date.SelectedDate.ToString(); time = this.txtTime.Text;
            city = this.DropDownCity.Text; description = this.txtDescription.Text;
            damageWorth = this.txtDW.Text; location = txtLocation.Text;
            User user=new User();
            if (Session["user"] != null)
            {
                 user = (User)Session["user"];
            }
            string cnic = user.CNIC;
            string submittedBy = user.userName;
            Report report = new Report(title, submittedBy, cnic, date, time, city, description, location, Int32.Parse(damageWorth));
            conn = new DBConnection();
            ds = conn.getTable("Report", "SELECT * FROM Report");
            DataTable table = ds.Tables["Report"];
            if (ds != null && ds.Tables["Report"] != null)
            {
                DataRow row = ds.Tables["Report"].NewRow();
                row[1] = title;
                row[2] = submittedBy;
                row[3] = cnic;
                row[4] = date;
                row[5] = time;
                row[6] = city;
                row[7] = description;
                row[8] = location;
                row[9] = damageWorth;
                ds.Tables["Report"].Rows.Add(row);
                if (conn.Commit(ds.Tables["Report"].ToString()))
                {
                    Response.Redirect("index.aspx?msg=RS");
                }
                else
                {
                    Response.Redirect("signup.aspx?msg=RF");
                }
            }
        }
    }
}