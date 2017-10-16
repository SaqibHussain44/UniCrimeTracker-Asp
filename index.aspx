<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ct_project.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <h1>
            <% if (Request.QueryString["msg"] != null)
                {
                    if (Request.QueryString["msg"] == "UR")
                        Response.Write("User Registered Successfully");
                    if (Request.QueryString["msg"] == "LI")
                        Response.Write("User Loged in Successfully");
                    if (Request.QueryString["msg"] == "RS")
                        Response.Write("Report Submitted Successfully");
                    if (Request.QueryString["msg"] == "RF")
                        Response.Write("Report Submission caught an error");
                }
            %></h1>
    </form>

    <asp:ListView ID="ListAllReports" runat="server" DataSourceID="SqlDataSource2">
        <ItemTemplate>
            <div class="col-lg-4">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <b>
                            <asp:Label ID="CrimeTitleLabel" runat="server" Text='<%# Eval("CrimeTitle") %>' /></b>
                    </div>
                    <div class="panel-body">
                        <li style="">SubmittedBy:
                            <asp:Label ID="SubmittedByLabel" runat="server" Text='<%# Eval("SubmittedBy") %>' />
                            <br />
                            Date:
                            <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                            <br />
                            Time:
                            <asp:Label ID="TimeLabel" runat="server" Text='<%# Eval("Time") %>' />
                            <br />
                            City:
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                            <br />
                            Description:
                            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                            <br />
                            Location:
                            <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                            <br />
                            DamageWorth:
                            <asp:Label ID="DamageWorthLabel" runat="server" Text='<%# Eval("DamageWorth") %>' />
                            <br />
                        </li>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="">
            </div>
        </LayoutTemplate>

    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CrimeTitle], [SubmittedBy], [Date], [Time], [City], [Description], [Location], [DamageWorth] FROM [Report]"></asp:SqlDataSource>

</asp:Content>
