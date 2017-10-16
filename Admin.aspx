<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="ct_project.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <% 
        if (Session["admin"] != null)
        {
    %>
    <form id="form1" runat="server">
        <h1>Manage Crimes</h1>
         <!-- Crimes record panel -->
        <asp:ListView ID="ListViewCrimes" runat="server" DataKeyNames="CrimeTitle" DataSourceID="SqlDataSource3" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="CrimeIdLabel" runat="server" Text='<%# Eval("CrimeId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CrimeTitleLabel" runat="server" Text='<%# Eval("CrimeTitle") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SeverityLabel" runat="server" Text='<%# Eval("Severity") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="CrimeIdLabel1" runat="server" Text='<%# Eval("CrimeId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CrimeTitleLabel1" runat="server" Text='<%# Eval("CrimeTitle") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SeverityTextBox" runat="server" Text='<%# Bind("Severity") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="CrimeTitleTextBox" runat="server" Text='<%# Bind("CrimeTitle") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SeverityTextBox" runat="server" Text='<%# Bind("Severity") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="CrimeIdLabel" runat="server" Text='<%# Eval("CrimeId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CrimeTitleLabel" runat="server" Text='<%# Eval("CrimeTitle") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SeverityLabel" runat="server" Text='<%# Eval("Severity") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server"></th>
                                    <th runat="server">CrimeId</th>
                                    <th runat="server">CrimeTitle</th>
                                    <th runat="server">Severity</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="CrimeIdLabel" runat="server" Text='<%# Eval("CrimeId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CrimeTitleLabel" runat="server" Text='<%# Eval("CrimeTitle") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SeverityLabel" runat="server" Text='<%# Eval("Severity") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Crime] WHERE [CrimeTitle] = @CrimeTitle" InsertCommand="INSERT INTO [Crime] ([CrimeTitle], [Severity]) VALUES (@CrimeTitle, @Severity)" SelectCommand="SELECT * FROM [Crime]" UpdateCommand="UPDATE [Crime] SET [CrimeId] = @CrimeId, [Severity] = @Severity WHERE [CrimeTitle] = @CrimeTitle">
            <DeleteParameters>
                <asp:Parameter Name="CrimeTitle" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CrimeTitle" Type="String" />
                <asp:Parameter Name="Severity" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CrimeId" Type="Int64" />
                <asp:Parameter Name="Severity" Type="Int32" />
                <asp:Parameter Name="CrimeTitle" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <!-- Crimes record panel end -->
        <h1>Manage Cities</h1>

        <!-- Manage Cities Control -->
        <asp:ListView ID="ListViewCities" runat="server" DataKeyNames="City" DataSourceID="SqlDataSource4" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel1" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server"></th>
                                    <th runat="server">Id</th>
                                    <th runat="server">City</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
         </asp:ListView>
         <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [City] WHERE [City] = @City" InsertCommand="INSERT INTO [City] ([City]) VALUES (@City)" SelectCommand="SELECT * FROM [City]" UpdateCommand="UPDATE [City] SET [Id] = @Id WHERE [City] = @City">
             <DeleteParameters>
                 <asp:Parameter Name="City" Type="String" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="City" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Id" Type="Int32" />
                 <asp:Parameter Name="City" Type="String" />
             </UpdateParameters>
         </asp:SqlDataSource>
        <!-- Manage city end -->

        <h1>Manage Users</h1>

        <!-- users control panel -->
        <asp:ListView ID="ListViewUsers" runat="server" DataKeyNames="CNIC,Email" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFF8DC;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CNICLabel" runat="server" Text='<%# Eval("CNIC") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ContactLabel" runat="server" Text='<%# Eval("Contact") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #008A8C; color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="UserIDLabel1" runat="server" Text='<%# Eval("UserID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CNICLabel1" runat="server" Text='<%# Eval("CNIC") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ContactTextBox" runat="server" Text='<%# Bind("Contact") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel1" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CNICTextBox" runat="server" Text='<%# Bind("CNIC") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ContactTextBox" runat="server" Text='<%# Bind("Contact") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #DCDCDC; color: #000000;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CNICLabel" runat="server" Text='<%# Eval("CNIC") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ContactLabel" runat="server" Text='<%# Eval("Contact") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                    <th runat="server"></th>
                                    <th runat="server">UserID</th>
                                    <th runat="server">UserName</th>
                                    <th runat="server">CNIC</th>
                                    <th runat="server">City</th>
                                    <th runat="server">Contact</th>
                                    <th runat="server">Address</th>
                                    <th runat="server">Email</th>
                                    <th runat="server">Gender</th>
                                    <th runat="server">Type</th>
                                    <th runat="server">Password</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CNICLabel" runat="server" Text='<%# Eval("CNIC") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ContactLabel" runat="server" Text='<%# Eval("Contact") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [CNIC] = @CNIC AND [Email] = @Email" InsertCommand="INSERT INTO [Users] ([UserName], [CNIC], [City], [Contact], [Address], [Email], [Gender], [Type], [Password]) VALUES (@UserName, @CNIC, @City, @Contact, @Address, @Email, @Gender, @Type, @Password)" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [UserID] = @UserID, [UserName] = @UserName, [City] = @City, [Contact] = @Contact, [Address] = @Address, [Gender] = @Gender, [Type] = @Type, [Password] = @Password WHERE [CNIC] = @CNIC AND [Email] = @Email">
            <DeleteParameters>
                <asp:Parameter Name="CNIC" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="CNIC" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="CNIC" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <!-- users panel end -->

        <h1>Manage Reports</h1>

        <!-- Reports Records  -->
        <asp:ListView ID="ListViewReports" runat="server" DataKeyNames="ReportId" DataSourceID="SqlDataSource2" InsertItemPosition="LastItem" OnSelectedIndexChanged="ListViewCrimes_SelectedIndexChanged">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFF8DC;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="ReportIdLabel" runat="server" Text='<%# Eval("ReportId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CrimeTitleLabel" runat="server" Text='<%# Eval("CrimeTitle") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SubmittedByLabel" runat="server" Text='<%# Eval("SubmittedBy") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CNICLabel" runat="server" Text='<%# Eval("CNIC") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TimeLabel" runat="server" Text='<%# Eval("Time") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DamageWorthLabel" runat="server" Text='<%# Eval("DamageWorth") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #008A8C; color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="ReportIdLabel1" runat="server" Text='<%# Eval("ReportId") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CrimeTitleTextBox" runat="server" Text='<%# Bind("CrimeTitle") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SubmittedByTextBox" runat="server" Text='<%# Bind("SubmittedBy") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CNICTextBox" runat="server" Text='<%# Bind("CNIC") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="TimeTextBox" runat="server" Text='<%# Bind("Time") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LocationTextBox" runat="server" Text='<%# Bind("Location") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DamageWorthTextBox" runat="server" Text='<%# Bind("DamageWorth") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="CrimeTitleTextBox" runat="server" Text='<%# Bind("CrimeTitle") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SubmittedByTextBox" runat="server" Text='<%# Bind("SubmittedBy") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CNICTextBox" runat="server" Text='<%# Bind("CNIC") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="TimeTextBox" runat="server" Text='<%# Bind("Time") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LocationTextBox" runat="server" Text='<%# Bind("Location") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DamageWorthTextBox" runat="server" Text='<%# Bind("DamageWorth") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #DCDCDC; color: #000000;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="ReportIdLabel" runat="server" Text='<%# Eval("ReportId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CrimeTitleLabel" runat="server" Text='<%# Eval("CrimeTitle") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SubmittedByLabel" runat="server" Text='<%# Eval("SubmittedBy") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CNICLabel" runat="server" Text='<%# Eval("CNIC") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TimeLabel" runat="server" Text='<%# Eval("Time") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DamageWorthLabel" runat="server" Text='<%# Eval("DamageWorth") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                    <th runat="server"></th>
                                    <th runat="server">ReportId</th>
                                    <th runat="server">CrimeTitle</th>
                                    <th runat="server">SubmittedBy</th>
                                    <th runat="server">CNIC</th>
                                    <th runat="server">Date</th>
                                    <th runat="server">Time</th>
                                    <th runat="server">City</th>
                                    <th runat="server">Description</th>
                                    <th runat="server">Location</th>
                                    <th runat="server">DamageWorth</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="ReportIdLabel" runat="server" Text='<%# Eval("ReportId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CrimeTitleLabel" runat="server" Text='<%# Eval("CrimeTitle") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SubmittedByLabel" runat="server" Text='<%# Eval("SubmittedBy") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CNICLabel" runat="server" Text='<%# Eval("CNIC") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TimeLabel" runat="server" Text='<%# Eval("Time") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DamageWorthLabel" runat="server" Text='<%# Eval("DamageWorth") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Report] WHERE [ReportId] = @ReportId" InsertCommand="INSERT INTO [Report] ([CrimeTitle], [SubmittedBy], [CNIC], [Date], [Time], [City], [Description], [Location], [DamageWorth]) VALUES (@CrimeTitle, @SubmittedBy, @CNIC, @Date, @Time, @City, @Description, @Location, @DamageWorth)" SelectCommand="SELECT * FROM [Report]" UpdateCommand="UPDATE [Report] SET [CrimeTitle] = @CrimeTitle, [SubmittedBy] = @SubmittedBy, [CNIC] = @CNIC, [Date] = @Date, [Time] = @Time, [City] = @City, [Description] = @Description, [Location] = @Location, [DamageWorth] = @DamageWorth WHERE [ReportId] = @ReportId">
            <DeleteParameters>
                <asp:Parameter Name="ReportId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CrimeTitle" Type="String" />
                <asp:Parameter Name="SubmittedBy" Type="String" />
                <asp:Parameter Name="CNIC" Type="String" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Time" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Location" Type="String" />
                <asp:Parameter Name="DamageWorth" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CrimeTitle" Type="String" />
                <asp:Parameter Name="SubmittedBy" Type="String" />
                <asp:Parameter Name="CNIC" Type="String" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Time" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Location" Type="String" />
                <asp:Parameter Name="DamageWorth" Type="String" />
                <asp:Parameter Name="ReportId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <!-- Reports record panel end -->

    </form>
    <%
        }
        else
        {
            Response.Write("<p> Access Denied..!<p>");
        }
    %>
</asp:Content>
