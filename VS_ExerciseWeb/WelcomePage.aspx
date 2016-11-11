<%@ Page Language="VB" AutoEventWireup="false" CodeFile="WelcomePage.aspx.vb" Inherits="WelcomePage" %>
<!---->
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home - Orthopaedic Exercise System</title>
    <style>
        p {padding-left:10px}
        body{height:100%;margin:0;padding:0;background-image:url("Images/background_bgwave.jpg");background-repeat:repeat-y;background-size:100%}
        #entire{width:1000px; margin:50px auto 0 auto; font-family:'Franklin Gothic Medium'}
        #header{height:140px; width : 1000px; background-color:cornflowerblue; border:ridge;border-color:mediumseagreen}
        #header h1{font-size:60px; text-align:center}
        #leftpanel{width:200px; height:458px; float:left;border:ridge; border-color:mediumseagreen}
        #pagecontent{height : 458px; width : 536px;margin-left:20px; float:left; background-color:lightblue; border:ridge;border-color:mediumseagreen}
        #login{margin-top:50px; margin-left:100px; float:left}
        #rightpanel{width:200px; height:458px; margin-left:20px; float:right; border:ridge; border-color:mediumseagreen}
        #footer{float:left; height:80px; width:1000px; margin-top:20px; background-color:mediumseagreen; border:ridge;border-color:mediumseagreen}
        a:hover{background-color:yellow}
        .auto-style3 {height: 116px;  margin-top: 12px;}
    </style>
</head>

<body>
    <div id="entire">

        <div id="header">
            <br />
            <h1 class="auto-style3">Orthopaedic Exercise System</h1>
        </div>
        <br/>

        <div id="leftpanel">
            <asp:Image ID="supra_img" runat="server" ImageUrl="~/Images/supraspinatus_image.jpg" ImageAlign="Left" Width="196px" BorderWidth="2px"/>
            <asp:Image ID="infra_img" runat="server" ImageUrl="~/Images/infraspinatus_image.jpg" ImageAlign="Left" Width="196px" BorderWidth="2px"/>
            <asp:Image ID="teres_img" runat="server" ImageUrl="~/Images/teres_minor_image.jpg" ImageAlign="Left" Width="196px" BorderWidth="2px"/>
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
                                <asp:TextBox ID="UserID_text" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td>
                                <asp:TextBox ID="Password_text" TextMode="Password" runat="server"></asp:TextBox></td>
                        </tr>
                    </table>
                    <br/>
                    <input type=button onClick="location.href='PostLogon.aspx'" value='Login' style="font-family:'Franklin Gothic Medium'"/>
                    <br/>
                </fieldset>
            </div>
        </form>
        </div>

        <div id="rightpanel">
            <asp:Image ID="subscap_img" runat="server" ImageUrl="~/Images/subscapularis_image.jpg" ImageAlign="Left" Width="196px" BorderWidth="2px"/>
            <asp:Image ID="flexion_img" runat="server" ImageUrl="~/Images/shoulder_flexion_image.jpg" ImageAlign="Left" Width="196px" BorderWidth="2px"/>
            <asp:Image ID="extension_img" runat="server" ImageUrl="~/Images/shoulder_extension_image.jpg" ImageAlign="Left" Width="196px" Height="153px" BorderWidth="2px"/>
        </div>

        <div id="footer" style="text-align:center">
        
            <asp:Image ID="Panther_Logo" runat="server" ImageUrl="~/Images/Panther_Logo.png" ImageAlign="Middle" Height="76px" BorderWidth="2px"/>
            <asp:Image ID="GLCE_Logo" runat="server" ImageUrl="~/Images/GLCE_logo.jpg" Height="76px" ImageAlign="Middle" BorderWidth="2px" />
       
        </div>

    </div>

</body>
</html>
