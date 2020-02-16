using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using shop.code;

namespace shop
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id, name, pwd, tel, email, addr;
            id = Request.Form["id"];
            name = Request.Form["name"];
            pwd = Request.Form["pwd"];
            tel = Request.Form["tel"];
            email = Request.Form["email"];
            addr = Request.Form["addr"];
            //Response.Write("true");

            dbutils db = new dbutils();
            db.createConnect();

            string sql = "insert into user (u_id,u_name ,u_password,u_tel,u_email,u_addr) values( '" + id + "','" + name + "','" + pwd + "','" + tel + "','" + email + "','" + addr + "') ;";
            int count = db.ExecuteNonQuery(sql);
            db.closeConnect();
            
            if (count == 1)
            {
                Response.Write("true");
            }
            else
            {
                Response.Write("false");
            }
        }
    }
}