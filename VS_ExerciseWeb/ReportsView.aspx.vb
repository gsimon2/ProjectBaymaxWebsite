
Partial Class ReportsView
    Inherits System.Web.UI.Page

    Dim WebsiteName As String = "ProjectBaymax.com"


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'This keeps the page from jumping back to the top on post backs
        Page.MaintainScrollPositionOnPostBack = True
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
