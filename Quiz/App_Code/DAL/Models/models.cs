using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for models
/// </summary>


public class tbl_students
{
    public tbl_students() { }

    public int sid { get; set; }
    public string sname { get; set; }
    public string email { get; set; }
    public bool gender { get; set; }
    public long contactno { get; set; }
    public string createddt { get; set; }
}


public class tbl_quesmaster
{
    public tbl_quesmaster() { }

    public int qid { get; set; }
    public string title { get; set; }
    public string ques { get; set; }
    public bool active { get; set; }
    public string createdby { get; set; }
    public string createddt { get; set; }
    public string modifiedby { get; set; }
    public string modifieddt { get; set; }
}


public class tbl_ansmaster
{
    public tbl_ansmaster() { }

    public int aid { get; set; }
    public int qid { get; set; }
    public string title { get; set; }
    public string ans { get; set; }
    public bool correct { get; set; }
    public string createdby { get; set; }
    public string createddt { get; set; }
    public string modifiedby { get; set; }
    public string modifieddt { get; set; }

}

public class tbl_userans
{
    public tbl_userans() { }

    public int uaid { get; set; }
    public int sid { get; set; }
    public int qid { get; set; }
    public int aid { get; set; }
    public string createddt { get; set; }

}



public class tbl_results
{
    public tbl_results() { }

    public int uaid { get; set; }
    public int sid { get; set; }

    public string titleq { get; set; }
    public int qid { get; set; }
    public string ques { get; set; }

    public string titlea { get; set; }
    public int aid { get; set; }
    public string ans { get; set; }

    public bool correct { get; set; }

    public string createddt { get; set; }

}


