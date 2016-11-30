
Partial Class ReportsView
    Inherits System.Web.UI.Page

    Dim WebsiteName As String = "ProjectBaymax.com"


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'This keeps the page from jumping back to the top on post backs
        Page.MaintainScrollPositionOnPostBack = True

        If CType(Session.Item("UserID"), String) = "" Then
            Server.Transfer("WelcomePage.aspx", True)
        End If
    End Sub


    Private Sub alert(ByVal alert_message As String)
        Dim msg As String
        msg = "<script language='javascript'>"

        ' The 100 ms delay prevents a blank page during alert, in Chrome and FireFox:
        msg += "setTimeout(function(){alert('" & WebsiteName & "\n\n" & alert_message & "')}, 100);"

        msg += "<" & "/script>"
        Response.Write(msg)
    End Sub

    
    Protected Sub SelectReportDropDown_SelectedIndexChanged(sender As Object, e As EventArgs) Handles SelectReportDropDown.SelectedIndexChanged
        On Error GoTo SelectReportDropDown_SelectedIndexChanged_Error
        Dim strSelectedItem As String
        Dim reportDataSource = New Microsoft.Reporting.WebForms.ReportDataSource()

        'Get value of drop down
        strSelectedItem = SelectReportDropDown.SelectedValue

        'Clear data in report viewer
        ReportViewer1.LocalReport.DataSources.Clear()

        'Rebuild data and local report based off of report selected in drop down
        If strSelectedItem = "Completed Workouts" Then
            reportDataSource.Name = "CompWorkoutDataSet"
            reportDataSource.DataSourceId = "ObjectDataSource3"
            ReportViewer1.LocalReport.DataSources.Add(reportDataSource)
            ReportViewer1.LocalReport.ReportEmbeddedResource = "CompletedWorkouts.rdlc"
            ReportViewer1.LocalReport.ReportPath = "CompletedWorkouts.rdlc"
        ElseIf strSelectedItem = "Prescribed Workouts Wide" Then
            reportDataSource.Name = "DataSet1"
            reportDataSource.DataSourceId = "ObjectDataSource2"
            ReportViewer1.LocalReport.DataSources.Add(reportDataSource)
            ReportViewer1.LocalReport.ReportEmbeddedResource = "PrescribedWorkouts.rdlc"
            ReportViewer1.LocalReport.ReportPath = "PrescribedWorkouts.rdlc"
        ElseIf strSelectedItem = "Prescribed Workouts Stepped" Then
            reportDataSource.Name = "CompWorkoutDataSet"
            reportDataSource.DataSourceId = "ObjectDataSource2"
            ReportViewer1.LocalReport.DataSources.Add(reportDataSource)
            ReportViewer1.LocalReport.ReportEmbeddedResource = "PrescribedReportsStepped.rdlc"
            ReportViewer1.LocalReport.ReportPath = "PrescribedReportsStepped.rdlc"
        End If
        ReportViewer1.LocalReport.Refresh()


SelectReportDropDown_SelectedIndexChanged_Exit:
        On Error GoTo 0
        Exit Sub
SelectReportDropDown_SelectedIndexChanged_Error:
        MsgBox("Error: " & Err.Description, MsgBoxStyle.Information, WebsiteName + " - Reports View")
        Resume SelectReportDropDown_SelectedIndexChanged_Exit
    End Sub
End Class
