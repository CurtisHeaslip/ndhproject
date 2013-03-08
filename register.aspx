<%@ Page Title="" Language="C#" MasterPageFile="~/adminPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="_register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_content" Runat="Server">

    <asp:CreateUserWizard ID="cuw_main" runat="server" ContinueDestinationPageUrl="~/login.aspx" />

</asp:Content>

