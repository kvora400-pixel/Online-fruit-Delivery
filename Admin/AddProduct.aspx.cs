using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineFruitDelivery.Admin
{

    public partial class AddProduct : System.Web.UI.Page
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
                getcon();
                fillcombo();
                fillgrid();    
            }

        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillcombo()//categories
        {
            getcon();
            da = new SqlDataAdapter("select * from add_fruit", con);
            ds = new DataSet();
            da.Fill(ds);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                drpdwn.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }
        }
        void clear()
        {
            txtFruitName.Text = "";
            txtPrice.Text = "";
            txtQuantity.Text = "";
        }
        void imgupload()
        {
            if (fldimg.HasFile)
            {
                fnm = "..//Image/" + fldimg.FileName;
                fldimg.SaveAs(Server.MapPath(fnm));
            }

        }
        void fillgrid()//gridview
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM add_pro", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        protected void btnAddFruit_Click(object sender, EventArgs e)
        {
            if (btnAddFruit.Text == "Add Fruit")
            {
                getcon();
                imgupload();
                cmd = new SqlCommand("insert into add_pro(FruitName,Category,Price,Quantity,Image) values('" + txtFruitName.Text + "' , '" + drpdwn.SelectedValue + "' , '" + txtPrice.Text + "','" + txtQuantity.Text + "', '" + fnm + "')", con);
                cmd.ExecuteNonQuery();
                clear();

                //Response.Redirect(Request.RawUrl);
            }
            else
            {
                getcon();
                SqlCommand cmd = new SqlCommand("UPDATE add_pro SET " +
                 "FruitName='" + txtFruitName.Text + "', " +
                 "Category='" + drpdwn.SelectedValue + "', " +
                "Price='" + txtPrice.Text + "', " +
                 "Quantity='" + txtQuantity.Text + "' " +
                   "WHERE Id='" + ViewState["id"] + "'", con);

                cmd.ExecuteNonQuery();
                clear();
                fillgrid();
                btnAddFruit.Text = "Add Fruit";

            }

        }
        void select()//gridview
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM add_pro WHERE Id='" + ViewState["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            txtFruitName.Text = ds.Tables[0].Rows[0]["FruitName"].ToString();
            drpdwn.SelectedValue = ds.Tables[0].Rows[0]["Category"].ToString();
            txtPrice.Text = ds.Tables[0].Rows[0]["Price"].ToString();
            txtQuantity.Text = ds.Tables[0].Rows[0]["Quantity"].ToString();
        }



        protected void drpdwn_SelectedIndexChanged(object sender, EventArgs e)//categories
        {
            getcon();
            da = new SqlDataAdapter("select Id from add_fruit where FruitType='" + drpdwn.SelectedItem.Text + "'", con);

            ds = new DataSet();
            da.Fill(ds);
            ViewState["id"] = ds.Tables[0].Rows[0][0].ToString();
        }

        //protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)//gridview
        //{
        //    if (e.CommandName == "cmd_edt")
        //   {
        //       int id = Convert.ToInt32(e.CommandArgument);
        //        ViewState["id"] = id;
        //        btnAddFruit.Text = "Update";
        //        select();
        //    }
        //    else if (e.CommandName == "cmd_dlt")
        //    {
        //        int id = Convert.ToInt32(e.CommandArgument);
        //        getcon();
        //        cmd = new SqlCommand("DELETE FROM add_pro WHERE Id='" + id + "'", con);
        //        cmd.ExecuteNonQuery();
        //        fillgrid();
        //    }
        //}

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                btnAddFruit.Text = "Update";
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

