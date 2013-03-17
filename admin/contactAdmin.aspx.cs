using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{
    contactLinqClass objLinq = new contactLinqClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    private void _subRebind()
    {
        lv_contact.DataSource = objLinq.getContacts();
        lv_contact.DataBind();
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_conMessage.Text = "<span style='color: green;'>Product " + str + " was successful</span>";
        }
        else
        {
            lbl_conMessage.Text = "<span style='color: red;'>Product " + str + " was not successful</span>";
        }
    }

    protected void subAdmin(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "subDelete":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_contactId")).Value);
                _strMessage(objLinq.commitDelete(_id), "delete");
                _subRebind();

                break;
        }
    }
}