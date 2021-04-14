<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StaffInformation.ascx.cs" Inherits="OnlineSurvey.Pages.Survey.Controls.StaffInformation" %>

<script>

    $(document).ready(function () {
        LoadStaffInformation();
        LoadStaffInformationConcessions();
        LoadStaffInformationSMTManagementOfAbsenceByStaff();
    });

    function SaveStaffInformation() {
        var rows = $("#tblStaffInformationHeadcountBody tr");
        var staffInformationConcessionsRows = $("#tblStaffInformationConcessionsBody tr");
        var staffInformationHeadcountList = [];
        var staffInformationConcessionsList = [];

        rows.each(function (index, row) {
            var textboxes = $(row).closest("tr").find("input");
            var inputControls = [];

            textboxes.each(function (i, input) {
                inputControls.push(input.id);
            });

            var category = inputControls[0].split("_")[1];

            var staffInformation = {
                TenthDayStaffCountsStatePaid: $("#" + FindStaffInformationInput(inputControls, "TenthDayStaffCountsStatePaid")).val(),
                TenthDayStaffCountsSGBAppointed: $("#" + FindStaffInformationInput(inputControls, "TenthDayStaffCountsSGBAppointed")).val(),
                NoOfStaffMembersReturnedStatePaid: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffMembersReturnedStatePaid")).val(),
                NoOfStaffMembersReturnedSGBAppointed: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffMembersReturnedSGBAppointed")).val(),
                NoOfStaffApprovedForConcessionsStatePaid: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffApprovedForConcessionsStatePaid")).val(),
                NoOfStaffApprovedForConcessionsSGBAppointed: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffApprovedForConcessionsSGBAppointed")).val(),
                NoOfStaffAppliedAndAwaitingApprovalForConcessionsStatePaid: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffAppliedAndAwaitingApprovalForConcessionsStatePaid")).val(),
                NoOfStaffAppliedAndAwaitingApprovalForConcessionsSGBAppointed: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffAppliedAndAwaitingApprovalForConcessionsSGBAppointed")).val(),

                NoOfStaffAppliedAndNotApprovedForConcessionsStatePaid: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffAppliedAndNotApprovedForConcessionsStatePaid")).val(),
                NoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed")).val(),

                NoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid")).val(),
                NoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed")).val(),
                NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid")).val(),
                NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed")).val(),
                Category: category,
                SchoolID: $("#MainContent_hdfSchoolID").val()
            };

            staffInformationHeadcountList.push(staffInformation);
        });

        staffInformationConcessionsRows.each(function (index, row) {
            var textboxes = $(row).closest("tr").find("input");
            var inputControls = [];

            textboxes.each(function (i, input) {
                inputControls.push(input.id);
            });

            var category = inputControls[0].split("_")[1];

            var staffInformationConcession = {
                NoOfStaffApprovedForComorbiditiesStatePaid: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffApprovedForComorbiditiesStatePaid")).val(),
                NoOfStaffApprovedForComorbiditiesSGBAppointed: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffApprovedForComorbiditiesSGBAppointed")).val(),
                NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessStatePaid: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessStatePaid")).val(),
                NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessSGBAppointed: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessSGBAppointed")).val(),
                NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsStatePaid: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsStatePaid")).val(),
                NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsSGBAppointed: $("#" + FindStaffInformationInput(inputControls, "NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsSGBAppointed")).val(),
                NoOfSubstitutesAppliedForStatePaid: $("#" + FindStaffInformationInput(inputControls, "NoOfSubstitutesAppliedForStatePaid")).val(),
                NoOfSubstitutesReceivedStatePaid: $("#" + FindStaffInformationInput(inputControls, "NoOfSubstitutesReceivedStatePaid")).val(),
                Category: category,
                SchoolID: $("#MainContent_hdfSchoolID").val()
            };

            staffInformationConcessionsList.push(staffInformationConcession);
        });


        var sMTManagementOfAttendence = {
            HaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApproval: $("#chk_HaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApproval").prop("checked"),
            NoOfStatePaidEducators: $("#txt_NoOfStatePaidEducators").val(),
            NoOfPSStaff: $("#txt_NoOfPSStaff").val(),
            HasTheGDEInstitutedDisciplinaryProcesses: $("#chk_HasTheGDEInstitutedDisciplinaryProcesses").prop("checked"),
            HowManyCasesInvolvedStatePaidEducators: $("#txt_HowManyCasesInvolvedStatePaidEducators").val(),
            HowManyCasesInvolvedPSStaff: $("#txt_HowManyCasesInvolvedPSStaff").val(),
            SchoolID: $("#MainContent_hdfSchoolID").val()
        };

        var params = { staffInformationHeadcount: staffInformationHeadcountList, staffInformationConcessions: staffInformationConcessionsList, sMTManagementOfAttendence: sMTManagementOfAttendence };

        $.ajax({
            type: "POST",
            url: "../../Services/Service.asmx/SaveStaffInformation",
            data: JSON.stringify(params),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            beforeSend: function () {
                ShowLoadingSpinner();
            },
            success: function (response) {
                var jsonData = JSON.parse(response.d);

                var errorMsg = "";
                for (var i = 0; i < jsonData.length; i++) {
                    var message = jsonData[i];
                    if (message.toLowerCase() != "success") {
                        errorMsg = message;
                    }
                }

                if (errorMsg == "") {
                    $("#divSaveStaffInformationSuccess").text("Staff Information Saved Successfully.");
                    $("#divSaveStaffInformationSuccess").show();
                    $("#divSaveLearnerInformationFailure").hide();

                    setTimeout(
                        function () {
                            $("#divStaffInformation").hide();
                            $("#divClassInformation").show();
                            HideLoadingSpinner();
                        }
                        , 1000);

                } else {
                    $("#divSaveStaffInformationFailure").text(errorMsg);
                    $("#divSaveStaffInformationSuccess").hide();
                    $("#divSaveStaffInformationFailure").show();
                }
            },
            complete: function () {
                HideLoadingSpinner();
            },
            failure: function (jqXHR, textStatus, errorThrown) {
                alert("HTTP Status: " + jqXHR.status + "; Error Text: " + jqXHR.responseText); // Display error message  
            }
        });
    }

    function OnHaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApprovalCheck() {
        if ($("#chk_HaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApproval").prop("checked") == true) {
            $("#trHaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApprovalStatePaidEducators").show();
            $("#trHaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApprovalPSStaff").show();
            $("#trHaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApprovalTitle").show();
        } else {
            $("#trHaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApprovalStatePaidEducators").hide();
            $("#trHaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApprovalPSStaff").hide();
            $("#trHaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApprovalTitle").hide();

            $("#txt_NoOfStatePaidEducators").val("0");
            $("#txt_NoOfPSStaff").val("0");
        }
    }

    function OnHasTheGDEInstitutedDisciplinaryProcessesCheck() {
        if ($("#chk_HasTheGDEInstitutedDisciplinaryProcesses").prop("checked") == true) {
            $("#trHasTheGDEInstitutedDisciplinaryProcessesTitle").show();
            $("#trHasTheGDEInstitutedDisciplinaryProcessesStatepaidEducators").show();
            $("#trHasTheGDEInstitutedDisciplinaryProcessesPSStaff").show();
        } else {
            $("#trHasTheGDEInstitutedDisciplinaryProcessesStatepaidEducators").hide();
            $("#trHasTheGDEInstitutedDisciplinaryProcessesPSStaff").hide();
            $("#trHasTheGDEInstitutedDisciplinaryProcessesTitle").hide();

            $("#txt_HowManyCasesInvolvedStatePaidEducators").val("0");
            $("#txt_HowManyCasesInvolvedPSStaff").val("0");
        }
    }

    function LoadStaffInformation() {
        var params = { schoolID: $("#MainContent_hdfSchoolID").val() };

        $.ajax({
            type: "POST",
            url: "../../../Services/Service.asmx/GetStaffInformationBySchoolID",
            data: JSON.stringify(params),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            beforeSend: function () {
                ShowLoadingSpinner();
            },
            success: function (response) {
                var jsonData = JSON.parse(response.d);

                if (jsonData.Message.toLowerCase() == "success") {

                    //Show data
                    var data = jsonData.Data;

                    for (var i = 0; i < data.length; i++) {
                        var item = data[i];
                        var category = item.Category;

                        var txtTenthDayStaffCountsStatePaid = "#txt_" + category + "_" + "TenthDayStaffCountsStatePaid";
                        var txtTenthDayStaffCountsSGBAppointed = "#txt_" + category + "_" + "TenthDayStaffCountsSGBAppointed";
                        var txtNoOfStaffMembersReturnedStatePaid = "#txt_" + category + "_" + "NoOfStaffMembersReturnedStatePaid";
                        var txtNoOfStaffMembersReturnedSGBAppointed = "#txt_" + category + "_" + "NoOfStaffMembersReturnedSGBAppointed";
                        var txtNoOfStaffApprovedForConcessionsStatePaid = "#txt_" + category + "_" + "NoOfStaffApprovedForConcessionsStatePaid";
                        var txtNoOfStaffApprovedForConcessionsSGBAppointed = "#txt_" + category + "_" + "NoOfStaffApprovedForConcessionsSGBAppointed";
                        var txtNoOfStaffAppliedAndAwaitingApprovalForConcessionsStatePaid = "#txt_" + category + "_" + "NoOfStaffAppliedAndAwaitingApprovalForConcessionsStatePaid";
                        var txtNoOfStaffAppliedAndAwaitingApprovalForConcessionsSGBAppointed = "#txt_" + category + "_" + "NoOfStaffAppliedAndAwaitingApprovalForConcessionsSGBAppointed";
                        var txtNoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid = "#txt_" + category + "_" + "NoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid";
                        var txtNoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed = "#txt_" + category + "_" + "NoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed";
                        var txtNoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid = "#txt_" + category + "_" + "NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid";
                        var txtNoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed = "#txt_" + category + "_" + "NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed";
                        var txtNoOfStaffAppliedAndNotApprovedForConcessionsStatePaid = "#txt_" + category + "_" + "NoOfStaffAppliedAndNotApprovedForConcessionsStatePaid";
                        var txtNoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed = "#txt_" + category + "_" + "NoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed";

                        $(txtTenthDayStaffCountsStatePaid).val(item.TenthDayStaffCountsStatePaid);
                        $(txtTenthDayStaffCountsSGBAppointed).val(item.TenthDayStaffCountsSGBAppointed);
                        $(txtNoOfStaffMembersReturnedStatePaid).val(item.NoOfStaffMembersReturnedStatePaid);
                        $(txtNoOfStaffMembersReturnedSGBAppointed).val(item.NoOfStaffMembersReturnedSGBAppointed);

                        $(txtNoOfStaffApprovedForConcessionsStatePaid).val(item.NoOfStaffApprovedForConcessionsStatePaid);
                        $(txtNoOfStaffApprovedForConcessionsSGBAppointed).val(item.NoOfStaffApprovedForConcessionsSGBAppointed);
                        $(txtNoOfStaffAppliedAndAwaitingApprovalForConcessionsStatePaid).val(item.NoOfStaffAppliedAndAwaitingApprovalForConcessionsStatePaid);
                        $(txtNoOfStaffAppliedAndAwaitingApprovalForConcessionsSGBAppointed).val(item.NoOfStaffAppliedAndAwaitingApprovalForConcessionsSGBAppointed);

                        $(txtNoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid).val(item.NoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid);
                        $(txtNoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed).val(item.NoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed);
                        $(txtNoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid).val(item.NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid);
                        $(txtNoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed).val(item.NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed);

                        $(txtNoOfStaffAppliedAndNotApprovedForConcessionsStatePaid).val(item.NoOfStaffAppliedAndNotApprovedForConcessionsStatePaid);
                        $(txtNoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed).val(item.NoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed);
                    };

                } else {

                    $("#divSaveStaffInformationFailure").text(jsonData.Message);
                    $("#divSaveStaffInformationSuccess").hide();
                    $("#divSaveStaffInformationFailure").show();
                }
            },
            complete: function () {
                HideLoadingSpinner();
            },
            failure: function (jqXHR, textStatus, errorThrown) {
                alert("HTTP Status: " + jqXHR.status + "; Error Text: " + jqXHR.responseText); // Display error message  
            }
        });
    }

    function LoadStaffInformationConcessions() {
        var params = { schoolID: $("#MainContent_hdfSchoolID").val() };

        $.ajax({
            type: "POST",
            url: "../../../Services/Service.asmx/GetStaffInformationConcessionsBySchoolID",
            data: JSON.stringify(params),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            beforeSend: function () {
                ShowLoadingSpinner();
            },
            success: function (response) {
                var jsonData = JSON.parse(response.d);
                if (jsonData.Message.toLowerCase() == "success") {
                    //Show data
                    var data = jsonData.Data;

                    for (var i = 0; i < data.length; i++) {
                        var item = data[i];
                        var category = item.Category;

                        var txtNoOfStaffApprovedForComorbiditiesStatePaid = "#txt_" + category + "_" + "NoOfStaffApprovedForComorbiditiesStatePaid";
                        var txtNoOfStaffApprovedForComorbiditiesSGBAppointed = "#txt_" + category + "_" + "NoOfStaffApprovedForComorbiditiesSGBAppointed";
                        var txtNoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessStatePaid = "#txt_" + category + "_" + "NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessStatePaid";
                        var txtNoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessSGBAppointed = "#txt_" + category + "_" + "NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessSGBAppointed";
                        var txtNoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsStatePaid = "#txt_" + category + "_" + "NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsStatePaid";
                        var txtNoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsSGBAppointed = "#txt_" + category + "_" + "NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsSGBAppointed";
                        var txtNoOfSubstitutesAppliedForStatePaid = "#txt_" + category + "_" + "NoOfSubstitutesAppliedForStatePaid";
                        var txtNoOfSubstitutesReceivedStatePaid = "#txt_" + category + "_" + "NoOfSubstitutesReceivedStatePaid";
                       

                        $(txtNoOfStaffApprovedForComorbiditiesStatePaid).val(item.NoOfStaffApprovedForComorbiditiesStatePaid);
                        $(txtNoOfStaffApprovedForComorbiditiesSGBAppointed).val(item.NoOfStaffApprovedForComorbiditiesSGBAppointed);
                        $(txtNoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessStatePaid).val(item.NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessStatePaid);
                        $(txtNoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessSGBAppointed).val(item.NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessSGBAppointed);
                        $(txtNoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsStatePaid).val(item.NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsStatePaid);
                        $(txtNoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsSGBAppointed).val(item.NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsSGBAppointed);
                        $(txtNoOfSubstitutesAppliedForStatePaid).val(item.NoOfSubstitutesAppliedForStatePaid);
                        $(txtNoOfSubstitutesReceivedStatePaid).val(item.NoOfSubstitutesReceivedStatePaid);                      
                    };

                } else {

                    $("#divSaveStaffInformationFailure").text(jsonData.Message);
                    $("#divSaveStaffInformationSuccess").hide();
                    $("#divSaveStaffInformationFailure").show();
                }
            },
            complete: function () {
                HideLoadingSpinner();
            },
            failure: function (jqXHR, textStatus, errorThrown) {
                alert("HTTP Status: " + jqXHR.status + "; Error Text: " + jqXHR.responseText); // Display error message  
            }
        });
    }

    function LoadStaffInformationSMTManagementOfAbsenceByStaff() {
        var params = { schoolID: $("#MainContent_hdfSchoolID").val() };

        $.ajax({
            type: "POST",
            url: "../../../Services/Service.asmx/GetStaffInformationManagementOfAbsenceBySMTBySchoolID",
            data: JSON.stringify(params),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            beforeSend: function () {
                ShowLoadingSpinner();
            },
            success: function (response) {
                var jsonData = JSON.parse(response.d);

                if (jsonData.Message.toLowerCase() == "success") {
                    //Show data
                    var data = jsonData.Data;
                    if (data) {

                        $("#chk_HaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApproval").prop("checked", data.HaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApproval);
                        $("#txt_NoOfStatePaidEducators").val(data.NoOfStatePaidEducators);
                        $("#txt_NoOfPSStaff").val(data.NoOfPSStaff);
                        $("#chk_HasTheGDEInstitutedDisciplinaryProcesses").prop("checked", data.HasTheGDEInstitutedDisciplinaryProcesses);
                        $("#txt_HowManyCasesInvolvedStatePaidEducators").val(data.HowManyCasesInvolvedStatePaidEducators);
                        $("#txt_HowManyCasesInvolvedPSStaff").val(data.HowManyCasesInvolvedPSStaff);

                        if (data.HasTheGDEInstitutedDisciplinaryProcesses == true) {
                            $("#trHasTheGDEInstitutedDisciplinaryProcessesTitle").show();
                            $("#trHasTheGDEInstitutedDisciplinaryProcessesStatepaidEducators").show();
                            $("#trHasTheGDEInstitutedDisciplinaryProcessesPSStaff").show();
                        }

                        if (data.HaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApproval == true) {
                            $("#trHaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApprovalStatePaidEducators").show();
                            $("#trHaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApprovalPSStaff").show();
                            $("#trHaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApprovalTitle").show();
                        }
                    }

                } else {

                    $("#divSaveStaffInformationFailure").text(jsonData.Message);
                    $("#divSaveStaffInformationSuccess").hide();
                    $("#divSaveStaffInformationFailure").show();
                }
            },
            complete: function () {
                HideLoadingSpinner();
            },
            failure: function (jqXHR, textStatus, errorThrown) {
                alert("HTTP Status: " + jqXHR.status + "; Error Text: " + jqXHR.responseText); // Display error message  
            }
        });
    }

    function BackToLearnerInformation() {
        $("#divLearnerInformation").show();
        $("#divStaffInformation").hide();
    }

    function FindStaffInformationInput(textboxes, fieldName) {
        for (var i = 0; i < textboxes.length; i++) {
            var input = textboxes[i];
            var fName = input.split("_")[2];

            if (fName == fieldName) {
                return input;
            }
        }
    }
</script>


<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	<div class="card">
		<h5 class="card-header">3. STAFF INFORMATION </h5>
		<div class="card-body">
			<p style="color:#FF0000"><i>Compulsory for all schools</i></p> 
         <p style="color:#FF0000"><i>Independent Schools to complete all fields that apply</i></p> 
		<h6 style="color:#231f20">3.1 STAFF HEADCOUNT</h6>
			<div class="row">
				<div class="form-group col-md-12" style="overflow-x:auto;">
					<table class="table table-bordered" id="tblStaffInformation">
						<thead>
							 <tr>
								 <th scope="col" >COLUMN</th>
								 <th scope="col" colspan="2">A</th>
								 <th scope="col" colspan="2">B</th>
								 <th scope="col" colspan="2">C</th>
								 <th scope="col" colspan="2">D</th>
								 <th scope="col" colspan="2">E</th>
								 <th scope="col" colspan="2">F</th>
								 <th scope="col" colspan="2">G</th>
							</tr>
		   <tr>
		     <th scope="col" rowspan="2">CATEGORY</th>
		     <th scope="col" colspan="2">10th Day Staff counts (as at January 2020)</th>
		     <th scope="col" colspan="2">Number of staff members that have returned</th>
		     <th scope="col" colspan="2">Number of staff that have been approved for Concessions</th>
            <th scope="col" colspan="2">Number of staff that have applied and awaiting approval for Concessions*</th>
			 <th scope="col" colspan="2">Number of staff that have applied and have not been approved for concessions</th> 
			 <th scope="col" colspan="2">Number of staff that have not returned to work for no known reason/s </th> 
			 <th scope="col" colspan="2">Number of staff that have not returned as a result of resignation, retirement any other process provided for in law</th>
		   </tr>
		   <tr>
		     <th scope="col">State-Paid</th>
		     <th scope="col">SGB-Appointed</th>
			 <th scope="col">State-Paid</th>
		     <th scope="col">SGB-Appointed</th>
			 <th scope="col">State-Paid</th>
		     <th scope="col">SGB-Appointed</th>
             <th scope="col">State-Paid</th>
		     <th scope="col">SGB-Appointed</th>
			 <th scope="col">State-Paid</th>
		     <th scope="col">SGB-Appointed</th>
			 <th scope="col">State-Paid</th>
		     <th scope="col">SGB-Appointed</th>
		     <th scope="col">State-Paid</th>
		     <th scope="col">SGB-Appointed</th>
		   </tr>
		 </thead>
						<tbody id="tblStaffInformationHeadcountBody">
			<tr>
				<th scope="row">Educators</th> 
				<td><input type="number" style="min-width: 70px;" value="0" min="0" id="txt_Educators_TenthDayStaffCountsStatePaid"  class="form-control" /></td>
				<td><input type="number" style="min-width: 70px;"value="0" min="0" id="txt_Educators_TenthDayStaffCountsSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffMembersReturnedStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffMembersReturnedSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffApprovedForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffApprovedForConcessionsSGBAppointed"  class="form-control" /></td>               

				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffAppliedAndAwaitingApprovalForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffAppliedAndAwaitingApprovalForConcessionsSGBAppointed"  class="form-control" /></td>

                <td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffAppliedAndNotApprovedForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed"  class="form-control" /></td>
				
				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed"  class="form-control" /></td>
			</tr>
			
			<tr>
				<th scope="row">ECD Practitioners</th> 
				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_TenthDayStaffCountsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_TenthDayStaffCountsSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffMembersReturnedStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffMembersReturnedSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffApprovedForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffApprovedForConcessionsSGBAppointed"  class="form-control" /></td>
				
				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffAppliedAndAwaitingApprovalForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffAppliedAndAwaitingApprovalForConcessionsSGBAppointed"  class="form-control" /></td>

                <td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffAppliedAndNotApprovedForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed"  class="form-control" /></td>
				
				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed"  class="form-control" /></td>
			</tr>

			<tr>
				<th scope="row">Prof. non-teaching staff</th> 
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_TenthDayStaffCountsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_TenthDayStaffCountsSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffMembersReturnedStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffMembersReturnedSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffApprovedForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffApprovedForConcessionsSGBAppointed"  class="form-control" /></td>
				
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffAppliedAndAwaitingApprovalForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffAppliedAndAwaitingApprovalForConcessionsSGBAppointed"  class="form-control" /></td>

                <td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffAppliedAndNotApprovedForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed"  class="form-control" /></td>
				
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed"  class="form-control" /></td>
			</tr>

            <tr>
				<th scope="row">Admin. Staff</th> 
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_TenthDayStaffCountsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_TenthDayStaffCountsSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffMembersReturnedStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffMembersReturnedSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffApprovedForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffApprovedForConcessionsSGBAppointed"  class="form-control" /></td>
				
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffAppliedAndAwaitingApprovalForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffAppliedAndAwaitingApprovalForConcessionsSGBAppointed"  class="form-control" /></td>

                <td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffAppliedAndNotApprovedForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed"  class="form-control" /></td>
				
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed"  class="form-control" /></td>
			</tr>

			<tr>
				<th scope="row">Support staff</th> 
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_TenthDayStaffCountsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_TenthDayStaffCountsSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffMembersReturnedStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffMembersReturnedSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffApprovedForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffApprovedForConcessionsSGBAppointed"  class="form-control" /></td>
				
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffAppliedAndAwaitingApprovalForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffAppliedAndAwaitingApprovalForConcessionsSGBAppointed"  class="form-control" /></td>

                <td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffAppliedAndNotApprovedForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed"  class="form-control" /></td>
				
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed"  class="form-control" /></td>
			</tr>

			<tr>
				<th scope="row">Hostel staff</th> 
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_TenthDayStaffCountsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_TenthDayStaffCountsSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffMembersReturnedStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffMembersReturnedSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffApprovedForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffApprovedForConcessionsSGBAppointed"  class="form-control" /></td>
				
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffAppliedAndAwaitingApprovalForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffAppliedAndAwaitingApprovalForConcessionsSGBAppointed"  class="form-control" /></td>

                <td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffAppliedAndNotApprovedForConcessionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed"  class="form-control" /></td>
				
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed"  class="form-control" /></td>
			</tr>
		</tbody>
					</table>
				</div>
			</div>

			<div class="row">
<div class="form-group col-md-12" style="overflow-x:auto;">
	<h6 style="color:#231f20">3.2 MANAGEMENT OF CONCESSIONS</h6>
	  <p style="color:#FF0000"><i>Public schools Only</i></p> 
	<table class="table table-bordered" id="tblStaffInformationConcessions">
		 <thead>
		   <tr>
		     <th scope="col" rowspan="2">CATEGORY</th>
		     <th scope="col" colspan="2">Number of staff approved for comorbidities</th>
		     <th scope="col" colspan="2">Number of staff approved for concessions based on Age (60+) and Illness</th>
		     <th scope="col" colspan="2">Number of staff approved for concessions based on Underlying Conditions</th>
			 <th scope="col">Number of Substitutes Applied For</th> 
			 <th scope="col">Number of Substitutes received </th> 
		   </tr>
		   <tr>
		     <th scope="col">State-Paid</th>
		     <th scope="col">SGB-Appointed</th>
			 <th scope="col">State-Paid</th>
		     <th scope="col">SGB-Appointed</th>
			 <th scope="col">State-Paid</th>
		     <th scope="col">SGB-Appointed</th>
			 <th scope="col">State-Paid</th>
			 <th scope="col">State-Paid</th>
		   </tr>
		 </thead>
		  <tbody id="tblStaffInformationConcessionsBody">
			<tr>
				<th scope="row">Educators</th> 
				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffApprovedForComorbiditiesStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffApprovedForComorbiditiesSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsSGBAppointed"  class="form-control" /></td>
				
				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfSubstitutesAppliedForStatePaid"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_Educators_NoOfSubstitutesReceivedStatePaid"  class="form-control" /></td>
				
			</tr>

			<tr>
				<th scope="row">ECD Practitioners</th> 
				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffApprovedForComorbiditiesStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffApprovedForComorbiditiesSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessSGBAppointed"  class="form-control" /></td>

				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsSGBAppointed"  class="form-control" /></td>
				
				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfSubstitutesAppliedForStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ECDPractitioners_NoOfSubstitutesReceivedStatePaid"  class="form-control" /></td>
			</tr>

			<tr>
				<th scope="row">Prof. non-teaching staff</th> 
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffApprovedForComorbiditiesStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffApprovedForComorbiditiesSGBAppointed"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessSGBAppointed"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsSGBAppointed"  class="form-control" /></td>				
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfSubstitutesAppliedForStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_ProfNonTeachingStaff_NoOfSubstitutesReceivedStatePaid"  class="form-control" /></td>
			</tr>

			<tr>
				<th scope="row">Admin. Staff</th> 
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffApprovedForComorbiditiesStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffApprovedForComorbiditiesSGBAppointed"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessSGBAppointed"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsSGBAppointed"  class="form-control" /></td>				
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfSubstitutesAppliedForStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_AdminStaff_NoOfSubstitutesReceivedStatePaid"  class="form-control" /></td>
			</tr>

			<tr>
				<th scope="row">Support staff</th> 
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffApprovedForComorbiditiesStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffApprovedForComorbiditiesSGBAppointed"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessSGBAppointed"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsSGBAppointed"  class="form-control" /></td>				
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfSubstitutesAppliedForStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_SupportStaff_NoOfSubstitutesReceivedStatePaid"  class="form-control" /></td>
			</tr>

			<tr>
				<th scope="row">Hostel staff</th> 
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffApprovedForComorbiditiesStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffApprovedForComorbiditiesSGBAppointed"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessSGBAppointed"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsSGBAppointed"  class="form-control" /></td>				
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfSubstitutesAppliedForStatePaid"  class="form-control" /></td>
				<td><input type="number" value="0" min="0" id="txt_HostelStaff_NoOfSubstitutesReceivedStatePaid"  class="form-control" /></td>
			</tr>

			

			  </tbody>
		</table>
	</div>
	</div>

			<div class="row">
																<div class="form-group col-md-12" style="overflow-x:auto;">
																	<h6 style="color:#231f20">3.3 SMT MANAGEMENT OF ATTENDANCE BY STAFF</h6>
																	<table class="table table-bordered" id="tblManagementOfAbsenceBySMT">
																		 <tbody id="tblManagementOfAbsenceBySMTBody">
																			    <tr>
																					<th scope="row">3.3.1 Since the resumption of schooling, have there been staff members who have not returned to school without having obtained approval from either the school or the GDE? <i style="color:#FF0000">Tick if YES</i></th> 
																					<td><input type="checkbox" id="chk_HaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApproval" onclick="OnHaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApprovalCheck()" /></td>
																				</tr>
																			    <tr id="trHaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApprovalTitle">
																					<th scope="row" colspan="2" style="display:none;">If Yes, how many involved: </th> 
																				</tr>
																			    <tr id="trHaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApprovalStatePaidEducators" style="display:none;">
		                															 <th  scope="row" style="padding-left: 35px;">State-Paid Educators</th>
            																	     <td><input type="number" value="0" min="0" id="txt_NoOfStatePaidEducators"  class="form-control" /></td>
		                														</tr>
																			    <tr id="trHaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApprovalPSStaff" style="display:none;">
		                															 <th  scope="row" style="padding-left: 35px;">PS Staff</th>
            																	     <td><input type="number" value="0" min="0" id="txt_NoOfPSStaff"  class="form-control" /></td>
		                														</tr>
																				<tr>
																					<th scope="row">3.3.2 In line with the Public Servants Act and the Employment of Educator Acts, has the GDE instituted disciplinary processes against the defaulters above? <i style="color:#FF0000">Tick if YES</i></th> 
																					<td><input type="checkbox" id="chk_HasTheGDEInstitutedDisciplinaryProcesses" onclick="OnHasTheGDEInstitutedDisciplinaryProcessesCheck()" /></td>
																				</tr>
																				 <tr id="trHasTheGDEInstitutedDisciplinaryProcessesTitle"  style="display:none;">
																					<th scope="row" colspan="2">If Yes, how many cases involved: </th> 
																				</tr>
																			    <tr id="trHasTheGDEInstitutedDisciplinaryProcessesStatepaidEducators" style="display:none;">
		                															 <th  scope="row" style="padding-left: 35px;">State-Paid Educators</th>
            																	     <td><input type="number" value="0" min="0" id="txt_HowManyCasesInvolvedStatePaidEducators"  class="form-control" /></td>
		                														</tr>
																			    <tr id="trHasTheGDEInstitutedDisciplinaryProcessesPSStaff" style="display:none;">
		                															 <th  scope="row" style="padding-left: 35px;">PS Staff</th>
            																	     <td><input type="number" value="0" min="0" id="txt_HowManyCasesInvolvedPSStaff"  class="form-control" /></td>
		                														</tr>
																		 </tbody>
																     </table>
																	</div>
															</div>

															<div class="form-row">
																<div class="form-group col-12" style="text-align:right;">
																	<div class="alert alert-success" role="alert" id="divSaveStaffInformationSuccess" style="display:none;"></div>
																	<div class="alert alert-danger" role="alert" id="divSaveStaffInformationFailure"  style="display:none;;"></div>
																	  <ul class="inline">
																	    <li><input onclick="BackToLearnerInformation(); return false;" type="button" class="btn btn-primary btn-sm" value="Previous" /></li>
																	    <li><input onclick="SaveStaffInformation(); return false;" type="button" class="btn btn-primary btn-sm" value="Save & Continue" /></li>
																	  </ul>
																</div>
															</div>

		</div>
	</div>
</div>
				