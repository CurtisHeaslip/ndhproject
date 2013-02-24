<%@ Page Title="" Language="C#" MasterPageFile="~/adminPage.master" AutoEventWireup="true" CodeFile="careersAdmin.cs" Inherits="_careersAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_content" Runat="Server">
    <asp:Label ID="lbl_insert" runat="server" Text="Create a New Job Posting:" Font-Bold="true" />
        <br /><br />

        <!--insert job posting information into database-->
        <asp:Label ID="lbl_titleI" runat="server" Text="Title" AssociatedControlID="txt_titleI" />
        <br />
        <asp:TextBox ID="txt_titleI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_titleI" runat="server" Text="*required" ControlToValidate="txt_titleI" ValidationGroup="insert" />
        <br /><br />
        <asp:Label ID="lbl_locationI" runat="server" Text="Location" AssociatedControlID="txt_locationI" />
        <br />
        <asp:TextBox ID="txt_locationI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_locationI" runat="server" Text="*required" ControlToValidate="txt_locationI" ValidationGroup="insert" />
        <br /><br />
        <asp:Label ID="lbl_dateI" runat="server" Text="Date" AssociatedControlID="txt_dateI" />
        <br />
        <asp:TextBox ID="txt_dateI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_dateI" runat="server" Text="*required" ControlToValidate="txt_dateI" ValidationGroup="insert" Display="Dynamic" />
        <br /><br />
        <asp:Label ID="lbl_department" runat="server" Text="Department" AssociatedControlID="txt_departmentI" />
        <br />
        <asp:TextBox ID="txt_departmentI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_departmentI" runat="server" Text="*required" ControlToValidate="txt_departmentI" ValidationGroup="insert" Display="Dynamic" />
        <br /><br />
        <br /><br />
        <asp:Label ID="lbl_shiftI" runat="server" Text="Shift" AssociatedControlID="txt_shiftI" />
        <br />
        <asp:TextBox ID="txt_shiftI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_shiftI" runat="server" Text="*required" ControlToValidate="txt_shiftI" ValidationGroup="insert" Display="Dynamic" />
        <br /><br />
        <asp:Label ID="lbl_hoursI" runat="server" Text="Hours" AssociatedControlID="txt_hoursI" />
        <br />
        <asp:TextBox ID="txt_hoursI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_hoursI" runat="server" Text="*required" ControlToValidate="txt_hoursI" ValidationGroup="insert" Display="Dynamic" />
        <br /><br />
        <asp:Label ID="lbl_descriptionI" runat="server" Text="Description" AssociatedControlID="txt_descriptionI" />
        <br />
        <asp:TextBox ID="txt_descriptionI" runat="server" TextMode="MultiLine" />
        <asp:RequiredFieldValidator ID="rfv_descriptionI" runat="server" Text="*required" ControlToValidate="txt_descriptionI" ValidationGroup="insert" Display="Dynamic" />
        <br /><br />
        <asp:Label ID="lbl_wageI" runat="server" Text="Date" AssociatedControlID="txt_wageI" />
        <br />
        <asp:TextBox ID="txt_wageI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_wageI" runat="server" Text="*required" ControlToValidate="txt_wageI" ValidationGroup="insert" Display="Dynamic" />

        <%-- button inserts new job posting into database --%>
        <asp:Button ID="bnt_insert" runat="server" Text="Insert" CommandName="Insert" OnCommand="subAdmin" ValidationGroup="insert" />
        <br /><br />
        
        <asp:Panel ID="pnl_main" runat="server" GroupingText="Products">
            <table>
                <tbody>
                    <%-- lists the items in the database and their values, provides buttons for editing/deletion --%>
                    <asp:DataList ID="dtl_main" runat="server" CellPadding="5" >
                        <ItemTemplate>
                            <tr>
                                <td><strong><asp:Label ID="lbl_title" runat="server" Text="Title" /></strong></td>
                                <td><strong><asp:Label ID="lbl_location" runat="server" Text="Location" /></strong></td>
                                <td><strong><asp:Label ID="lbl_date" runat="server" Text="Date" /></strong></td>
                                <td><strong><asp:Label ID="lbl_department" runat="server" Text="Department" /></strong></td>
                                <td><strong><asp:Label ID="lbl_shift" runat="server" Text="Shift" /></strong></td>
                                <td><strong><asp:Label ID="lbl_hours" runat="server" Text="Hours" /></strong></td>
                                <td><strong><asp:Label ID="lbl_description" runat="server" Text="Description" /></strong></td>
                                <td><strong><asp:Label ID="lbl_wage" runat="server" Text="Wage" /></strong></td>
                            </tr>
                            <tr>
                                <td><%#Eval("title")%></td>
                                <td><%#Eval("location") %></td>
                                <td><%#Eval("date") %></td>
                                <td><%#Eval("department") %></td>
                                <td><%#Eval("shift") %></td>
                                <td><%#Eval("hours") %></td>
                                <td><%#Eval("description") %></td>
                                <td><%#Eval("wage") %></td>
                                <%-- edit button will display update panel for altering values --%>
                                <td><asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Eval("id") %>' OnCommand="subAdmin" /></td>
                                <%-- delete button will display delete panel and confirm deletion --%>
                                <td><asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("id") %>' OnCommand="subAdmin" /></td>
                            </tr>
                        </ItemTemplate>
                    </asp:DataList>
                </tbody>
            </table>
        </asp:Panel>

        <%-- displayed when user hits update button --%>
        <asp:Panel ID="pnl_update" runat="server" GroupingText="Update Job Posting">
            <table>
                <tbody>
                    <asp:DataList ID="dtl_update" runat="server" OnItemCommand="subUpDel" CellPadding="5">
                        <ItemTemplate>
                            <tr>
                                <td><strong><asp:Label ID="lbl_titleU" runat="server" Text="Title" /></strong></td>
                                <td><strong><asp:Label ID="lbl_locationU" runat="server" Text="Location" /></strong></td>
                                <td><strong><asp:Label ID="lbl_dateU" runat="server" Text="Date" /></strong></td>
                                <td><strong><asp:Label ID="lbl_departmentU" runat="server" Text="Department" /></strong></td>
                                <td><strong><asp:Label ID="lbl_shiftU" runat="server" Text="Shift" /></strong></td>
                                <td><strong><asp:Label ID="lbl_hoursU" runat="server" Text="Hours" /></strong></td>
                                <td><strong><asp:Label ID="lbl_descriptionU" runat="server" Text="Description" /></strong></td>
                                <td><strong><asp:Label ID="lbl_wageU" runat="server" Text="Wage" /></strong></td>
                            </tr>
                            <tr>
                                <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("id") %>' />
                                <td><asp:TextBox ID="txt_titleU" runat="server" Text='<%#Eval("title") %>' /></td>
                                <td><asp:TextBox ID="txt_locationU" runat="server" Text='<%#Eval("location") %>' TextMode="MultiLine" /></td>
                                <td><asp:TextBox ID="txt_dateU" runat="server" Text='<%#Eval("date") %>' /></td>
                                <td><asp:TextBox ID="txt_departmentU" runat="server" Text='<%#Eval("department") %>' /></td>
                                <td><asp:TextBox ID="txt_shiftU" runat="server" Text='<%#Eval("shift") %>' /></td>
                                <td><asp:TextBox ID="txt_hoursU" runat="server" Text='<%#Eval("hours") %>' /></td>
                                <td><asp:TextBox ID="txt_descriptionU" runat="server" Text='<%#Eval("description") %>' /></td>
                                <td><asp:TextBox ID="txt_wageU" runat="server" Text='<%#Eval("wage") %>' /></td>
                            </tr>
                            <tr>
                                <td><asp:RequiredFieldValidator ID="rfv_titleU" runat="server" Text="*required" ControlToValidate="txt_titleU" ValidationGroup="update" /></td>
                                <td><asp:RequiredFieldValidator ID="rfv_locationU" runat="server" Text="*required" ControlToValidate="txt_locationU" ValidationGroup="update" /></td>
                                <td><asp:RequiredFieldValidator ID="rfv_dateU" runat="server" Text="*required" ControlToValidate="txt_dateU" ValidationGroup="update" Display="Dynamic" /></td>
                                <td><asp:RequiredFieldValidator ID="rfv_departmentU" runat="server" Text="*required" ControlToValidate="txt_departmentU" ValidationGroup="update" Display="Dynamic" /></td>
                                <td><asp:RequiredFieldValidator ID="rfv_shiftU" runat="server" Text="*required" ControlToValidate="txt_shiftU" ValidationGroup="update" Display="Dynamic" /></td>
                                <td><asp:RequiredFieldValidator ID="rfv_hoursU" runat="server" Text="*required" ControlToValidate="txt_hoursU" ValidationGroup="update" Display="Dynamic" /></td>
                                <td><asp:RequiredFieldValidator ID="rfv_descriptionU" runat="server" Text="*required" ControlToValidate="txt_descriptionU" ValidationGroup="update" Display="Dynamic" /></td>
                                <td><asp:RequiredFieldValidator ID="rfv_wageU" runat="server" Text="*required" ControlToValidate="txt_wageU" ValidationGroup="update" Display="Dynamic" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- commits update to database --%>
                                    <asp:Button ID="btn_doUpdate" runat="server" Text="Update" CommandName="Update" ValidationGroup="update" />
                                    &nbsp;&nbsp;&nbsp;
                                    <%-- cancels update --%>
                                    <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:DataList>
                </tbody>
            </table>
        </asp:Panel>

        <%-- displayed when user hits delete button --%>
        <asp:Panel ID="pnl_delete" runat="server" GroupingText="Delete Job Posting">
            <table>
                <thead>
                    <tr>
                        <td style="color:red;"><asp:Label ID="lbl_delete" runat="server" Text="Are you sure you want to delete this posting?" /></td>
                    </tr>
                </thead>
                <tbody>
                    <asp:DataList ID="dtl_delete" runat="server" OnItemCommand="subUpDel" CellPadding="5">
                        <ItemTemplate>
                            <tr>
                                <td><strong><asp:Label ID="lbl_titleD" runat="server" Text="Title" /></strong></td>
                                <td><strong><asp:Label ID="lbl_locationD" runat="server" Text="Location" /></strong></td>
                                <td><strong><asp:Label ID="lbl_dateD" runat="server" Text="Date" /></strong></td>
                                <td><strong><asp:Label ID="lbl_departmentD" runat="server" Text="Department" /></strong></td>
                                <td><strong><asp:Label ID="lbl_shiftD" runat="server" Text="Shift" /></strong></td>
                                <td><strong><asp:Label ID="lbl_hoursD" runat="server" Text="Hours" /></strong></td>
                                <td><strong><asp:Label ID="lbl_descriptionD" runat="server" Text="Description" /></strong></td>
                                <td><strong><asp:Label ID="lbl_wageD" runat="server" Text="Wage" /></strong></td>
                            </tr>
                            <tr>
                                <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("id") %>' />
                                <td><asp:Label ID="txt_titleD" runat="server" Text='<%#Eval("title") %>' /></td>
                                <td><asp:Label ID="txt_locationD" runat="server" Text='<%#Eval("location") %>' /></td>
                                <td><asp:Label ID="txt_dateD" runat="server" Text='<%#Eval("date") %>' /></td>
                                <td><asp:Label ID="txt_departmentD" runat="server" Text='<%#Eval("department") %>' /></td>
                                <td><asp:Label ID="txt_shiftD" runat="server" Text='<%#Eval("shift") %>' /></td>
                                <td><asp:Label ID="txt_hoursD" runat="server" Text='<%#Eval("hours") %>' /></td>
                                <td><asp:Label ID="txt_descriptionD" runat="server" Text='<%#Eval("description") %>' /></td>
                                <td><asp:Label ID="txt_wageD" runat="server" Text='<%#Eval("wage") %>' /></td>
                            </tr>
                            <tr>
                                <%-- deletes item from database --%>
                                <td><asp:Button ID="btn_doDelete" runat="server" Text="Delete" CommandName="Delete" />
                                    &nbsp;&nbsp;&nbsp;
                                    <%-- cancels delete --%>
                                    <asp:Button ID="btn_doCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:DataList>

                </tbody>
            </table>
        </asp:Panel>
        <br />
        <asp:Label ID="lbl_message" runat="server" />
</asp:Content>

