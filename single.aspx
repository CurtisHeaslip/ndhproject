<%@ Page Title="" Language="C#" MasterPageFile="~/contentPage.master" AutoEventWireup="true" CodeFile="single.aspx.cs" Inherits="_Default" %>

<asp:Content ID="cnt_head" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>

<asp:Content ID="cnt_hero_content" ContentPlaceHolderID="cph_hero_content" Runat="Server">
    <h1><asp:Label ID="lbl_contentHeader" runat="server" Text="Building Stronger Communities" /></h1>
    <h2><asp:Label ID="lbl_contentSubHeader" runat="server" Text="Striving to bring out the best in each other" /></h2>
</asp:Content>

<asp:Content ID="cnt_primary_content" ContentPlaceHolderID="cph_primary_content" Runat="Server">

    <div class="contentSectionContent">
        <h1>This is an example of a change</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elit ipsum, hendrerit iaculis varius ac, facilisis et nisi. Duis posuere adipiscing libero vitae condimentum. Aenean ut massa velit, id tempus urna. Praesent lacus mi, pellentesque non convallis et, commodo eu justo. Nullam commodo rhoncus pellentesque. Sed consectetur volutpat venenatis. Nulla placerat congue ligula, id pharetra enim ultricies non. Quisque et risus sem, vitae vulputate felis. Nam ut ipsum at tortor feugiat consequat. Mauris pellentesque, nibh id dictum porttitor, nisl eros scelerisque velit, a volutpat nunc libero varius nibh. Suspendisse potenti. Nam faucibus felis in mi ultricies ullamcorper.</p>

        <p>Fusce porttitor hendrerit arcu sed dictum. Duis vel mauris sed purus elementum tempus a id lacus. Curabitur mollis dui quis dui ultrices vestibulum sed in diam. Phasellus eu sem nec dolor dictum aliquet sit amet a purus. Duis egestas iaculis varius. Proin ipsum massa, lobortis in gravida sit amet, scelerisque vestibulum velit. Nam vel sem congue risus dictum auctor nec ac velit. In adipiscing tempus purus at facilisis.</p>
    </div><%--/end contentSection --%>
</asp:Content>

<asp:Content ID="cnt_secondary_content" ContentPlaceHolderID="cph_secondary" Runat="Server">
    <div class="secondaryContentWrapperContent">
        <div class="secondarySectionID">
            <span class="secondaryTitle">Volunteer</span>
        </div>
        <div class="secondaryContent">
            <p>Notre Dame volunteers are renowned in the hospital for the valuable contributions they make every day.</p>

            <span class="secondaryLink"><a href="#volunteer">Volunteer Today</a></span>
        </div>
    </div>
    <%-- /end secondary widget--%>
</asp:Content>

