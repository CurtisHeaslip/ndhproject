using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _homenewsAdmin : System.Web.UI.Page
{
    newsLinqClass objLinq = new newsLinqClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        pnl_all.Visible = true;
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    private void _subRebind()
    {
        txt_titleI.Text = string.Empty;
        txt_main_textI.Text = string.Empty;
        txt_event_dateI.Text = string.Empty;
        rpt_all.DataSource = objLinq.getNews();
        rpt_all.DataBind();
        _panelControl(pnl_all);
    }

    private void _panelControl(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl_delete.Visible = false;
        pnl_update.Visible = false;
        pnl.Visible = true;
    }

    protected void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "News item " + str + " was successful";
            lbl_message.ForeColor = System.Drawing.ColorTranslator.FromHtml("Green");
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + " news item";
            lbl_message.ForeColor = System.Drawing.ColorTranslator.FromHtml("Red");
        }


    }

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(objLinq.commitInsert(txt_titleI.Text, txt_main_textI.Text, DateTime.Parse(txt_event_dateI.Text.ToString())), "insert");
                break;
            case "Update":
                _showUpdate(int.Parse(e.CommandArgument.ToString()));
                break;
            case "Delete":
                _showDelete(int.Parse(e.CommandArgument.ToString()));
                break;

        }

    }

    private void _showUpdate(int id)
    {
        _panelControl(pnl_update);
        rpt_update.DataSource = objLinq.getNewsByID(id);
        rpt_update.DataBind();

    }

    private void _showDelete(int id)
    {
        _panelControl(pnl_delete);
        rpt_delete.DataSource = objLinq.getNewsByID(id);
        rpt_delete.DataBind();

    }

    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtTitle = (TextBox)e.Item.FindControl("txt_titleU");
                TextBox txtMainText = (TextBox)e.Item.FindControl("txt_main_textU");
                TextBox txtEventDate = (TextBox)e.Item.FindControl("txt_event_dateU");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_id");
                int proID = int.Parse(hdfID.Value.ToString());
                _strMessage(objLinq.commitUpdate(proID, txtTitle.Text, txtMainText.Text, DateTime.Parse(txtEventDate.Text.ToString())), "update");
                _subRebind();
                break;
            case "Delete":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_id")).Value);
                _strMessage(objLinq.commitDelete(_id), "delete");
                _subRebind();
                break;
            case "Cancel":
                _panelControl(pnl_all);
                break;

        }

    }
}