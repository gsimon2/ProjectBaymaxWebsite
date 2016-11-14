<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ManagePatients.aspx.vb" Inherits="ManagePatients" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Workout Plan - Orthopaedic Exercise System</title>

    <!--**the following is needed for the calendar popup**-->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function(){
                $("#datepicker").datepicker({
                        altField: "#alternate",
                });
            });
        </script>
    <!--**-->

    <!--**the following is needed for the prompts during checkbox selection-->
    <script language="javascript" type="text/javascript">
    function ShowHideTextBox(chk,sets,reps,rom, weight){
        var setsvar = document.getElementById(sets);
        var setstext = "Sets: <input size=4 style=\"border-color:green\" type=\"text\" name=\"SetsTextBox\" />";
        var repsvar = document.getElementById(reps);
        var repstext = "Reps: <input size=4 style=\"border-color:crimson\" type=\"text\" name=\"RepsTextBox\" />";
        var romvar = document.getElementById(rom);
        var romtext = "Max range of motion: <input size=4 style=\"border-color:mediumblue\" type=\"text\" name=\"ROMTextBox\" />";
        var weightvar = document.getElementById(weight);
        var weighttext = "Weight: <input size=4 style=\"border-color:darkorchid\" type=\"text\" name=\"WeightTextBox\" />";

        if (chk.checked){
            setsvar.innerHTML = setstext;
            repsvar.innerHTML = repstext;
            romvar.innerHTML = romtext;
            weightvar.innerHTML = weighttext;
        }
        else{
            setsvar.innerHTML = "";
            repsvar.innerHTML = "";
            romvar.innerHTML = "";
            weightvar.innerHTML = "";
        }
    }
    </script>
    <!--**-->

    <style>
        p {padding-left:10px}
        body{height:100%;margin:0;padding:0;background-image:url("Images/background_bgwave.jpg");background-repeat:repeat-y;background-size:100%}
        #entire{width:1000px; margin:50px auto 0 auto; font-family:'Franklin Gothic Medium'}
        #header{height:140px; width : 1000px; background-color:cornflowerblue; border:ridge;border-color:mediumseagreen}
        #header h1{font-size:60px; text-align:center}
        #leftpanel{width:200px; height:700px; float:left; background-color:palegreen;border:ridge; border-color:mediumseagreen}
        #leftpanel p{margin-top:50px}
        #leftpanel li a{color:cornflowerblue}
        #pagecontent{height : 770px; width : 764px; float:left; background-color:lightblue;border:ridge; border-color:mediumseagreen}
        #workoutform{margin-top:50px;margin-left:40px;float:left}
        #checkboxes span{font-size:smaller;font-style:italic}
        #footer{float:left; height:80px; width:1000px; margin-top:20px; background-color:mediumseagreen; border:ridge;border-color:mediumseagreen}
        .auto-style1{width: 200px}
        a:hover{background-color: yellow}
    </style>
</head>

<body>
    <div id="entire">
        <div id="header">
            <h1>Orthopaedic Exercise System</h1>
        </div>
        <br/>

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
            <form id="form1" runat="server">
                <div id="workoutform">
                    <table cellpadding="8px" style="width:725px">
                        <col width="174">
                        <col width="500">
                        <tr>
                            <td>Patient Name:</td>
                            <td><asp:TextBox ID="NameText" runat="server" Width="240px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Patient Login Number:</td>
                            <td><asp:TextBox ID="NumberText" runat="server" Width="240px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Date-Time Prescription Entered (MM/DD/YYYY):</td>
                            <td><input type="text" id="datepicker" runat="server" style="width:240px"></td>
                                <!--<asp:TextBox ID="TextBox1" runat="server" Width="240px"></asp:TextBox>-->
                            </td>
                        </tr>
                        <tr>
                            <td style="position:absolute">Exercises to be Performed:</td>
                            <td>
                                <div id="checkboxes">
                                    <input id="Checkbox1" type="checkbox" onclick="ShowHideTextBox(this, 'Sets1', 'Reps1', 'ROM1', 'Weight1')" />Supraspinatus
                                    <br /><span id="Sets1" style="color:green"></span>&nbsp;<span id="Reps1" style="color:crimson"></span>&nbsp;<span id="ROM1" style="color:mediumblue"></span>&nbsp;<span id="Weight1" style="color:darkorchid"></span>
                                    <br />
                                    <input id="Checkbox2" type="checkbox" onclick="ShowHideTextBox(this, 'Sets2', 'Reps2', 'ROM2', 'Weight2')" />Infraspinatus
                                    <br /><span id="Sets2" style="color:green"></span>&nbsp;<span id="Reps2" style="color:crimson"></span>&nbsp;<span id="ROM2" style="color:mediumblue"></span>&nbsp;<span id="Weight2" style="color:darkorchid"></span>
                                    <br />
                                    <input id="Checkbox3" type="checkbox" onclick="ShowHideTextBox(this, 'Sets3', 'Reps3', 'ROM3', 'Weight3')" />Teres Minor
                                    <br /><span id="Sets3" style="color:green"></span>&nbsp;<span id="Reps3" style="color:crimson"></span>&nbsp;<span id="ROM3" style="color:mediumblue"></span>&nbsp;<span id="Weight3" style="color:darkorchid"></span>
                                    <br />
                                    <input id="Checkbox4" type="checkbox" onclick="ShowHideTextBox(this, 'Sets4', 'Reps4', 'ROM4', 'Weight4')" />Subscapularis
                                    <br /><span id="Sets4" style="color:green"></span>&nbsp;<span id="Reps4" style="color:crimson"></span>&nbsp;<span id="ROM4" style="color:mediumblue"v></span>&nbsp;<span id="Weight4" style="color:darkorchid"></span>
                                    <br />
                                    <input id="Checkbox5" type="checkbox" onclick="ShowHideTextBox(this, 'Sets5', 'Reps5', 'ROM5', 'Weight5')" />Shoulder Flexion
                                    <br /><span id="Sets5" style="color:green"></span>&nbsp;<span id="Reps5" style="color:crimson"></span>&nbsp;<span id="ROM5" style="color:mediumblue"></span>&nbsp;<span id="Weight5" style="color:darkorchid"></span>
                                    <br />
                                    <input id="Checkbox6" type="checkbox" onclick="ShowHideTextBox(this, 'Sets6', 'Reps6', 'ROM6', 'Weight6')" />Shoulder Extension
                                    <br /><span id="Sets6" style="color:green"></span>&nbsp;<span id="Reps6" style="color:crimson"></span>&nbsp;<span id="ROM6" style="color:mediumblue"></span>&nbsp;<span id="Weight6" style="color:darkorchid"></span>
                                    <br />
                                    <input id="Checkbox7" type="checkbox" onclick="ShowHideTextBox(this, 'Sets7', 'Reps7', 'ROM7', 'Weight7')" />Shoulder Glide
                                    <br /><span id="Sets7" style="color:green"></span>&nbsp;<span id="Reps7" style="color:crimson"></span>&nbsp;<span id="ROM7" style="color:mediumblue"></span>&nbsp;<span id="Weight7" style="color:darkorchid"></span>
                                    <br />
                                    <input id="Checkbox8" type="checkbox" onclick="ShowHideTextBox(this, 'Sets8', 'Reps8', 'ROM8', 'Weight8')" />Scapular Protraction
                                    <br /><span id="Sets8" style="color:green"></span>&nbsp;<span id="Reps8" style="color:crimson"></span>&nbsp;<span id="ROM8" style="color:mediumblue"></span>&nbsp;<span id="Weight8" style="color:darkorchid"></span>
                                    <br />
                                    <input id="Checkbox9" type="checkbox" onclick="ShowHideTextBox(this, 'Sets9', 'Reps9', 'ROM9', 'Weight9')" />Rowing
                                    <br /><span id="Sets9" style="color:green"></span>&nbsp;<span id="Reps9" style="color:crimson"></span>&nbsp;<span id="ROM9" style="color:mediumblue"></span>&nbsp;<span id="Weight9" style="color:darkorchid"></span>
                                    <br />  
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Notes for Patient:</td>
                            <td>
                                <textarea id="PatientNotes" cols="20" name="S1" rows="2" style="width: 240px"></textarea></td>
                        </tr>
                        <tr>
                            <td>Notes for Physical Therapist:</td>
                            <td>
                                <textarea id="TherapistNotes" cols="20" name="S2" rows="2" style="width: 240px"></textarea></td>
                        </tr>
                        <tr>
                            <td><asp:Button ID="SubmitButton" runat="server" Text="Submit" />
                                <asp:Button ID="ResetButton" runat="server" Text="Reset" />
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
        <div id="footer" style="text-align:center">
            <asp:Image ID="Panther_Logo" runat="server" ImageUrl="~/Images/Panther_Logo.png" ImageAlign="Middle" Height="76px" BorderWidth="2px"/>
            <asp:Image ID="GLCE_Logo" runat="server" ImageUrl="~/Images/GLCE_logo.jpg" Height="76px" ImageAlign="Middle" BorderWidth="2px" />
        </div>
    </div>
</body>
</html>
