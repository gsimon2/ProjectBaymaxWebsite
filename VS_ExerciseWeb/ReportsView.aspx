<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ReportsView.aspx.vb" Inherits="ReportsView" %>

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

    <style>
        p {padding-left:10px}
        #header{height:100px}
        #header h1{font-size:40px;font-family:'Franklin Gothic Medium';text-align: center}
        #navigation{width:200px;padding-top:8px;height:400px;background-color:powderblue;margin-top:50px;font-family:'Franklin Gothic Medium';float:left}
        #query{margin-top:50px;margin-left:230px;font-family:'Franklin Gothic Medium';float:left}
        #reportlist{margin-top:50px;margin-left:60px;font-family:'Franklin Gothic Medium';float:left}
        .auto-style1 {
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
            <li><a href="NewPatient.aspx">Create New Patient</a></li>
            <li><a href="ManagePatients.aspx">Assign Workout Plan</a></li>
            <li><a href="ReportsView.aspx">View Reports</a></li>
            <li><a href="PostLogon.aspx">Back to Home</a></li>
            <li><a href="WelcomePage.aspx">Sign Out</a></li>
        </ul>
    </div>

    <form id="form1" runat="server">

        <div id="query">
            <fieldset style="width: 400px" dir="ltr">
                <legend class="auto-style2">Report Query:</legend>
                <table width="400px">
                    <tr>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="150px">
                                <asp:ListItem>User ID</asp:ListItem>
                                <asp:ListItem>First Name</asp:ListItem>
                                <asp:ListItem>Last Name</asp:ListItem>
                                <asp:ListItem>Group Affiliation</asp:ListItem>
                                <asp:ListItem>Email address</asp:ListItem>
                                <asp:ListItem>Date Entered (MM/DD/YYYY)</asp:ListItem>
                            </asp:DropDownList>
                            </td>
                        <td>
                            <input type="text" name="userid_search" class="auto-style1"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server" Width="150px">
                                <asp:ListItem>First Name</asp:ListItem>
                                <asp:ListItem>Last Name</asp:ListItem>
                                <asp:ListItem>Group Affiliation</asp:ListItem>
                                <asp:ListItem>Email address</asp:ListItem>
                                <asp:ListItem>Date Entered (MM/DD/YYYY)</asp:ListItem>
                                <asp:ListItem>User ID</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <input type="text" name="firstname_search" class="auto-style1"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="DropDownList3" runat="server" Width="150px">
                                <asp:ListItem>Last Name</asp:ListItem>
                                <asp:ListItem>Group Affiliation</asp:ListItem>
                                <asp:ListItem>Email address</asp:ListItem>
                                <asp:ListItem>Date Entered (MM/DD/YYYY)</asp:ListItem>
                                <asp:ListItem>User ID</asp:ListItem>
                                <asp:ListItem>First Name</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <input type="text" name="lastname_search" class="auto-style1"/></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="DropDownList4" runat="server" Width="150px">
                                <asp:ListItem>Group Affiliation</asp:ListItem>
                                <asp:ListItem>Email address</asp:ListItem>
                                <asp:ListItem>Date Entered (MM/DD/YYYY)</asp:ListItem>
                                <asp:ListItem>User ID</asp:ListItem>
                                <asp:ListItem>First Name</asp:ListItem>
                                <asp:ListItem>Last Name</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <input type="text" name="group_search" class="auto-style1"/></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="DropDownList5" runat="server" Width="150px">
                                <asp:ListItem>Email address</asp:ListItem>
                                <asp:ListItem>Date Entered (MM/DD/YYYY)</asp:ListItem>
                                <asp:ListItem>User ID</asp:ListItem>
                                <asp:ListItem>First Name</asp:ListItem>
                                <asp:ListItem>Last Name</asp:ListItem>
                                <asp:ListItem>Group Affiliation</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <input type="email" name="email_search" class="auto-style1"/></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="DropDownList6" runat="server" Width="150px">
                                <asp:ListItem>Date Entered (MM/DD/YYYY)</asp:ListItem>
                                <asp:ListItem>User ID</asp:ListItem>
                                <asp:ListItem>First Name</asp:ListItem>
                                <asp:ListItem>Last Name</asp:ListItem>
                                <asp:ListItem>Group Affiliation</asp:ListItem>
                                <asp:ListItem>Email address</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <!--<input type="text" name="date_search" class="auto-style1"/></td>-->
                            <input type="text" id="datepicker" class="auto-style1"></td>
                    </tr>
                </table>
                <br>
                <input type=button value='Submit' style="font-family:'Franklin Gothic Medium'"/>
                <br><!--onClick="location.href='WelcomePage.aspx'"-->
            </fieldset>
        </div>

        <div id="reportlist">
            <asp:Table ID="Table1" runat="server" BorderWidth="5px" CellPadding="5" GridLines="Both" Visible="true" Caption="Example Only">
                <asp:TableRow runat="server" Font-Bold="True">
                    <asp:TableCell runat="server">User ID</asp:TableCell>
                    <asp:TableCell runat="server">First Name</asp:TableCell>
                    <asp:TableCell runat="server">Last Name</asp:TableCell>
                    <asp:TableCell runat="server">Group Affiliation</asp:TableCell>
                    <asp:TableCell runat="server">Email Address:</asp:TableCell>
                    <asp:TableCell runat="server">Date Prescribed</asp:TableCell>
                    <asp:TableCell runat="server">Percentage Completed</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">mmouse</asp:TableCell>
                    <asp:TableCell runat="server">Mickey</asp:TableCell>
                    <asp:TableCell runat="server">Mouse</asp:TableCell>
                    <asp:TableCell runat="server">Walt Disney</asp:TableCell>
                    <asp:TableCell runat="server">mmouse@dworld.com</asp:TableCell>
                    <asp:TableCell runat="server">11/06/16</asp:TableCell>
                    <asp:TableCell runat="server">100%</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>

</body>
</html>
