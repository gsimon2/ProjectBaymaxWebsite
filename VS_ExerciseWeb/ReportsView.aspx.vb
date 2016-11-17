
Partial Class ReportsView
    Inherits System.Web.UI.Page

    Dim WebsiteName As String = "ProjectBaymax.com"

    Private Sub alert(ByVal alert_message As String)
        Dim msg As String
        msg = "<script language='javascript'>"

        ' The 100 ms delay prevents a blank page during alert, in Chrome and FireFox:
        msg += "setTimeout(function(){alert('" & WebsiteName & "\n\n" & alert_message & "')}, 100);"

        msg += "<" & "/script>"
        Response.Write(msg)
    End Sub
End Class
