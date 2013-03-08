using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _careersAdmin : System.Web.UI.Page
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
        txt_titleI.Text = string.Empty;
        txt_locationI.Text = string.Empty;
        txt_dateI.Text = string.Empty;
        txt_departmentI.Text = string.Empty;
        txt_shiftI.Text = string.Empty;
        txt_hoursI.Text = string.Empty;
        txt_descriptionI.Text = string.Empty;
        txt_wageI.Text = string.Empty;
        dtl_main.DataSource = objLinq.getPosting();
        dtl_main.DataBind();
        _panelControl(pnl_main);
    }

    private void _panelControl(Panel pnl)
    {
        pnl_main.Visible = false;
        pnl_delete.Visible = false;
        pnl_update.Visible = false;
        pnl.Visible = true;
    }

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(objLinq.commitInsert(txt_titleI.Text, txt_locationI.Text, txt_dateI.Text, txt_departmentI.Text, txt_shiftI.Text, txt_hoursI.Text, txt_description.Text, decimal.Parse(txt_wageI.Text.ToString())), "insert");
                _subRebind();
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
        careersLinqClass _linq = new careersLinqClass();
        dtl_update.DataSource = _linq.getPosting(id);
        dtl_update.DataBind();
    }

    private void _showDelete(int id)
    {
        _panelControl(pnl_delete);
        dtl_delete.DataSource = objLinq.getPosting(id);
        dtl_delete.DataBind();
    }

    protected void subUpDel(object sender, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtTitle = (TextBox)e.Item.FindControl("txt_titleU");
                TextBox txtLocation = (TextBox)e.Item.FindControl("txt_locationU");
                TextBox txtDate = (TextBox)e.Item.FindControl("txt_dateU");
                TextBox txtDepartment = (TextBox)e.Item.FindControl("txt_departmentU");
                TextBox txtShift = (TextBox)e.Item.FindControl("txt_shiftU");
                TextBox txtHours = (TextBox)e.Item.FindControl("txt_hoursU");
                TextBox txtDescription = (TextBox)e.Item.FindControl("txt_descriptionU");
                TextBox txtWage = (TextBox)e.Item.FindControl("txt_wageU");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_id");
                int postID = int.Parse(hdfID.Value.ToString());
                _strMessage(objLinq.commitUpdate(postID, txtTitle.Text, txtLocation.Text, txtDate.Text, txtDepartment.Text, txtShift.Text, txtHours.Text, txtDescription.Text, decimal.Parse(txtWage.Text.ToString())), "update");
                _subRebind();
                break;
            case "Delete":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_id")).Value);
                _strMessage(objLinq.commitDelete(_id), "delete");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "Item " + str + " was successful";
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + " product";
        }
    }
}