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
    public partial class shoppingcart2 : System.Web.UI.Page
    {
        static private string u_id_cur;
        int num;
        public class good
        {
            public string id;
            public string name;
            public double price;
            public string image;
            public string info;

            public good(string id, string name, double price, string image, string info)
            {
                this.id = id;
                this.name = name;
                this.price = price;
                this.image = image;
                this.info = info;

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
           u_id_cur = Session["u_id"].ToString();
            if (!Page.IsPostBack)
            {
                string res = get_goods();
                item.InnerHtml = res;
            }

        }
        protected void But_deleteall(object sender, EventArgs e)
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
            string sql = "DELETE FROM shoppingcart where u_id = '" + u_id + "'";
            int res = db.ExecuteNonQuery(sql);
            db.closeConnect();
        }
        public string get_goods()
        {
            u_id_cur = Session["u_id"].ToString();
            List<good> list = new List<good>();

            dbutils db = new dbutils();
            db.createConnect();

            string output = "";
            string sql2 = "SELECT goods.g_image1,g_name,g_info,g_price,sc_num,goods.g_id,sc_id from (goods,shoppingcart) where goods.g_id = shoppingcart.g_id and shoppingcart.u_id = '" + u_id_cur + "';";
            DataSet ds2 = db.executeQueue(sql2);
            db.closeConnect();
            num = ds2.Tables[0].Rows.Count;
            for (int i = 0; i < num; ++i)
            {
                double tatol = Convert.ToDouble(ds2.Tables[0].Rows[i][3].ToString()) * Convert.ToDouble(ds2.Tables[0].Rows[i][4].ToString());
                output += "<li class=\"cart_item item_list d - flex flex - lg - row flex - column align - items - lg - center align - items - start justify - content - start\">";
                output += "<div class=\"product d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start\">";
                output += "<div><div class=\"product_image\"><img src = \"" + ds2.Tables[0].Rows[i][0].ToString() + "\" alt=\"\"/></div></div>";
                output += "<div class=\"product_name\"><a href = \"goodsdetail.aspx?g_id="+ ds2.Tables[0].Rows[i][5].ToString() + "\"> " + ds2.Tables[0].Rows[i][1].ToString() + "</a></div>";
                output += "</div>";
                output += "<div class=\"product_size text-lg-center product_text\"><span>商品ID：</span>" + ds2.Tables[0].Rows[i][5].ToString() + "</div>";
                output += "<div class=\"product_size text-lg-center product_text\"><span>详细信息：</span>" + ds2.Tables[0].Rows[i][2].ToString() + "</div>";
                output += "<div class=\"product_price text-lg-center product_text\"><span>价格: </span>$" + ds2.Tables[0].Rows[i][3].ToString() + "</div>";
                output += "<div class=\"product_quantity_container\">";
                output += "<div class=\"product_quantity ml-lg-auto mr-lg-auto text-center\">";
                output += "<span class=\"product_text product_num\">" + ds2.Tables[0].Rows[i][4].ToString() + "</span>";
                output += "<div class=\"qty_sub qty_button trans_200 text-center\"><span>-</span></div>";
                output += "<div class=\"qty_add qty_button trans_200 text-center\"><span>+</span></div>";
                output += "</div>";
                output += "</div>";
                output += "<div class=\"product_total text-lg-center product_text\"><span>总价: </span>$" + tatol.ToString() + "&nbsp;&nbsp;&nbsp;<button class=\"btn btn-outline-primary btn-sm btn_delete\"  runat=\"server\"><span style=\"display:none\">"+ ds2.Tables[0].Rows[i][6].ToString() + "</span><i class=\"fa fa-times\" aria-hidden=\"true\"></i></button>&nbsp; &nbsp; &nbsp;<button class=\"btn btn-outline-primary btn-sm btn_buy\"  runat=\"server\"><span style=\"display:none\">" + ds2.Tables[0].Rows[i][6].ToString() + "</span>购买</button></div>";
                //output += "<label id=label"+i.ToString()+">";
                output += "</li>";
            }
            db.closeConnect();

            return output;
        }
        protected void but_click1(object sender, EventArgs e)
        {

        }
        protected void but_click2(object sender, EventArgs e)
        {
        }
      
    }
}