using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["eid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    [WebMethod]
    public static List<tbl_students> getStudents(string user)
    {
        string message = "";
        List<tbl_students> data_str1 = new List<tbl_students>();


        try
        {

            DataTable dt = new clsDashboard().getStudents().Tables[0];

            tbl_students tbl_row;
            foreach (DataRow dr in dt.Rows)
            {
                tbl_row = new tbl_students();

                tbl_row.sid = Convert.ToInt32(dr["sid"]);
                tbl_row.sname = Convert.ToString(dr["sname"]);
                tbl_row.email = Convert.ToString(dr["email"]);
                tbl_row.gender = Convert.ToBoolean(dr["gender"]);

                tbl_row.contactno = Convert.ToInt64(dr["contactno"]);

                tbl_row.createddt = Convert.ToString(dr["createddt"]);


                data_str1.Add(tbl_row);
            }


            message = "";

        }
        catch (Exception ex)
        {
            Custom.generatelog(null, null, "get students", ex.Message + ex.StackTrace);
            message = ex.Message + "|2";
        }

        return data_str1;
    }



    [WebMethod]
    public static List<tbl_results> getResults()
    {
        string message = "";
        List<tbl_results> data_str1 = new List<tbl_results>();

       
        try
        {

            DataTable dt = new clsDashboard().getResults().Tables[0];

            tbl_results tbl_row;
            foreach (DataRow dr in dt.Rows)
            {
                tbl_row = new tbl_results();

                tbl_row.uaid = Convert.ToInt32(dr["uaid"]);
                tbl_row.sid = Convert.ToInt32(dr["sid"]);

                tbl_row.qid = Convert.ToInt32(dr["qid"]);
                tbl_row.titleq = Convert.ToString(dr["titleq"]);
                tbl_row.ques = Convert.ToString(dr["ques"]);

                tbl_row.aid = Convert.ToInt32(dr["aid"]);
                tbl_row.titlea = Convert.ToString(dr["titlea"]);
                tbl_row.ans = Convert.ToString(dr["ans"]);

                tbl_row.correct = Convert.ToBoolean(dr["correct"]);

                tbl_row.createddt = Convert.ToString(dr["createddt"]);


                data_str1.Add(tbl_row);
            }

        }
        catch (Exception ex)
        {
            Custom.generatelog(null, null, "get results", ex.Message + ex.StackTrace);
            message = ex.Message + "|2";
        }

        return data_str1;
    }

}