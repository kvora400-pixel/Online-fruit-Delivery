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