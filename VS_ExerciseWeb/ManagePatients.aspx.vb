
Partial Class ManagePatients
    Inherits System.Web.UI.Page


    Protected Sub ResetButton_Click(sender As Object, e As EventArgs) Handles ResetButton.Click
        NameText.Text = ""
        NumberText.Text = ""
        ExerciseList.ClearSelection()
    End Sub
End Class
