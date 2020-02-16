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
    
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dbutils db = new dbutils();
            db.createConnect();
            string id = Request.Form["u_id"];
            string pwd = Request.Form["u_pwd"];
            int flag = int.Parse(Request.Form["flag"]);
            if (flag == 1)
            {
                string sql = "select COUNT(*) from user WHERE user.u_id =  '" + id + "' and user.u_password = '" + pwd + "';";
                DataSet ds = db.executeQueue(sql);
                db.closeConnect();
                int count = int.Parse(ds.Tables[0].Rows[0][0].ToString());
                if (count == 1)
                {
                    //Session.Add("user", new user(id, pwd));  //登录成功以后将用户信息保存在Session中
                    Session["user"] = new user(id, pwd);
                    Session["u_id"] = id;
                    Response.Write("true");
                }
                else
                {
                    Response.Write("false");
                }
            }
            else
            {
                Session.Remove("user");//退出以后将user从session中移除
                Response.Write("true");
            }
            
        }
        [WebMethod]//静态+WebMethod
        public static string register(string id,string name,string pwd,string tel,string email,string addr)
        {

            string u_id = id;

            return "true";
        }
    }
}