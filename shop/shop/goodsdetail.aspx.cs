using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using shop.code;
using System.Data;
using System.Web.Script.Services;
using System.Web.Services;
using shop.pdl_bean;


namespace shop
{
    public partial class goodsdetail : System.Web.UI.Page
    {
        //static private string u_id_cur;
        protected void Page_Load(object sender, EventArgs e)
        {
            //u_id_cur = Session["u_id"].ToString();
            if (!Page.IsPostBack)
            {
                string res1 = get_images();
                image.InnerHtml = res1;
                string res2 = get_goods();
                goods.InnerHtml = res2;
            }
        }
        public string get_images()
        {
            //u_id_cur = Session["u_id"].ToString();
            string text = Request.QueryString["g_id"];

            dbutils db = new dbutils();
            db.createConnect();

            string output1 = "";
            string sql2 = "select * from goods where goods.g_id ='"+text+"'";
            DataSet ds2 = db.executeQueue(sql2);
            db.closeConnect();

            output1 +="<div class=\"product_content_inner\">";
            output1 +="<div class=\"product_image_row d-flex flex-md-row flex-column align-items-md-end align-items-start justify-content-start\">";
            output1 +="<div class=\"product_image_1 product_image\">";
            output1 +="<img src = "+ds2.Tables[0].Rows[0][4].ToString()+" alt=\"\"/>";
            output1 +="</div>";
            output1 +="<div class=\"product_image_2 product_image\"><img src = " + ds2.Tables[0].Rows[0][5].ToString() + " alt=\"\"/></div>";
            output1 +="</div>";
            output1 +="<div class=\"product_image_row\">";
            output1 +="<div class=\"product_image_3 product_image\"><img src = " + ds2.Tables[0].Rows[0][6].ToString() + " alt=\"\"/></div>";
            output1 +="</div>";
            output1 +="<div class=\"product_image_row d-flex flex-md-row flex-column align-items-start justify-content-start\">";
            output1 +="<div class=\"product_image_4 product_image\"><img src = " + ds2.Tables[0].Rows[0][7].ToString() + " alt=\"\"/></div>";
            output1 +="<div class=\"product_image_5 product_image\"><img src = " + ds2.Tables[0].Rows[0][4].ToString() + " alt=\"\"/></div>";
            output1 +="</div>";
            output1 +="</div>";
                
            db.closeConnect();

            return output1;
        }
        public string get_goods()
        {
            //u_id_cur = Session["u_id"].ToString();
            string text = Request.QueryString["g_id"];

            dbutils db = new dbutils();
            db.createConnect();

            string output1 = "";
            string sql2 = "select g_name,g_price,t_name,u_id,g_info from(goods,goodstype) where goods.g_id ='"+text+"' and goods.t_id = goodstype.t_id";
            DataSet ds2 = db.executeQueue(sql2);
            db.closeConnect();

            output1 += "<div class=\"product_name\">" + ds2.Tables[0].Rows[0][0].ToString() + "</div>";
            output1 += "<div class=\"product_price\">单价：$" + ds2.Tables[0].Rows[0][1].ToString() + "</div>";
            output1 += "<div class=\"product_price\">类型：" + ds2.Tables[0].Rows[0][2].ToString() + "</div>";
            output1 += "<div class=\"product_price\">卖家：" + ds2.Tables[0].Rows[0][3].ToString() + "</div>";
            output1 += "<div class=\"product_price\">详细信息：<br>" + ds2.Tables[0].Rows[0][4].ToString() + "</div>";
            db.closeConnect();

            return output1;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            user u = (user)Session["user"];
            string u_id = "";
            if (u == null)
            {
                Response.Write("<script language=javascript>alert('请登录后购买！')</script>");
                return;
            }
            else
            {
                u_id = u.U_ID;
            }
            string text = Request.QueryString["g_id"];
            dbutils db = new dbutils();
            db.createConnect();
            string sc_num = TextBox1.Text;
            //user u = (user)Session["user"];
            //string u_id = "";
            //if (u == null)
            //{
            //    Response.Write("no");
            //    return;
            //}
            //else
            //{
            //    u_id = u.U_ID;
            //}
            string sql = "insert into shoppingcart(sc_num,u_id,g_id) values('"+sc_num+"','"+u_id+"','"+text+"')";
            int res = db.ExecuteNonQuery(sql);
            db.closeConnect();

            if (res == 1)
            {
                Response.Write("<script language=javascript>alert('添加成功！')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('添加失败！')</script>");
            }
        }
    }
}