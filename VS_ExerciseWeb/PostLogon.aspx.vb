
Partial Class PostLogon
    Inherits System.Web.UI.Page

    Sub Page_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs) Handles Me.Load
        'This keeps the page from jumping back to the top on post backs
        Page.MaintainScrollPositionOnPostBack = True

        'For some reason it will give error messages about object IDs not being declared. Ignore this, it will work out when it loads
        WelcomeMessage.Text = "Welcome " + CType(Session.Item("UserName"), String) + "!"

    End Sub

End Class
