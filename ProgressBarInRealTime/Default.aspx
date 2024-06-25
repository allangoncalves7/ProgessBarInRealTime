<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProgressBarInRealTime.Deafault" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="Scripts/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.signalR-2.4.3.min.js"></script>
    <script type="text/javascript" src="signalr/hubs"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script>
        $(function () {
            var hub = $.connection.progressHub;
            hub.client.updateProgress = function (percent) {
                $('#progressBar').css('width', percent + '%').attr('aria-valuenow', percent);
                $('#progressBar').text(percent + '%');
                if (percent > 99) {
                    $('#progressBar').addClass("progress-bar-success");
                }
            };
            $.connection.hub.start();
        });
</script>
    <title>Progress Bar in Real Time</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding: 10px;">
            <div class="progress" style="width: 30%; margin: auto; float: left; border: 1px solid;">
                <div class="progress-bar progress-bar-striped active" id="progressBar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                    0%
                </div>
            </div>

            <br />
            <br />
            <asp:Button ID="btnStart" runat="server" CssClass="btn btn-primary btn" Text="Start" CausesValidation="false" OnClick="btnStart_Click" />
        </div>
    </form>
</body>
</html>
