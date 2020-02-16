using MySql.Data.MySqlClient;
using shop.pdl_bean;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shop
{
    public partial class corder : System.Web.UI.Page
    {
        public static MySqlConnection CreateConn()
        {
            string _conn = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(_conn);
            return conn;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            user u = (user)Session["user"];
            string u_id = "";
            if (u == null)
            {
                Response.Write("no");
                return;
            }
            else
            {
                u_id = u.U_ID;
            }
            if (!IsPostBack)
            {
                CreateConn();
            }
            MySqlConnection conn = CreateConn();
            conn.Open();
            string sql = "SELECT o_id as '订单号',g_id AS '商品号',buy_id AS '买家',o_num AS '数量' FROM orderlist where sell_id='" + u_id + "' and o_state='0'";
            MySqlCommand comm = new MySqlCommand(sql, conn);
            MySqlDataAdapter ada = new MySqlDataAdapter(comm);
            DataSet ds = new DataSet();
            ada.Fill(ds, "orderlist");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            user u = (user)Session["user"];
            string u_id = "";
            if (u == null)
            {
                Response.Write("no");
                return;
            }
            else
            {
                u_id = u.U_ID;
            }
            MySqlConnection conn = CreateConn();
            string oid = TextBox1.Text;
            string sql = "update orderlist set o_state='1' where o_id='"+oid+"' ";
            MySqlCommand comm = new MySqlCommand(sql, conn);
            conn.Open();

            if (oid == "")
            {
                Response.Write("<script language=javascript>alert('确认失败，请填写订单号！')</script>");
            }
            else
            {

                comm.ExecuteNonQuery();
                Response.Write("<script language=javascript>alert('订单确认成功！');window.location.href=document.URL;</script>");
                //Response.Redirect("FirstPage.aspx");
            }
            conn.Close();
        }
    }
}