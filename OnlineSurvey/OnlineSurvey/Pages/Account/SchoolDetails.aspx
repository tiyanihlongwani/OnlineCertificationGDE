<%@ Page Language="C#"  MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SchoolDetails.aspx.cs" Inherits="OnlineSurvey.Pages.Account.SchoolDetails" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
	.inline li {
    display: inline;
}
</style>

<script>

	function SaveSchoolDetails() {
        var controls = [
			"txtPrincipalEmailAddress",
			"txtPrincipalName",
			//"txtPrincipalIDNo",
			//"txtPrincipalPersalNo",
			"txtPrincipalCellphoneNo"
		];

		var isValid = validateControls(controls);

        var isValidEmail = ValidateEmail("txtPrincipalEmailAddress");
        if (isValid == true && (isValidEmail == true || $("#txtPrincipalEmailAddress").val() == "")) {

			var school = {
                ID: $("#<%=hdfSchoolID.ClientID%>").val(),
                PrincipalName: $("#txtPrincipalName").val(),
                PrincipalEmailAddress: $("#txtPrincipalEmailAddress").val(),
                PrincipalIdentityNo: $("#txtPrincipalIDNo").val(),
                PrincipalPersalNo: $("#txtPrincipalPersalNo").val(),
                PrincipalMobileNo: $("#txtPrincipalCellphoneNo").val()
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
							
							var data = jsonData.Data;
							if (data) {
								location.href = "OTPVerification.aspx?Data=" + data;
							}
                          
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

    function ValidateEmail(txtPrincipalEmailAddress) {
        var isValid = true;
        var errorControls = [];
        var element = document.getElementById(txtPrincipalEmailAddress);
        var label = $("label[for='" + element.id + "']")[0];


        var email = document.getElementById(txtPrincipalEmailAddress);
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
            }

            $(element).closest('.form-group').removeClass('has-success has-error').addClass('has-error');
            $(element).closest('.help-block').remove();
            element.style.borderColor = "red";
            errorControls.push(element.id);
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
    <section id="hero2" class="d-flex flex-column justify-content-center align-items-center">
        <div class="container text-center text-md-left" data-aos="fade-up">
            <h1>Welcome to <span>Covid-19 Impact Survey System</span></h1>
        </div>
    </section>
    <div class="container">
        <main id="main">
            <br />
            <h5>SCHOOL INFORMATION</h5>
            <hr />
            <div class="modal-body">
                <div class="card">
                    <div class="card-header">
                        User Account Verification:
                    </div>
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card-body">
                                <div class="row">
                        <div class="form-group col-md-6">
                            <label style="font-weight: 100">School Name:</label>
                            <label runat="server" id="lblSchoolName" style="font-weight: 900;" />
                        </div>

                        <div class="form-group col-md-6">
                            <label>EMIS No:</label>
                            <label runat="server" id="lblEMISNo" style="font-weight: 900;" />
                        </div>

                        <div class="form-group col-md-6">
                            <label>School Level:</label>
                            <label runat="server" id="lblSchoolLevel" style="font-weight: 900;" />
                        </div>

                        <div class="form-group col-md-6">
                            <label>Relationship to State:</label>
                            <label runat="server" id="lblRelationWithState" style="font-weight: 900;" />
                        </div>

                        <div class="form-group col-md-6">
                            <label>Educational District:</label>
                            <label runat="server" id="lblEducationalDistrict" style="font-weight: 900;" />
                        </div>
                        <div class="form-group col-md-6"></div>

                        <div class="form-group col-md-6">
                            <label for="txtPrincipalName">Principal Name</label>
                            <input type="text" id="txtPrincipalName" class="form-control" />
                        </div>


                        <div class="form-group col-md-6">
                            <label for="txtPrincipalIDNo">Principal ID No</label>
                            <input type="text" id="txtPrincipalIDNo" class="form-control" />
                        </div>

                        <div class="form-group col-md-6">
                            <label for="txtPrincipalEmailAddress">Email Address</label>
                            <input type="text" id="txtPrincipalEmailAddress" class="form-control" />
                        </div>

                        <div class="form-group col-md-6">
                            <label for="txtPrincipalCellphoneNo">Principal Cellphone No</label>
                            <input type="text" id="txtPrincipalCellphoneNo" class="form-control" />
                        </div>

                        <div class="form-group col-md-6">
                            <label for="txtPrincipalPersalNo">Principal Persal No</label>
                            <input type="text" id="txtPrincipalPersalNo" class="form-control" />
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12" style="text-align: right;">

                            <div class="alert alert-success" role="alert" id="divSaveSchoolDetailsSuccess" style="display: none;"></div>
                            <div class="alert alert-danger" role="alert" id="divSaveSchoolDetailssFailure" style="display: none;"></div>
                            <ul class="inline">
                                <li>
                                    <input onclick="SaveSchoolDetails(); return false;" type="button" class="btn btn-primary btn-sm" value="Save & Continue" /></li>
                            </ul>
                        </div>
                    </div>
                    </div>
                        </div>
                        </div>
                </div>
            </div>
        </main>
    </div>
<asp:HiddenField runat="server" ID="hdfEncryptedSchoolID" Value="" />
<asp:HiddenField runat="server" ID="hdfSchoolID" Value="0" />

</asp:Content>
