using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using shop.code;
using System.Data;
using shop.pdl_bean;

namespace shop
{
    public partial class cart_delete : System.Web.UI.Page
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
            string sql = "DELETE FROM shoppingcart where sc_id = '"+ sc_id + "'";
            int res = db.ExecuteNonQuery(sql);
            db.closeConnect();

            if (res == 1)
            {
                //更新前端数据


                //Response.Write("true");
                Response.Redirect("shoppingcart2.aspx");
                return;
            }
            else
            {
                Response.Write("false");
                return;
            }
        }


    }
}