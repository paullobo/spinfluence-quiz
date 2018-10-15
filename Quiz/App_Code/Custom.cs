using GS_DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;



using System.Net.Mail;
using System.Collections;

using System.Diagnostics;
/// <summary>
/// Summary description for Custom
/// </summary>
public class Custom
{
    public Custom()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static bool generatelog(string path, string dates, string location, string msg)
    {

        if (path == null) path = HttpContext.Current.Server.MapPath("../error/errorlog.txt");
        if (dates == null) dates = DateTime.Now.ToString();
        string err;
        err = Environment.NewLine + "-------------------------------------------------" + Environment.NewLine;
        err += "DateTime: " + dates + Environment.NewLine;
        err += "Error Location: " + location + Environment.NewLine;
        err += "Error Msg: " + msg + Environment.NewLine;
        err += "-------------------------------------------------" + Environment.NewLine;

        try
        {
            File.AppendAllText(path, err);
            return true;
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    public static string updateToDatabase(object obj, string type, string table, string user,string primary_id)
    {
        string message = "", query = "", autoid = "", columns = "";
        try
        {
            if (type == "insert")
            {
                foreach (var prop in obj.GetType().GetProperties())
                {

                    if (prop.Name != primary_id)
                    {
                        switch (prop.GetType().Name)
                        {
                            case "Int32":
                            case "Decimal":
                                query += prop.GetValue(obj, null) == null ? "NULL," : prop.GetValue(obj, null).ToString() + ",";
                                break;
                            default:
                                query += prop.GetValue(obj, null) == null ? "NULL," : "'" + prop.GetValue(obj, null).ToString().Replace("'", "''") + "',";
                                break;
                        }

                        columns += prop.Name + ",";
                    }


                }
                query = query.TrimEnd(',');
                columns = columns.TrimEnd(',');
                //make query
                query = "insert into " + table + " (" + columns + ") values (" + query + ")";
                query = query.Replace(",''", ",NULL");
                query = query.Replace("'',", "NULL,");

                //add to database
                DataTable dtinput = new DataTable();
                DataSet dsoutput = new DataSet();

                dtinput.Columns.Add("data");
                dtinput.Columns.Add("value");
                dtinput.Rows.Add("@user", user);
                dtinput.Rows.Add("@data_str", query);

                dsoutput = new clsCommonFunction().callProcedure("usp_insert_data", dtinput, 1);
                message = "0|Success|"+dsoutput.Tables[0].Rows[0][0].ToString();
            }
            else if (type == "update")
            {
                foreach (var prop in obj.GetType().GetProperties())
                {

                    if (prop.Name != primary_id)
                    {
                        switch (prop.GetType().Name)
                        {
                            case "Int32":
                            case "Decimal":
                                query += prop.GetValue(obj, null) == null ? prop.Name + "=NULL," : prop.Name + "=" + prop.GetValue(obj, null).ToString() + ",";
                                break;
                            default:
                                query += prop.GetValue(obj, null) == null ? prop.Name + "=NULL," : prop.Name + "='" + prop.GetValue(obj, null).ToString().Replace("'", "''") + "',";
                                break;
                        }
                    }
                    else if (prop.Name == primary_id) { autoid = prop.GetValue(obj, null).ToString(); }

                }
                query = query.TrimEnd(',');
                //make query
                query = "update " + table + " set " + query + " where "+primary_id+"=" + autoid;
                query = query.Replace("=''", "=NULL");

                //add to database
                DataTable dtinput = new DataTable();
                DataSet dsoutput = new DataSet();

                dtinput.Columns.Add("data");
                dtinput.Columns.Add("value");
                dtinput.Rows.Add("@user", user);
                dtinput.Rows.Add("@data_str", query);

                dsoutput = new clsCommonFunction().callProcedure("usp_insert_data", dtinput, 1);
                message = "0|Success|" + dsoutput.Tables[0].Rows[0][0].ToString();
            }
        }
        catch (Exception ex)
        {

            generatelog(null, null, "updateToDatabase", ex.Message + ex.StackTrace + "(" + query + "-" + columns + ")");
            message = ex.Message+"|2" ;
        }
        return message;

    }

    

}