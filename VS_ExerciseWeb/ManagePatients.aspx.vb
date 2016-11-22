Imports System.Data.SqlClient
Partial Class ManagePatients
    Inherits System.Web.UI.Page
    Dim WebsiteName As String = "ProjectBaymax.com"


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        On Error GoTo Page_Load_Error

        'This keeps the page from jumping back to the top on post backs
        Page.MaintainScrollPositionOnPostBack = True

        'First change to make sure that user data is available
        If CType(Session.Item("UserID"), String) = "" Then
            Server.Transfer("WelcomePage.aspx", True)
        End If

        If DropDownList1.Items.Count = 0 Then
            UpdateDropDown()
        End If


Page_Load_Exit:
        On Error GoTo 0
        Exit Sub
Page_Load_Error:
        MsgBox("Error: " & Err.Description, MsgBoxStyle.Information, WebsiteName + " - Manage Patients")
        Resume Page_Load_Exit

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        On Error GoTo DropDownList1_SelectedIndexChanged_Error
        Dim strSelectedItem As String

        SetPatientUserID(DropDownList1.SelectedValue)

DropDownList1_SelectedIndexChanged_Exit:
        On Error GoTo 0
        Exit Sub
DropDownList1_SelectedIndexChanged_Error:
        MsgBox("Error: " & Err.Description, MsgBoxStyle.Information, WebsiteName + " - Manage Patients")
        Resume DropDownList1_SelectedIndexChanged_Exit


    End Sub

    Protected Sub NameText_TextChanged(sender As Object, e As EventArgs) Handles NameText.TextChanged
        On Error GoTo NameText_TextChanged_Error

        UpdateDropDown()

NameText_TextChanged_Exit:
        On Error GoTo 0
        Exit Sub
NameText_TextChanged_Error:
        MsgBox("Error: " & Err.Description, MsgBoxStyle.Information, WebsiteName + " - Manage Patients")
        Resume NameText_TextChanged_Exit
    End Sub

    Protected Sub UpdateDropDown()
        On Error GoTo UpdateDropDown_Error
        Dim con As New SqlConnection
        Dim strCon As String = "Server=tcp:projectbaymax.database.windows.net,1433;Initial Catalog=ProjectBaymax_Db;Persist Security Info=False;User ID=Application_Login;Password=GrantMeAccess11;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
        Dim cmd As New SqlCommand
        Dim rd As SqlDataReader

        Dim strListItem As String = ""
        Dim i As Integer = 0

        'Connection to SQL Server
        con.ConnectionString = strCon
        cmd.Connection = con
        con.Open()

        DropDownList1.Items.Clear()

        'Populate Drop down box of patients in current group
        If NameText.Text = "" Then
            cmd.CommandText = "SELECT * FROM Demographics WHERE OrganizationID = '" + CType(Session.Item("UserGroup"), String) + "'"
        Else
            cmd.CommandText = "SELECT * FROM Demographics WHERE OrganizationID = '" + CType(Session.Item("UserGroup"), String) + "' AND FirstName = '" + NameText.Text + "'"
        End If
        rd = cmd.ExecuteReader
        If rd.HasRows Then
            Do While rd.Read
                strListItem = rd.GetValue(1).ToString() + " " + rd.GetValue(2).ToString() + " - " + rd.GetValue(0).ToString()
                DropDownList1.Items.Insert(i, strListItem)
                i += 1
            Loop
            DropDownList1.SelectedIndex() = 0
            SetPatientUserID(DropDownList1.SelectedValue)
        End If
        rd.Close()

UpdateDropDown_Exit:
        On Error GoTo 0
        Exit Sub
UpdateDropDown_Error:
        MsgBox("Error: " & Err.Description, MsgBoxStyle.Information, WebsiteName + " - Manage Patients")
        Resume UpdateDropDown_Exit

    End Sub

    Protected Sub SetPatientUserID(ByVal input As String)
        Session("PatientUserID") = input.Substring(input.LastIndexOf("-") + 1).Trim()
    End Sub

    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs) Handles SubmitButton1.Click
        On Error GoTo SubmitButton_Click_Error
        Dim con As New SqlConnection
        Dim strCon As String = "Server=tcp:projectbaymax.database.windows.net,1433;Initial Catalog=ProjectBaymax_Db;Persist Security Info=False;User ID=Application_Login;Password=GrantMeAccess11;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
        Dim cmd As New SqlCommand
        Dim rd As SqlDataReader

        Dim strInsertInto As String = "INSERT INTO Prescribed_Workouts("
        Dim strValues As String = " Values("
        Dim hold As String
        Dim i As Integer = 1
        Dim intWorkoutID As Integer
        Dim ExerciseAssigned As Boolean = False

        'Connection to SQL Server
        con.ConnectionString = strCon
        cmd.Connection = con
        con.Open()

        'Get Workout id for this new workout
        cmd.CommandText = "SELECT MAX(Workout_ID) FROM Prescribed_Workouts"
        rd = cmd.ExecuteReader
        If rd.HasRows Then
            rd.Read()
            intWorkoutID = rd.GetValue(0) + 1
            'MsgBox(intWorkoutID)
        End If
        rd.Close()

        'Auto assign todays date if one isn't picked
        If datepicker.Value = "" Then
            datepicker.Value = Now()
        End If

        'Build First couple non exercise related fields
        strInsertInto = strInsertInto + "[Recipient_ID], [Prescriber_ID], [Workout_ID], [Date_Assigned], "
        strValues = strValues + "'" + CType(Session.Item("PatientUserID"), String) + "', '" + CType(Session.Item("UserID"), String) + "', '" + Str(intWorkoutID) + "', '" + datepicker.Value + "', "


        'Iterater through check boxes and build sql command based off of their states
        For Each ctrl As Control In form1.Controls
            If TypeOf ctrl Is CheckBox Then
                'Always assign either true or false to the exercise_assigned field
                hold = "[Exercise_" + Trim(Str(i))
                strInsertInto = strInsertInto + hold + "_Assigned], "
                If DirectCast(ctrl, CheckBox).Checked Then
                    'If the exercise is assigned, the sets, reps, ROM, and weight have to be appended as well
                    strValues = strValues + "'1', "
                    strInsertInto = strInsertInto + hold + "_Sets], " + hold + "_Reps], " + hold + "_Weight], " + hold + "_MaxRangeOfMotion], "
                    strValues = strValues + "'" + DirectCast(Form.FindControl("Sets" + Trim(Str(i)) + "Text"), TextBox).Text + "', "
                    strValues = strValues + "'" + DirectCast(Form.FindControl("Reps" + Trim(Str(i)) + "Text"), TextBox).Text + "', "
                    strValues = strValues + "'" + DirectCast(Form.FindControl("ROM" + Trim(Str(i)) + "Text"), TextBox).Text + "', "
                    strValues = strValues + "'" + DirectCast(Form.FindControl("Weight" + Trim(Str(i)) + "Text"), TextBox).Text + "', "
                    ExerciseAssigned = True
                Else
                    strValues = strValues + "'0', "
                End If
                i += 1
                hold = ""
            End If
        Next

        'Get data from the note fields
        strInsertInto = strInsertInto + "[PatientNotes], [TherapistNotes])"
        strValues = strValues + "'" + PatientNotes.Text + "', '" + TherapistNotes.Text + "')"


        If ExerciseAssigned = True Then
            'Append workout to SQL db
            cmd.CommandText = strInsertInto + strValues
            cmd.ExecuteNonQuery()

            alert("Workout Posted!")

        Else
            alert("Please assign atleast one exercise!")
        End If

SubmitButton_Click_Exit:
        On Error GoTo 0
        Exit Sub
SubmitButton_Click_Error:
        MsgBox("Error: " & Err.Description, MsgBoxStyle.Information, WebsiteName + " - Manage Patients")
        Resume SubmitButton_Click_Exit
    End Sub

    Protected Sub Checkbox1_CheckedChanged(sender As Object, e As EventArgs) Handles Checkbox1.CheckedChanged
        If Checkbox1.Checked Then
            Sets1.Visible = True
            Sets1Text.Visible = True
            Reps1.Visible = True
            Reps1Text.Visible = True
            ROM1.Visible = True
            ROM1Text.Visible = True
            Weight1.Visible = True
            Weight1Text.Visible = True
        Else
            Sets1.Visible = False
            Sets1Text.Visible = False
            Reps1.Visible = False
            Reps1Text.Visible = False
            ROM1.Visible = False
            ROM1Text.Visible = False
            Weight1.Visible = False
            Weight1Text.Visible = False
        End If
    End Sub
    Protected Sub Checkbox2_CheckedChanged(sender As Object, e As EventArgs) Handles Checkbox2.CheckedChanged
        If Checkbox2.Checked Then
            Sets2.Visible = True
            Sets2Text.Visible = True
            Reps2.Visible = True
            Reps2Text.Visible = True
            ROM2.Visible = True
            ROM2Text.Visible = True
            Weight2.Visible = True
            Weight2Text.Visible = True
        Else
            Sets2.Visible = False
            Sets2Text.Visible = False
            Reps2.Visible = False
            Reps2Text.Visible = False
            ROM2.Visible = False
            ROM2Text.Visible = False
            Weight2.Visible = False
            Weight2Text.Visible = False
        End If
    End Sub
    Protected Sub Checkbox3_CheckedChanged(sender As Object, e As EventArgs) Handles Checkbox3.CheckedChanged
        If Checkbox3.Checked Then
            Sets3.Visible = True
            Sets3Text.Visible = True
            Reps3.Visible = True
            Reps3Text.Visible = True
            ROM3.Visible = True
            ROM3Text.Visible = True
            Weight3.Visible = True
            Weight3Text.Visible = True
        Else
            Sets3.Visible = False
            Sets3Text.Visible = False
            Reps3.Visible = False
            Reps3Text.Visible = False
            ROM3.Visible = False
            ROM3Text.Visible = False
            Weight3.Visible = False
            Weight3Text.Visible = False
        End If
    End Sub
    Protected Sub Checkbox4_CheckedChanged(sender As Object, e As EventArgs) Handles Checkbox4.CheckedChanged
        If Checkbox4.Checked Then
            Sets4.Visible = True
            Sets4Text.Visible = True
            Reps4.Visible = True
            Reps4Text.Visible = True
            ROM4.Visible = True
            ROM4Text.Visible = True
            Weight4.Visible = True
            Weight4Text.Visible = True
        Else
            Sets4.Visible = False
            Sets4Text.Visible = False
            Reps4.Visible = False
            Reps4Text.Visible = False
            ROM4.Visible = False
            ROM4Text.Visible = False
            Weight4.Visible = False
            Weight4Text.Visible = False
        End If
    End Sub
    Protected Sub Checkbox5_CheckedChanged(sender As Object, e As EventArgs) Handles Checkbox5.CheckedChanged
        If Checkbox5.Checked Then
            Sets5.Visible = True
            Sets5Text.Visible = True
            Reps5.Visible = True
            Reps5Text.Visible = True
            ROM5.Visible = True
            ROM5Text.Visible = True
            Weight5.Visible = True
            Weight5Text.Visible = True
        Else
            Sets5.Visible = False
            Sets5Text.Visible = False
            Reps5.Visible = False
            Reps5Text.Visible = False
            ROM5.Visible = False
            ROM5Text.Visible = False
            Weight5.Visible = False
            Weight5Text.Visible = False
        End If
    End Sub
    Protected Sub Checkbox6_CheckedChanged(sender As Object, e As EventArgs) Handles Checkbox6.CheckedChanged
        If Checkbox6.Checked Then
            Sets6.Visible = True
            Sets6Text.Visible = True
            Reps6.Visible = True
            Reps6Text.Visible = True
            ROM6.Visible = True
            ROM6Text.Visible = True
            Weight6.Visible = True
            Weight6Text.Visible = True
        Else
            Sets6.Visible = False
            Sets6Text.Visible = False
            Reps6.Visible = False
            Reps6Text.Visible = False
            ROM6.Visible = False
            ROM6Text.Visible = False
            Weight6.Visible = False
            Weight6Text.Visible = False
        End If
    End Sub
    Protected Sub Checkbox7_CheckedChanged(sender As Object, e As EventArgs) Handles Checkbox7.CheckedChanged
        If Checkbox7.Checked Then
            Sets7.Visible = True
            Sets7Text.Visible = True
            Reps7.Visible = True
            Reps7Text.Visible = True
            ROM7.Visible = True
            ROM7Text.Visible = True
            Weight7.Visible = True
            Weight7Text.Visible = True
        Else
            Sets7.Visible = False
            Sets7Text.Visible = False
            Reps7.Visible = False
            Reps7Text.Visible = False
            ROM7.Visible = False
            ROM7Text.Visible = False
            Weight7.Visible = False
            Weight7Text.Visible = False
        End If
    End Sub
    Protected Sub Checkbox8_CheckedChanged(sender As Object, e As EventArgs) Handles Checkbox8.CheckedChanged
        If Checkbox8.Checked Then
            Sets8.Visible = True
            Sets8Text.Visible = True
            Reps8.Visible = True
            Reps8Text.Visible = True
            ROM8.Visible = True
            ROM8Text.Visible = True
            Weight8.Visible = True
            Weight8Text.Visible = True
        Else
            Sets8.Visible = False
            Sets8Text.Visible = False
            Reps8.Visible = False
            Reps8Text.Visible = False
            ROM8.Visible = False
            ROM8Text.Visible = False
            Weight8.Visible = False
            Weight8Text.Visible = False
        End If
    End Sub
    Protected Sub Checkbox9_CheckedChanged(sender As Object, e As EventArgs) Handles Checkbox9.CheckedChanged
        If Checkbox9.Checked Then
            Sets9.Visible = True
            Sets9Text.Visible = True
            Reps9.Visible = True
            Reps9Text.Visible = True
            ROM9.Visible = True
            ROM9Text.Visible = True
            Weight9.Visible = True
            Weight9Text.Visible = True
        Else
            Sets9.Visible = False
            Sets9Text.Visible = False
            Reps9.Visible = False
            Reps9Text.Visible = False
            ROM9.Visible = False
            ROM9Text.Visible = False
            Weight9.Visible = False
            Weight9Text.Visible = False
        End If
    End Sub

    Protected Sub ResetButton_Click(sender As Object, e As EventArgs) Handles ResetButton.Click
        NameText.Text = ""
        datepicker.Value = ""

        Dim i As Integer = 1
        For Each ctrl As Control In form1.Controls
            If TypeOf ctrl Is CheckBox Then
                DirectCast(ctrl, CheckBox).Checked = False
         
            End If
            i += 1
        Next


    End Sub

    Private Sub alert(ByVal alert_message As String)
        Dim msg As String
        msg = "<script language='javascript'>"

        ' The 100 ms delay prevents a blank page during alert, in Chrome and FireFox:
        msg += "setTimeout(function(){alert('" & WebsiteName & "\n\n" & alert_message & "')}, 100);"

        msg += "<" & "/script>"
        Response.Write(msg)
    End Sub

End Class
