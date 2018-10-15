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
        if (Session["username"] == null)
        {
            Response.Redirect("Register.aspx");
        }
    }


    [WebMethod]
    public static List<tbl_quesmaster> getQuestions(string user)
    {
        string message = "";
        List<tbl_quesmaster> data_str1 = new List<tbl_quesmaster>();


        try
        {

            DataTable dt = new clsQuiz().getQuestions().Tables[0];

            tbl_quesmaster tbl_row;
            foreach (DataRow dr in dt.Rows)
            {
                tbl_row = new tbl_quesmaster();

                tbl_row.qid = Convert.ToInt32(dr["qid"]);
                tbl_row.title = Convert.ToString(dr["title"]);
                tbl_row.ques = Convert.ToString(dr["ques"]);
                tbl_row.active = Convert.ToBoolean(dr["active"]);
             
                tbl_row.createdby = Convert.ToString(dr["createdby"]);
                tbl_row.createddt = Convert.ToString(dr["createddt"]);
                tbl_row.modifiedby = Convert.ToString(dr["modifiedby"]);
                tbl_row.modifieddt = Convert.ToString(dr["modifieddt"]);



                data_str1.Add(tbl_row);
            }


            message = "";

        }
        catch (Exception ex)
        {
            Custom.generatelog(null, null, "get questions", ex.Message + ex.StackTrace);
            message = ex.Message + "|2";
        }

        return data_str1;
    }


    [WebMethod]
    public static List<tbl_ansmaster> getAnswers(string user)
    {
        string message = "";
        List<tbl_ansmaster> data_str1 = new List<tbl_ansmaster>();


        try
        {

            DataTable dt = new clsQuiz().getAnswers().Tables[0];

            tbl_ansmaster tbl_row;
            foreach (DataRow dr in dt.Rows)
            {
                tbl_row = new tbl_ansmaster();

                tbl_row.aid = Convert.ToInt32(dr["aid"]);
                tbl_row.qid = Convert.ToInt32(dr["qid"]);
                tbl_row.title = Convert.ToString(dr["title"]);
                tbl_row.ans = Convert.ToString(dr["ans"]);
                //tbl_row.correct = Convert.ToBoolean(dr["correct"]);

                tbl_row.createdby = Convert.ToString(dr["createdby"]);
                tbl_row.createddt = Convert.ToString(dr["createddt"]);
                tbl_row.modifiedby = Convert.ToString(dr["modifiedby"]);
                tbl_row.modifieddt = Convert.ToString(dr["modifieddt"]);



                data_str1.Add(tbl_row);
            }


            message = "";

        }
        catch (Exception ex)
        {
            Custom.generatelog(null, null, "get answers", ex.Message + ex.StackTrace);
            message = ex.Message + "|2";
        }

        return data_str1;
    }


    [WebMethod(EnableSession = true)]
    public static string submit(List<tbl_userans> tbl_ua)
    {

        foreach(var ua in tbl_ua)
        {
            ua.createddt = Convert.ToDateTime(ua.createddt).ToString("yyyy-MM-dd HH:mm:ss");
        }
       
       

        string message = "";

        var sid = Convert.ToInt32(System.Web.HttpContext.Current.Session["uid"]);
        try
        {
            foreach(var ua in tbl_ua)
            {
                DataTable dt = new clsQuiz().submit(0,sid,ua.qid,ua.aid,ua.createddt).Tables[0];
                message = dt.Rows[0][0].ToString();
            }
    
  
        }
        catch (Exception ex)
        {
            Custom.generatelog(null, null, "submit", ex.Message + ex.StackTrace);
            message = ex.Message + "|2";
        }

        return message;
    }


    [WebMethod]
    public static List<tbl_results> getResults()
    {
        string message = "";
        List<tbl_results> data_str1 = new List<tbl_results>();

        var sid = Convert.ToInt32(System.Web.HttpContext.Current.Session["uid"]);
        try
        {

            DataTable dt = new clsQuiz().getResults(sid).Tables[0];

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
            Custom.generatelog(null, null, "get result", ex.Message + ex.StackTrace);
            message = ex.Message + "|2";
        }

        return data_str1;
    }

}