<%@ Page Title="" Language="C#" MasterPageFile="~/homePage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_index" %>

<asp:Content ID="cnt_head" runat="server" ContentPlaceHolderID="cph_head">

</asp:Content>

<%--This is another comment test for github --%>
<%-- booyah! it worked --%>
<%-- this is an example of a change  --%>

<asp:Content ID="cnt_hero" ContentPlaceHolderID="cph_hero" runat="server">
    <div id="heroUnitWrapper">
            <div id="heroUnit">
                <div id="welcomeMessageWrapper">
                    <div id="welcomeMessage">
                        <asp:Label ID="lbl_welcome" runat="server" Text="Welcome to Notre Dame Hospital" />
                    </div>
                </div><%-- /end welcomeMessageWrapper --%>

                <div id="donateMessage">
                    <h2><asp:Label ID="lbl_donate" runat="server" Text="Help Make a Difference" /></h2>
                    <asp:HyperLink ID="lnk_donate" runat="server" Text="Donate Today" NavigateUrl="#donate" />
                </div>
            </div><%-- /end heroUnit --%>
        </div><%-- /end heroUnitWrapper --%>
</asp:Content>

<asp:Content ID="cnt_primary" ContentPlaceHolderID="cph_primary" runat="server">
    <div class="contentSectionID">
                    <h3>News & Events</h3>
                </div> <%-- /end contentSectionID --%>
  
        <div class="contentSection">
        <asp:ListView runat="server" ID="lsv_index" >
            <ItemTemplate>
             <asp:Label ID="lbl_date" runat="server" Text='<%#Eval("event_date") %>' CssClass="contentDate" /><br />
             <asp:Label ID="lbl_title" runat="server" Text='<%#Eval("title") %>' CssClass="contentTitle" /><br />
            <asp:Label ID="lbl_main_text" runat="server" Text='<%#Eval("main_text") %>'  /><br /><br />
            </ItemTemplate>
        </asp:ListView>
            </div><%--/end contentSection --%>
                
</asp:Content>

<asp:Content ID="cnt_secondary" ContentPlaceHolderID="cph_secondary" runat="server">
    
                <div class="secondaryContentWrapper">
                    <div class="secondarySectionID">
                        <span class="secondaryTitle">Volunteer</span>
                    </div>
                    <div class="secondaryContentContent">
                        <p>Notre Dame volunteers are renowned in the hospital for the valuable contributions they make every day.</p>

                        <span class="secondaryLink"><a href="#volunteer">Volunteer Today</a></span>
                    </div>
                </div>
                <%-- /end secondary widget--%>

                <div class="secondaryContentWrapper">
                    <div class="secondarySectionID">
                        <span class="secondaryTitle">Quick Links</span>
                    </div>
                    <div class="secondaryContent">
                        <span class="secondaryLink"><a href="#volunteer">Patient & Visitor Information</a></span>
                        <span class="secondaryLink"><a href="#volunteer">Contact the Hospital</a></span>
                        <span class="secondaryLink"><a href="#volunteer">Our Services</a></span>
                    </div>
                </div>
                <%-- /end secondary widget--%>

                <div class="secondaryContentWrapper">
                    <div class="secondarySectionID">
                        <span class="secondaryTitle">Accessibility Tools</span>
                    </div>
                    <div class="secondaryContent">
                        <p>Notre-Dame is committed to making our facilities and medical services accessible, creating a welcoming environment for all.</p>

                        <span class="secondaryLink"><a href="#volunteer">Click here for additional info</a></span>
                    </div>
                </div>
                <%-- /end secondary widget--%>
</asp:Content>
