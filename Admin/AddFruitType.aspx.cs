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
    public partial class AddFruit : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        String fnm;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            fillgrid();

        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM add_fruit", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        void clear()
        {
            txtnm.Text = "";

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            if (Button1.Text == "Add")
            {
                getcon();
                cmd = new SqlCommand("insert into add_fruit(FruitType)values('" + txtnm.Text + "')", con);
                cmd.ExecuteNonQuery();
                clear();

                txtnm.Text = "";
            }
            else
            {
                cmd = new SqlCommand("UPDATE add_fruit SET " +
                "FruitType='" + txtnm.Text + "' " +
                "WHERE Id='" + ViewState["id"] + "'", con);

                cmd.ExecuteNonQuery();
                clear();
                fillgrid();
                Button1.Text = "Add";

            }
        }
        void select()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM  add_fruit WHERE Id='" + ViewState["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            txtnm.Text = ds.Tables[0].Rows[0]["FruitType"].ToString();

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                Button1.Text = "Update";
                select();
            }
            else if (e.CommandName == "cmd_dlt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                getcon();
                cmd = new SqlCommand("DELETE FROM add_fruit WHERE Id='" + id + "'", con);
                cmd.ExecuteNonQuery();
                fillgrid();
            }

        }
    }
}