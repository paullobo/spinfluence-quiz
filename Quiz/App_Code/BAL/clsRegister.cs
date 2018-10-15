using System;
using System.Collections.Generic;
using System.Web;
using GS_DAL;
using System.Data;
using System.Data.OleDb;
using System.IO;

/// <summary>
/// Summary description for clsRegister
/// </summary>
public class clsRegister
{
    clsCommonFunction cf = new clsCommonFunction();
    DataTable dsinput;
    DataSet ds, dsoutput;

    public clsRegister()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    public DataSet setStudent(string sname, string email, string gender, long contactno, string createddt)
    {
        dsinput = new DataTable();
        dsoutput = new DataSet();

        dsinput.Columns.Add("data");
        dsinput.Columns.Add("value");

        dsinput.Rows.Add("@sname", sname);
        dsinput.Rows.Add("@email", email);
        dsinput.Rows.Add("@gender", gender);
        dsinput.Rows.Add("@contactno", contactno);
        dsinput.Rows.Add("@createddt", createddt);

        dsoutput = cf.callProcedure("usp_setStudent", dsinput, 1);
        return dsoutput;
    }

}