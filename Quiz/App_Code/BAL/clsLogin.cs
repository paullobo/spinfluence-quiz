using System;
using System.Collections.Generic;
using System.Web;
using GS_DAL;
using System.Data;
using System.Data.OleDb;
using System.IO;

/// <summary>
/// Summary description for clsLogin
/// </summary>
public class clsLogin
{
    clsCommonFunction cf = new clsCommonFunction();
    DataTable dsinput;
    DataSet ds, dsoutput;

    public clsLogin()
    {
        //
        // TODO: Add constructor logic here
        //
    }



    public DataSet login(string user, string pass)
    {
        dsinput = new DataTable();
        dsoutput = new DataSet();

        dsinput.Columns.Add("data");
        dsinput.Columns.Add("value");

        dsinput.Rows.Add("@user", user);
        dsinput.Rows.Add("@pass", pass);


        dsoutput = cf.callProcedure("usp_Login", dsinput, 1);
        return dsoutput;
    }



}