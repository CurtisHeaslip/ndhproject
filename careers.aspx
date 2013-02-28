<%@ Page Title="Careers Page" Language="C#" MasterPageFile="~/contentPage.master" AutoEventWireup="true" CodeFile="careers.aspx.cs" Inherits="careers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_hero_content" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_primary_content" Runat="Server">
    <asp:Label ID="lbl_careers" runat="server" Text="Job Opportunities at Notre-Dame Hearst" />
    <!--filters job postings-->
    <asp:Panel ID="pnl_filter" runat="server">
        <asp:Label ID="lbl_filter" runat="server" Text="Filter Careers By: " />
        <asp:Label ID="lbl_date" runat="server" Text="Date Posted" />
        <asp:DropDownList ID="ddl_date" runat="server">
            <asp:ListItem>Most Recent</asp:ListItem>
            <asp:ListItem>Least Recent</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lbl_wage" runat="server" Text="Salary" />
        <asp:DropDownList ID="ddl_wage" runat="server">
            <asp:ListItem>Highest to Lowest</asp:ListItem>
            <asp:ListItem>Lowest to Highest</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lbl_shift" runat="server" Text="Shift" />
        <asp:DropDownList ID="ddl_shift" runat="server">
            <asp:ListItem>Days</asp:ListItem>
            <asp:ListItem>Evenings</asp:ListItem>
            <asp:ListItem>Mixed</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btn_filter" runat="server" Text="Filter" />
    </asp:Panel>

    <!--displays job postings from database-->
    <asp:Panel ID="pnl_careers" runat="server">
        <asp:Repeater ID="rpt_careers" runat="server">
            <ItemTemplate>
                <table>
                    <tr>
                        <td><%#Eval("title") %></td>
                    </tr>
                    <tr>
                        <td><%#Eval("location") %></td>
                    </tr>
                    <tr>
                        <td><%#Eval("date") %></td>
                    </tr>
                    <tr>
                        <td><%#Eval("shift") %></td>
                    </tr>
                    <tr>
                        <td><%#Eval("hours") %></td>
                    </tr>
                    <!--<tr>
                        <td><asp:LinkButton ID="btn_apply" runat="server" Text="Apply" /></td>
                        <td><asp:LinkButton ID="btn_save" runat="server" Text="Save" /></td>
                    </tr>-->
                </table>
            </ItemTemplate>
        </asp:Repeater>
    </asp:Panel>
   
    <!--upload resumes in ms document format to database (in progress)-->
    <!--<asp:Panel ID="pnl_resumeUpload" runat="server">
        <asp:FileUpload ID="resumeUpload" runat="server" />
        <asp:Button ID="btn_upload" runat="server" Text="Upload" OnClick="subResumeUpload" />
        <br /><br />
        <asp:Label ID="lbl_uploadStatus" runat="server" Text="Upload Status" />
    </asp:Panel>-->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_secondary" Runat="Server">
</asp:Content>

