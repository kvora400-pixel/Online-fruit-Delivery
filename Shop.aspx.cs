using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace OnlineFruitDelivery
{
    public partial class Shop : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        String fnm;

        PagedDataSource pg;
        int row = 3, p;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            //fillcombo();
            filllist();
            if (Session["User"] != null)
            {
                getcon();
                ds = new DataSet();
                da = new SqlDataAdapter("SELECT * FROM Registerf WHERE Email = '" + Session["User"] + "'", con);
                 
                da.Fill(ds);
                int uid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
                String s= ds.Tables[0].Rows[0][1].ToString();
                Label3.Text = "Welcome:"+s;
            }
            else
            {
                Response.Redirect("Login.aspx");

            }

        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            LinkButton1.Enabled = true;
            p += Convert.ToInt32(ViewState["id"]) + 1;

            ViewState["id"] = Convert.ToInt32(p);

            int temp = row / pg.PageSize;
            if (p == temp)
            {
                LinkButton2.Enabled = false;
            }
            //int CurrentPage = Convert.ToInt32(ViewState["id"]);
            //CurrentPage++;
            //ViewState["id"] = CurrentPage;
            //filllist();
            filllist();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton2.Enabled = true;

            p -= Convert.ToInt32(ViewState["id"]) - 1;

            ViewState["id"] = Convert.ToInt32(p);

            int temp = row / pg.PageSize;
            if (p == temp)
            {
                LinkButton1.Enabled = false;
            }

            //int CurrentPage = Convert.ToInt32(ViewState["id"]);
            //CurrentPage--;
            //ViewState["id"] = CurrentPage;
            filllist();
        }

      

        protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_view")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("ViewDetails.aspx?id=" + id);
            }
            else if(e.CommandName=="cmd_add")
            {
                da = new SqlDataAdapter("SELECT * FROM Registerf WHERE Email = '" + Session["User"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                int userid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);

                int prodid = Convert.ToInt32(e.CommandArgument);

                da = new SqlDataAdapter("SELECT * FROM add_pro WHERE Id = '" + prodid+ "'", con);
                ds = new DataSet();
                da.Fill(ds);


                string prdnm = ds.Tables[0].Rows[0]["FruitName"].ToString();
                decimal prdprc = Convert.ToDecimal(ds.Tables[0].Rows[0]["Price"]); 
                string img = ds.Tables[0].Rows[0]["Image"].ToString();
                int quantity = 1;

                cmd = new SqlCommand("INSERT INTO cart_tbl (user_cart_id, prod_cart_id, FruitName, Price, Quantity, Image) " +
                         "VALUES ('" + userid + "', '" + prodid + "', '" + prdnm + "', '" + prdprc + "', '" + quantity + "', '" + img + "')", con);

                cmd.ExecuteNonQuery();

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewCart.aspx");

        }

        void filllist()
        {
            getcon();
            da = new SqlDataAdapter("select * from add_pro", con);
            ds = new DataSet();
            da.Fill(ds);

            row = ds.Tables[0].Rows.Count;
            pg = new PagedDataSource();

            pg.AllowPaging = true;
            pg.PageSize = 3;
            pg.CurrentPageIndex = Convert.ToInt32(ViewState["id"]);

            //LinkButton1.Enabled = !pg.IsFirstPage;
            //LinkButton2.Enabled = !pg.IsLastPage;

            pg.DataSource = ds.Tables[0].DefaultView;
            DataList1.DataSource = pg;
            DataList1.DataBind();

        }


        //protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        //        {

        //        }
    }
}