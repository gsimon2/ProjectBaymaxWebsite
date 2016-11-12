<%@ Page Language="VB" AutoEventWireup="false" CodeFile="NewPatient.aspx.vb" Inherits="NewPatient" %>

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
        #pagecontent{height : 458px; width : 764px; margin-left:20px; float:left; background-color:lightblue;border:ridge; border-color:mediumseagreen}
        #patientform{margin-top:50px;margin-left:180px}
        #footer{float:left; height:80px; width:1000px; margin-top:20px; background-color:mediumseagreen; border:ridge;border-color:mediumseagreen}
        .auto-style1{height: 116px;  margin-top: 12px}
        .auto-style3{width: 200px}
        a:hover{background-color: yellow}
    </style>
</head>

<body>
    <div id="entire">
        <div id="header">
            <br />
            <h1 class="auto-style1">Shoulder Exercise System</h1>
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
                    <fieldset style="width: 400px" dir="ltr">
                        <legend align="center">Patient information:</legend>
                        <table width="400px">
                            <tr>
                                <td class="auto-style3">Patient name:</td>
                                <td>
                                    <asp:TextBox ID="Patientname_text" runat="server" Width="200px"></asp:TextBox></td>
                            </tr>                    
                            <tr>
                                <td class="auto-style3">Patient ID:</td>
                                <td>
                                    <asp:TextBox ID="UserID_text" runat="server" Width="200px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Set password:</td>
                                <td>
                                    <asp:TextBox ID="Password_text" TextMode="Password" runat="server" Width="200px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Email address:</td>
                                <td>
                                    <asp:TextBox ID="Email_text" runat="server" Width="200px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Group affiliation:</td>
                                <td>
                                    <asp:TextBox ID="Group_text" runat="server" Width="200px"></asp:TextBox></td>
                            </tr>
                        </table>
                        <br/>
                        <asp:Button ID="SubmitButton" runat="server" Text="Submit" />
                        <!--<input type=button onClick="location.href='WelcomePage.aspx'" value='Submit'/>-->
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
