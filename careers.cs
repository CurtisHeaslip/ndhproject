using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class careers : System.Web.UI.Page
{
    careersLinqClass objLinq = new careersLinqClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    private void _subRebind()
    {
        rpt_careers.DataSource = objLinq.getPosting();
        rpt_careers.DataBind();
    }

  
}