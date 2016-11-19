<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ReportsView.aspx.vb" Inherits="ReportsView" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reports - Orthopaedic Exercise System</title>

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
        #query{margin-top:13px; margin-left:170px; float:left; width: 733px}
        #reportlist{margin-top:50px;float:left}
        #footer{float:left; height:80px; width:1000px; margin-top:20px; background-color:mediumseagreen; border:ridge;border-color:mediumseagreen}
        .auto-style1{width: 250px}
        .auto-style2{width: 160px}
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
                <div id="query">
                    <fieldset style="width: 430px" dir="ltr">
                        <legend align="center">Report Query:</legend>
                        <table width="430px">
                            <tr>
                                <td class="auto-style2">User ID:
                                    <!--<asp:DropDownList ID="DropDownList1" runat="server" Width="150px">
                                        <asp:ListItem>User ID</asp:ListItem>
                                        <asp:ListItem>First Name</asp:ListItem>
                                        <asp:ListItem>Last Name</asp:ListItem>
                                        <asp:ListItem>Group Affiliation</asp:ListItem>
                                        <asp:ListItem>Email address</asp:ListItem>
                                        <asp:ListItem>Date Entered (MM/DD/YYYY)</asp:ListItem>
                                    </asp:DropDownList>-->
                                    </td>
                                <td>
                                    <input type="text" name="userid_search" class="auto-style1"/>
                                </td>
                            </tr>
                            <tr>
                                <td>First Name:</td>
                                <td>
                                    <input type="text" name="firstname_search" class="auto-style1"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Last Name:</td>
                                <td>
                                    <input type="text" name="lastname_search" class="auto-style1"/></td>
                            </tr>
                            <tr>
                                <td>Group Affiliation:</td>
                                <td>
                                    <input type="text" name="group_search" class="auto-style1"/></td>
                            </tr>
                            <tr>
                                <td>Email address:</td>
                                <td>
                                    <input type="email" name="email_search" class="auto-style1"/></td>
                            </tr>
                            <tr>
                                <td>Date Entered (MM/DD/YYYY):</td>
                                <td>
                                    <!--<input type="text" name="date_search" class="auto-style1"/></td>-->
                                    <input type="text" id="datepicker" class="auto-style1"></td>
                            </tr>
                        </table>
                        <p style="text-align: center"><input type=button value='Submit'/></p>
                        <!--onClick="location.href='WelcomePage.aspx'"-->
                    </fieldset>
                    <br/>
                </div>
                <div id="reportviewer">
                    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" style="margin-left: 0px" Width="929px">
                        <LocalReport ReportPath="PrescribedWorkouts.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetData" TypeName="DataSetTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="ProjectBaymax_DbDataSetTableAdapters.Prescribed_WorkoutsTableAdapter"></asp:ObjectDataSource>
                 </div>       

                    
                

                <div id="reportlist">
                </div>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            </form>
        </div>

        <div id="footer" style="text-align:center">
            <asp:Image ID="Panther_Logo" runat="server" ImageUrl="~/Images/Panther_Logo.png" ImageAlign="Middle" Height="76px" BorderWidth="2px"/>
            <asp:Image ID="GLCE_Logo" runat="server" ImageUrl="~/Images/GLCE_logo.jpg" Height="76px" ImageAlign="Middle" BorderWidth="2px" />
        </div>
    </div>

</body>
</html>
