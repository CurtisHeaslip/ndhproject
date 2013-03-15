<%@ Page Title="" Language="C#" MasterPageFile="~/adminPage.master" AutoEventWireup="true" CodeFile="homenewsAdmin.aspx.cs" Inherits="_homenewsAdmin" %>

<asp:Content ID="homenewsAdminContent" ContentPlaceHolderID="cph_content" runat="Server">

    <AJAX:ToolkitScriptManager ID="tsm_main" runat="server" />
    <AJAX:CalendarExtender ID="cae_insert" runat="server" TargetControlID="txt_event_dateI" />

    <asp:Label ID="lbl_message" runat="server" />
    <br />
    <asp:Label ID="lbl_titleI" runat="server" Text="Insert title:" Font-Bold="true" AssociatedControlID="txt_titleI" />
    <asp:TextBox ID="txt_titleI" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_titleI" runat="server" Text="*Required" ControlToValidate="txt_titleI" ValidationGroup="insert" />
    <br />
    <asp:Label ID="lbl_main_textI" runat="server" Text="Main Text:" AssociatedControlID="txt_main_textI" />
    <asp:TextBox ID="txt_main_textI" runat="server" TextMode="MultiLine" />
    <asp:RequiredFieldValidator ID="rfv_main_textI" runat="server" Text="*Required" ControlToValidate="txt_main_textI" ValidationGroup="insert" />
    <br />
    <asp:Label ID="lbl_event_dateI" runat="server" Text="Event Date:" AssociatedControlID="txt_event_dateI" />
    <asp:TextBox ID="txt_event_dateI" runat="server" />

    <asp:RequiredFieldValidator ID="rfv_event_dateI" runat="server" Text="*Required" ControlToValidate="txt_event_dateI" ValidationGroup="insert" />
    <br />
    <asp:Button ID="btn_insert" runat="server" Text="Insert" CommandName="Insert" OnCommand="subAdmin" ValidationGroup="insert" />
    <br />
    <br />
    <%-- The All Panel --%>
    <asp:Panel ID="pnl_all" runat="server" GroupingText="All Products">
        <table>
            <thead>
                <tr>
                    <th>News Title</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpt_all" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("title") %></td>
                            <td>
                                <asp:LinkButton ID="btn_update" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Eval("news_id") %>' OnCommand="subAdmin" /></td>
                            <td>
                                <asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("news_id") %>' OnCommand="subAdmin" /></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </asp:Panel>

    <asp:Panel ID="pnl_update" runat="server" GroupingText="Update Product">
        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Main Text</th>
                    <th>Event Date</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpt_update" runat="server" OnItemCommand="subUpDel">
                    <ItemTemplate>
                        <tr>
                            <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("news_id") %>' />
                            <td>
                                <asp:TextBox ID="txt_titleU" runat="server" Text='<%#Eval("title") %>' /></td>
                            <td>
                                <asp:TextBox ID="txt_main_textU" runat="server" Text='<%#Eval("main_text") %>' /></td>
                            <td>
                                <asp:TextBox ID="txt_event_dateU" runat="server" Text='<%#Eval("event_date") %>' /></td>
                            <AJAX:CalendarExtender ID="cae_update" runat="server" TargetControlID="txt_event_dateU" />
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btn_doUpdate" runat="server" Text="Update" CommandName="Update" /></td>
                            <td>
                                <asp:Button ID="btn_Cancel" Text="Cancel" runat="server" CommandName="Cancel" CausesValidation="false" /></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnl_delete" runat="server" GroupingText="Delete Product">
        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Main Text</th>
                    <th>Event Date</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpt_delete" runat="server" OnItemCommand="subUpDel">
                    <ItemTemplate>
                        <tr>
                            <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("news_id") %>' />
                            <td><asp:Label ID="lbl_titleD" runat="server" Text='<%#Eval("title") %>' /></td>
                            <td><asp:Label ID="lbl_main_textD" runat="server" Text='<%#Eval("main_text") %>' /></td>
                            <td><asp:Label ID="lbl_event_dateD" runat="server" Text='<%#Eval("event_date") %>' /></td>
                            <td><asp:Button ID="btn_doDelete" runat="server" Text="Delete" CommandName="Delete" />
                            <asp:Button ID="btn_doCancel" runat="server" Text="Cancel" CommandName="Cancel" /></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </asp:Panel>


</asp:Content>

