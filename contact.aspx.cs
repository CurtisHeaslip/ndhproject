using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    // Origin Map private property
    // Used to store the map data
    private string _origins;
    public string pp_mapOrigins
    {
        get { return _origins; }
        set { _origins = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // Change public proptery to desired string
            pp_mapOrigins = "'Mattice', 'Shannon Lake', 'Fushimi Lake Provincial Park'";
        }
    }


}