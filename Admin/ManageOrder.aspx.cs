using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineFruitDelivery.Admin
{
    public partial class ManageOrder : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            if (!IsPostBack)
            {
                fillgrid();
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();

        }
        private void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM order_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                btnEdit.Text = "Update";
                select();
            }
            else if (e.CommandName == "cmd_dlt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                getcon();
                cmd = new SqlCommand("DELETE FROM add_pro WHERE Id='" + id + "'", con);
                cmd.ExecuteNonQuery();
                fillgrid();
            }
        }
    }
}