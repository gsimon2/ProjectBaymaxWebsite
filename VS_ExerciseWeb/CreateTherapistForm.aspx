<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CreateTherapistForm.aspx.vb" Inherits="CreateTherapistForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Therapist - Orthopaedic Exercise System</title>
    <style>
        p {padding-left:10px}
        body{height:100%;margin:0;padding:0;background-image:url("Images/background_bgwave.jpg");background-repeat:repeat-y;background-size:100%}
        #entire{width:1000px; margin:50px auto 0 auto; font-family:'Franklin Gothic Medium'}
        #header{height:140px; width : 1000px; background-color:cornflowerblue; border:ridge;border-color:mediumseagreen}
        #header h1{font-size:60px; text-align:center}
        #leftpanel{width:200px; height:458px; float:left; background-color:palegreen;border:ridge; border-color:mediumseagreen}
        #leftpanel p{margin-top:50px}
        #leftpanel li a{color:cornflowerblue}
        #pagecontent{height : 458px; width : 764px; margin-left:20px; float:left; background-color:lightblue;border:ridge; border-color:mediumseagreen}
        #therapistform{margin-top:50px;margin-left:180px}
        #footer{float:left; height:80px; width:1000px; margin-top:20px; background-color:mediumseagreen; border:ridge;border-color:mediumseagreen}
        .auto-style1{height: 116px;  margin-top: 12px}
        a:hover{background-color: yellow}
        .auto-style4 {
            color: #FF0000;
        }
    </style>
</head>

<body>
    <div id="entire">
        <div id="header">
            <br/>
            <h1 class="auto-style1">Orthopaedic Exercise System</h1>
        </div>
        <br />

        <div id="leftpanel">
            <p><strong>Navigation</strong></p>
            <ul>
                <li><a href="WelcomePage.aspx">Return to Home</a></li>
            </ul>
        </div>

        <div id="pagecontent">
            <div id="therapistform">
                <form id="form1" runat="server" style="text-align:left">
                    <fieldset style="width: 400px" dir="ltr">
                        <legend align="center">Account Information:</legend>
                        <table width="400px">
                            <tr>
                                <td class="auto-style2">User ID: <span class="auto-style4">*</span></td>
                                <td>
                                    <asp:TextBox ID="UserID_text" runat="server" Width="200px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Set Password: <span class="auto-style4">*</span></td>
                                <td>
                                    <asp:TextBox ID="Password_text" runat="server" Width="200px" TextMode="Password"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Email Address: <span class="auto-style4">*</span></td>
                                <td>
                                    <asp:TextBox ID="Email_text" runat="server" Width="200px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Group Affiliation: <span class="auto-style4">*</span></td>
                                <td>
                                    <asp:TextBox ID="Group_text" runat="server" Width="200px"></asp:TextBox></td>
                            </tr>
                        </table>
                        <br/>
                        <input type=button onClick="location.href='WelcomePage.aspx'" value='Submit'/>
                        <br/>
                    </fieldset>
                </form>
            </div>
        </div>

        <div id="footer" style="text-align:center">
            <asp:Image ID="Panther_Logo" runat="server" ImageUrl="~/Images/Panther_Logo.png" ImageAlign="Middle" Height="76px" BorderWidth="2px"/>
            <asp:Image ID="GLCE_Logo" runat="server" ImageUrl="~/Images/GLCE_logo.jpg" Height="76px" ImageAlign="Middle" BorderWidth="2px" />
        </div>

    </div>
</body>
</html>
