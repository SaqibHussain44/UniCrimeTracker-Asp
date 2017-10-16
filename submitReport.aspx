<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="submitReport.aspx.cs" Inherits="ct_project.submitReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Loginstyle.css" rel="stylesheet" />
    <% if (Session["user"] != null)
        { %>
        <div class="form-width">
        <form runat="server">
             <p>
                <% if (Request.QueryString["msg"] != null)
                    {
                        if (Request.QueryString["msg"] == "PDM")
                        {
                            Response.Write("The two Passwords does not match");
                        }
                        if (Request.QueryString["MSG"] == "CN")
                        {
                            Response.Write("CNIC Format invalid");
                        }
                        if (Request.QueryString["MSG"] == "CON")
                        {
                            Response.Write("Contact Number Format invalid");
                        }
                    }
                %>
            </p>
            <div class="form-group">
                <label for="username">Title:</label><asp:DropDownList ID="dropDownTitle" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="CrimeTitle" DataValueField="CrimeTitle"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CrimeTitle] FROM [Crime]"></asp:SqlDataSource>
            </div>
            <div class="form-group">
                <label for="date">Date:</label>
                <asp:Calendar ID="Date" runat="server"></asp:Calendar>
                
            </div>
            <div class="form-group">
                <label for="City">Time:</label>
                <asp:TextBox runat="server" CssClass="form-control" required="true" ID="txtTime"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="Contact">City:</label>
                <asp:DropDownList ID="DropDownCity" runat="server" DataSourceID="SqlDataSource2" DataTextField="City" DataValueField="City"></asp:DropDownList>
                
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [City] FROM [City]"></asp:SqlDataSource>
                
                <%--<asp:TextBox runat="server" CssClass="form-control" required="true" ID="txtCity"></asp:TextBox>--%>
            </div>
            <div class="form-group">
                <label for="Address">Description:</label>
                <asp:TextBox runat="server" CssClass="form-control" required="true" ID="txtDescription"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="location">Location:</label>
                <asp:TextBox runat="server" type="text" CssClass="form-control" required="true" ID="txtLocation"></asp:TextBox>
            </div>
          
            <div class="form-group">
                <label for="Password">Damage Worth:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtDW" required="true"></asp:TextBox>
            </div>
            <asp:Button ID="ButtonSubmit" runat="server" CssClass="btn btn-default" Text="Submit" OnClick="ButtonSubmit_Click" />
        </form>
    </div>
    <% }
        else
        {
            Response.Write("<p>Access Denied</p>");
        }
         %>
</asp:Content>
