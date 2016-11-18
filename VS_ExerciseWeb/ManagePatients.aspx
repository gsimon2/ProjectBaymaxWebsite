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
        a:hover{background-color: yellow}
        #form1 {
            height: 1162px;
        }
        .auto-style4 {
            color: #FF0000;
        }
        .auto-style5 {
            width: 201px;
        }
        .auto-style6 {
            position: absolute;
            width: 201px;
        }
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
                            <td class="auto-style5">Filter by First Patient Name:</td>
                            <td><asp:TextBox ID="NameText" runat="server" Width="240px" AutoPostBack="True"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Select a Patient: <span class="auto-style4">*</span></td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Date-Time Prescription Entered (MM/DD/YYYY): <span class="auto-style4">*</span></td>
                            <td><input type="text" id="datepicker" runat="server" style="width:240px"></td>
                                <!--<asp:TextBox ID="TextBox1" runat="server" Width="240px"></asp:TextBox>-->
                            
                        </tr>
                        <tr>
                            <td class="auto-style6">Exercises to be Performed: <span class="auto-style4">*</span></td>
                            <td>
                                 
                                <div id="checkboxes">
                                    <asp:CheckBox runat = "server" id="Checkbox1"  OnCheckedChanged="Checkbox1_CheckedChanged" type="checkbox"  AutoPostBack="True" />Supraspinatus
                                    <br />
                                    <asp:Label ID="Sets1" runat="server" ForeColor="#006600" Text="Sets" Visible="False"></asp:Label>
                                    <asp:TextBox ID="Sets1Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Reps1" runat="server"  style="color:crimson" Visible="False">Reps</asp:Label>&nbsp;
                                    <asp:TextBox ID="Reps1Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="ROM1" runat="server"  style="color:mediumblue" Visible="False">Max RoM</asp:Label>&nbsp;
                                    <asp:TextBox ID="ROM1Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Weight1" runat="server"  style="color:darkorchid" Visible="False">Weight</asp:Label>&nbsp;
                                    <asp:TextBox ID="Weight1Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <br />

                                    <asp:CheckBox runat = "server" id="Checkbox2"  OnCheckedChanged="Checkbox2_CheckedChanged" type="checkbox"  AutoPostBack="True" />Infraspinatus
                                    <br />
                                    <asp:Label ID="Sets2" runat="server" ForeColor="#006600" Text="Sets" Visible="False"></asp:Label>
                                    <asp:TextBox ID="Sets2Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Reps2" runat="server"  style="color:crimson" Visible="False">Reps</asp:Label>&nbsp;
                                    <asp:TextBox ID="Reps2Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="ROM2" runat="server"  style="color:mediumblue" Visible="False">Max RoM</asp:Label>&nbsp;
                                    <asp:TextBox ID="ROM2Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Weight2" runat="server"  style="color:darkorchid" Visible="False">Weight</asp:Label>&nbsp;
                                    <asp:TextBox ID="Weight2Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <br />

                                    <asp:CheckBox runat = "server" id="Checkbox3"  OnCheckedChanged="Checkbox3_CheckedChanged" type="checkbox"  AutoPostBack="True" />Teres Minor
                                    <br />
                                    <asp:Label ID="Sets3" runat="server" ForeColor="#006600" Text="Sets" Visible="False"></asp:Label>
                                    <asp:TextBox ID="Sets3Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Reps3" runat="server"  style="color:crimson" Visible="False">Reps</asp:Label>&nbsp;
                                    <asp:TextBox ID="Reps3Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="ROM3" runat="server"  style="color:mediumblue" Visible="False">Max RoM</asp:Label>&nbsp;
                                    <asp:TextBox ID="ROM3Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Weight3" runat="server"  style="color:darkorchid" Visible="False">Weight</asp:Label>&nbsp;
                                    <asp:TextBox ID="Weight3Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <br />

                                    <asp:CheckBox runat = "server" id="Checkbox4"  OnCheckedChanged="Checkbox4_CheckedChanged" type="checkbox"  AutoPostBack="True" />Subscapularis
                                    <br />
                                    <asp:Label ID="Sets4" runat="server" ForeColor="#006600" Text="Sets" Visible="False"></asp:Label>
                                    <asp:TextBox ID="Sets4Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Reps4" runat="server"  style="color:crimson" Visible="False">Reps</asp:Label>&nbsp;
                                    <asp:TextBox ID="Reps4Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="ROM4" runat="server"  style="color:mediumblue" Visible="False">Max RoM</asp:Label>&nbsp;
                                    <asp:TextBox ID="ROM4Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Weight4" runat="server"  style="color:darkorchid" Visible="False">Weight</asp:Label>&nbsp;
                                    <asp:TextBox ID="Weight4Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <br />

                                    <asp:CheckBox runat = "server" id="Checkbox5"  OnCheckedChanged="Checkbox5_CheckedChanged" type="checkbox"  AutoPostBack="True" />Shoulder Flexion
                                    <br />
                                    <asp:Label ID="Sets5" runat="server" ForeColor="#006600" Text="Sets" Visible="False"></asp:Label>
                                    <asp:TextBox ID="Sets5Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Reps5" runat="server"  style="color:crimson" Visible="False">Reps</asp:Label>&nbsp;
                                    <asp:TextBox ID="Reps5Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="ROM5" runat="server"  style="color:mediumblue" Visible="False">Max RoM</asp:Label>&nbsp;
                                    <asp:TextBox ID="ROM5Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Weight5" runat="server"  style="color:darkorchid" Visible="False">Weight</asp:Label>&nbsp;
                                    <asp:TextBox ID="Weight5Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <br />

                                    <asp:CheckBox runat = "server" id="Checkbox6"  OnCheckedChanged="Checkbox6_CheckedChanged" type="checkbox"  AutoPostBack="True" />Shoulder Extension
                                    <br />
                                    <asp:Label ID="Sets6" runat="server" ForeColor="#006600" Text="Sets" Visible="False"></asp:Label>
                                    <asp:TextBox ID="Sets6Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Reps6" runat="server"  style="color:crimson" Visible="False">Reps</asp:Label>&nbsp;
                                    <asp:TextBox ID="Reps6Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="ROM6" runat="server"  style="color:mediumblue" Visible="False">Max RoM</asp:Label>&nbsp;
                                    <asp:TextBox ID="ROM6Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Weight6" runat="server"  style="color:darkorchid" Visible="False">Weight</asp:Label>&nbsp;
                                    <asp:TextBox ID="Weight6Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <br />

                                    <asp:CheckBox runat = "server" id="Checkbox7"  OnCheckedChanged="Checkbox7_CheckedChanged" type="checkbox"  AutoPostBack="True" />Shoulder Glide
                                    <br />
                                    <asp:Label ID="Sets7" runat="server" ForeColor="#006600" Text="Sets" Visible="False"></asp:Label>
                                    <asp:TextBox ID="Sets7Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Reps7" runat="server"  style="color:crimson" Visible="False">Reps</asp:Label>&nbsp;
                                    <asp:TextBox ID="Reps7Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="ROM7" runat="server"  style="color:mediumblue" Visible="False">Max RoM</asp:Label>&nbsp;
                                    <asp:TextBox ID="ROM7Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Weight7" runat="server"  style="color:darkorchid" Visible="False">Weight</asp:Label>&nbsp;
                                    <asp:TextBox ID="Weight7Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <br />

                                    <asp:CheckBox runat = "server" id="Checkbox8"  OnCheckedChanged="Checkbox8_CheckedChanged" type="checkbox"  AutoPostBack="True" />Scapular Protraction
                                    <br />
                                    <asp:Label ID="Sets8" runat="server" ForeColor="#006600" Text="Sets" Visible="False"></asp:Label>
                                    <asp:TextBox ID="Sets8Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Reps8" runat="server"  style="color:crimson" Visible="False">Reps</asp:Label>&nbsp;
                                    <asp:TextBox ID="Reps8Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="ROM8" runat="server"  style="color:mediumblue" Visible="False">Max RoM</asp:Label>&nbsp;
                                    <asp:TextBox ID="ROM8Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Weight8" runat="server"  style="color:darkorchid" Visible="False">Weight</asp:Label>&nbsp;
                                    <asp:TextBox ID="Weight8Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <br />

                                    <asp:CheckBox runat = "server" id="Checkbox9"  OnCheckedChanged="Checkbox9_CheckedChanged" type="checkbox"  AutoPostBack="True" />Rowing
                                    <br />
                                    <asp:Label ID="Sets9" runat="server" ForeColor="#006600" Text="Sets" Visible="False"></asp:Label>
                                    <asp:TextBox ID="Sets9Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Reps9" runat="server"  style="color:crimson" Visible="False">Reps</asp:Label>&nbsp;
                                    <asp:TextBox ID="Reps9Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="ROM9" runat="server"  style="color:mediumblue" Visible="False">Max RoM</asp:Label>&nbsp;
                                    <asp:TextBox ID="ROM9Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <asp:Label id="Weight9" runat="server"  style="color:darkorchid" Visible="False">Weight</asp:Label>&nbsp;
                                    <asp:TextBox ID="Weight9Text" runat="server" Width="40px" Visible="False"></asp:TextBox>
                                    <br />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Notes for Patient:</td>
                            <td>
                                <asp:TextBox id="PatientNotes" runat="server" cols="20" name="S1" rows="2" TextMode="multiline"  style="width: 240px"></asp:TextBox>
                        </tr>
                        <tr>
                            <td class="auto-style5">Notes for Physical Therapist:</td>
                            <td>
                                <asp:TextBox id="TherapistNotes" runat="server" cols="20" name="S1" rows="2" TextMode="multiline"  style="width: 240px"></asp:TextBox>
                        </tr>
                        <tr>
                            <td class="auto-style5"><asp:Button ID="Button1" runat="server" Text="Submit" Visible="False" />
                                <asp:Button ID="SubmitButton" runat="server" Text="Submit" />
                                <asp:Button ID="ResetButton" runat="server" Text="Reset" Enabled="False" Visible="False" />
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
