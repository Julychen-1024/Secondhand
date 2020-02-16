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
    public partial class buy_order : System.Web.UI.Page
    {
        static private string u_id_cur;
        int num;
        protected void Page_Load(object sender, EventArgs e)
        {
            u_id_cur = Session["u_id"].ToString();
            if (!Page.IsPostBack)
            {
                string res = get_order();
                item.InnerHtml = res;
            }

        }
        //protected void But_deleteall(object sender, EventArgs e)
        //{
        //    dbutils db = new dbutils();
        //    db.createConnect();
        //    string sc_id = Request.Form["sc_id"];
        //    user u = (user)Session["user"];
        //    string u_id = "";
        //    if (u == null)
        //    {
        //        Response.Write("no");
        //        return;
        //    }
        //    else
        //    {
        //        u_id = u.U_ID;
        //    }
        //    string sql = "DELETE FROM shoppingcart where u_id = '" + u_id + "'";
        //    int res = db.ExecuteNonQuery(sql);
        //    db.closeConnect();
        //}
        public string get_order()
        {
            u_id_cur = Session["u_id"].ToString();

            dbutils db = new dbutils();
            db.createConnect();

            string output = "";
            string sql2 = "SELECT orderlist.o_id,user.u_name,goods.g_name,orderlist.g_id,o_num,o_sum_price,o_state from (goods,orderlist,user) where buy_id ='" + u_id_cur + "' and buy_id = user.u_id and orderlist.g_id  = goods.g_id";
            DataSet ds2 = db.executeQueue(sql2);
            db.closeConnect();
            num = ds2.Tables[0].Rows.Count;
            for (int i = 0; i < num; ++i)
            {
                string state;
                if (ds2.Tables[0].Rows[i][6].ToString() == "0")
                    state = "未发货";
                else
                    state = "已发货";
                //double tatol = Convert.ToDouble(ds2.Tables[0].Rows[i][3].ToString()) * Convert.ToDouble(ds2.Tables[0].Rows[i][4].ToString());
                output += "<li class=\"cart_item item_list d - flex flex - lg - row flex - column align - items - lg - center align - items - start justify - content - start\">";
                output += "<div class=\"product d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start\">";
                output += "<div class=\"product_total text-lg-center product_text\"><span>订单状态: </span>" + state + "&nbsp;&nbsp;&nbsp;<button class=\"btn btn-outline-primary btn-sm btn_delete\"  runat=\"server\"><span style=\"display:none\">" + ds2.Tables[0].Rows[i][0].ToString() + "</span><i class=\"fa fa-times\" aria-hidden=\"true\"></i></button></div>";
                output += "</div>";
                output += "<div class=\"product_size text-lg-center product_text\"><span>订单编号：</span>" + ds2.Tables[0].Rows[i][0].ToString() + "</div>";
                output += "<div class=\"product_size text-lg-center product_text\"><span>卖家：</span>" + ds2.Tables[0].Rows[i][1].ToString() + "</div>";
                //output += "<div class=\"product_size text-lg-center product_text\"><span>商品：</span>" + ds2.Tables[0].Rows[i][2].ToString() + "</div>";
                output += "<div class=\"product_size text-lg-center product_text\"><span>商品ID：</span>" + ds2.Tables[0].Rows[i][3].ToString() + "</div>";
                output += "<div class=\"product_price text-lg-center product_text\"><span>数量: </span>" + ds2.Tables[0].Rows[i][4].ToString() + "</div>";
                output += "<div class=\"product_price text-lg-center product_text\"><span>总价: </span>$" + ds2.Tables[0].Rows[i][5].ToString() + "</div>";
                //output += "<div class=\"product_total text-lg-center product_text\"><span>订单状态: </span>" + state + "&nbsp;&nbsp;&nbsp;<button class=\"btn btn-outline-primary btn-sm btn_delete\"  runat=\"server\"><span style=\"display:none\">" + ds2.Tables[0].Rows[i][0].ToString() + "</span><i class=\"fa fa-times\" aria-hidden=\"true\"></i></button></div>";
                //output += "<label id=label" + i.ToString() + ">";
                output += "</li>";
            }
            db.closeConnect();

            return output;
        }
    }
}