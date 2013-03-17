<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="contactAdmin.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="cnt_head" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="cnt_content" ContentPlaceHolderID="con_content" Runat="Server">
    <h1>Contact Page Administration</h1>
    <asp:Label ID="lbl_conMessage" runat="server" />
    <div class="contactFormResponses">
        <div class="page-header">
            <h3>Contact Form <small>Manage user submitted responses</small></h3>
        </div>
        <asp:ListView ID="lv_contact" runat="server" OnItemCommand="subAdmin">
            <LayoutTemplate>
                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
            </LayoutTemplate>
            <ItemTemplate>
                    <div class="well span8">
                        <asp:HiddenField ID="hdf_contactId" runat="server" Value='<%#Eval("id") %>' />
                        <p>From: <asp:Label ID="lbl_conName" runat="server" text='<%#Eval("contactName") %>' /> (<asp:Label ID="lbl_conEmail" runat="server" Text='<%#Eval("contactEmail") %>' />)</p>
                        <p>Subject: <asp:Label ID="lbl_conReason" runat="server" Text='<%#Eval("contactReason") %>' /></p>
                        <p>Message:</p>
                        <p><asp:Label ID="lbl_conMessage" runat="server" Text='<%#Eval("contactMessage") %>' /></p>
                        <hr />
                            <asp:Button ID="btn_reply" runat="server" Text="Reply to Message" />
                            <asp:Button ID="btn_delete" runat="server" Text="Delete Message" CommandName="subDelete" />
                    </div>            
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

