﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="ct_project.category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">

        <asp:ListView ID="ListViewDetails" runat="server">
            <ItemTemplate>
                <div class="col-lg-4">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <b>
                                <asp:Label ID="CrimeTitleLabel" runat="server" Text='<%# Eval("CrimeTitle") %>' /></b>
                        </div>
                        <div class="panel-body">
                            <span style="">
                                <br />
                                SubmittedBy:
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
                                <br />
                            </span>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div style="" id="itemPlaceholderContainer" runat="server">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <span style="">CrimeTitle:
                        <asp:Label ID="CrimeTitleLabel" runat="server" Text='<%# Eval("CrimeTitle") %>' />
                    <br />
                    SubmittedBy:
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
                    <br />
                </span>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CrimeTitle], [SubmittedBy], [Date], [Time], [City], [Description], [Location], [DamageWorth] FROM [Report]"></asp:SqlDataSource>
    </form>
</asp:Content>