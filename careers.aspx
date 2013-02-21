<%@ Page Title="Careers Page" Language="C#" MasterPageFile="~/contentPage.master" AutoEventWireup="true" CodeFile="careers.cs" Inherits="careers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_hero_content" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_primary_content" Runat="Server">
    <asp:Label ID="lbl_careers" runat="server" Text="Job Opportunities at Notre-Dame Hearst" />
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
                    <tr>
                        <td><asp:LinkButton ID="btn_apply" runat="server" Text="Apply" /></td>
                        <td><asp:LinkButton ID="btn_save" runat="server" Text="Save" /></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:Repeater>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_secondary" Runat="Server">
</asp:Content>

