<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PostLogon.aspx.vb" Inherits="PostLogon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        p {padding-left:10px}
        #header{height:100px}
        #header h1{font-size:40px;font-family:'Franklin Gothic Medium';text-align: center}
        #navigation{width:200px;padding-top:8px;height:400px;background-color:powderblue;margin-top:50px;font-family:'Franklin Gothic Medium';float:left}
        #welcome{padding-top:50px;margin-left:210px;font-size:larger;font-family:'Franklin Gothic Medium';float:left}
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            width: 200px;
        }
    </style>
</head>

<body background="Images/background_bluegreen.jpeg"/>
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
            <li><a href="NewPatient.aspx">Create New Patient</a></li>
            <li><a href="ManagePatients.aspx">Assign Workout Plan</a></li>
            <li><a href="ReportsView.aspx">View Reports</a></li>
            <li><a href="WelcomePage.aspx">Sign Out</a></li>
        </ul>
    </div>

    <div id="welcome">
        <p>Hello, [user's name]!</p><br>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Machine_image.png" Height="300px" BorderWidth="2px"/>
    </div>
</body>
</html>
