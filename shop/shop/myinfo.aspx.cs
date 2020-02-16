using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Web.Configuration;
using shop.pdl_bean;

namespace shop
{
    public partial class myinfo : System.Web.UI.Page
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
            string sql = "SELECT u_name ,u_password ,u_tel ,u_email ,u_addr  FROM user where u_id='" + u_id + "';";
            MySqlCommand comm = new MySqlCommand(sql, conn);
            MySqlDataReader dr = comm.ExecuteReader();
            dr.Read();
            string aa = dr[0].ToString().Trim();
            string bb = dr[1].ToString().Trim();
            string cc = dr[2].ToString().Trim();
            string dd = dr[3].ToString().Trim();
            string ee = dr[4].ToString().Trim();
            if (!Page.IsPostBack)
            {
                TextBox1.Text = u_id;
                TextBox2.Text = aa;
                TextBox3.Text = bb;
                TextBox4.Text = cc;
                TextBox5.Text = dd;
                TextBox6.Text = ee;
            }
            conn.Close();
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
            string uid = TextBox1.Text;
            string uname = TextBox2.Text;
            string upwd = TextBox3.Text;
            string utel = TextBox4.Text;
            string uemail = TextBox5.Text;
            string uaddr = TextBox6.Text;
            string sql = "update user set u_name='" + uname + "',u_password='" + upwd + "',u_tel='" + utel + "',u_email='" + uemail + "',u_addr='" + uaddr + "' where u_id='" + u_id + "'";
            MySqlCommand comm = new MySqlCommand(sql, conn);
            conn.Open();
            comm.ExecuteNonQuery();
            Response.Write("<script language=javascript>alert('修改成功！');window.location.href=document.URL;</script>");
            conn.Close();
        }
    }
}