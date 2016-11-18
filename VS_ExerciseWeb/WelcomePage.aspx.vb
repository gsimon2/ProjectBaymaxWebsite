Imports System.Data.SqlClient

Partial Class WelcomePage
    Inherits System.Web.UI.Page
    Dim WebsiteName As String = "ProjectBaymax.com"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'This keeps the page from jumping back to the top on post backs
        Page.MaintainScrollPositionOnPostBack = True
    End Sub

    Sub Login_Button_Click()
        On Error GoTo Login_Button_Click_Error
        Dim con As New SqlConnection
        Dim strCon As String = "Server=tcp:projectbaymax.database.windows.net,1433;Initial Catalog=ProjectBaymax_Db;Persist Security Info=False;User ID=Application_Login;Password=GrantMeAccess11;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
        Dim cmd As New SqlCommand
        Dim rd As SqlDataReader

        'Make sure text has been entered for both fields
        If UsernameTextBox.Text = "" Then
            alert("Please enter a username.")
            Exit Sub
        End If
        If PasswordTextBox.Text = "" Then
            alert("Please enter a password.")
            Exit Sub
        End If

        'Connection to SQL Server
        con.ConnectionString = strCon
        cmd.Connection = con
        con.Open()
        cmd.CommandText = "SELECT * FROM Users WHERE UserName = '" & UsernameTextBox.Text & "' AND UserPasswordHash = HASHBYTES('SHA1', '" & PasswordTextBox.Text & "')"
        rd = cmd.ExecuteReader

        'Check to see if entered username and password are valid
        If rd.HasRows Then

            'Harvest User Info - UserID from Users table
            rd.Read()
            GlobalVars.CurrentUserID = rd.GetValue(2).ToString()
            Session("UserID") = GlobalVars.CurrentUserID
            rd.Close()

            'Harvest User Info - UserFirstName from Demographics table
            cmd.CommandText = "SELECT * FROM Demographics WHERE UserID = '" & GlobalVars.CurrentUserID & "'"
            rd = cmd.ExecuteReader
            If rd.HasRows Then
                rd.Read()
                GlobalVars.CurrentUserFirstName = rd.GetValue(1).ToString()
                Session("UserName") = GlobalVars.CurrentUserFirstName
                Session("UserGroup") = rd.GetValue(6).ToString()

                'Transfer to post logon webpage
                Server.Transfer("PostLogon.aspx", True)

            Else
                alert("No Demographics record found for " & UsernameTextBox.Text & "!")
                GoTo Login_Button_Click_Exit
            End If
            rd.Close()



        Else
            alert("Invalid Username or Password")
            GoTo Login_Button_Click_Exit
        End If

        


Login_Button_Click_Exit:
        rd.Close()
        con.Close()
        Exit Sub
Login_Button_Click_Error:
        MsgBox("Error: " & Err.Description, MsgBoxStyle.Information, WebsiteName + " - Login")
        Resume Login_Button_Click_Exit
    End Sub


    Public Class GlobalVars

        Enum Forms
            RunMode
            SetUpMode
            ManualMode
        End Enum

        Enum Exercises
            Supraspinatus
            Infraspinatus
            Teres_minor
            Subscapularis
            Shoulder_flexion
            Shoulder_extension
            Shoulder_glide
            Scapular_protraction
            Rowing

        End Enum

        Public Shared DestinationForm As Forms

        Public Shared CurrentExercise As Exercises

        Public Shared CurrentUserID As String

        Public Shared CurrentUserFirstName As String

        Public Class WorkoutPlan

            'Basic details about the workout plan
            Public Shared RecipientID As Integer
            Public Shared PrecriberID As Integer
            Public Shared WorkoutID As Integer
            Public Shared DateAssigned As Date

            'Details about the exercises prescribered

            'Class to hold all of the details of a prescribed exercise
            Public Class Supraspinatus
                Public Shared Assigned As Boolean
                Public Shared Sets As Integer
                Public Shared Reps As Integer
                Public Shared Weight As Integer
                Public Shared MaxRangeOfMotion As Integer
            End Class

            'Class to hold all of the details of a prescribed exercise
            Public Class Infraspinatus
                Public Shared Assigned As Boolean
                Public Shared Sets As Integer
                Public Shared Reps As Integer
                Public Shared Weight As Integer
                Public Shared MaxRangeOfMotion As Integer
            End Class

            'Class to hold all of the details of a prescribed exercise
            Public Class Teres_minor
                Public Shared Assigned As Boolean
                Public Shared Sets As Integer
                Public Shared Reps As Integer
                Public Shared Weight As Integer
                Public Shared MaxRangeOfMotion As Integer
            End Class

            'Class to hold all of the details of a prescribed exercise
            Public Class Subscapularis
                Public Shared Assigned As Boolean
                Public Shared Sets As Integer
                Public Shared Reps As Integer
                Public Shared Weight As Integer
                Public Shared MaxRangeOfMotion As Integer
            End Class

            'Class to hold all of the details of a prescribed exercise
            Public Class Shoulder_flexion
                Public Shared Assigned As Boolean
                Public Shared Sets As Integer
                Public Shared Reps As Integer
                Public Shared Weight As Integer
                Public Shared MaxRangeOfMotion As Integer
            End Class

            'Class to hold all of the details of a prescribed exercise
            Public Class Shoulder_extension
                Public Shared Assigned As Boolean
                Public Shared Sets As Integer
                Public Shared Reps As Integer
                Public Shared Weight As Integer
                Public Shared MaxRangeOfMotion As Integer
            End Class

            'Class to hold all of the details of a prescribed exercise
            Public Class Shoulder_glide
                Public Shared Assigned As Boolean
                Public Shared Sets As Integer
                Public Shared Reps As Integer
                Public Shared Weight As Integer
                Public Shared MaxRangeOfMotion As Integer
            End Class

            'Class to hold all of the details of a prescribed exercise
            Public Class Scapular_protraction
                Public Shared Assigned As Boolean
                Public Shared Sets As Integer
                Public Shared Reps As Integer
                Public Shared Weight As Integer
                Public Shared MaxRangeOfMotion As Integer
            End Class

            'Class to hold all of the details of a prescribed exercise
            Public Class Rowing
                Public Shared Assigned As Boolean
                Public Shared Sets As Integer
                Public Shared Reps As Integer
                Public Shared Weight As Integer
                Public Shared MaxRangeOfMotion As Integer
            End Class
        End Class

        Shared Sub ClearWorkoutPlan()
            WorkoutPlan.RecipientID = 0
            WorkoutPlan.PrecriberID = 0
            WorkoutPlan.WorkoutID = 0
            WorkoutPlan.DateAssigned = Date.Now()
            WorkoutPlan.Supraspinatus.Assigned = False
            WorkoutPlan.Supraspinatus.Sets = 0
            WorkoutPlan.Supraspinatus.Reps = 0
            WorkoutPlan.Supraspinatus.Weight = 0
            WorkoutPlan.Supraspinatus.MaxRangeOfMotion = 0

            WorkoutPlan.Infraspinatus.Assigned = False
            WorkoutPlan.Infraspinatus.Sets = 0
            WorkoutPlan.Infraspinatus.Reps = 0
            WorkoutPlan.Infraspinatus.Weight = 0
            WorkoutPlan.Infraspinatus.MaxRangeOfMotion = 0

            WorkoutPlan.Teres_minor.Assigned = False
            WorkoutPlan.Teres_minor.Sets = 0
            WorkoutPlan.Teres_minor.Reps = 0
            WorkoutPlan.Teres_minor.Weight = 0
            WorkoutPlan.Teres_minor.MaxRangeOfMotion = 0

            WorkoutPlan.Subscapularis.Assigned = False
            WorkoutPlan.Subscapularis.Sets = 0
            WorkoutPlan.Subscapularis.Reps = 0
            WorkoutPlan.Subscapularis.Weight = 0
            WorkoutPlan.Subscapularis.MaxRangeOfMotion = 0

            WorkoutPlan.Shoulder_flexion.Assigned = False
            WorkoutPlan.Shoulder_flexion.Sets = 0
            WorkoutPlan.Shoulder_flexion.Reps = 0
            WorkoutPlan.Shoulder_flexion.Weight = 0
            WorkoutPlan.Shoulder_flexion.MaxRangeOfMotion = 0

            WorkoutPlan.Shoulder_extension.Assigned = False
            WorkoutPlan.Shoulder_extension.Sets = 0
            WorkoutPlan.Shoulder_extension.Reps = 0
            WorkoutPlan.Shoulder_extension.Weight = 0
            WorkoutPlan.Shoulder_extension.MaxRangeOfMotion = 0

            WorkoutPlan.Shoulder_glide.Assigned = False
            WorkoutPlan.Shoulder_glide.Sets = 0
            WorkoutPlan.Shoulder_glide.Reps = 0
            WorkoutPlan.Shoulder_glide.Weight = 0
            WorkoutPlan.Shoulder_glide.MaxRangeOfMotion = 0

            WorkoutPlan.Scapular_protraction.Assigned = False
            WorkoutPlan.Scapular_protraction.Sets = 0
            WorkoutPlan.Scapular_protraction.Reps = 0
            WorkoutPlan.Scapular_protraction.Weight = 0
            WorkoutPlan.Scapular_protraction.MaxRangeOfMotion = 0

            WorkoutPlan.Rowing.Assigned = False
            WorkoutPlan.Rowing.Sets = 0
            WorkoutPlan.Rowing.Reps = 0
            WorkoutPlan.Rowing.Weight = 0
            WorkoutPlan.Rowing.MaxRangeOfMotion = 0

        End Sub

        Shared Sub ClearUser()
            GlobalVars.CurrentUserID = ""
            GlobalVars.CurrentUserFirstName = ""
        End Sub

        Shared Function GetPrescribedSets(ByVal exercise As Exercises) As Integer
            Dim Sets As Integer

            Select Case exercise
                Case Exercises.Supraspinatus
                    Sets = GlobalVars.WorkoutPlan.Supraspinatus.Sets
                Case Exercises.Infraspinatus
                    Sets = GlobalVars.WorkoutPlan.Infraspinatus.Sets
                Case Exercises.Teres_minor
                    Sets = GlobalVars.WorkoutPlan.Teres_minor.Sets
                Case Exercises.Subscapularis
                    Sets = GlobalVars.WorkoutPlan.Subscapularis.Sets
                Case Exercises.Shoulder_flexion
                    Sets = GlobalVars.WorkoutPlan.Shoulder_flexion.Sets
                Case Exercises.Shoulder_extension
                    Sets = GlobalVars.WorkoutPlan.Shoulder_extension.Sets
                Case Exercises.Shoulder_glide
                    Sets = GlobalVars.WorkoutPlan.Shoulder_glide.Sets
                Case Exercises.Scapular_protraction
                    Sets = GlobalVars.WorkoutPlan.Scapular_protraction.Sets
                Case Exercises.Rowing
                    Sets = GlobalVars.WorkoutPlan.Rowing.Sets
                Case Else
                    Sets = 0
            End Select
            Return Sets
        End Function

        Shared Function GetPrescribedReps(ByVal exercise As Exercises) As Integer
            Dim Reps As Integer

            Select Case exercise
                Case Exercises.Supraspinatus
                    Reps = GlobalVars.WorkoutPlan.Supraspinatus.Reps
                Case Exercises.Infraspinatus
                    Reps = GlobalVars.WorkoutPlan.Infraspinatus.Reps
                Case Exercises.Teres_minor
                    Reps = GlobalVars.WorkoutPlan.Teres_minor.Reps
                Case Exercises.Subscapularis
                    Reps = GlobalVars.WorkoutPlan.Subscapularis.Reps
                Case Exercises.Shoulder_flexion
                    Reps = GlobalVars.WorkoutPlan.Shoulder_flexion.Reps
                Case Exercises.Shoulder_extension
                    Reps = GlobalVars.WorkoutPlan.Shoulder_extension.Reps
                Case Exercises.Shoulder_glide
                    Reps = GlobalVars.WorkoutPlan.Shoulder_glide.Reps
                Case Exercises.Scapular_protraction
                    Reps = GlobalVars.WorkoutPlan.Scapular_protraction.Reps
                Case Exercises.Rowing
                    Reps = GlobalVars.WorkoutPlan.Rowing.Reps
                Case Else
                    Reps = 0
            End Select
            Return Reps
        End Function
    End Class

    Private Sub alert(ByVal alert_message As String)
        Dim msg As String
        msg = "<script language='javascript'>"

        ' The 100 ms delay prevents a blank page during alert, in Chrome and FireFox:
        msg += "setTimeout(function(){alert('" & WebsiteName & "\n\n" & alert_message & "')}, 100);"

        msg += "<" & "/script>"
        Response.Write(msg)
    End Sub


End Class


