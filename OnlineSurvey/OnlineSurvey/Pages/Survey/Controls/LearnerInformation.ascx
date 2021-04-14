<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LearnerInformation.ascx.cs" Inherits="OnlineSurvey.Pages.Survey.Controls.LearnerInformation" %>

<script type="text/javascript">

	$(document).ready(function () {
		AttachLearnerInformationCalculateEvent("tblLearnerInformationBody");
		LoadLearnerInformation();
		LoadLearnerInformationByCategoryBySchoolID();
        LoadAverageLearnerAttendenceBetween31AugustAnd11SeptemberBySchoolID();
        AttachAverageLearnersAttendenceCalculateEvent();
	});

	function SaveLearnerInformation() {
		var rows = $("#tblLearnerInformationBody tr");
        var learnerAttendenceRows = $("#tblAverageLearnersAttendenceBetween31AugustAnd11SeptemberBody tr");

        var learnerInformationList = [];
        var learnerAttendenceList = [];

        rows.each(function (index, row) {
            var textboxes = $(row).closest("tr").find("input");
            var inputControls = [];

            textboxes.each(function (i, input) {
                inputControls.push(input.id);
            });

            var grade = inputControls[0].split("_")[1];

            var li = {
                HeadcountEnrolment: $("#" + findLaernerInformationInput(inputControls, "HeadcountEnrolment")).val(),
                CurrentEnrolment: $("#" + findLaernerInformationInput(inputControls, "CurrentEnrolment")).val(),
                NoOfLearnersAttendingClassesAtSchoolCurrently: $("#" + findLaernerInformationInput(inputControls, "NoOfLearnersAttendingClassesAtSchoolCurrently")).val(),
                NoOfLearnersStudyingFromHomeCurrently: $("#" + findLaernerInformationInput(inputControls, "NoOfLearnersStudyingFromHomeCurrently")).val(),
                NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation: $("#" + findLaernerInformationInput(inputControls, "NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation")).val(),
                NoOfLearnersThatHavePotentiallyDroppedOutOfSchool: $("#" + findLaernerInformationInput(inputControls, "NoOfLearnersThatHavePotentiallyDroppedOutOfSchool")).val(),
                NoOfLearnersTransferredIntoTheSchool: $("#" + findLaernerInformationInput(inputControls, "NoOfLearnersTransferredIntoTheSchool")).val(),
                NoOfLearnersTransferredOutToOtherSchools: $("#" + findLaernerInformationInput(inputControls, "NoOfLearnersTransferredOutToOtherSchools")).val(),
                Grade: grade,
                SchoolID: $("#MainContent_hdfSchoolID").val()
                };

                learnerInformationList.push(li);
		});


        learnerAttendenceRows.each(function (index, row) {
            var textboxes = $(row).closest("tr").find("input");
            var inputControls = [];

            textboxes.each(function (i, input) {
                inputControls.push(input.id);
            });
			var t = inputControls[0];
			if (inputControls.length > 0) {
				var grade = inputControls[0].split("_")[1];

				var li = {
					NoOfLearnersExpected: $("#" + findLaernerInformationInput(inputControls, "NoOfLearnersExpected")).val(),
					NoOfLearnersReturned: $("#" + findLaernerInformationInput(inputControls, "NoOfLearnersReturned")).val(),
					AverageAttendance: $("#" + findLaernerInformationInput(inputControls, "AverageAttendance")).val(),
					Grade: grade,
					SchoolID: $("#MainContent_hdfSchoolID").val()
				};

				learnerAttendenceList.push(li);
			}
        });

        var reviewTheDeregistrationOfLearnersByGDE = null;
        if ($("input[name=rdb_ReviewTheDeregistrationOfLearnersByGDE]:checked").val() == "Yes") {
            reviewTheDeregistrationOfLearnersByGDE = true;
        } else if ($("input[name=rdb_ReviewTheDeregistrationOfLearnersByGDE]:checked").val() == "No") {
            reviewTheDeregistrationOfLearnersByGDE = false;
        } else {
            reviewTheDeregistrationOfLearnersByGDE = null;
        }

		var learnerInformation = {
            NoOfLearnersApprovedForLockdownLearningApprovedByGDE: $("#txt_NoOfLearnersInvolvedInLockdownLearningApprovedByGDE").val(), 
            NoOfLearnersInvolvedInLockdownLearningByArrangementWithTheSchool: $("#txt_NoOfLearnersInvolvedInLockdownLearningByArrangementWithTheSchool").val(), 
            NoOfLearnersApprovedForLockdownLearningDueToComorbidities: $("#txt_NoOfLearnersApprovedForLockdownLearningDueToComorbidities").val(), 
            NoOfLearnersApprovedForLockdownLearningDueToAnxietyOrFear: $("#txt_NoOfLearnersApprovedForLockdownLearningDueToAnxietyOrFear").val(), 
            NoOfLearnersApprovedForLockdownLearningDueToOtherHealthRelatedReasons: $("#txt_NoOfLearnersApprovedForLockdownLearningDueToOtherHealthRelatedReasons").val(), 
            PotentialDropOutYoungerThan7: $("#txt_PotentialDropOutYoungerThan7").val(), 
            PotentialDropOutBetween7And15: $("#txt_PotentialDropOutBetween7And15").val(), 
            PotentialDropOutOlderThan15: $("#txt_PotentialDropOutOlderThan15").val(), 
            ReviewTheDeregistrationOfLearnersByGDE: reviewTheDeregistrationOfLearnersByGDE, 
            NoOfPotentialDropOutsContactedBySchool: $("#txt_NoOfPotentialDropOutsContactedBySchool").val(), 
            NoOfLearnersWhoseParentsWereContacted: $("#txt_NoOfLearnersWhoseParentsWereContacted").val(), 
            NoOfLearnersUnableToBeContacted: $("#txt_NoOfLearnersUnableToBeContacted").val(), 
            DidTheSchoolEscalateToTheDistrict: $("#chk_EscalateOutcomeOfNonContactedLearnersDistrict").prop("checked"), 
            HasTherBeenFollowUpByDistrict: $("#chk_HasThereBeenFollowUpByTheDistrict").prop("checked"), 
            HasThisProvenSuccessful: $("#chk_HasThisProvenSuccessful").prop("checked"), 
            SchoolID: $("#MainContent_hdfSchoolID").val()
		};

        var params = { learnerInformation: learnerInformation, learnerInformationByCategories: learnerInformationList, averageLearnerAttendenceBetween31AugustAnd11September: learnerAttendenceList };

        $.ajax({
            type: "POST",
            url: "../../Services/Service.asmx/SaveLearnerInformation",
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
                    $("#divSaveLearnerInformationSuccess").text("Learner Information Saved Successfully.");
                    $("#divSaveLearnerInformationSuccess").show();
					$("#divSaveLearnerInformationFailure").hide();

                    setTimeout(
                        function () {
                            $("#divStaffInformation").show(); 
                            $("#divLearnerInformation").hide();
                            HideLoadingSpinner();
                        }
                        , 1000);

                } else {
                    $("#divSaveLearnerInformationFailure").text(errorMsg);
                    $("#divSaveLearnerInformationSuccess").hide();
                    $("#divSaveLearnerInformationFailure").show();
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

    function findLaernerInformationInput(textboxes, fieldName) {

        for (var i = 0; i < textboxes.length; i++) {
            var input = textboxes[i];
            var grade = input.split("_")[1];
            var fName = input.split("_")[2];

            if (fName == fieldName) {
                return input;
            }
        }
	}

    function GoToGuidelines() {
        $("#divGuidelines").show();
        $("#divLearnerInformation").hide();
	}

    function AttachLearnerInformationCalculateEvent(tableID) {
        var table = document.getElementById(tableID);
        var allrows = table.getElementsByTagName("tr");

        for (i = 0; i < allrows.length; i++) {
            var inputList = allrows[i].getElementsByTagName("input");
            for (var j = 0; j < inputList.length; j++) {
                var input = inputList[j];
                $(input).blur(function () {
                    CalculateLearnerInformationColumnTotals(this);
                });
            }
        }
	}

	function CalculateLearnerInformationColumnTotals(e) {
        var table = $(e).closest("tbody")[0];
        var columnIndex = $(e).closest("TD")[0].cellIndex;
        var colTotal = 0;

        var txtID = e.id;
        var txtData = txtID.split("_");
        var group = txtData[2];

      //  txt_Total_NoOfLearnersTransferredOutToOtherSchools

		var txt_Total = "#txt_Total_" + group;

        allrows = table.getElementsByTagName("tr");

        for (i = 0; i < allrows.length; i++) {
            var row_cells = allrows[i].getElementsByTagName("input");
            var targetControl = row_cells[columnIndex - 1];
            var val = targetControl.value;

            if (targetControl.id.split("_")[1] != "Total") {
                colTotal = colTotal + parseInt(val);
            }
        }

        $(txt_Total).val(colTotal);
	}

    function LoadLearnerInformation() {
        var params = { schoolID: $("#MainContent_hdfSchoolID").val() };

        $.ajax({
            type: "POST",
            url: "../../Services/Service.asmx/GetLearnerInformationBySchoolID",
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

                        $("#txt_NoOfLearnersInvolvedInLockdownLearningApprovedByGDE").val(data.NoOfLearnersApprovedForLockdownLearningApprovedByGDE);
                        $("#txt_NoOfLearnersInvolvedInLockdownLearningByArrangementWithTheSchool").val(data.NoOfLearnersInvolvedInLockdownLearningByArrangementWithTheSchool);
                        $("#txt_NoOfLearnersApprovedForLockdownLearningDueToComorbidities").val(data.NoOfLearnersApprovedForLockdownLearningDueToComorbidities);
                        $("#txt_NoOfLearnersApprovedForLockdownLearningDueToAnxietyOrFear").val(data.NoOfLearnersApprovedForLockdownLearningDueToAnxietyOrFear);
                        $("#txt_NoOfLearnersApprovedForLockdownLearningDueToOtherHealthRelatedReasons").val(data.NoOfLearnersApprovedForLockdownLearningDueToOtherHealthRelatedReasons);
                        $("#txt_PotentialDropOutYoungerThan7").val(data.PotentialDropOutYoungerThan7);
                        $("#txt_PotentialDropOutBetween7And15").val(data.PotentialDropOutBetween7And15);
                        $("#txt_PotentialDropOutOlderThan15").val(data.PotentialDropOutOlderThan15);
                        $("#txt_NoOfPotentialDropOutsContactedBySchool").val(data.NoOfPotentialDropOutsContactedBySchool);
                        $("#txt_NoOfLearnersWhoseParentsWereContacted").val(data.NoOfLearnersWhoseParentsWereContacted);
                        $("#txt_NoOfLearnersUnableToBeContacted").val(data.NoOfLearnersUnableToBeContacted);
                        $("#chk_EscalateOutcomeOfNonContactedLearnersDistrict").prop("checked", data.DidTheSchoolEscalateToTheDistrict);
                        $("#chk_HasThereBeenFollowUpByTheDistrict").prop("checked", data.HasTherBeenFollowUpByDistrict);
                        $("#chk_HasThisProvenSuccessful").prop("checked", data.HasThisProvenSuccessful);

                        if (data.ReviewTheDeregistrationOfLearnersByGDE == true) {
                            $("input[name=rdb_ReviewTheDeregistrationOfLearnersByGDE][value='Yes']").prop("checked", true);
                        } else if (data.ReviewTheDeregistrationOfLearnersByGDE == false) {
                            $("input[name=rdb_ReviewTheDeregistrationOfLearnersByGDE][value='No']").prop("checked", true);
                        } else {
                            $("input[name=rdb_ReviewTheDeregistrationOfLearnersByGDE][value='Not Applicable']").prop("checked", true);
                        }
                    }
                } else {

                    $("#divSaveLearnerInformationFailure").text(jsonData.Message);
                    $("#divSaveLearnerInformationSuccess").hide();
                    $("#divSaveLearnerInformationFailure").show();
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

    function LoadLearnerInformationByCategoryBySchoolID() {
        var params = { schoolID: $("#MainContent_hdfSchoolID").val() };

        $.ajax({
            type: "POST",
            url: "../../Services/Service.asmx/GetLearnerInformationByCategoryBySchoolID",
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
                        var grade = item.Grade;

                        var txtHeadcountEnrolment = "#txt_" + grade + "_" + "HeadcountEnrolment";
                        var txtCurrentEnrolment = "#txt_" + grade + "_" + "CurrentEnrolment";
                        var txtNoOfLearnersAttendingClassesAtSchoolCurrently = "#txt_" + grade + "_" + "NoOfLearnersAttendingClassesAtSchoolCurrently";
                        var txtNoOfLearnersStudyingFromHomeCurrently = "#txt_" + grade + "_" + "NoOfLearnersStudyingFromHomeCurrently";
                        var txtNoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation = "#txt_" + grade + "_" + "NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation";
                        var txtNoOfLearnersThatHavePotentiallyDroppedOutOfSchool = "#txt_" + grade + "_" + "NoOfLearnersThatHavePotentiallyDroppedOutOfSchool";
                        var txtNoOfLearnersTransferredIntoTheSchool = "#txt_" + grade + "_" + "NoOfLearnersTransferredIntoTheSchool";
                        var txtNoOfLearnersTransferredOutToOtherSchools = "#txt_" + grade + "_" + "NoOfLearnersTransferredOutToOtherSchools";

                        $(txtHeadcountEnrolment).val(item.HeadcountEnrolment);
                        $(txtCurrentEnrolment).val(item.CurrentEnrolment);
                        $(txtNoOfLearnersAttendingClassesAtSchoolCurrently).val(item.NoOfLearnersAttendingClassesAtSchoolCurrently);
                        $(txtNoOfLearnersStudyingFromHomeCurrently).val(item.NoOfLearnersStudyingFromHomeCurrently);

                        $(txtNoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation).val(item.NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation);
                        $(txtNoOfLearnersThatHavePotentiallyDroppedOutOfSchool).val(item.NoOfLearnersThatHavePotentiallyDroppedOutOfSchool);
                        $(txtNoOfLearnersTransferredIntoTheSchool).val(item.NoOfLearnersTransferredIntoTheSchool);
                        $(txtNoOfLearnersTransferredOutToOtherSchools).val(item.NoOfLearnersTransferredOutToOtherSchools);
                    };

                } else {

                    $("#divSaveLearnerInformationFailure").text(jsonData.Message);
                    $("#divSaveLearnerInformationSuccess").hide();
                    $("#divSaveLearnerInformationFailure").show();
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

    function LoadAverageLearnerAttendenceBetween31AugustAnd11SeptemberBySchoolID() {
        var params = { schoolID: $("#MainContent_hdfSchoolID").val() };

        $.ajax({
            type: "POST",
            url: "../../Services/Service.asmx/GetAverageLearnerAttendenceBetween31AugustAnd11SeptemberBySchoolID",
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
						var grade = item.Grade;
						
                        var txtNoOfLearnersExpected = "#txt_" + grade + "_" + "NoOfLearnersExpected";
                        var txtNoOfLearnersReturned = "#txt_" + grade + "_" + "NoOfLearnersReturned";
                        var txtAverageAttendance = "#txt_" + grade + "_" + "AverageAttendance";

                        $(txtNoOfLearnersExpected).val(item.NoOfLearnersExpected);
                        $(txtNoOfLearnersReturned).val(item.NoOfLearnersReturned);
                        $(txtAverageAttendance).val(item.AverageAttendance);
                    };

                } else {

                    $("#divSaveLearnerInformationFailure").text(jsonData.Message);
                    $("#divSaveLearnerInformationSuccess").hide();
                    $("#divSaveLearnerInformationFailure").show();
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

    function AttachAverageLearnersAttendenceCalculateEvent() {
        var table = document.getElementById("tblAverageLearnersAttendenceBetween31AugustAnd11SeptemberBody");
        var allrows = table.getElementsByTagName("tr");

        for (i = 0; i < allrows.length; i++) {
            var inputList = allrows[i].getElementsByTagName("input");
            for (var j = 0; j < inputList.length; j++) {
                var input = inputList[j];
                $(input).blur(function () {
                    CalculateAverageLearnersAttendenceColumnAverage(this);
                });
            }
        }
    }

    function CalculateAverageLearnersAttendenceColumnAverage(e) {
        var average = 0.0;
        var txtID = e.id;
        var txtData = txtID.split("_");
        var grade = txtData[1];

        var txt_NoOfLearnersReturned = "#txt_" + grade + "_NoOfLearnersReturned";
        var txt_NoOfLearnersExpected = "#txt_" + grade + "_NoOfLearnersExpected";
        var txt_Average = "#txt_" + grade + "_AverageAttendance";

        var noOfLearnersReturned = parseInt($(txt_NoOfLearnersReturned).val());
        var NoOfLearnersExpected = parseInt($(txt_NoOfLearnersExpected).val());

        if (noOfLearnersReturned > 0 && NoOfLearnersExpected > 0) {
            average = (noOfLearnersReturned / NoOfLearnersExpected) * 100;

            average = Math.round(average * 100) / 100
        }

        $(txt_Average).val(average);
    }
</script>


<div class="card">
    <h5 class="card-header">2. LEARNER INFORMATION</h5>
      <div class="card-body">
         <p style="color:#FF0000"><i>Compulsory for all schools</i></p> 
         <p style="color:#FF0000"><i>Independent Schools to complete all fields that apply</i></p> 
         <p style="color:#231f20">2.1	Kindly insert the total number of learners in each of the following categories Current Enrolment (B) = C + D = A – E – F + G - H </p>
        <div class="row">
            <div class="form-group col-md-12" style="overflow-x: auto;">
                <table class="table table-bordered" id="tblLearnerInformation">
                    <thead>
                        <tr>
                            <th scope="col">COLUMN</th>
                            <th scope="col">A</th>
                            <th scope="col">B</th>
                            <th scope="col">C</th>
                            <th scope="col">D</th>
                            <th scope="col">E</th>
                            <th scope="col">F</th>
                            <th scope="col">G</th>
                            <th scope="col">H</th>
                        </tr>
                        <tr>
                            <th scope="col">GRADE</th>
                            <th scope="col">Headcount Enrolment (end of January 2020)(A)</th>
                            <th scope="col">Current Enrolment (September 2020) (B) B=C+D= A-E-F</th>
                            <th scope="col">Number of learners attending classes at school currently (C)</th>

                            <th scope="col">Number of learners for studying from home currently (Lockdown Learning) (D)</th>
                            <th scope="col">Number of learners Deregistered from the school and approved for home education (E)</th>
                            <th scope="col">Number of learners that have potentially Dropped Out of school (F)</th>

                            <th scope="col">Number of Learners Transferred into the school (G) </th>
                            <th scope="col">Number of Learners Transferred out to other schools (H)</th>
                        </tr>
                    </thead>
                    <tbody id="tblLearnerInformationBody">

                        <tr>
                            <th scope="row">Pre-Grade R</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_PreGradeR_HeadcountEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_PreGradeR_CurrentEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_PreGradeR_NoOfLearnersAttendingClassesAtSchoolCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_PreGradeR_NoOfLearnersStudyingFromHomeCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_PreGradeR_NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_PreGradeR_NoOfLearnersThatHavePotentiallyDroppedOutOfSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_PreGradeR_NoOfLearnersTransferredIntoTheSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_PreGradeR_NoOfLearnersTransferredOutToOtherSchools" class="form-control" /></td>
                        </tr>


                        <tr>
                            <th scope="row">Grade R</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_GradeR_HeadcountEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_GradeR_CurrentEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_GradeR_NoOfLearnersAttendingClassesAtSchoolCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_GradeR_NoOfLearnersStudyingFromHomeCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_GradeR_NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_GradeR_NoOfLearnersThatHavePotentiallyDroppedOutOfSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_GradeR_NoOfLearnersTransferredIntoTheSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_GradeR_NoOfLearnersTransferredOutToOtherSchools" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 1</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade1_HeadcountEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade1_CurrentEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade1_NoOfLearnersAttendingClassesAtSchoolCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade1_NoOfLearnersStudyingFromHomeCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade1_NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade1_NoOfLearnersThatHavePotentiallyDroppedOutOfSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade1_NoOfLearnersTransferredIntoTheSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade1_NoOfLearnersTransferredOutToOtherSchools" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 2</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade2_HeadcountEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade2_CurrentEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade2_NoOfLearnersAttendingClassesAtSchoolCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade2_NoOfLearnersStudyingFromHomeCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade2_NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade2_NoOfLearnersThatHavePotentiallyDroppedOutOfSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade2_NoOfLearnersTransferredIntoTheSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade2_NoOfLearnersTransferredOutToOtherSchools" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 3</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade3_HeadcountEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade3_CurrentEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade3_NoOfLearnersAttendingClassesAtSchoolCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade3_NoOfLearnersStudyingFromHomeCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade3_NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade3_NoOfLearnersThatHavePotentiallyDroppedOutOfSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade3_NoOfLearnersTransferredIntoTheSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade3_NoOfLearnersTransferredOutToOtherSchools" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 4</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade4_HeadcountEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade4_CurrentEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade4_NoOfLearnersAttendingClassesAtSchoolCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade4_NoOfLearnersStudyingFromHomeCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade4_NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade4_NoOfLearnersThatHavePotentiallyDroppedOutOfSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade4_NoOfLearnersTransferredIntoTheSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade4_NoOfLearnersTransferredOutToOtherSchools" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 5</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade5_HeadcountEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade5_CurrentEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade5_NoOfLearnersAttendingClassesAtSchoolCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade5_NoOfLearnersStudyingFromHomeCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade5_NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade5_NoOfLearnersThatHavePotentiallyDroppedOutOfSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade5_NoOfLearnersTransferredIntoTheSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade5_NoOfLearnersTransferredOutToOtherSchools" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 6</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade6_HeadcountEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade6_CurrentEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade6_NoOfLearnersAttendingClassesAtSchoolCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade6_NoOfLearnersStudyingFromHomeCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade6_NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade6_NoOfLearnersThatHavePotentiallyDroppedOutOfSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade6_NoOfLearnersTransferredIntoTheSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade6_NoOfLearnersTransferredOutToOtherSchools" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 7</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade7_HeadcountEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade7_CurrentEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade7_NoOfLearnersAttendingClassesAtSchoolCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade7_NoOfLearnersStudyingFromHomeCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade7_NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade7_NoOfLearnersThatHavePotentiallyDroppedOutOfSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade7_NoOfLearnersTransferredIntoTheSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade7_NoOfLearnersTransferredOutToOtherSchools" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 8</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade8_HeadcountEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade8_CurrentEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade8_NoOfLearnersAttendingClassesAtSchoolCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade8_NoOfLearnersStudyingFromHomeCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade8_NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade8_NoOfLearnersThatHavePotentiallyDroppedOutOfSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade8_NoOfLearnersTransferredIntoTheSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade8_NoOfLearnersTransferredOutToOtherSchools" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 9</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade9_HeadcountEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade9_CurrentEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade9_NoOfLearnersAttendingClassesAtSchoolCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade9_NoOfLearnersStudyingFromHomeCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade9_NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade9_NoOfLearnersThatHavePotentiallyDroppedOutOfSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade9_NoOfLearnersTransferredIntoTheSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade9_NoOfLearnersTransferredOutToOtherSchools" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 10</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade10_HeadcountEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade10_CurrentEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade10_NoOfLearnersAttendingClassesAtSchoolCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade10_NoOfLearnersStudyingFromHomeCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade10_NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade10_NoOfLearnersThatHavePotentiallyDroppedOutOfSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade10_NoOfLearnersTransferredIntoTheSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade10_NoOfLearnersTransferredOutToOtherSchools" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 11</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade11_HeadcountEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade11_CurrentEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade11_NoOfLearnersAttendingClassesAtSchoolCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade11_NoOfLearnersStudyingFromHomeCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade11_NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade11_NoOfLearnersThatHavePotentiallyDroppedOutOfSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade11_NoOfLearnersTransferredIntoTheSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade11_NoOfLearnersTransferredOutToOtherSchools" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 12</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade12_HeadcountEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade12_CurrentEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade12_NoOfLearnersAttendingClassesAtSchoolCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade12_NoOfLearnersStudyingFromHomeCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade12_NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade12_NoOfLearnersThatHavePotentiallyDroppedOutOfSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade12_NoOfLearnersTransferredIntoTheSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade12_NoOfLearnersTransferredOutToOtherSchools" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">TOTAL</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Total_HeadcountEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Total_CurrentEnrolment" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Total_NoOfLearnersAttendingClassesAtSchoolCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Total_NoOfLearnersStudyingFromHomeCurrently" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Total_NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Total_NoOfLearnersThatHavePotentiallyDroppedOutOfSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Total_NoOfLearnersTransferredIntoTheSchool" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Total_NoOfLearnersTransferredOutToOtherSchools" class="form-control" /></td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12" style="overflow-x: auto;">
                <table class="table table-bordered" id="tblLearnerInformationLockdownLearningAndPotentialDropOut">
                    <thead>
                        <tr>
                            <th scope="col" colspan="2">2.2 Learner Information: Lockdown Learning & Potential Drop-Out</th>
                        </tr>
                        <tr>
                            <th scope="col" colspan="2">2.2.1 The Number of learners approved for Lockdown Learning (Column D Total)</th>
                        </tr>

                    </thead>
                    <tbody id="tblLearnerInformationLockdownLearningAndPotentialDropOutBody">
                        <tr>
                            <th scope="row" style="padding-left: 35px;">Approved by GDE</th>
                            <td>
                                <input type="number" value="0" id="txt_NoOfLearnersInvolvedInLockdownLearningApprovedByGDE" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row" style="padding-left: 35px;">By Arrangement with the School</th>
                            <td>
                                <input type="number" value="0" id="txt_NoOfLearnersInvolvedInLockdownLearningByArrangementWithTheSchool" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="col" colspan="2">2.2.2 The Number of learners approved for lockdown learning (Column D) due to</th>
                        </tr>
                        <tr>
                            <th scope="row" style="padding-left: 35px;">Comorbidities</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_NoOfLearnersApprovedForLockdownLearningDueToComorbidities" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row" style="padding-left: 35px;">Anxiety/Fear</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_NoOfLearnersApprovedForLockdownLearningDueToAnxietyOrFear" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row" style="padding-left: 35px;">Other Health Related Reasons</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_NoOfLearnersApprovedForLockdownLearningDueToOtherHealthRelatedReasons" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row" style="padding-left: 35px;">Reasons Unknown to School – application approved by the GDE Online</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_ReasonsUnknownToSchool" class="form-control" /></td>
                        </tr>


                        <tr>
                            <th scope="col" colspan="2">2.2.3 Provide an age analysis of those learners that have potentially Dropped Out (Column F) </th>
                        </tr>
                        <tr>
                            <th scope="row" style="padding-left: 35px;">Learners Younger than 7</th>2.3.6

                            <td>
                                <input type="number" value="0" min="0" id="txt_PotentialDropOutYoungerThan7" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row" style="padding-left: 35px;">Learners Between 7-15</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_PotentialDropOutBetween7And15" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row" style="padding-left: 35px;">Learners Older than 15</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_PotentialDropOutOlderThan15" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">2.2.4 Did the school review the deregistration of learners that were approved for home education by the GDE?:
                        </th>
                            <td>

                                <div class="custom-control custom-radio">
                                  <input type="radio" class="custom-control-input" id="rdbNotApplicable" value="Not Applicable" checked name="rdb_ReviewTheDeregistrationOfLearnersByGDE">
                                  <label class="custom-control-label" for="rdbNotApplicable">Not Applicable</label>
                                </div>
                                 <div class="custom-control custom-radio">
                                  <input type="radio" class="custom-control-input"  id="rdbNo" value="No" name="rdb_ReviewTheDeregistrationOfLearnersByGDE">
                                  <label class="custom-control-label" for="rdbNo">No</label>
                                </div>
                                 <div class="custom-control custom-radio">
                                  <input type="radio" class="custom-control-input"  id="rdbYes" value="Yes" name="rdb_ReviewTheDeregistrationOfLearnersByGDE">
                                  <label class="custom-control-label" for="rdbYes">Yes</label>
                                </div>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>



        <div class="row">
            <div class="form-group col-md-12" style="overflow-x: auto;">
                <table class="table table-bordered" id="tblManagementOfLearnerAbsenceByTheSMT">
                    <thead>
                        <tr>
                            <th scope="col" colspan="2">2.3 Management of Learner absence by the SMT</th>
                        </tr>
                    </thead>
                    <tbody id="tblManagementOfLearnerAbsenceByTheSMTBody">
                        <tr>
                            <th scope="row">2.3.1 How many learners from Column F (Potential Drop-outs), that have not returned, were contacted by the school?</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_NoOfPotentialDropOutsContactedBySchool" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">2.3.2 How many learners, whose parents were successfully contacted, have still not returned to school? </th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_NoOfLearnersWhoseParentsWereContacted" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">2.3.3 How many learners was the school unable to contact? </th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_NoOfLearnersUnableToBeContacted" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">2.3.4 Did the school escalate the above to the District? <i style="color:#FF0000">Tick if YES</i></th>
                            <td>
                                <input type="checkbox" id="chk_EscalateOutcomeOfNonContactedLearnersDistrict" /></td>
                        </tr>
                        <tr>
                            <th scope="row">2.3.5 Has there been follow-up by the district? <i style="color:#FF0000">Tick if YES</i> </th>
                            <td>
                                <input type="checkbox" id="chk_HasThereBeenFollowUpByTheDistrict" /></td>
                        </tr>
                        <tr>
                            <th scope="row">2.3.6 If Yes, has this proven successful? <i style="color:#FF0000">Tick if YES</i> </th>
                            <td>
                                <input type="checkbox" id="chk_HasThisProvenSuccessful" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>


        <div class="row">
            <div class="form-group col-md-12" style="overflow-x: auto;">
                 <p style="color:#231f20"> 2.4 PERCENTAGE LEARNER ATTENDANCE OVER THE PERIOD 31 AUGUST to 11 SEPTEMBER 2020</p>
                 <p style="color:#FF0000"><i>Complete for all grades that are specific to the school</i></p> 
                <p>This table seeks to obtain the percentage learner attendance per grade over the week 31 August-11 September 2020</p>
                <p>Column B figures involve a sum of the actual attendance per grade over the period 31 August-11 September</p>
                <p>Column C figures are obtained through dividing the value in Column B (Actual attendance) by the value in Column A (Expected attendance) and multiplied by 100 or B/A x 100</p>
                <table class="table table-bordered" id="tblAverageLearnersAttendenceBetween31AugustAnd11September">
                    <thead>
                        <tr>
                            <th scope="col">COLUMN</th>
                            <th scope="col">A</th>
                            <th scope="col">B</th>
                            <th scope="col">C</th>
                        </tr>
                        <tr>
                            <th scope="col">GRADE</th>
                            <th scope="col">Total Number of learners expected over the period 31 August to 11 September</th>
                            <th scope="col">Total Number of learners who returned to school over the period 31 August to 11 September</th>
                            <th scope="col">Attendance (31 August to 11 September) expressed as a %</th>
                        </tr>
                    </thead>
                    <tbody id="tblAverageLearnersAttendenceBetween31AugustAnd11SeptemberBody">


                        <tr>
                            <th scope="row">Pre-Grade R</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_PreGradeR_NoOfLearnersExpected" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_PreGradeR_NoOfLearnersReturned" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_PreGradeR_AverageAttendance" class="form-control" /></td>
                        </tr>


                        <tr>
                            <th scope="row">Grade R</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_GradeR_NoOfLearnersExpected" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_GradeR_NoOfLearnersReturned" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_GradeR_AverageAttendance" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 1</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade1_NoOfLearnersExpected" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade1_NoOfLearnersReturned" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade1_AverageAttendance" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 2</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade2_NoOfLearnersExpected" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade2_NoOfLearnersReturned" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade2_AverageAttendance" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 3</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade3_NoOfLearnersExpected" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade3_NoOfLearnersReturned" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade3_AverageAttendance" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 4</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade4_NoOfLearnersExpected" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade4_NoOfLearnersReturned" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade4_AverageAttendance" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 5</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade5_NoOfLearnersExpected" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade5_NoOfLearnersReturned" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade5_AverageAttendance" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 6</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade6_NoOfLearnersExpected" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade6_NoOfLearnersReturned" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade6_AverageAttendance" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 7</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade7_NoOfLearnersExpected" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade7_NoOfLearnersReturned" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade7_AverageAttendance" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 8</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade8_NoOfLearnersExpected" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade8_NoOfLearnersReturned" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade8_AverageAttendance" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 9</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade9_NoOfLearnersExpected" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade9_NoOfLearnersReturned" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade9_AverageAttendance" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 10</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade10_NoOfLearnersExpected" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade10_NoOfLearnersReturned" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade10_AverageAttendance" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 11</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade11_NoOfLearnersExpected" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade11_NoOfLearnersReturned" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade11_AverageAttendance" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th scope="row">Grade 12</th>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade12_NoOfLearnersExpected" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade12_NoOfLearnersReturned" class="form-control" /></td>
                            <td>
                                <input type="number" value="0" min="0" id="txt_Grade12_AverageAttendance" class="form-control" /></td>
                        </tr>
                        <tr>
                    </tbody>
                </table>

            </div>
        </div>



        <div class="form-row">
            <div class="form-group col-12" style="text-align: right;">
                <div class="alert alert-success" role="alert" id="divSaveLearnerInformationSuccess" style="display: none;"></div>
                <div class="alert alert-danger" role="alert" id="divSaveLearnerInformationFailure" style="display: none;"></div>
                <ul class="inline">
                    <li>
                        <input onclick="GoToGuidelines(); return false;" type="button" class="btn btn-primary btn-sm" value="Previous" /></li>
                    <li>
                        <input onclick="SaveLearnerInformation(); return false;" type="button" class="btn btn-primary btn-sm" value="Save & Continue" /></li>
                </ul>
            </div>
        </div>
    </div>
</div>

