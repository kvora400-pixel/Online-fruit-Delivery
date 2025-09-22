using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace OnlineFruitDelivery
{
    public partial class Login : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm;
        int i;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();

        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            if (txteml.Text != null && txtpwd != null)
            {


                getcon();
                cmd = new SqlCommand("select count(*) from Registerf where Email = '" + txteml.Text + "' and Password='" + txtpwd.Text + "'", con);
                i = Convert.ToInt32(cmd.ExecuteScalar());


                if (i > 0)
                {
                    Session["User"] = txteml.Text;
                    Response.Redirect("Index.aspx");
                }
                else
                {
                    Response.Write("<script> alrt('Invalid User')</script>");
                }



            }
        }
    }
}