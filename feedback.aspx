<%@ Page Title="" Language="C#" MasterPageFile="~/contentPage.master" AutoEventWireup="true" CodeFile="feedback.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_hero_content" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_primary_content" Runat="Server">
    <asp:Label ID="fb_header" runat="server" Text="Feedback" />
    <br />
    <asp:Label ID="fb_subHead" runat="server" Text="We Welcome All of Your Comments and Suggestions" />
    <p>You can contact us about environmental health and facility licensing issues using this feedback form. An environmental health officer or licensing officer will respond to you within a few business days. We will make every effort to keep your identity as a complainant confidential. Please discuss any confidentiality issues with us when we contact you. </p>
    <asp:Panel ID="fb_panel" runat="server" >
        <asp:Label ID="fb_commentType" runat="server" Text="What kind of comment would you like to send?" Font-Bold="true" />
        <br />
        <asp:RadioButtonList ID="fb_radio" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem Value="1" Selected="True">Complaint</asp:ListItem>
            <asp:ListItem Value="2">Problem</asp:ListItem>
            <asp:ListItem Value="3">Suggestions</asp:ListItem>
            <asp:ListItem Value="4">Praise</asp:ListItem>
        </asp:RadioButtonList>
        <asp:Label ID="fb_selectTopic" runat="server" Text="Select a Topic" Font-Bold="true" />
        <asp:DropDownList ID="fb_ddl" runat="server">
            <asp:ListItem Selected="True" Value="1">Select One</asp:ListItem>
            <asp:ListItem Value="2">Air Quality</asp:ListItem>
            <asp:ListItem Value="3">Food Safety</asp:ListItem>
            <asp:ListItem Value="4">Garbage/Sanitation</asp:ListItem>
            <asp:ListItem Value="5">Licensing/Child Care</asp:ListItem>
            <asp:ListItem Value="6">Licensing/Residential Care</asp:ListItem>
            <asp:ListItem Value="7">Noise</asp:ListItem>
            <asp:ListItem Value="8">Pest Management</asp:ListItem>
            <asp:ListItem Value="9">Smoking</asp:ListItem>
            <asp:ListItem Value="10">Employee</asp:ListItem>
            <asp:ListItem Value="11">Organization</asp:ListItem>
            <asp:ListItem Value="12">Service</asp:ListItem>
            <asp:ListItem Value="13">(Other)</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="fb_selectOther" runat="server" Text="Other: " AssociatedControlID="txt_other" />
        <asp:TextBox ID="txt_other" runat="server" />
        <br />
        <asp:Label ID="fb_specific" runat="server" Text="If your feedback is about a specific business or incident, please include the following: " Font-Bold="true" />
        <asp:Label ID="fb_business" runat="server" Text="Name of business: " />
        <asp:TextBox ID="txt_business" runat="server" />
        <br />
        <asp:Label ID="fb_address" runat="server" Text="Address: " />
        <asp:TextBox ID="txt_address" runat="server" />
        <br />
        <asp:Label ID="fb_date" runat="server" Text="Date of Incident: " />
        <asp:TextBox ID="txt_date" runat="server" />
        <br />
        <asp:Label ID="fb_comment" runat="server" Text="Enter your comments:" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_comment" runat="server" TextMode="MultiLine" Rows="5" Columns="50" />
        <asp:RequiredFieldValidator ID="rfv_comment" runat="server" Text="*Required Field" ControlToValidate="txt_comment" />
        <br />
        <asp:Label ID="fb_contact" runat="server" Text="How can we reach you?" Font-Bold="true" />
        <br />
        <asp:Label ID="fb_contactName" runat="server" Text="Full Name " />
        <asp:TextBox ID="txt_contactName" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_contactName" runat="server" Text="*Required Field" ControlToValidate="txt_contactName" />
        <br />
        <asp:Label ID="fb_contactEmail" runat="server" Text="Email " />
        <asp:TextBox ID="txt_contactEmail" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_contactEmail" runat="server" Text="*Required Field" ControlToValidate="txt_contactEmail" />
        <br />
        <asp:Label ID="fb_contactPhone" runat="server" Text="Phone " />
        <asp:TextBox ID="txt_contactPhone" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_contactPhone" runat="server" Text="*Required Field" ControlToValidate="txt_contactPhone" />
        <br />
        <asp:Label ID="fb_contactFax" runat="server" Text="Fax " />
        <asp:TextBox ID="txt_contactFax" runat="server" />
        <br />
        <asp:Button ID="fb_submitButton" runat="server" Text="Submit" />
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_secondary" Runat="Server">
</asp:Content>

