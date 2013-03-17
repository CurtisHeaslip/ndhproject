using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{
    mapLinqClass objLinq = new mapLinqClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    private void _subRebind()
    {
        txt_originI.Text = string.Empty;

        lv_map.DataSource = objLinq.getLocations();
        lv_map.DataBind();
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "<span style='color: green;'>Origin " + str + " was successful</span>";
        }
        else
        {
            lbl_message.Text = "<span style='color: red;'>Origin " + str + " was not successful</span>";
        }
    }

    protected void subInsert(object sender, EventArgs e)
    {
        _strMessage(objLinq.commitInsert(txt_originI.Text), "insert");
        _subRebind();
    }

    protected void subAdmin(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "subDelete":
                int _id = int.Parse(((Label)e.Item.FindControl("lbl_originId")).Text);
                _strMessage(objLinq.commitDelete(_id), "delete");
                _subRebind();

                break;

            case "subUpdate":
                Label txtId = (Label)e.Item.FindControl("lbl_originId");
                TextBox txtOrigin = (TextBox)e.Item.FindControl("txt_origin");
                int oriID = int.Parse(txtId.Text.ToString());

                _strMessage(objLinq.commitUpdate(oriID, txtOrigin.Text), "update");
                _subRebind();

                break;
        }
    }
}