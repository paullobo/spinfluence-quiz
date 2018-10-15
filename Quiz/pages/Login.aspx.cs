using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["eid"] != null)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }


    [WebMethod(EnableSession = true)]
    public static string login(string user, string pass)
    {
        string message = "";


        try
        {
            DataTable dt = new clsLogin().login(user,pass).Tables[0];

            if (dt.Columns.Count > 1)
            {

                string eid = dt.Rows[0][1].ToString();
                message = dt.Rows[0][0].ToString();

                if (eid != "0")
                {
                    System.Web.HttpContext.Current.Session["user"] = user;
                    System.Web.HttpContext.Current.Session["eid"] = eid;
                }
            }
            else
            {
                message = dt.Rows[0][0].ToString();
            }


        }
        catch (Exception ex)
        {
            Custom.generatelog(null, null, "Login", ex.Message + ex.StackTrace);
            message = ex.Message + "|2";
        }

        return message;
    }


    [WebMethod(EnableSession = true)]
    public static string logout(string username)
    {
        string message = "logout";

        try
        {
            System.Web.HttpContext.Current.Session.Abandon();
            System.Web.HttpContext.Current.Session.Clear();
        }
        catch (Exception ex)
        {
            Custom.generatelog(null, null, "logout", ex.Message + ex.StackTrace);
            message = ex.Message + "|2";
        }

        return message;
    }

}