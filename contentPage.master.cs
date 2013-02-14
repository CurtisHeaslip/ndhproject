using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contentPage : System.Web.UI.MasterPage
{

    // Exposing the _title property
    private string _title = "Notre-Dame Hospital - Hearst, Ontario, Canada";

    public string pp_masterTitle
    {
        get { return _title; }
        set { _title = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
}
