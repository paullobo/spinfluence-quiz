using System;
using System.Collections.Generic;
using System.Web;
using GS_DAL;
using System.Data;
using System.Data.OleDb;
using System.IO;

/// <summary>
/// Summary description for clsQuiz
/// </summary>
public class clsQuiz
{
    clsCommonFunction cf = new clsCommonFunction();
    DataTable dsinput;
    DataSet ds, dsoutput;

    public clsQuiz()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    public DataSet getQuestions()
    {
        dsinput = new DataTable();
        dsoutput = new DataSet();

        dsinput.Columns.Add("data");
        dsinput.Columns.Add("value");

        dsoutput = cf.callProcedure("usp_getQuestions", dsinput, 1);
        return dsoutput;
    }

    public DataSet getAnswers()
    {
        dsinput = new DataTable();
        dsoutput = new DataSet();

        dsinput.Columns.Add("data");
        dsinput.Columns.Add("value");

        dsoutput = cf.callProcedure("usp_getAnswers", dsinput, 1);
        return dsoutput;
    }


    public DataSet setStudent(string sname, string email, bool gender, string createddt)
    {
        dsinput = new DataTable();
        dsoutput = new DataSet();

        dsinput.Columns.Add("data");
        dsinput.Columns.Add("value");

        dsinput.Rows.Add("@sname", sname);
        dsinput.Rows.Add("@email", email);
        dsinput.Rows.Add("@gender", gender);
        dsinput.Rows.Add("@createddt", createddt);

        dsoutput = cf.callProcedure("usp_setStudent", dsinput, 1);
        return dsoutput;
    }

    public DataSet submit(int uaid, int sid, int qid, int aid, string createddt)
    {
        dsinput = new DataTable();
        dsoutput = new DataSet();

        dsinput.Columns.Add("data");
        dsinput.Columns.Add("value");

        dsinput.Rows.Add("@uaid", uaid);
        dsinput.Rows.Add("@sid", sid);
        dsinput.Rows.Add("@qid", qid);
        dsinput.Rows.Add("@aid", aid);
        dsinput.Rows.Add("@createddt", createddt);

        dsoutput = cf.callProcedure("usp_submitAns", dsinput, 1);
        return dsoutput;
    }


    public DataSet getResults(int sid)
    {
        dsinput = new DataTable();
        dsoutput = new DataSet();

        dsinput.Columns.Add("data");
        dsinput.Columns.Add("value");

        dsinput.Rows.Add("@sid", sid);


        dsoutput = cf.callProcedure("usp_getResult", dsinput, 1);
        return dsoutput;
    }

}