<%@ Page Language="VB" AutoEventWireup="false" CodeFile="NewPatient.aspx.vb" Inherits="NewPatient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        p {padding-left:10px}
        #header{height:100px}
        #header h1{font-size:40px;font-family:'Franklin Gothic Medium';text-align: center}
        #navigation{width:200px;padding-top:8px;height:400px;background-color:powderblue;margin-top:50px;font-family:'Franklin Gothic Medium';float:left}
        #patientform{margin-left:400px;margin-top:50px;font-family:'Franklin Gothic Medium'}
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            width: 200px;
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

    <div id="navigation">
        <p><strong>Navigation</strong></p>
        <ul>
            <li><a href="ManagePatients.aspx">Assign Workout Plan</a></li>
            <li><a href="ReportsView.aspx">View Reports</a></li>
            <li><a href="WelcomePage.aspx">Sign Out</a></li>
        </ul>
    </div>

    <div id="patientform">
        <form id="form1" runat="server" style="text-align:left">
            <fieldset style="width: 400px" dir="ltr">
                <legend class="auto-style2">Patient information:</legend>
                <table width="400px"><!--style="width:50%"-->
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
                            <asp:TextBox ID="Password_text" runat="server" Width="200px"></asp:TextBox></td>
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
                <br>
                <asp:Button ID="SubmitButton" runat="server" Text="Submit" style="font-family:'Franklin Gothic Medium'" />
                <!--<input type=button onClick="location.href='WelcomePage.aspx'" value='Submit' style="font-family:'Franklin Gothic Medium'"/>-->
                <br>
            </fieldset>
        </form>
    </div>
</body>
</html>
