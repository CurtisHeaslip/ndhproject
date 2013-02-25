<%@ Page Title="" Language="C#" MasterPageFile="~/singlePage.master" AutoEventWireup="true" CodeFile="singleMike.cs" Inherits="_singleMike" %>

<asp:Content ID="cnt_hero" ContentPlaceHolderID="cph_hero" runat="server">
     <h1><asp:Label ID="lbl_contentHeader" runat="server" Text="Building Stronger Communities" /></h1>
    <h2><asp:Label ID="lbl_contentSubHeader" runat="server" Text="Striving to bring out the best in each other" /></h2><%--this is a comment --%>
</asp:Content>


<asp:Content ID="cnt_primary_title" ContentPlaceHolderID="cph_primary_title" runat="server">
    <h1>This is an example of a change</h1>
</asp:Content>

<%-- Add content controls here --%>
<asp:Content ID="cnt_primary_content" ContentPlaceHolderID="cph_primary_content" Runat="Server">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elit ipsum, hendrerit iaculis varius ac, facilisis et nisi. Duis posuere adipiscing libero vitae condimentum. Aenean ut massa velit, id tempus urna. Praesent lacus mi, pellentesque non convallis et, commodo eu justo. Nullam commodo rhoncus pellentesque. Sed consectetur volutpat venenatis. Nulla placerat congue ligula, id pharetra enim ultricies non. Quisque et risus sem, vitae vulputate felis. Nam ut ipsum at tortor feugiat consequat. Mauris pellentesque, nibh id dictum porttitor, nisl eros scelerisque velit, a volutpat nunc libero varius nibh. Suspendisse potenti. Nam faucibus felis in mi ultricies ullamcorper.</p>

        <p>Fusce porttitor hendrerit arcu sed dictum. Duis vel mauris sed purus elementum tempus a id lacus. Curabitur mollis dui quis dui ultrices vestibulum sed in diam. Phasellus eu sem nec dolor dictum aliquet sit amet a purus. Duis egestas iaculis varius. Proin ipsum massa, lobortis in gravida sit amet, scelerisque vestibulum velit. Nam vel sem congue risus dictum auctor nec ac velit. In adipiscing tempus purus at facilisis.</p>

</asp:Content>

<asp:Content ID="cnt_secondary_title" runat="server" ContentPlaceHolderID="cph_secondary_title">
    Volunteer
</asp:Content>

<asp:Content ID="cnt_secondary_content" runat="server" ContentPlaceHolderID="cph_secondary_content">
    <p>Notre Dame volunteers are renowned in the hospital for the valuable contributions they make every day.</p>

            <span class="secondaryLink"><a href="#volunteer">Volunteer Today</a></span>

</asp:Content>
