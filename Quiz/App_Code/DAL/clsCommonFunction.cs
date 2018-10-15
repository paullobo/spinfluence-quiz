using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

/// <summary>
/// Summary description for Testclass
/// </summary>
/// 
namespace GS_DAL
{
    public class clsCommonFunction  : clsVariables
    {
        MySqlCommand cmd1, cmd2;
        MySqlDataAdapter da;
        MySqlConnection con = new MySqlConnection();
        int i;
        public clsCommonFunction()
        {
            con = clsConnection.getcon();
        }


        public DataSet callProcedure(String procedure_name, DataTable dt, int executiontype)
        {
            DataSet newdata = new DataSet();
            
            String message = "";
            int count = 0;
            try
            {
                
                clsConnection.handleConnection(con,0);
                cmd2 = new MySqlCommand(procedure_name, con);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.CommandTimeout = 5000;
               
            
                
                foreach(DataRow dr in dt.Rows)
                {
                cmd2.Parameters.AddWithValue(dr[0].ToString(), dr[1].ToString().Trim());
                }             
                           

              
 
               
                
            last:
                message = "error";
                if (executiontype == 0)//returns no of rows affected
                {
                    newdata.Tables.Add("newdata");
                    newdata.Tables["newdata"].Columns.Add("data");
                    newdata.Tables["newdata"].Rows.Add(cmd2.ExecuteNonQuery().ToString());
                }
                else if (executiontype == 1)
                {
                    da = new MySqlDataAdapter(cmd2);
                    da.Fill(newdata);
                }
                else if (executiontype == 2)//returning single value 
                {
                    newdata.Tables.Add("newdata");
                    newdata.Tables["newdata"].Columns.Add("data");
                    newdata.Tables["newdata"].Rows.Add(cmd2.ExecuteScalar().ToString());
                }
                
            }
                
            catch (Exception ex)
            {
                Custom.generatelog(HttpContext.Current.Server.MapPath("../error/errorlog.txt"),DateTime.Now.ToShortDateString(),"callprocedure",ex.Message+ex.StackTrace);
                throw;
            }
            finally
            {

                clsConnection.handleConnection(con,1);

            }
            return newdata;
        }
 
    }
}