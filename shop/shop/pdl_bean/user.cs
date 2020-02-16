using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace shop.pdl_bean
{
    public class user
    {
        private string u_id;
        private string u_pwd;

        public user(string id,string pwd)
        {
            this.u_id = id;
            this.u_pwd = pwd;
        }
        public string U_ID
        {
            get { return this.u_id; }
            set { this.u_id = value; }
        }
        public string U_PWD
        {
            get { return this.u_pwd; }
            set { this.u_pwd = value; }
        }
    }
}