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
    public partial class Checkout : System.Web.UI.Page
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
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            getcon();

            // 1. Get user ID from registerf
            getcon();
            da = new SqlDataAdapter("Select * from Registerf where Email ='" + Session["User"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)

            {

                lblMessage.Text = "User not found.";
                return;

            }

            int uid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

            // 2. Get cart items for user

            da = new SqlDataAdapter("SELECT *, (Price * Quantity) AS Total FROM cart_tbl WHERE user_cart_id = '" + uid + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            DataTable cartItems = ds.Tables[0];

            if (cartItems.Rows.Count == 0)
            {
                lblMessage.Text = "Your cart is empty.";
                return;
            }
            // 3. Calculate total amount

            decimal totalAmount = 0;

            foreach (DataRow dr in cartItems.Rows)
            {
                if (dr["Total"] != DBNull.Value)
                    totalAmount += Convert.ToDecimal(dr["Total"]);
            }
            // 4. Insert order_tbl

            string shippingAddress = txtShippingAddress.Text.Trim();

            string paymentMethod = rblPaymentMethod.SelectedValue;

            if (string.IsNullOrEmpty(shippingAddress))
            {
                lblMessage.Text = "Please enter a shipping address.";
                return;
            }

            cmd = new SqlCommand("INSERT INTO order_tbl (user_id, Order_Date, Total_Amount, Order_Status, Shipping_Address, Payment_Method) " +
                                 "VALUES ('" + uid + "', '" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "', '" + totalAmount +
                                 "', 'Pending', '" + shippingAddress + "', '" + paymentMethod + "'); SELECT SCOPE_IDENTITY();", con);

            int orderId = Convert.ToInt32(cmd.ExecuteScalar());

            // 5. Insert order_items_tbl for each cart item

            foreach (DataRow dr in cartItems.Rows)
            {
                cmd = new SqlCommand("INSERT INTO order_item_tbl (order_id, prod_id,FruitName, Price,Quantity,Image) " +
                 "VALUES ('" + orderId + "', '" + dr["prod_cart_id"] + "', '" + dr["FruitName"] + "', '" + dr["Price"] +
                 "', '" + dr["Quantity"] + "', '" + dr["Image"] + "')", con);

                cmd.ExecuteNonQuery();

            }

            // 6. Clear cart

            cmd = new SqlCommand("DELETE FROM cart_tbl WHERE user_cart_Id = '" + uid + "'", con);
            cmd.ExecuteNonQuery();

            //con.close();

            lblMessage.Text = "Order placed successfully!";
            gvCart.DataSource = null;
            gvCart.DataBind();
            lblOrderTotal.Text = "";
        }
    }
}
