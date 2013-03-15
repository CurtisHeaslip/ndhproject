using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _index : System.Web.UI.Page
{

    newsLinqClass objLinq = new newsLinqClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    private void _subRebind()
    {
        lsv_index.DataSource = objLinq.getNews();
        lsv_index.DataBind();
    }
}