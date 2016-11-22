
Partial Class ReportsView
    Inherits System.Web.UI.Page

    Dim WebsiteName As String = "ProjectBaymax.com"


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'This keeps the page from jumping back to the top on post backs
        Page.MaintainScrollPositionOnPostBack = True
    End Sub


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        'ReportViewer1.LocalReport.DataSources.Clear()

        Dim reportDataSource = New Microsoft.Reporting.WebForms.ReportDataSource()

        ReportViewer1.LocalReport.ReportEmbeddedResource = "PrescribedWorkouts.rdlc"
        ReportViewer1.LocalReport.ReportPath = MapPath("PrescribedWorkouts.rdlc")

        reportDataSource.Name = "DataSet1"
        reportDataSource.DataSourceId = "ObjectDataSource2"
        'reportDataSource.Value = DataSetBindingSource


        ReportViewer1.LocalReport.DataSources.Add(reportDataSource)

        ReportViewer1.LocalReport.Refresh()


        'ReportViewer1.Reset()
        ' ReportViewer1.LocalReport.ReportEmbeddedResource = MapPath("PrescribedWorkouts.rdlc") + ".rdlc"
        'ReportViewer1.LocalReport.ReportEmbeddedResource = "VS_ExerciseWeb.PrescribedWorkouts.rdlc"


        'ReportViewer1.LocalReport.ReportPath = MapPath("PrescribedWorkouts.rdlc")
        'ReportViewer1.LocalReport.LoadReportDefinition()

        'ReportViewer1.DataBind()
        'ReportViewer1.LocalReport.Refresh()

        'ReportViewer1.LocalReport.Refresh()

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
