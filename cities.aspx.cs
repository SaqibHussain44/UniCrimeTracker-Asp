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
    public partial class cities : System.Web.UI.Page
    {
        String name;
        DBConnection conn;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["name"] != null)
            {
                this.name = Request.QueryString["name"].ToString();
                conn = new DBConnection();
                ds = conn.getTable("Report", "SELECT * FROM Report WHERE City='" + this.name + "'");
                if (ds != null && ds.Tables["Report"] != null)
                {
                    ListViewCity.DataSource = ds.Tables["report"];
                    ListViewCity.DataBind();
                }
            }
        }
    }
}