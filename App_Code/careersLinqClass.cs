using System;
using System.Collections.Generic;
using System.Linq; 
using System.Web;

public class careersLinqClass
{
    DataClassesDataContext objDataClassesDC = new DataClassesDataContext();

    public IQueryable<ndhCareer> getPosting()
    {
        DataClassesDataContext objDataClassesDC = new DataClassesDataContext();
        //var allPostings = from x in objDataClassesDC.ndhCareers select x;
        var allPostings = objDataClassesDC.ndhCareers.Select(x => x); //method syntax
        return allPostings;
    }

    public IQueryable<ndhCareer> getPostingByID(int _id)
    {
        DataClassesDataContext objDataClassesDC = new DataClassesDataContext();

        var postingID = objDataClassesDC.ndhCareers.Where(x => x.id == _id).Select(x => x);
        return postingID;
    }
    
    //inserts new career posting
    public bool commitInsert(string _title, string _location, DateTime _date, string _dept, string _shift, string _hours, string _desc, string _wage)
    {
        DataClassesDataContext objDataClassesDC = new DataClassesDataContext();
        using (objDataClassesDC)
        {
            ndhCareer objNewPost = new ndhCareer();
            objNewPost.title = _title;
            objNewPost.location = _location;
            objNewPost.date = _date;
            objNewPost.department = _dept;
            objNewPost.shift = _shift;
            objNewPost.hours = _hours;
            objNewPost.description = _desc;
            objNewPost.wage = _wage;
            //insert command
            objDataClassesDC.ndhCareers.InsertOnSubmit(objNewPost);
            //commits insert against database
            objDataClassesDC.SubmitChanges();
            return true;
        }
    }

    //updates existing career posting
    public bool commitUpdate(int _id, string _title, string _location, DateTime _date, string _dept, string _shift, string _hours, string _desc, string _wage)
    {
        DataClassesDataContext objDataClassesDC = new DataClassesDataContext();
        using (objDataClassesDC)
        {
            //update command
            ndhCareer objUpdPost = objDataClassesDC.ndhCareers.Single(x => x.id == _id);
            objUpdPost.title = _title;
            objUpdPost.location = _location;
            objUpdPost.date = _date;
            objUpdPost.department = _dept;
            objUpdPost.shift = _shift;
            objUpdPost.hours = _hours;
            objUpdPost.description = _desc;
            objUpdPost.wage = _wage;
            //commit update against database
            objDataClassesDC.SubmitChanges();
            return true;
        }
    }

    //deletes existing career posting
    public bool commitDelete(int _id)
    {
        DataClassesDataContext objDataClassesDC = new DataClassesDataContext();
        using (objDataClassesDC)
        {
            var objDelPost = objDataClassesDC.ndhCareers.Single(x => x.id == _id);
            //delete command
            objDataClassesDC.ndhCareers.DeleteOnSubmit(objDelPost);
            //commit delete against database
            objDataClassesDC.SubmitChanges();
            return true; 
        }
    }
}