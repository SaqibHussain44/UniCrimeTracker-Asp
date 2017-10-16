<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="ct_project.signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Loginstyle.css" rel="stylesheet" />
    <p>
        <% if (Request.QueryString["msg"] != null)
            {
                if (Request.QueryString["msg"] == "RF")
                    Response.Write("User Registration Failed due to some error..Try again");
            }
        %>
    </p>
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
                <label for="username">UserName:</label>
                <asp:TextBox runat="server" class="form-control" required="true" ID="txtName"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="cnic">CNIC:</label>
                <asp:TextBox runat="server" CssClass="form-control" required="true" ID="txtCNIC"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="City">City:</label>
                <asp:DropDownList ID="DropDownCity" runat="server" DataSourceID="SqlDataSource1" DataTextField="City" DataValueField="City"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [City] FROM [City]"></asp:SqlDataSource>
            </div>

            <div class="form-group">
                <label for="Contact">Contact:</label>
                <asp:TextBox runat="server" CssClass="form-control" required="true" ID="txtContact"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="Address">Address:</label>
                <asp:TextBox runat="server" CssClass="form-control" required="true" ID="txtAddress"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="Email">Email:</label>
                <asp:TextBox runat="server" type="email" CssClass="form-control" required="true" ID="txtEmail"></asp:TextBox>
            </div>
            <div class="control-group">
                <label class="control-label" for="gender">Gender</label>
                <div class="controls">
                    <label class="radio inline" for="gender-0">
                        <asp:RadioButton ID="RadioGender" Checked="true" GroupName="gender" runat="server" />
                        Male
                    </label>
                    <label class="radio inline" for="gender-1">
                        <asp:RadioButton ID="RadioGender1" GroupName="gender" required="true" runat="server" />
                        Female
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="Password">Password:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtPassword" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="cPassword">Confirm Password:</label>
                <asp:TextBox runat="server" CssClass="form-control" required="true" ID="txtcPassword"></asp:TextBox>
            </div>
           
            <asp:Button ID="ButtonSubmit" runat="server" CssClass="btn btn-default" OnClick="ButtonSubmit_Click" Text="Submit" />
        </form>
    </div>
</asp:Content>
