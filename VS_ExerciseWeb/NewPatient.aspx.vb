﻿Imports System.Data.SqlClient

Partial Class NewPatient
    Inherits System.Web.UI.Page
    Dim WebsiteName As String = "ProjectBaymax.com"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'This keeps the page from jumping back to the top on post backs
        Page.MaintainScrollPositionOnPostBack = True

        If CType(Session.Item("UserID"), String) = "" Then
            Server.Transfer("WelcomePage.aspx", True)
        End If
    End Sub



    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs) Handles SubmitButton.Click
        On Error GoTo SubmitButton_Click_Error
        Dim con As New SqlConnection
        Dim strCon As String = "Server=tcp:projectbaymax.database.windows.net,1433;Initial Catalog=ProjectBaymax_Db;Persist Security Info=False;User ID=Application_Login;Password=GrantMeAccess11;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
        Dim cmd As New SqlCommand
        Dim rd As SqlDataReader


        Dim strPatientFirstName As String
        Dim strPatientMiddleName As String
        Dim strPatientLastName As String
        Dim strPassword As String
        Dim strConfirmPass As String
        Dim strPhone As String
        Dim strEmail As String
        Dim intUserID As Integer
        Dim strGroup As String
        Dim strUserName As String


        'harvest info from form
        strPatientFirstName = Me.PatientFirstName_text.Text
        strPatientLastName = Me.PatientLastName_text.Text
        strPatientMiddleName = Me.PatientMiddleName_text.Text
        strPassword = Me.Password_text.Text
        strConfirmPass = Me.ConfirmPassword_text.Text
        strPhone = Me.Phone_text.Text
        strEmail = Me.Email_text.Text
        'strGroup = Me.Group_text.Text

        'Check for required field values
        If strPatientFirstName = "" Then
            alert("Please fill out required fields.")
            GoTo SubmitButton_Click_Exit
        End If

        If strPatientLastName = "" Then
            alert("Please fill out required fields.")
            GoTo SubmitButton_Click_Exit
        End If

        If strPassword = "" Then
            alert("Please fill out required fields.")
            GoTo SubmitButton_Click_Exit
        End If

        If strConfirmPass = "" Then
            alert("Please fill out required fields.")
            GoTo SubmitButton_Click_Exit
        End If

        'Confirm password matches
        If strConfirmPass <> strPassword Then
            alert("Please make sure that entered passwords match.")
            GoTo SubmitButton_Click_Exit
        End If


        'Connection to SQL Server
        con.ConnectionString = strCon
        cmd.Connection = con
        con.Open()

        'Get max of user IDS to assign new user ID
        cmd.CommandText = "SELECT MAX(UserID) FROM Users"
        rd = cmd.ExecuteReader
        If rd.HasRows Then
            rd.Read()
            intUserID = rd.GetValue(0) + 1
        End If
        rd.Close()

        'get group of logged in user
        strGroup = CType(Session.Item("UserGroup"), String)

        'Create a unique UserName for the new patient
        Dim done As Boolean = False
        Dim i As Integer = 0
        strUserName = ""
        If Len(strPatientLastName) < 5 Then
            strUserName = Trim(strPatientLastName.Substring(0, Len(strPatientLastName)))
        Else
            strUserName = Trim(strPatientLastName.Substring(0, 5))
        End If
        If Len(strPatientFirstName) < 3 Then
            strUserName = Trim(strUserName + strPatientFirstName.Substring(0, Len(strPatientFirstName)))
        Else
            strUserName = Trim(strUserName + strPatientFirstName.Substring(0, 3))
        End If

        Dim strBaseUserName As String = strUserName

        While (done = False)
            'Check to make sure username is not taken yet
            cmd.CommandText = "SELECT * FROM Users WHERE UserName = '" + strUserName + "'"
            rd = cmd.ExecuteReader
            'If rd has rows then the user name is taken
            If rd.HasRows Then
                i += 1
                strUserName = Trim(Trim(strBaseUserName) + Trim(Str(i)))
                done = False
            Else
                done = True
            End If
            rd.Close()
        End While
        'MsgBox(strUserName)


        'Append new patient to users table
        cmd.CommandText = "INSERT INTO Users([UserName], [UserPasswordHash], [UserID]) VALUES('" + strUserName + "', HASHBYTES('SHA1', '" + strPassword + "'), '" + Str(intUserID) + "')"
        cmd.ExecuteNonQuery()

        'Append new patient to demographics table
        cmd.CommandText = "INSERT INTO Demographics([UserID], [FirstName], [LastName], [MiddleName], [PrimaryPhone], [Email], [OrganizationID], [Role]) Values('" + Str(intUserID) + "', '" + strPatientFirstName + "', '" + strPatientLastName + "', '" + strPatientMiddleName + "', '" + strPhone + "', '" + strEmail + "', '" + strGroup + "', '4')"
        cmd.ExecuteNonQuery()

        alert("New Patient Added! UserName = " + strUserName)

SubmitButton_Click_Exit:
        On Error GoTo 0
        con.Close()
        Exit Sub
SubmitButton_Click_Error:
        MsgBox("Error: " & Err.Description, MsgBoxStyle.Information, WebsiteName + " - New Patient")
        Resume SubmitButton_Click_Exit

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
