using System;
using System.Collections.Generic;
using System.Web;
using GS_DAL;
using System.Data;
using System.Data.OleDb;
using System.IO;

/// <summary>
/// Summary description for clsDashboard
/// </summary>
public class clsDashboard
{
    clsCommonFunction cf = new clsCommonFunction();
    DataTable dsinput;
    DataSet ds, dsoutput;

    public clsDashboard()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    public DataSet getStudents()
    {
        dsinput = new DataTable();
        dsoutput = new DataSet();

        dsinput.Columns.Add("data");
        dsinput.Columns.Add("value");

        dsoutput = cf.callProcedure("usp_getStudents", dsinput, 1);
        return dsoutput;
    }


    public DataSet getResults()
    {
        dsinput = new DataTable();
        dsoutput = new DataSet();

        dsinput.Columns.Add("data");
        dsinput.Columns.Add("value");


        dsoutput = cf.callProcedure("usp_getResults", dsinput, 1);
        return dsoutput;
    }


}