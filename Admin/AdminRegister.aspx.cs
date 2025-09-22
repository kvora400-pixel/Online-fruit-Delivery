using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace OnlineFruitDelivery.Admin
{
    public partial class Register : System.Web.UI.Page
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
            //fillgrid();

        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void imgupload()
        {
            if (fldimg.HasFile)
            {
                fnm = "Image/" + fldimg.FileName;
                fldimg.SaveAs(Server.MapPath(fnm));
            }
        }
        //void fillgrid()
        //{
        //    getcon();
        //    da = new SqlDataAdapter("SELECT * FROM AdminRegisterf", con);
        //    ds = new DataSet();
        //    //da.Fill(ds);

        //}
        void clear()
        {
            txtnum.Text = "";
            txteml.Text = "";
            txtpwd.Text = "";
            drpcty.SelectedIndex = 0;
            rdbgen.ClearSelection();
        }
        protected void btn1_Click(object sender, EventArgs e)
        {
            if (btn1.Text == "Save")
            {

                imgupload();
                getcon();

                cmd = new SqlCommand("INSERT INTO AdminRegisterf " +
                    "(Name, Gender, Email, City, Password, Image) " +
                    "VALUES ('" + txtnum.Text + "','" + rdbgen.SelectedValue + "','" + txteml.Text + "','" +
                    drpcty.SelectedValue + "','" + txtpwd.Text + "','" + fnm + "')", con);

                cmd.ExecuteNonQuery();
                clear();

                Response.Redirect("AdminLogin.aspx");
            }
            }
    }
}