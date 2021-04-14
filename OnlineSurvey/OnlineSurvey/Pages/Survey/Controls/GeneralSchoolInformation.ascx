<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GeneralSchoolInformation.ascx.cs" Inherits="OnlineSurvey.Pages.Survey.Controls.GeneralSchoolInformation" %>

<style>
	.inline li {
    display: inline;
}
</style>

<script>

    function GeneralSchoolInformationToGuidelines() {
        $("#divGeneralSchoolInformation").hide();
        $("#divGuidelines").show();
    }

	function SaveSchoolDetails() {
		var controls = [
			"MainContent_GeneralSchoolInformation_txtEmailAddress",
			"MainContent_GeneralSchoolInformation_txtPrincipalName",
			"MainContent_GeneralSchoolInformation_txtPrincipalIDNo",
			"MainContent_GeneralSchoolInformation_txtPrincipalPersalNo",
			"MainContent_GeneralSchoolInformation_txtPrincipalCellphoneNo"
		];

		var isValid = validateControls(controls);
        var isValidEmail = ValidateEmail("MainContent_GeneralSchoolInformation_txtEmailAddress");
        if (isValid == true && (isValidEmail == true || $("#MainContent_GeneralSchoolInformation_txtEmailAddress").val() == "")) {

			var school = {
                ID: $("#<%=hdfSchoolID.ClientID%>").val(),
                PrincipalName: $("#MainContent_GeneralSchoolInformation_txtPrincipalName").val(),
                EmailAddress: $("#MainContent_GeneralSchoolInformation_txtEmailAddress").val(),
                PrincipalIdentityNo: $("#MainContent_GeneralSchoolInformation_txtPrincipalIDNo").val(),
                PrincipalPersalNo: $("#MainContent_GeneralSchoolInformation_txtPrincipalPersalNo").val(),
                PrincipalMobileNo: $("#MainContent_GeneralSchoolInformation_txtPrincipalCellphoneNo").val()
			};

            var params = { school: school };

			$.ajax({
				type: "POST",
				url: "../../Services/Service.asmx/SaveSchoolDetails",
				data: JSON.stringify(params),
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				beforeSend: function () {
					ShowLoadingSpinner();
				},
				success: function (response) {
                    if (response.d != "") {
                        var jsonData = JSON.parse(response.d);
						if (jsonData.Message = "Success") {
                            $("#divSaveSchoolDetailsSuccess").text("School Details Saved Successfully.");
                            $("#divSaveSchoolDetailsSuccess").show();
                            $("#divSaveSchoolDetailsFailure").hide();

                            setTimeout(
                                function () {
                                    $("#divLearnerInformation").show();
									$("#divGeneralSchoolInformation").hide();
                                    HideLoadingSpinner();
                                }
                                , 1000);
                        } else {
                            $("#divSaveSchoolDetailsFailure").text(jsonData.Message);
                            $("#divSaveSchoolDetailsSuccess").hide();
                            $("#divSaveSchoolDetailsFailure").show();
                        }
                    } else {
                        $("#divSaveSchoolDetailsFailure").text("There was an error when saving school details");
                        $("#divSaveSchoolDetailsSuccess").hide();
                        $("#divSaveSchoolDetailsFailure").show();
                    }
				
			    },
			    complete: function () {
			       // HideLoadingSpinner();
			    },
			    failure: function (jqXHR, textStatus, errorThrown) {
			        $("#divSaveSchoolDetailsFailure").text("HTTP Status: " + jqXHR.status + "; Error Text: " + jqXHR.responseText);
			        $("#divSaveSchoolDetailsSuccess").hide();
			        $("#divSaveSchoolDetailsFailure").show();
			    }
			});
        }
	}

    function ValidateEmail(txtEmailAddress) {
        var isValid = true;
        var errorControls = [];
        var element = document.getElementById(txtEmailAddress);
        var label = $("label[for='" + element.id + "']")[0];


        var email = document.getElementById(txtEmailAddress);
        if (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(email.value)) {
            $(element).closest('.form-group').removeClass('has-success has-error');
            $(element).closest('.help-block').remove();
            element.style.borderColor = "";
            if (document.getElementById(errorID)) {
                element.parentNode.removeChild(document.getElementById(errorID));
            }
            return (true)
        }

        if (label) {
            var errorID = element.id + "_Error";
            var error = "<span style='color:red;' id='" + errorID + "'>" + label.innerText + " is invalid" + "</span>";
            if (document.getElementById(errorID) == null) {
                $(element).parents('.form-group').append(error);
                $(element).closest('.form-group').removeClass('has-success has-error').addClass('has-error');
                $(element).closest('.help-block').remove();
                element.style.borderColor = "red";
                errorControls.push(element.id);
            }
        }

        isValid = errorControls.length > 0 ? false : true;

        element.onblur = function () {
            var val = $(element).val();

            if (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(val)) {
                $(element).closest('.form-group').removeClass('has-success has-error');
                $(element).closest('.help-block').remove();
                element.style.borderColor = "";
                if (document.getElementById(errorID)) {
                    element.parentNode.removeChild(document.getElementById(errorID));
                }
                return (true)
            } else {
                $(element).closest('.form-group').removeClass('has-success has-error').addClass('has-error');
                $(element).closest('.help-block').remove();
                element.style.borderColor = "red";
                errorControls.push(element.id);
            }

            isValid = errorControls.length > 0 ? false : true;

            return false;
        };

        return isValid;
    }
</script>

	<div class="card">
		<h5 class="card-header">1. GENERAL SCHOOL INFORMATION</h5>
		<div class="card-body">
			<p style="color:#FF0000"><i>Please click Continue to start the Covid-19 Impact Survey</i></p>
			<div class="well well-lg">
				<div class="row">
					<div class="form-group col-md-12">
						<label style="font-weight:100">School Name:</label>    
						<label runat="server" id="lblSchoolName" style="font-weight:900;" />
					</div>

					<div class="form-group col-md-12">
						<label>EMIS No:</label>    
						<label runat="server" id="lblEMISNo"  style="font-weight:900;" />
					</div>

					<div class="form-group col-md-12">
						<label>School Level:</label>    
						<label runat="server" id="lblSchoolLevel"  style="font-weight:900;" />
					</div>

					<div class="form-group col-md-12">
						<label>Relationship to State:</label>    
						<label runat="server" id="lblRelationWithState" style="font-weight:900;" />
					</div>

					<div class="form-group col-md-12">
						<label>Educational District:</label>    
						<label runat="server" id="lblEducationalDistrict"  style="font-weight:900;" />
					</div>

					<div class="form-group col-md-12">
						<label>Email Address:</label>    
					    <label runat="server" id="lblEmailAddress"  style="font-weight:900;" />
					</div>

				    <div class="form-group col-md-12">
						<label>Principal Name:</label>    
						<label runat="server" id="lblPrincipalName"  style="font-weight:900;" />
					</div>
				    
					 <div class="form-group col-md-12">
						<label>Principal ID No:</label>    
						<label runat="server" id="lblPrincipalIDNo"  style="font-weight:900;" />
					</div>
					
					<div class="form-group col-md-12">
						<label>Principal Persal No:</label>    
						<label runat="server" id="lblPrincipalPersalNo"  style="font-weight:900;" />
					</div>

					<div class="form-group col-md-12">
						<label>Principal Cellphone No:</label>    
						<label runat="server" id="lblPrincipalCellphoneNo"  style="font-weight:900;" />
					</div>
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-12" style="text-align:right;">
					
					<div class="alert alert-success" role="alert" id="divSaveSchoolDetailsSuccess" style="display:none;"></div>
					<div class="alert alert-danger" role="alert" id="divSaveSchoolDetailssFailure"  style="display:none;"></div>
				  <ul class="inline">
				    <li><input onclick="GeneralSchoolInformationToGuidelines(); return false;" type="button" class="btn btn-primary btn-sm" value="Continue" /></li>
				  </ul>
				</div>
			</div>
		</div>
	</div>
</div>
<asp:HiddenField runat="server" ID="hdfEncryptedSchoolID" Value="" />
<asp:HiddenField runat="server" ID="hdfSchoolID" Value="0" />