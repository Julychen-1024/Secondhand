using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using shop.code;
using System.Data;
using shop.pdl_bean;
using MySql;

namespace shop
{
    public partial class cart_buy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dbutils db = new dbutils();
            db.createConnect();
            string sc_id = Request.Form["sc_id"];
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
            string sql1 = "select shoppingcart.g_id,goods.u_id,g_price,sc_num,g_num from(goods,shoppingcart) where sc_id='"+sc_id+"' and shoppingcart.g_id = goods.g_id";
            DataSet ds1 = db.executeQueue(sql1);
            string g_id = ds1.Tables[0].Rows[0][0].ToString();
            string sc_num = ds1.Tables[0].Rows[0][3].ToString();
            string g_num = ds1.Tables[0].Rows[0][4].ToString();
            string sell_id = ds1.Tables[0].Rows[0][1].ToString();
            string price = ds1.Tables[0].Rows[0][2].ToString();
            db.closeConnect();
            int sc_num_cur = Convert.ToInt32(sc_num);
            int g_num_cur = Convert.ToInt32(g_num);
            double sum_price = sc_num_cur * Convert.ToDouble(price);
            if (sc_num_cur > g_num_cur)
            {
                db.createConnect();
                string sql2 = "DELETE FROM shoppingcart where sc_id = '" + sc_id + "'";
                int res = db.ExecuteNonQuery(sql2);
                db.closeConnect();

                if (res == 1)
                {
                    //更新前端数据
                    Response.Redirect("shoppingcart2.aspx");
                    return;
                }
                Response.Write("库存不足");
            }
            else
            {
                db.createConnect();
                string sql3 = "insert into orderlist(g_id,buy_id,sell_id,o_state,o_num,o_sum_price) values( '" + g_id + "','" + u_id + "','" + sell_id + "','0','" + sc_num + "','" + sum_price.ToString() + "') ;";
                int count = db.ExecuteNonQuery(sql3);
                db.closeConnect();
                db.createConnect();
                int all_num = g_num_cur - sc_num_cur;
                string sql5 = "update goods set g_num = '" + all_num.ToString() + "' where g_id ='"+g_id+"'";
                db.ExecuteNonQuery(sql5);
                db.closeConnect();
                db.createConnect();
                string sql4 = "DELETE FROM shoppingcart where sc_id = '" + sc_id + "'";
                int res = db.ExecuteNonQuery(sql4);
                db.closeConnect();
                if (res == 1)
                {
                    //更新前端数据
                    Response.Redirect("shoppingcart2.aspx");
                    return;
                }
            }
        }
    }
}