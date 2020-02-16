using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using shop.code;
using System.Data;
using System.Text.RegularExpressions;

namespace shop
{
    public partial class index : System.Web.UI.Page
    {
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
            if (!Page.IsPostBack)
            {
                string res = get_goods(1);
                product3.InnerHtml = res;
                bindCerType();  //绑定可以使用的类型
                
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            string res = get_goods(0);
            product3.InnerHtml = res;
        }

        /*
         * 绑定证件类型
         */
        public void bindCerType()
        {
            //绑定排序方式
            string[] Month = new string[3] { "未排序", "销量", "价格" };
            this.DropDownList2.DataSource = Month;
            this.DropDownList2.DataBind();
            


            string sql = sql = "SELECT t_id,t_name from goodstype;";
            dbutils db = new dbutils();
            db.createConnect();
            DataSet ds = db.executeQueue(sql);
            DataTable dt = ds.Tables[0];
            li_cer_type.DataSource = dt;
            li_cer_type.DataTextField = "t_name";
            li_cer_type.DataValueField = "t_id";
            li_cer_type.DataBind();
            db.closeConnect();
        }
       //public string get_goodstype()
       // {
       //     List<good> list = new List<good>();

       //     dbutils db = new dbutils();
       //     db.createConnect();
       //     string sql = "";

       //     sql = "SELECT t_id,t_name from goodstype;";
       //     DataSet ds = db.executeQueue(sql);

       //     string output = "";
       //     for (int i = 0; i < ds.Tables[0].Rows.Count; ++i)
       //     {
       //         output += "<a class=\"dropdown-item type\" href=\"#\" runat=\"server\">" + ds.Tables[0].Rows[i][1].ToString() + "<span style=\"display:none\">" + ds.Tables[0].Rows[i][0].ToString() + "</span></a>";
       //     }
                
       //     db.closeConnect();

       //     return output;
       // }

       public string get_goods(int flag)
       {
           List<good> list = new List<good>();

           dbutils db = new dbutils();
           db.createConnect();

           //string search = input.Value;

           //获取选择的类型值

           //1、首先获取到按钮中的html文本，然后从中提取到类型的编号
           //string type = "";

           //type = Regex.Replace(type, @"[^0-9]+", "");
           //string sort = "";
           //sort = Regex.Replace(sort, @"[\r\n]+", "");
           //sort = sort.Trim();
          


           string output = "";
           string sql = "";
           if (flag == 1)  //表示页面第一次加载，查询所有的数据
           {
               sql = "SELECT g_id,g_name,g_price,g_image1,g_info from goods;";
           }
           else
           {
               string sort = this.DropDownList2.SelectedValue;
               string type = this.li_cer_type.SelectedValue;
               string search = this.input.Value;
               if (sort.Equals("销量"))
               {
                   sql = "SELECT goods.g_id,g_name,g_price,g_image1,g_info from goods,orderlist where orderlist.g_id = goods.g_id and t_id = '" + int.Parse(type) + "' and (g_name LIKE '%" + search + "%' OR g_info LIKE '%" + search + "%' ) order by o_num DESC;";
               }
               else if (sort.Equals("价格"))
               {
                   sql = "SELECT goods.g_id,g_name,g_price,g_image1,g_info from goods where t_id = '" + int.Parse(type) + "' and (g_name LIKE '%" + search + "%' OR g_info LIKE '%" + search + "%') order by g_price DESC;";
               }
               else
               {
                   sql = "SELECT g_id,g_name,g_price,g_image1,g_info from goods where t_id = '" + int.Parse(type) + "' and (g_name LIKE '%" + search + "%' OR g_info LIKE '%" + search + "%');";
               }

           }

           DataSet ds = db.executeQueue(sql);
           db.closeConnect();
           int f = 0;
           int num = ds.Tables[0].Rows.Count;

           for (int i = 0; i < num; ++i)
           {
               if (f % 4 == 0)
               {
                   output += " <div class=\"row p-2 rows\" >";
               }
               output += "<div class=\"col-sm-3 \"><div class=\"card post-slide\" \"><div class=\"post-img \" style=\"margin:0px;padding:0px;\"> <a  href=\"goodsdetail.aspx?g_id="+ ds.Tables[0].Rows[i][0].ToString() +"\"><img src=" + ds.Tables[0].Rows[i][3].ToString() + " class=\"card-img-top\" alt=\"\"/></a></div><div class=\"card-body\"> <p class=\"card-text\">" + ds.Tables[0].Rows[i][4].ToString() + "</p></div><div class=\"card-footer\"><a class=\"btn btn-light\"><small class=\"text-muted\"><strong>Price:$" + ds.Tables[0].Rows[i][2].ToString() + "</strong></small></a><button href=\"#\" class=\"btn btn-outline-info good\"><i class=\"fa fa-cart-arrow-down \" aria-hidden=\"true\"><span style=\"display:none\">" + ds.Tables[0].Rows[i][0].ToString() + "</span></i></button></div></div> </div>";
               if ((f + 1) % 4 == 0)
               {
                   output += "</div>";
               }
               f++;
               //list.Add(new good(ds.Tables[0].Rows[i][0].ToString(), ds.Tables[0].Rows[i][1].ToString(), double.Parse(ds.Tables[0].Rows[i][2].ToString()), ds.Tables[0].Rows[i][3].ToString(), ds.Tables[0].Rows[i][4].ToString()));
           }

           db.closeConnect();

           return output;
       }

        protected void submit_Click(object sender, EventArgs e)
        {
            string res = get_goods(0);
            product3.InnerHtml = res;
        }
    }
}