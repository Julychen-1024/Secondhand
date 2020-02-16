using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;

namespace shop.code
{
    public class dbutils
    {
        /*
         * 声明连接数据库的信息 
         */
        private static string connstr = System.Configuration.ConfigurationManager.AppSettings["connectionstring"];
        private MySqlConnection con = null;
        private MySqlCommand cmd = null;

        public static MySqlConnection get_connection()
        {
            MySqlConnection con = new MySqlConnection(connstr);
            return con;
        }
        /*
         * 创建连接函数
         */
        public void  createConnect()
        {
            this.con = new MySqlConnection(connstr);
            try
            {
                con.Open();
            }
            catch (Exception ex)
            {
                
                return;//连接打开出现异常
            }
        }
        /*
         * 执行无参数的查询语句
         */
        public DataSet executeQueue(String sql)
        {
            MySqlDataAdapter myadapter = new MySqlDataAdapter(sql, this.con);
            DataSet select = new DataSet();
            int suc_count = myadapter.Fill(select);
            if (select != null) 
            { 
                return select; 
            }
            else 
            {
                return null;
            }     
        }
        /*
         * 执行带参数的sql语句
         */
        public DataTable ExecuteQuery(string cmdText, MySqlParameter[] paras)
        {
            DataTable dt = new DataTable();
            cmd = new MySqlCommand(cmdText, this.con);
            cmd.Parameters.AddRange(paras);

            MySqlDataAdapter myadapter = new MySqlDataAdapter(cmd);
            int count = myadapter.Fill(dt);
            if(dt != null)
            {
                return dt;
            }
            else
            {
                return null;
            }
        }
        /*
         * 执行非查询语句
         */
        public int ExecuteNonQuery(string cmdText)
        {
            int res;
            try
            {
                cmd = new MySqlCommand(cmdText,this.con);
                res = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
            return res;
        }
        /*
         * 执行带参数的非查询语句
         */
        public int ExecuteNonQuery(string cmdText, MySqlParameter[] paras)
        {
            int res;
            using (cmd = new MySqlCommand(cmdText,this.con))
            {
                cmd.Parameters.AddRange(paras);
                res = cmd.ExecuteNonQuery();
            }
            return res;
        }
        /*
         * 关闭连接
         */
        public void closeConnect()
        {
            this.con.Close();
        }
    }
}