using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Net.Mail; // imported
using System.Net; // imported

public class contactClass
{
    // Origin Map private property
    private string _origins;
    public string pp_mapOrigins
    {
        get { return _origins; }
        set { _origins = value; }
    }
}

// ================================================================
/*
 * Email Class
 * 
 * Instantiate this class to use the gmail emailer for Nortre Dame 
 * Hospital
 * 
 */

public class emailClass
{
    public bool sendEmail()
    {
        MailMessage objMail = new MailMessage("neilff@gmail.com", "hospitalnotredame@gmail.com", "Email Subject", "Email Body");
        NetworkCredential objNC = new NetworkCredential("hospitalnotredame@gmail.com", "Notred@me5");
        SmtpClient objSMTP = new SmtpClient("smtp.gmail.com", 587); // for gmail
        
        using(objSMTP)
        {
            objSMTP.EnableSsl = true;
            objSMTP.Credentials = objNC;
            objSMTP.Send(objMail);
            return true;
        }
    }

    // (string _conName, string _conEmail, string _conReason, string _conMessage) mail data types

}

// ================================================================
/*
 * Contact LINQ Class
 * 
 * Only required Insert and Delete, as there is no need to 
 * update a users submitted email and will not be selecting 
 * by id, instead listing all info
 * 
 */

public class contactLinqClass
{
    // method to select all
    public IQueryable<contact> getContacts()
    {
        ndhDataContext objContact = new ndhDataContext();
        var allcontact = objContact.contacts.Select(x => x); // method syntax
        return allcontact;
    }

    // method that performs insert
    public bool commitInsert(string _conName, string _conEmail, string _conReason, string _conMessage)
    {
        ndhDataContext objContact = new ndhDataContext();
        using (objContact)
        {
            contact objContactNew = new contact();
            objContactNew.contactName = _conName;
            objContactNew.contactEmail = _conEmail;
            objContactNew.contactReason = _conReason;
            objContactNew.contactMessage = _conMessage;
            objContact.contacts.InsertOnSubmit(objContactNew);
            objContact.SubmitChanges();
            return true;
        }
    }

    // method that performs delete
    public bool commitDelete(int _id)
    {
        ndhDataContext objContact = new ndhDataContext();
        using (objContact)
        {
            var objContactDelete = objContact.contacts.Single(x => x.id == _id);
            objContact.contacts.DeleteOnSubmit(objContactDelete);
            objContact.SubmitChanges();
            return true;
        }
    }
}