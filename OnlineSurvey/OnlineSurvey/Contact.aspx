<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="OnlineSurvey.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <!DOCTYPE html>
<script runat="server">
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Ajax PasswordStrength - How to use PasswordStrength in asp.net ajax</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2 style="color:DarkSeaGreen; font-style:italic;">Ajax Control Toolkit Example: Using PasswordStrength</h2>
        <hr width="550" align="left" color="DarkSeaGreen" />
        <asp:ScriptManager 
            ID="ScriptManager1"
            runat="server"
            >
        </asp:ScriptManager>
        <cc1:PasswordStrength 
            ID="PasswordStrength1"
            runat="server"
            TargetControlID="TextBox1"
            >
        </cc1:PasswordStrength>
        <br /><br />
        <asp:Label 
            ID="Label1"
            runat="server"
            ForeColor="OrangeRed"
            Font-Bold="true"
            Text="Input your password"
            >
        </asp:Label>
        <asp:TextBox 
            ID="TextBox1"
            runat="server"
            >
        </asp:TextBox>
    </div>
    </form>
</body>
</html>

</asp:Content>