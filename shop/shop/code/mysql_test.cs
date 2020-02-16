using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using shop.code;
using System.Data;

namespace shop.code
{
    public class mysql_test
    {
            private string id;
            private string pwd;

            public string ID
            {
                get { return this.id; }
                set { this.id = value; }
            }
            public string passward
            {
                get { return this.pwd; }
                set { this.pwd = value; }
            }

            public bool isLogin()
            {
                dbutils db = new dbutils();
                db.createConnect();
                string sql = "select COUNT(*) from user WHERE user.u_id =  '"+this.id +"' and user.u_password = '" + this.pwd + "';";
                DataSet ds = db.executeQueue(sql);
                db.closeConnect();
                int count = int.Parse(ds.Tables[0].Rows[0][0].ToString());
                if (count == 1)
                {

                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
    
}