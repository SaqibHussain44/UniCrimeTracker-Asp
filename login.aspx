<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ct_project.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <% if (Session["user"] == null)
        {
             %>
    <link href="Content/Loginstyle.css" rel="stylesheet" />
    <div>
        <div class="container">
            <section id="content">
                <p>
                    <% if (Request.QueryString["msg"] != null)
                        {
                            if (Request.QueryString["msg"] == "n") Response.Write("Please Login or Register to continue");
                            else if (Request.QueryString["msg"] == "UNR") Response.Write("Alert: Email not registerd");
                            else if (Request.QueryString["msg"] == "PI") Response.Write("Alert: Incorrect Password");
                        }
                    %>
                </p>
                <form runat="server" method="post">
                    <h1>User Login</h1>
                    <div>
                        <input type="text" placeholder="Email" required="" id="username" name="email" />
                    </div>
                    <div>
                        <input type="password" placeholder="Password" required="" id="password" name="password" />
                    </div>
                    <div>
                        <asp:Button type="submit" ID="ButtonSubmit" class="submitBtn" runat="server" Text="Submit" OnClick="ButtonSubmit_Click1" />
                        <a href="signup.aspx">Register</a>
                    </div>
                </form>
                <%  %>
                <!-- form -->
            </section>
            <!-- content -->
        </div>
        <!-- container -->
        <script src="Scripts/customLogin.js"></script>
    </div>
    <% }
        else
        {
            Response.Write("You're already Logged in");
        } %>
</asp:Content>
