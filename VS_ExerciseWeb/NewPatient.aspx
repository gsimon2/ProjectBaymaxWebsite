﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="NewPatient.aspx.vb" Inherits="NewPatient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Patient - Orthopaedic Exercise System</title>
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
        #patientform{margin-top:50px;margin-left:170px}
        #footer{float:left; height:80px; width:1000px; margin-top:20px; background-color:mediumseagreen; border:ridge;border-color:mediumseagreen}
        .auto-style1{height: 116px;  margin-top: 12px}
        .auto-style3{width: 160px}
        a:hover{background-color: yellow}
        .auto-style4 {
            color: #FF0000;
        }
    </style>
</head>

<body>
    <div id="entire">
        <div id="header">
            <br />
            <h1 class="auto-style1">Orthopaedic Exercise System</h1>
        </div>
        <br />

        <div id="leftpanel">
            <p><strong>Navigation</strong></p>
            <ul>
                <li><a href="NewPatient.aspx">Create New Patient</a></li>
                <li><a href="ManagePatients.aspx">Assign Workout Plan</a></li>
                <li><a href="ReportsView.aspx">View Reports</a></li>
                <li><a href="PostLogon.aspx">Back to Home</a></li>
                <li><a href="WelcomePage.aspx">Sign Out</a></li>

            </ul>
        </div>

        <div id="pagecontent">

            <div id="patientform">
                <form id="form1" runat="server" style="text-align:left">
                    <fieldset style="width: 430px" dir="ltr">
                        <legend align="center">Patient information:</legend>
                        <table style="width: 430px">
                            <tr>
                                <td class="auto-style3">Patient First Name: <span class="auto-style4">*</span></td>
                                <td> <!--class="auto-style5">-->
                                    <asp:TextBox ID="PatientFirstName_text" runat="server" Width="250px"></asp:TextBox></td>
                            </tr>                    
                            <tr>
                                <td class="auto-style3">Patient Last Name: <span class="auto-style4">*</span></td>
                                <td>
                                    <asp:TextBox ID="PatientLastName_text" runat="server" Width="250px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Patient Middle Name:</td>
                                <td>
                                    <asp:TextBox ID="PatientMiddleName_text" runat="server" Width="250px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Set Password: <span class="auto-style4">*</span></td>
                                <td>
                                    <asp:TextBox ID="Password_text" runat="server"  TextMode="Password" Width="250px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Confirm Password: <span class="auto-style4">*</span></td>
                                <td>
                                    <asp:TextBox ID="ConfirmPassword_text" runat="server"  TextMode="Password" Width="250px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Patient Phone:</td>
                                <td>
                                    <asp:TextBox ID="Phone_text" runat="server" Width="250px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Patient Email:</td>
                                <td>
                                    <asp:TextBox ID="Email_text" runat="server" Width="250px"></asp:TextBox></td>
                            </tr>
                            </table>
                        <p style="text-align: center"><asp:Button ID="SubmitButton" runat="server" Text="Submit" /></p>
                        <!--<input type=button onClick="location.href='WelcomePage.aspx'" value='Submit'/>-->
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
