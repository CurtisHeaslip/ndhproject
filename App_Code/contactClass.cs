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
    public bool sendEmail(string _conName, string _conEmail, string _conReason, string _conMessage)
    {
        string _fullMessage = "From: " + _conName + " (" + _conEmail + ")" + "<br />Message Body: " + _conMessage; 
        MailMessage objMail = new MailMessage(_conEmail, "hospitalnotredame@gmail.com", _conReason, _fullMessage);
        NetworkCredential objNC = new NetworkCredential("hospitalnotredame@gmail.com", "Notred@me5");
        SmtpClient objSMTP = new SmtpClient("smtp.gmail.com", 587); // for gmail
        
        using(objSMTP)
        {
            objMail.IsBodyHtml = true; // allows use of html in body
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
 * Map LINQ Class
 * 
 * Produces the origins for the map sidebar
 * 
 */

public class mapLinqClass
{
    // method to select all
    public IQueryable<mapMatrix> getLocations()
    {
        ndhDataContext objMap = new ndhDataContext();
        var allLocations = objMap.mapMatrixes.Select(x => x); // method syntax
        return allLocations;
    }

    // method that performs insert
    public bool commitInsert(string _origin)
    {
        ndhDataContext objMap = new ndhDataContext();
        using (objMap)
        {
            mapMatrix objMapNew = new mapMatrix();
            objMapNew.origin = _origin;
            objMap.mapMatrixes.InsertOnSubmit(objMapNew);
            objMap.SubmitChanges();
            return true;
        }
    }

    // method that performs update
    public bool commitUpdate(int _id, string _origin) // perform update
    {
        ndhDataContext objMap = new ndhDataContext();

        using (objMap)
        {
            var objUpMap = objMap.mapMatrixes.Single(x => x.id == _id); // perform update where id = x

            objUpMap.origin = _origin; // gather fields

            objMap.SubmitChanges(); // commit changes
            return true;
        }
    }

    // method that performs delete
    public bool commitDelete(int _id)
    {
        ndhDataContext objMap = new ndhDataContext();
        using (objMap)
        {
            var objMapDelete = objMap.mapMatrixes.Single(x => x.id == _id);
            objMap.mapMatrixes.DeleteOnSubmit(objMapDelete);
            objMap.SubmitChanges();
            return true;
        }
    }
}