using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using shop.code;
using MySql.Data;

namespace shop
{
    public partial class mysqltest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            mysql_test m = new mysql_test();
            
           
            m.ID = "bluesky";
            m.passward = "123456";
            if (m.isLogin() == true)
            {

                Response.Write("<script>alert('登录成功');</script>");
            }
            else
            {
                //Response.Redirect("login.aspx");
                Response.Write("<script>alert('密码错误');</script>");
                return;
            }
        }
    }
}