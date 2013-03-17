using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail; // imported

public partial class _Default : System.Web.UI.Page
{

    contactLinqClass objLinq = new contactLinqClass();
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

    // submit data to server
    protected void subClick(object sender, EventArgs e)
    {
        _strMessage(objEmail.sendEmail());
    }

    // ================================================================
    /*
     * Contact Submit
     * 
     * The next few subroutines will handle the form data. Using LINQ
     * it will be sent to the DB. We will prevent the user from resubmitting
     * the form after completion by creating a cookie. It will take one of 
     * two forms, success or fail. If success, it will provide user with 
     * a positive message, if fail, it will provide user with a message
     * asking to try again later. The cookies will be removed on browser
     * close.
     * 
     */

    //// submit data to server
    //protected void subClick(object sender, EventArgs e)
    //{
    //    _strMessage(objLinq.commitInsert(txt_name.Text, txt_email.Text, ddl_concern.SelectedValue.ToString(), txt_message.Text));
                
    //    // force postback, this fixes error with google map not reloading after data submit
    //    Response.Redirect("contact.aspx");
    //}

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