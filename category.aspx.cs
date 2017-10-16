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
    public partial class category : System.Web.UI.Page
    {
        String title;
        DBConnection conn;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["title"] != null)
            {
                this.title = Request.QueryString["title"].ToString();
                conn = new DBConnection();
                ds = conn.getTable("Report", "SELECT * FROM Report WHERE CrimeTitle='" + this.title+"'");
                if (ds != null && ds.Tables["Report"] != null)
                {
                    ListViewDetails.DataSource = ds.Tables["report"];
                    ListViewDetails.DataBind();
                }
            }
        }
    }
}