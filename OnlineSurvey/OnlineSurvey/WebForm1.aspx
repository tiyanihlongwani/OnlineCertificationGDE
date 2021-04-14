<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="OnlineSurvey.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingOne">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true"
                    aria-controls="collapseOne">Header 1 </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                Content 1
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingTwo">
            <h4 class="panel-title">
                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"
                    aria-expanded="false" aria-controls="collapseTwo">Header 2 </a>
            </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
            <div class="panel-body">
                Content 2
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingThree">
            <h4 class="panel-title">
                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree"
                    aria-expanded="false" aria-controls="collapseThree">Header 3 </a>
            </h4>
        </div>
        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
            <div class="panel-body">
                Content 3
            </div>
        </div>
    </div>
    <br />
    <br />
    <asp:Button ID="Button1" Text="Submit" runat="server" CssClass="btn btn-primary" />
    <asp:HiddenField ID="PaneName" runat="server" />
</div>
<script type="text/javascript">
    $(function () {
        var paneName = $("[id*=PaneName]").val() != "" ? $("[id*=PaneName]").val() : "collapseOne";
             
        //Remove the previous selected Pane.
        $("#accordion .in").removeClass("in");
             
        //Set the selected Pane.
        $("#" + paneName).collapse("show");
             
        //When Pane is clicked, save the ID to the Hidden Field.
        $(".panel-heading a").click(function () {
            $("[id*=PaneName]").val($(this).attr("href").replace("#", ""));
        });
    });
</script>
        </div>
    </form>
</body>
</html>
