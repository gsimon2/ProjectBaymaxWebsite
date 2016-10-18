<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ManagePatients.aspx.vb" Inherits="ManagePatients" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <!--**the following is needed for the calendar popup**-->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
        $( function() {
        $( "#datepicker" ).datepicker({
            altField: "#alternate",
            <!--altFormat: "DD, d MM, yy"-->
        });
        } );
        </script>
    <!--**-->

    <style>
        p {padding-left:10px}
        #header{height:100px}
        #header h1{font-size:40px;font-family:'Franklin Gothic Medium';text-align: center}
        #navigation{width:200px;padding-top:8px;height:400px;background-color:powderblue;margin-top:50px;font-family:'Franklin Gothic Medium';float:left}
        #workoutform{margin-top:50px;margin-left:240px;font-family:'Franklin Gothic Medium';float:left}
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
            <li><a href="PostLogon.aspx">Back to Home</a></li>
            <li><a href="WelcomePage.aspx">Sign Out</a></li> <!--Need to add function!-->
        </ul>
    </div>

    <form id="form1" runat="server">
        <div id="workoutform">
                <table style=border="1">
                    <caption><b>Patient Information</b></caption>
                    <col width="200">
                    <col width="200">
                    <tr>
                        <td>Patient Name:</td>
                        <td>
                            <asp:TextBox ID="NameText" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Patient Login Number:</td>
                        <td>
                            <asp:TextBox ID="NumberText" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Date-Time Prescription Entered (MM/DD/YYYY):</td>
                        <td>
                            <input type="text" id="datepicker">
                        </td>
                    </tr>
                    <tr>
                        <td>Exercises to be Performed:</td>
                        <td>
                            <asp:CheckBoxList ID="ExerciseList" runat="server">
                                <asp:ListItem Text="Supraspinatus" Value="Value1"></asp:ListItem>
                                <asp:ListItem Text="Infraspinatus" Value="Value2"></asp:ListItem>
                                <asp:ListItem Text="Teres Minor" Value="Value3"></asp:ListItem>
                                <asp:ListItem Text="Subscapularis" Value="Value4"></asp:ListItem>
                                <asp:ListItem Text="Shoulder Flexion" Value="Value5"></asp:ListItem>
                                <asp:ListItem Text="Shoulder Extension" Value="Value6"></asp:ListItem>
                                <asp:ListItem Text="Shoulder Glide" Value="Value7"></asp:ListItem>
                                <asp:ListItem Text="Scapular Protraction" Value="Value8"></asp:ListItem>
                                <asp:ListItem Text="Rowing" Value="Value9"></asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <td>Notes for Patient:</td>
                        <td>
                            <textarea id="PatientNotes" cols="20" name="S1" rows="2"></textarea></td>
                    </tr>
                    <tr>
                        <td>Notes for Physical Therapist:</td>
                        <td>
                            <textarea id="TherapistNotes" cols="20" name="S2" rows="2"></textarea></td>
                    </tr>
                    <tr>
                        <td><asp:Button ID="SubmitButton" runat="server" Text="Submit" />
                            <asp:Button ID="ResetButton" runat="server" Text="Reset" />
                        </td>
                    </tr>
                </table>
        </div>
    </form>
</body>
</html>
