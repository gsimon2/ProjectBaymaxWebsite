<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PostLogon.aspx.vb" Inherits="PostLogon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Screen</title>
    <style>

        p {padding-left:10px}
        #entire{width:1000px; margin:50px auto 0 auto; font-family:'Franklin Gothic Medium'}
        #header{height:140px; width : 1000px; background-color:cornflowerblue; border:ridge}
        #header h1{font-size:60px; text-align:center}
        #leftpanel{width:200px; height:458px; float:left; background-color:palegreen}
        #pagecontent{height : 458px; width : 600px; float:left; background-color:lightblue}
        #welcome{padding-top:50px;margin-left:90px;font-size:larger;font-family:'Franklin Gothic Medium';float:left}
        #rightpanel{width:200px; height:458px; float:right; background-color:palegreen}
        #footer{float:left; height:80px; width:1000px; background-color:mediumseagreen}
        .auto-style3 {height: 116px;  margin-top: 12px}
        a:hover{background-color: yellow}
    </style>
</head>

<body background="Images/background_bgwave.jpg"/>
    <div id="entire">
        <div id="header">
            <br />
            <h1 class="auto-style3">Orthopaedic Exercise System</h1>
        </div>
        <br>

        <div id="toppanel">

        </div>

        <div id="leftpanel">
            <p><strong>Navigation</strong></p>
            <ul>
                <li><a href="NewPatient.aspx" style="color:cornflowerblue">Create New Patient</a></li>
                <li><a href="ManagePatients.aspx" style="color:cornflowerblue">Assign Workout Plan</a></li>
                <li><a href="ReportsView.aspx" style="color:cornflowerblue">View Reports</a></li>
                <li><a href="WelcomePage.aspx" style="color:cornflowerblue">Sign Out</a></li>
            
            </ul>
        </div>

        <div id="pagecontent">
            <div id="welcome">
                <p>Hello, [user's name]!</p><br>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Machine_image.png" Height="300px" BorderWidth="2px"/>
            </div>
        </div>

        <div id="rightpanel">            
        </div>

        <div id="footer" style="text-align:center">
            <asp:Image ID="Panther_Logo" runat="server" ImageUrl="~/Images/Panther_Logo.png" ImageAlign="Middle" Height="76px" BorderWidth="2px"/>
            <asp:Image ID="GLCE_Logo" runat="server" ImageUrl="~/Images/GLCE_logo.jpg" Height="76px" ImageAlign="Middle" BorderWidth="2px" />
        </div>


    </div>
</body>
</html>
