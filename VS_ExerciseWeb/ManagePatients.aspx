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
                });
            });
        </script>
    <!--**-->

    <!--**the following is needed for the prompts during checkbox selection-->
    <script language="javascript" type="text/javascript">
    function ShowHideTextBox(chk,sets,reps,rom)
    {
        var setsvar = document.getElementById(sets);
        var setstext = "Sets: <input size=4 type=\"text\" name=\"SetsTextBox\" />";
        var repsvar = document.getElementById(reps);
        var repstext = "Reps: <input size=4 type=\"text\" name=\"RepsTextBox\" />";
        var romvar = document.getElementById(rom);
        var romtext = "Range of motion: <input size=4 type=\"text\" name=\"ROMTextBox\" />";

        if (chk.checked) {
            setsvar.innerHTML = setstext;
            repsvar.innerHTML = repstext;
            romvar.innerHTML = romtext;
        }
        else {
            setsvar.innerHTML = "";
            repsvar.innerHTML = "";
            romvar.innerHTML = "";
        }
    }
    </script>
    <!--**-->

    <style>
        p {padding-left:10px}
        #header{height:100px}
        #header h1{font-size:40px;font-family:'Franklin Gothic Medium';text-align: center}
        #navigation{width:200px;padding-top:8px;height:400px;background-color:powderblue;margin-top:50px;font-family:'Franklin Gothic Medium';float:left}
        #workoutform{margin-top:50px;margin-left:180px;font-family:'Franklin Gothic Medium';float:left}
        #checkboxes{font-size:smaller;font-family:'Franklin Gothic'}
    </style>
</head>

<body background="Images/background_bluegreen.jpeg"/>

    <div id="header">
        <asp:Image ID="Panther_Logo" runat="server" ImageUrl="~/Images/Panther_Logo.png" ImageAlign="Left" Height="100px" BorderWidth="2px"/>
        <asp:Image ID="GLCE_Logo" runat="server" ImageUrl="~/Images/GLCE_logo.jpg" Height="100px" ImageAlign="Right" BorderWidth="2px" />
        <br/>
        <h1>Shoulder Exercise<br>System</h1>
    </div>
    <br/>

    <div id="navigation">
        <p><strong>Navigation</strong></p> 
        <ul>
            <li><a href="NewPatient.aspx">Create New Patient</a></li>
            <li><a href="ManagePatients.aspx">Assign Workout Plan</a></li>
            <li><a href="ReportsView.aspx">View Reports</a></li>
            <li><a href="PostLogon.aspx">Back to Home</a></li>
            <li><a href="WelcomePage.aspx">Sign Out</a></li>
        </ul>
    </div>

    <form id="form1" runat="server">

        <div id="workoutform">
                <table style=border="1">
                    <!--<caption><b>Patient Information</b></caption>-->
                    <col width="200">
                    <col width="500">
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
                            <div id="checkboxes">
                                <input id="Checkbox1" type="checkbox" onclick="ShowHideTextBox(this,'Sets1','Reps1','ROM1')" />Supraspinatus
                                <br /><span id="Sets1"></span>&nbsp;<span id="Reps1"></span>&nbsp;<span id="ROM1"></span>
                                <br />
                                <input id="Checkbox2" type="checkbox" onclick="ShowHideTextBox(this, 'Sets2', 'Reps2', 'ROM2')" />Infraspinatus
                                <br /><span id="Sets2"></span>&nbsp;<span id="Reps2"></span>&nbsp;<span id="ROM2"></span>
                                <br />
                                <input id="Checkbox3" type="checkbox" onclick="ShowHideTextBox(this, 'Sets3', 'Reps3', 'ROM3')" />Teres Minor
                                <br /><span id="Sets3"></span>&nbsp;<span id="Reps3"></span>&nbsp;<span id="ROM3"></span>
                                <br />
                                <input id="Checkbox4" type="checkbox" onclick="ShowHideTextBox(this, 'Sets4', 'Reps4', 'ROM4')" />Subscapularis
                                <br /><span id="Sets4"></span>&nbsp;<span id="Reps4"></span>&nbsp;<span id="ROM4"></span>
                                <br />
                                <input id="Checkbox5" type="checkbox" onclick="ShowHideTextBox(this, 'Sets5', 'Reps5', 'ROM5')" />Shoulder Flexion
                                <br /><span id="Sets5"></span>&nbsp;<span id="Reps5"></span>&nbsp;<span id="ROM5"></span>
                                <br />
                                <input id="Checkbox6" type="checkbox" onclick="ShowHideTextBox(this, 'Sets6', 'Reps6', 'ROM6')" />Shoulder Extension
                                <br /><span id="Sets6"></span>&nbsp;<span id="Reps6"></span>&nbsp;<span id="ROM6"></span>
                                <br />
                                <input id="Checkbox7" type="checkbox" onclick="ShowHideTextBox(this, 'Sets7', 'Reps7', 'ROM7')" />Shoulder Glide
                                <br /><span id="Sets7"></span>&nbsp;<span id="Reps7"></span>&nbsp;<span id="ROM7"></span>
                                <br />
                                <input id="Checkbox8" type="checkbox" onclick="ShowHideTextBox(this, 'Sets8', 'Reps8', 'ROM8')" />Scapular Protraction
                                <br /><span id="Sets8"></span>&nbsp;<span id="Reps8"></span>&nbsp;<span id="ROM8"></span>
                                <br />
                                <input id="Checkbox9" type="checkbox" onclick="ShowHideTextBox(this, 'Sets9', 'Reps9', 'ROM9')" />Rowing
                                <br /><span id="Sets9"></span>&nbsp;<span id="Reps9"></span>&nbsp;<span id="ROM9"></span>
                                <br />  
                            </div>
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
