using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using shop.code;
using System.Data;
using System.Text.RegularExpressions;
namespace shop
{
    public partial class showproducts : System.Web.UI.Page
    {
        public class good
        {
            public string id;
            public string name;
            public double price;
            public string image;
            public string info;

            public good(string id, string name, double price, string image,string info)
            {
                this.id = id;
                this.name = name;
                this.price = price;
                this.image = image;
                this.info = info;

            }
        }
        public class Student
        {
            public string Name;
            public int Age;
            public string Sex;


        }

        public string get_goods(int flag,string type,string sort,string search)
        {
            List<good> list = new List<good>();

            dbutils db = new dbutils();
            db.createConnect();

            

            //获取选择的类型值

            //1、首先获取到按钮中的html文本，然后从中提取到类型的编号
            
            type = Regex.Replace(type, @"[^0-9]+", "");
            
            sort = Regex.Replace(sort, @"[\r\n]+", "");
            sort = sort.Trim();

            string output = "";
            string sql = "";
            if (flag == 1)  //表示页面第一次加载，查询所有的数据
            {
                sql = "SELECT g_id,g_name,g_price,g_image1,g_info from goods;";
            }
            else
            {
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
                output += "<div class=\"col-sm-3 \"><div class=\"card post-slide\" \"><div class=\"post-img \" style=\"margin:0px;padding:0px;\"> <a  href=\"#\"><img src=" + ds.Tables[0].Rows[i][3].ToString() + " class=\"card-img-top\" alt=\"\"/></a></div><div class=\"card-body\"> <p class=\"card-text\">" + ds.Tables[0].Rows[i][4].ToString() + "</p></div><div class=\"card-footer\"><a class=\"btn btn-light\"><small class=\"text-muted\"><strong>Price:$" + ds.Tables[0].Rows[i][2].ToString() + "</strong></small></a><a href=\"#\" class=\"btn btn-outline-info\"><i class=\"fa fa-cart-arrow-down\" aria-hidden=\"true\"></i></a></div></div> </div>";
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
        protected void Page_Load(object sender, EventArgs e)
        {
            List<good> list = new List<good>();
            
            dbutils db = new dbutils();
            db.createConnect();
            
            string search = Request.Form["search"];
            
            string type = Request.Form["type"];
            string sort = Request.Form["sort"];

            string output = get_goods(0, type, sort, search);
            Response.Write(output);
           
        }


    }
}