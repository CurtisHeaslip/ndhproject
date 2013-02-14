<%@ Page Title="" Language="C#" MasterPageFile="~/homePage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>

<asp:Content ID="cnt_head" runat="server" ContentPlaceHolderID="cph_head">

</asp:Content>



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
                    <span class="contentDate">January 23, 2013</span>
                    <h2 class="contentTitle">Lorem ipsum dolor sit amet, consectetur adipiscing elit</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elit ipsum, hendrerit iaculis varius ac, facilisis et nisi. Duis posuere adipiscing libero vitae condimentum. Aenean ut massa velit, id tempus urna. Praesent lacus mi, pellentesque non convallis et, commodo eu justo. Nullam commodo rhoncus pellentesque. Sed consectetur volutpat venenatis. Nulla placerat congue ligula, id pharetra enim ultricies non. Quisque et risus sem, vitae vulputate felis. Nam ut ipsum at tortor feugiat consequat. Mauris pellentesque, nibh id dictum porttitor, nisl eros scelerisque velit, a volutpat nunc libero varius nibh. Suspendisse potenti. Nam faucibus felis in mi ultricies ullamcorper.</p>

                    <p>Fusce porttitor hendrerit arcu sed dictum. Duis vel mauris sed purus elementum tempus a id lacus. Curabitur mollis dui quis dui ultrices vestibulum sed in diam. Phasellus eu sem nec dolor dictum aliquet sit amet a purus. Duis egestas iaculis varius. Proin ipsum massa, lobortis in gravida sit amet, scelerisque vestibulum velit. Nam vel sem congue risus dictum auctor nec ac velit. In adipiscing tempus purus at facilisis.</p>
                </div><%--/end contentSection --%>
</asp:Content>

<asp:Content ID="cnt_secondary" ContentPlaceHolderID="cph_secondary" runat="server">
    
                <div class="secondaryContentWrapper">
                    <div class="secondarySectionID">
                        <span class="secondaryTitle">Volunteer</span>
                    </div>
                    <div class="secondaryContent">
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
