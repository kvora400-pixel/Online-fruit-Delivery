using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace OnlineFruitDelivery
{
    public partial class Contact : System.Web.UI.Page
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

        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void clear()
        {

            txtName.Text = "1";
            txtEmail.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (btnSubmit.Text == "Send Message")
            {
                getcon();
                cmd = new SqlCommand("INSERT INTO Contact_tbl ( FullName,Email,Subject, Message)" + "VALUES  ( '" + txtName.Text + "',  '" + txtEmail.Text + "', '" + txtSubject.Text + "', '" + txtMessage.Text + "')", con);
                cmd.ExecuteNonQuery();
                clear();
            }

            }
    }
}