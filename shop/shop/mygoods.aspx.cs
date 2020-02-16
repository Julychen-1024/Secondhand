using MySql.Data.MySqlClient;
using shop.code;
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
    public partial class myshop : System.Web.UI.Page
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
            string sql = "SELECT g_id as '商品号',g_name AS '商品名',g_price AS '商品价格',g_num AS '库存',g_image1 AS '图片1',g_image2 AS '图片2',g_image3 AS '图片3',g_image4 AS '图片4', g_info AS '详细信息' FROM goods where u_id='" + u_id+"';";
            MySqlCommand comm = new MySqlCommand(sql, conn);
            MySqlDataAdapter ada = new MySqlDataAdapter(comm);
            DataSet ds = new DataSet();
            ada.Fill(ds, "goods");
            GridView1.DataSource = ds;
            GridView1.DataBind();
            //conn.Close();
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
            string gid = TextBox1.Text;
            string gname = TextBox2.Text;
            string gprice = TextBox3.Text;
            string gnum = TextBox4.Text;
            string img1 = FileUpload1.FileName;
            string img2 = FileUpload2.FileName;
            string img3 = FileUpload3.FileName;
            string img4 = FileUpload4.FileName;
            string ginfo = TextBox5.Text;
            string gtype = DropDownList1.SelectedValue;
            string image1 = "image/" + img1;
            string image2 = "image/" + img2;
            string image3 = "image/" + img3;
            string image4 = "image/" + img4;
            string sql = "insert into goods (g_id,g_name,g_price,g_num,g_image1,g_image2,g_image3,g_image4,g_info,u_id,t_id) values('"
                + gid + "','" + gname + "','" + gprice + "','" + gnum + "','" + image1 + "','" + image2 + "','" + image3 + "','" + image4 + "','" + ginfo + "','" + u_id + "','"+gtype+"')";
            MySqlCommand comm = new MySqlCommand(sql, conn);
            conn.Open();

            if (gid == "" || gname == "" || gprice == "" || gnum == ""||img1==""||img2=="" || img3== "" || img4 == ""||ginfo==""||gtype=="")
            {
                Response.Write("<script language=javascript>alert('添加失败，请填写完整信息！')</script>");
            }
            else
            {

                comm.ExecuteNonQuery();
                Response.Write("<script language=javascript>alert('添加成功！');window.location.href=document.URL;</script>");
                //Response.Redirect("FirstPage.aspx");
            }
            conn.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
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
            string gid = TextBox1.Text;
            string gname = TextBox2.Text;
            string gprice = TextBox3.Text;
            string gnum = TextBox4.Text;
            string img1 = FileUpload1.FileName;
            string img2 = FileUpload2.FileName;
            string img3 = FileUpload3.FileName;
            string img4 = FileUpload4.FileName;
            string ginfo = TextBox5.Text;
            string gtype = DropDownList1.SelectedValue;
            string sql = "update goods set g_name='"+gname+"',g_price='"+gprice+"',g_num='"+gnum+"',g_image1='"+img1+ "',g_image2='" + img2 + "',g_image3='" + img3 + "',g_image4='" + img4 + "',g_info='" + ginfo + "',t_id='"+gtype+"' where g_id='"+gid+"'";
            MySqlCommand comm = new MySqlCommand(sql, conn);
            conn.Open();
            comm.ExecuteNonQuery();
            Response.Write("<script language=javascript>alert('修改成功！');window.location.href=document.URL;</script>");
            conn.Close();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = CreateConn();
            string gid = TextBox1.Text;
            string sql = "DELETE FROM goods WHERE g_id='" + gid+ "'";
            MySqlCommand comm = new MySqlCommand(sql, conn);
            conn.Open();
            comm.ExecuteNonQuery();
            Response.Write("<script language=javascript>alert('删除成功！');window.location.href=document.URL;</script>");
            conn.Close();
        }
    }
}