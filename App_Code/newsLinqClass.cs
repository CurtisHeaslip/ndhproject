using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class newsLinqClass
{
    //method to select all the homenews
    public IQueryable<homenew> getNews()
    {
        ndhDataContext objNews = new ndhDataContext();
        //creating an anonymous variable with its value being the instance of our LINQ object
        var allhomenews = objNews.homenews.Select(x => x);//method syntax
        return allhomenews;
    }

    //method to find a particular homenew
    public IQueryable<homenew> getNewsByID(int _id)
    {
        ndhDataContext objNews = new ndhDataContext();
        var homenewID = objNews.homenews.Where(x => x.news_id == _id).Select(x => x);
        return homenewID;
    }

    //method that commits an insert to the table
    public bool commitInsert(string _title, string _main_text, DateTime _event_date )
    {
        ndhDataContext objNews = new ndhDataContext();
        //to ensure all data will be disposed when finished
        using (objNews)
        {
            homenew objNewsItem = new homenew();
            objNewsItem.title = _title;
            objNewsItem.main_text = _main_text;
            objNewsItem.event_date = _event_date;
            objNews.homenews.InsertOnSubmit(objNewsItem);
            objNews.SubmitChanges();
            return true;
        }
    }

    //method to commit an update to a table
    public bool commitUpdate(int _id, string _title, string _main_text, DateTime _event_date)
    {
        ndhDataContext objNews = new ndhDataContext();
        using (objNews)
        {
            var objNewsUpdate = objNews.homenews.Single(x => x.news_id == _id);
            objNewsUpdate.title = _title;
            objNewsUpdate.main_text = _main_text;
            //objNewsUpdate.date = _date;
            objNewsUpdate.event_date = _event_date;
            objNews.SubmitChanges();
            return true;
        }
    }

    //method to commit a delete to a table
    public bool commitDelete(int _id)
    {
        ndhDataContext objNews = new ndhDataContext();
        using (objNews)
        {
            var objNewsDelete = objNews.homenews.Single(x => x.news_id == _id);
            objNews.homenews.DeleteOnSubmit(objNewsDelete);
            objNews.SubmitChanges();
            return true;
        }
    }
}