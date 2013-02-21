<%@ Page Title="" Language="C#" MasterPageFile="~/adminPage.master" AutoEventWireup="true" CodeFile="login.cs" Inherits="_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_content" Runat="Server">

    <asp:Login ID="lgn_main" runat="server" DestinationPageUrl="~/admin/admin.aspx" CreateUserUrl="~/register.aspx" CreateUserText="Register" />

</asp:Content>

