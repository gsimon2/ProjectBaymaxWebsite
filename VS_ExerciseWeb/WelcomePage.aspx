<%@ Page Language="VB" AutoEventWireup="false" CodeFile="WelcomePage.aspx.vb" Inherits="WelcomePage" %>
<!---->
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        p {padding-left:10px}
        #header{height:100px}
        #header h1{font-size:40px;font-family:'Franklin Gothic Medium';text-align: center}
        <!--#welcome{margin-top:100px;font-size:larger;font-family:'Franklin Gothic Medium';text-align:center}-->
        #leftpanel{width:200px;padding-top:8px;height:400px;margin-top:50px;font-family:'Franklin Gothic Medium';float:left}
        #login{margin-top:50px;margin-left:280px;font-family:'Franklin Gothic Medium';float:left}
        #rightpanel{width:200px;padding-top:8px;height:400px;margin-top:50px;font-family:'Franklin Gothic Medium';float:right}
        .auto-style2 {
            text-align: center;
        }
    </style>
</head>

<body background="Images/background_bluegreen.jpeg">

    <div id="header">
        <asp:Image ID="Panther_Logo" runat="server" ImageUrl="~/Images/Panther_Logo.png" ImageAlign="Left" Height="100px" BorderWidth="2px"/>
        <asp:Image ID="GLCE_Logo" runat="server" ImageUrl="~/Images/GLCE_logo.jpg" Height="100px" ImageAlign="Right" BorderWidth="2px" />
        <br>
        <h1>Shoulder Exercise<br>System</h1>
    </div>
    <br>

    <div id="leftpanel">
        <asp:Image ID="supra" runat="server" ImageUrl="~/Images/supraspinatus_image.jpg" ImageAlign="Left" Width="200px" BorderWidth="2px"/>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/infraspinatus_image.jpg" ImageAlign="Left" Width="200px" BorderWidth="2px"/>
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/teres_minor_image.jpg" ImageAlign="Left" Width="200px" BorderWidth="2px"/>
    </div>

    <!--
    <div id="welcome">
        <p>Welcome! Please log in or
        <a href="CreateTherapistForm.aspx">create a new account.</a></p>
    </div>-->

    <form id="form1" runat="server">
        <div id="login">
            <p>Welcome! Please log in or <a href="CreateTherapistForm.aspx">create a new account.</a></p>
            <fieldset style="width: 257px" dir="ltr">
                <legend class="auto-style2">Account information:</legend>
                <table style="width:50%">
                    <tr>
                        <td>User ID:</td>
                        <td>
                            <asp:TextBox ID="UserID_text" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td>
                            <asp:TextBox ID="Password_text" runat="server"></asp:TextBox></td>
                    </tr>
                </table>
                <br>
                <input type=button onClick="location.href='PostLogon.aspx'" value='Login' style="font-family:'Franklin Gothic Medium'"/>
                <br>
            </fieldset>
        </div>
    </form>

    <div id="rightpanel">
        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/subscapularis_image.jpg" ImageAlign="Left" Width="200px" BorderWidth="2px"/>
        <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/shoulder_flexion_image.jpg" ImageAlign="Left" Width="200px" BorderWidth="2px"/>
        <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/shoulder_extension_image.jpg" ImageAlign="Left" Width="200px" BorderWidth="2px"/>
    </div>

</body>
</html>
