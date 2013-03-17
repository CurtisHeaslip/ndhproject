<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="contactAdmin.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="cnt_head" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="cnt_content" ContentPlaceHolderID="con_content" runat="Server">
    <h1>Contact Page Administration</h1>
    <asp:Label ID="lbl_message" runat="server" />
    <div class="contactFormResponses">
        <div class="page-header">
            <h3>Map Origins <small>Manage the origins displayed within the interactive map</small></h3>
        </div>

        <div class="well">
            <h4><asp:Label ID="lbl_insert" runat="server" Text="Insert New Origin" /></h4>
            
            <asp:Label ID="lbl_originI" runat="server" Text="New Origin: " />
            <asp:TextBox ID="txt_originI" runat="server" />
            <p><asp:Button ID="btn_insert" runat="server" Text="Insert" OnClick="subInsert" /></p>
        </div>

        <hr />

        <asp:ListView ID="lv_map" runat="server" OnItemCommand="subAdmin">
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Origin</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                    </tbody>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="lbl_originId" runat="server" Text='<%#Eval("id") %>' /></td>
                    <td>
                        <asp:TextBox ID="txt_origin" runat="server" Text='<%#Eval("origin") %>' CssClass="input-xxlarge" /></td>
                    <td>
                        <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="subUpdate" /></td>
                    <td>
                        <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="subDelete" OnClientClick="return confirm('Are you sure you wish to delete?');" /></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

