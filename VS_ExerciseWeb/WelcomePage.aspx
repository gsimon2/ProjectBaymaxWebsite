<%@ Page Language="VB" AutoEventWireup="false" CodeFile="WelcomePage.aspx.vb" Inherits="WelcomePage" %>
<!---->
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome Page</title>
    <style>
        p {padding-left:10px}
        #entire{width:1000px; margin:50px auto 0 auto; font-family:'Franklin Gothic Medium'}
        #header{height:140px; width : 1000px; background-color:cornflowerblue; border:ridge}
        #header h1{font-size:60px; text-align:center}
        #leftpanel{width:200px; height:458px; float:left}
        #pagecontent{height : 458px; width : 600px; float:left; background-color:lightblue}
        #login{margin-top:50px; margin-left:120px; float:left}
        #rightpanel{width:200px; height:458px; float:right}
        #footer{float:left; height:80px; width:1000px; background-color:mediumseagreen}
        a:hover{background-color:yellow}
        .auto-style3 {height: 116px;  margin-top: 12px;}
    </style>
</head>

<body background="Images/background_bgwave.jpg"/>
    <div id="entire">

        <div id="header">
            <br />
            <h1 class="auto-style3">Orthopaedic Exercise System</h1>
        </div>
        <br>

        <div id="leftpanel">
            <asp:Image ID="supra" runat="server" ImageUrl="~/Images/supraspinatus_image.jpg" ImageAlign="Left" Width="196px" BorderWidth="2px"/>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/infraspinatus_image.jpg" ImageAlign="Left" Width="196px" BorderWidth="2px"/>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/teres_minor_image.jpg" ImageAlign="Left" Width="196px" BorderWidth="2px"/>
        </div>

        <div id="pagecontent">
        <form id="form1" runat="server">
            <div id="login">
                <p>Welcome! Please log in or <a href="CreateTherapistForm.aspx">create a new account.</a></p>
                <br />
                <fieldset style="width: 257px; margin-left:50px" dir="ltr">
                    <legend align="center">Account information:</legend>
                    <table style="width:50%">
                        <tr>
                            <td>User ID:</td>
                            <td>
                                <asp:TextBox ID="UsernameTextBox" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td>
                                <asp:TextBox ID="PasswordTextBox" TextMode="Password" runat="server"></asp:TextBox></td>
                        </tr>
                    </table>
                    <br>
                    <input type="button" OnserverClick="Login_Button_Click" runat="server"  value= "login" style="font-family:'Franklin Gothic Medium'" id ="Login_Button"/>
                    <!--<input type=button onClick="location.href='PostLogon.aspx'" value='Login' style="font-family:'Franklin Gothic Medium'"/>-->
                    <br>
                </fieldset>
            </div>

        </form>
        </div>

        <div id="rightpanel">
            <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/subscapularis_image.jpg" ImageAlign="Left" Width="196px" BorderWidth="2px"/>
            <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/shoulder_flexion_image.jpg" ImageAlign="Left" Width="196px" BorderWidth="2px"/>
            <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/shoulder_extension_image.jpg" ImageAlign="Left" Width="196px" BorderWidth="2px"/>
        </div>

        <div id="footer" style="text-align:center">
        
            <asp:Image ID="Panther_Logo" runat="server" ImageUrl="~/Images/Panther_Logo.png" ImageAlign="Middle" Height="76px" BorderWidth="2px"/>
            <asp:Image ID="GLCE_Logo" runat="server" ImageUrl="~/Images/GLCE_logo.jpg" Height="76px" ImageAlign="Middle" BorderWidth="2px" />
       
        </div>

    </div>

</body>
</html>
