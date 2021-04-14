<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FinalizeSurvey.ascx.cs" Inherits="OnlineSurvey.Pages.Survey.Controls.FinalizeSurvey" %>

<script type="text/javascript">
	function SubmitSurvey() {

	}

	function GoToEnablingConditions() {
        $("#divEnablingConditions").show();
        $("#divFinalizeSurvey").hide();
    }
</script>

<div class="card">
		<h5 class="card-header">Sumit Survey</h5>
		<div class="card-body">
			<div class="well well-lg">
				<div class="row">
					<div class="form-group col-md-12">
						 <ul class="inline">
							<li><input onclick="GoToEnablingConditions(); return false;" type="button" class="btn btn-primary btn-sm" value="Previous" /></li>
							<li><input onclick="SubmitSurvey(); return false;" type="button" class="btn btn-primary btn-sm" value="Submit Survey" /></li>
						</ul>
						<div class="form-group col-md-12" style="text-align:right;">
							<div class="alert alert-success" role="alert" id="divFinalizeSurveySuccess" style="display:none;"></div>
							<div class="alert alert-danger" role="alert" id="divFinalizeSurveyFailure"  style="display:none;"></div>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>
