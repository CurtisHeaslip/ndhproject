using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail; // imported

public partial class _Default : System.Web.UI.Page
{
    emailClass objEmail = new emailClass();

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
        
        // Check to see if user has submitted data already
        if (Request.Cookies["contactSuccess"] != null)
        {
            pnl_contact.Visible = false;
            ctt_subtitle.Text = "Thank you for contacting us, we will get you back as soon as possible. Have a great day.";
        }

        if (Request.Cookies["contactFail"] != null)
        {
            pnl_contact.Visible = false;
            ctt_subtitle.Text = "We are currently experiencing technical difficulties, please try again later. Thank you.";
        }
    }


    // ================================================================
    /*
     * Contact Submit
     * 
     * subClick is responsible for using the email class to send an
     * email to the NDH gmail account (can easily be changed later). If the
     * email is successful, then a cookie is created that will inform the user
     * their message was sent. If it fails, a cookie is sent saying the 
     * system is currently experiencing difficulties. Cookies are
     * erased on browser close.
     * 
     */

    protected void subClick(object sender, EventArgs e)
    {
        _strMessage(objEmail.sendEmail(txt_name.Text, txt_email.Text, ddl_concern.SelectedValue.ToString(), txt_message.Text));
        Response.Redirect("contact.aspx"); // force refresh to use cookie that is created
    }

    private void _strMessage(bool flag)
    {
        if (flag)
        {
            // create success cookie
            Response.Cookies["contactSuccess"]["Name"] = txt_name.Text.ToString(); // The cookie value will be taken from the name text box
        }
        else
        {
            // create fail cookie
            Response.Cookies["contactFail"]["Name"] = txt_name.Text.ToString(); // The cookie value will be taken from the name text box
        }
    }
}