
Partial Class ReportsView
    Inherits System.Web.UI.Page

    Dim WebsiteName As String = "ProjectBaymax.com"


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'This keeps the page from jumping back to the top on post backs
        Page.MaintainScrollPositionOnPostBack = True
    End Sub


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim reportDataSource = New Microsoft.Reporting.WebForms.ReportDataSource()

        reportDataSource.Name = "DataSet1"
        reportDataSource.DataSourceId = "ObjectDataSource2"
        ReportViewer1.LocalReport.DataSources.Add(reportDataSource)

        If ReportViewer1.LocalReport.ReportPath = "PrescribedWorkouts.rdlc" Then
            ReportViewer1.LocalReport.ReportEmbeddedResource = "CompletedWorkouts.rdlc"
            ReportViewer1.LocalReport.ReportPath = "CompletedWorkouts.rdlc"
        Else
            ReportViewer1.LocalReport.ReportEmbeddedResource = "PrescribedWorkouts.rdlc"
            ReportViewer1.LocalReport.ReportPath = "PrescribedWorkouts.rdlc"
        End If

        ReportViewer1.LocalReport.Refresh()

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
