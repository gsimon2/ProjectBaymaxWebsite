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
    function ShowHideTextBox(chk,sets,reps,rom){
        var setsvar = document.getElementById(sets);
        var setstext = "Sets: <input size=4 type=\"text\" name=\"SetsTextBox\" />";
        var repsvar = document.getElementById(reps);
        var repstext = "Reps: <input size=4 type=\"text\" name=\"RepsTextBox\" />";
        var romvar = document.getElementById(rom);
        var romtext = "Range of motion: <input size=4 type=\"text\" name=\"ROMTextBox\" />";

        if (chk.checked){
            setsvar.innerHTML = setstext;
            repsvar.innerHTML = repstext;
            romvar.innerHTML = romtext;
        }
        else{
            setsvar.innerHTML = "";
            repsvar.innerHTML = "";
            romvar.innerHTML = "";
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
        #pagecontent{height : 700px; width : 764px; margin-left:20px; float:left; background-color:lightblue;border:ridge; border-color:mediumseagreen}
        #workoutform{margin-top:50px;margin-left:180px;float:left}
        #checkboxes{font-size:smaller}
        #footer{float:left; height:80px; width:1000px; margin-top:20px; background-color:mediumseagreen; border:ridge;border-color:mediumseagreen}
        .auto-style1{width: 200px}
        a:hover{background-color: yellow}
    </style>
</head>

<body>
    <div id="entire">
        <div id="header">
            <br/>
            <h1>Shoulder Exercise System</h1>
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
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                <!--should be: <input type="text" id="datepicker">
                                    but it needs to only show the datepicker if that is the "type" in the drop-down-->
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
        </div>
        <div id="footer" style="text-align:center">
            <asp:Image ID="Panther_Logo" runat="server" ImageUrl="~/Images/Panther_Logo.png" ImageAlign="Middle" Height="76px" BorderWidth="2px"/>
            <asp:Image ID="GLCE_Logo" runat="server" ImageUrl="~/Images/GLCE_logo.jpg" Height="76px" ImageAlign="Middle" BorderWidth="2px" />
        </div>
    </div>
</body>
</html>
