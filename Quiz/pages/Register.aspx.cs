using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            Response.Redirect("Quiz.aspx");
        }
    }

    [WebMethod(EnableSession = true)]
    public static string register(string sname, string email, bool gen, long contactno, string createddt)
    {
        string message = "";
        var gender = ( gen ? "1" : "0");
        contactno = Convert.ToInt64(contactno);
        createddt = Convert.ToDateTime(createddt).ToString("yyyy-MM-dd HH:mm:ss");

        try
        {
            DataTable dt = new clsRegister().setStudent(sname, email, gender, contactno, createddt).Tables[0];

            if (dt.Columns.Count > 1)
            {

                string uid = dt.Rows[0][1].ToString();
                message = dt.Rows[0][0].ToString();

                if (uid != "0")
                {
                    System.Web.HttpContext.Current.Session["username"] = sname;
                    System.Web.HttpContext.Current.Session["uid"] = uid;
                }
            }
            else
            {
                message = dt.Rows[0][0].ToString();
            }


        }
        catch (Exception ex)
        {
            Custom.generatelog(null, null, "Register", ex.Message + ex.StackTrace);
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