using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using GS_DAL;
using System.IO;
using System.Data.OleDb;
using System.Globalization;




/// <summary>
/// Summary description for Class1
/// </summary>
public class common
{
    public common()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static string redirectIP = ConfigurationManager.AppSettings["redirectIP"].ToString();


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

    public static string ConvertTabletoJson(DataTable dt)
    {

        string jsonstr = "";

        foreach (DataRow dr in dt.Rows)
        {
            jsonstr += "{";
            foreach (DataColumn dc in dt.Columns)
            {
                switch (dr[dc].GetType().Name)
                {
                    case "Int32":
                    case "Decimal":
                        jsonstr += "\"" + dc.ColumnName + "\":" + dr[dc].ToString() + ",";
                        break;
                    default:
                        jsonstr += "\"" + dc.ColumnName + "\":\"" + dr[dc].ToString().Replace("\"", "%22") + "\",";
                        break;
                }
            }
            jsonstr = jsonstr.TrimEnd(',') + "},";
        }
        jsonstr = "[" + jsonstr.TrimEnd(',') + "]";
        return jsonstr;
    }

    public static string convertJavascriptDate(string date)
    {
        if (date.Length >= 15)
        {
            date = DateTime.ParseExact(date.Substring(0, 15), "ddd MMM d yyyy", CultureInfo.InvariantCulture).ToString("d MMM yyyy");
        }
        return date;
    }


    public static string updateToDatabase(object obj, string type, string table, string user)
    {
        string message = "", query = "", autoid = "", columns = "";
        try
        {
            if (type == "insert")
            {
                foreach (var prop in obj.GetType().GetProperties())
                {

                    if (prop.Name != "autoid")
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
                message = "0|Success";
            }
            else if (type == "update")
            {
                foreach (var prop in obj.GetType().GetProperties())
                {

                    if (prop.Name != "autoid")
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
                    else if (prop.Name == "autoid") { autoid = prop.GetValue(obj, null).ToString(); }

                }
                query = query.TrimEnd(',');
                //make query
                query = "update " + table + " set " + query + " where autoid=" + autoid;
                query = query.Replace("=''", "=NULL");

                //add to database
                DataTable dtinput = new DataTable();
                DataSet dsoutput = new DataSet();

                dtinput.Columns.Add("data");
                dtinput.Columns.Add("value");
                dtinput.Rows.Add("@user", user);
                dtinput.Rows.Add("@data_str", query);

                dsoutput = new clsCommonFunction().callProcedure("usp_insert_data", dtinput, 1);
                message = "0|Success";
            }
        }
        catch (Exception ex)
        {

            generatelog(null, null, "updateToDatabase", ex.Message + ex.StackTrace + "(" + query + "-" + columns + ")");
            message = ex.Message + "|2";
        }
        return message;

    }

    public static string ConvertString(object obj)
    {
        return obj.ToString();
    }

    public static Int32 ConvertInt(object obj)
    {
        Int32 num;
        if (obj.ToString() == "")
        { num = 0; }
        else { num = Convert.ToInt32(obj); }

        return num;
    }

  
    
}


