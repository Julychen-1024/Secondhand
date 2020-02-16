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
    public partial class addCart_pdl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dbutils db = new dbutils();
            db.createConnect();
            string g_id = Request.Form["g_id"];
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
            string sql = "insert into shoppingcart(sc_num,u_id,g_id) values(1,'" + u_id + "','" + int.Parse(g_id.Trim()) + "')";
            int res = db.ExecuteNonQuery(sql);
            db.closeConnect();

            if (res == 1)
            {
                Response.Write("true");
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