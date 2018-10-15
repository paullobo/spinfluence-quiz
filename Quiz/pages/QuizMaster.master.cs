using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_QuizMaster : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("Register.aspx");
        }
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
