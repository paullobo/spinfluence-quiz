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
/// Summary description for clsConnection
/// </summary>
/// 

namespace GS_DAL
{ 
public class clsConnection
{ 
	public clsConnection()
	{
        
	
	}

    public static void handleConnection(MySqlConnection con,int state)
    {        
        if (state==1)
        {
            con.Close();
        }
        else { con.Open(); }
    }

    public static MySqlConnection getcon()
    {
            MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        return con;
    }
 
}
}