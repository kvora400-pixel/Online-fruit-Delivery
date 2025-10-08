using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineFruitDelivery
{
    public partial class ViewCart : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        String fnm;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fill_grid();
            }
            getcon();

        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void fill_grid()
        {
            getcon();
            da = new SqlDataAdapter("Select * from Registerf where Email ='" + Session["User"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int uid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);

                //da = new SqlDataAdapter("SELECT prod_cart_id, FruitName, FruitPrice, Quantity, Image, (FruitPrice * Quantity) AS Total FROM cart_tbl WHERE user_cart_id = '" + uid + "'", con);

                da = new SqlDataAdapter("SELECT *, (Price * Quantity) AS Total FROM cart_tbl WHERE user_cart_id = '" + uid + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                gvCart.DataSource = ds;
                gvCart.DataBind();

                //calculate final total

                decimal finalTotal = 0;
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (dr["Total"] != DBNull.Value)
                        finalTotal += Convert.ToDecimal(dr["Total"]);

                }
                lblFinalTotal.Text = "Final Total: ₹" + finalTotal.ToString("0.00");

            }
            else
            {
                gvCart.DataSource = null;
                gvCart.DataBind();
                lblFinalTotal.Text = "Final Total = ₹0.00";
            }
        }

        protected void btnUpdateCart_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Registerf WHERE Email = '" + Session["User"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int uid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);//fetch userid

                foreach (GridViewRow row in gvCart.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow && row.RowIndex < gvCart.DataKeys.Count)
                    {
                        int prodid = Convert.ToInt32(gvCart.DataKeys[row.RowIndex].Value);

                        TextBox txtqty = (TextBox)row.FindControl("txtQuantity");//find control

                        int Quantity = 1;
                        int.TryParse(txtqty.Text, out Quantity);

                        if (Quantity < 1) Quantity = 1;

                        cmd = new SqlCommand("UPDATE cart_tbl SET Quantity = " + Quantity + " WHERE user_cart_id = '" + uid + "' AND prod_cart_id = " + prodid, con);
                        cmd.ExecuteNonQuery();


                    }
                }
                fill_grid();

            }
            else
            {
                //user not found,handle accordingly.
                Response.Redirect("Login.aspx");
            }

        }

        protected void btncheck_Click(object sender, EventArgs e)
        {
            Response.Redirect("checkout.aspx");
        }
    }
}