<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ClassInformation.ascx.cs" Inherits="OnlineSurvey.Pages.Survey.Controls.ClassInformation" %>

<script>
	$(document).ready(function () {
        InitializeMultiSelect("ddl_CombinedGradesForMultiGradeClasses");
        InitializeMultiSelect("ddl_GradesThatDidNotRotate");
		InitializeMultiSelect("ddl_SchoolDisinfectors");

		LoadClassInformation();
	});

    $(window).on('load', function () {
        AttachClassInformationCalculateEvent("tblClassUnitsInEachGradeBody");
        AttachClassInformationCalculateEvent("tblClassroomsUsedGradeBeforeLockdownBody");
        AttachClassInformationCalculateEvent("tblCohortsPerGradeBody");
    });

    function BackToStaffInformation() {
        $("#divStaffInformation").show();
        $("#divClassInformation").hide();
	} 

	function SaveClassInformation() {
        var isValid = true;
        if (document.getElementById("trOtherCycle").style.display != "none" && $("#txt_OtherCycle").val() == "") {
            $("#spnOtherCycle").show();
            isValid = false;
        } else {
            $("#spnOtherCycle").hide();
        }

        if (isValid == false) {
            return false;
        }

		var classInformationDetails = [];

		var classInformtion = {
            DoesTheSchoolPlatoon: $("#chk_DoesTheSchoolPlatoon").prop("checked"),
            DoesTheSchoolHaveDoubleShifts: $("#chk_DoesTheSchoolHaveDoubleShifts").prop("checked"),
            DoesTheSchoolHaveMultiGradeclasses: $("#chk_DoesTheSchoolHaveMultiGradeClasses").prop("checked"),
            NoOfLearnersAccommodatedForDailyRotation: $("#txt_NoOfLearnersDailyRotation").val(),
            NoOfLearnersAccommodatedForWeeklyRotation: $("#txt_NoOfLearnersWeeklyRotation").val(),
            NoOfLearnersAccommodatedForHybrid: $("#txt_NoOfLearnersHybridModel").val(),
            LearnerCapacityOfSchoolNormsAndStandardForSchoolInfrastructure: $("#txt_LearnerCapacityOfSchoolNormsAndStandardForSchoolInfrastructure").val(),
            HasTheSchoolAdjustedTheSchoolDayToCoverTheRegulatedHoursForCurriculumDelivery: $("#chk_HasTheSchoolAdjustedTheSchoolDayToCoverTheRegulatedHoursForCurriculumDelivery").prop("checked"),
            TotalTeachingTimeOverTheCycle: $("#txt_TotalTeachingTimeOverTheCycle").val(),
            WereAdditionalMobileClassroomsRequestedByTheSchool: $("#chk_WereAdditionalMobileClassroomsRequestedByTheSchool").prop("checked"),
            NoOfMobileClassroomsRequestedByTheSchool: $("#txt_NoOfMobileClassroomsRequestedByTheSchool").val(),
            NoOfAdditionalMobileClassroomsDelivered: $("#txt_NoOfAdditionalMobileClassroomsDelivered").val(),
            NoOfClassroomsNotUsedDueToPoorCondition: $("#txt_NoOfClassroomsNotUsedDueToPoorCondition").val(),
            WasTheSchoolClosedDueToCovid19: $("#chk_WasTheSchoolClosedDueToCovid19").prop("checked"),
            NoOfOccasionsTheSchoolClosedDueToCovid19: $("#txt_NoOfOccasionsTheSchoolClosedDueToCovid19").val(),
            LongestDurationTheSchoolClosedDueToCovid19: $("#txt_LongestDurationTheSchoolClosedDueToCovid19").val(),
            WasTheSchoolDisinfected: $("#chk_WasTheSchoolDisinfected").prop("checked"),
            SchoolID: $("#MainContent_hdfSchoolID").val(),
            IntroducedRotationID: $("#ddl_SchoolIntroducedRotations").val(),
            TimetableCycleID: $("#ddl_TimetableCycles").val(),
            SchoolRotationApproachID: $("#ddl_SchoolRotationApproaches").val(),
            WasTheSchoolAbleToAccommodatePhysicalDistancingID: $("#ddl_WasTheSchoolAbleToAccommodatePhysicalDistancing").val()
		};

		var noOfClassUnitsInEachGrade = {
            Category: "ClassUnitsInEachGrade",
            PreGradeR: $("#txt_PreGradeR_ClassUnitsInEachGrade").val(),
            GradeR: $("#txt_GradeR_ClassUnitsInEachGrade").val(),
            Grade1: $("#txt_Grade1_ClassUnitsInEachGrade").val(),
            Grade2: $("#txt_Grade2_ClassUnitsInEachGrade").val(),
            Grade3: $("#txt_Grade3_ClassUnitsInEachGrade").val(),
            Grade4: $("#txt_Grade4_ClassUnitsInEachGrade").val(),
            Grade5: $("#txt_Grade5_ClassUnitsInEachGrade").val(),
            Grade6: $("#txt_Grade6_ClassUnitsInEachGrade").val(),
            Grade7: $("#txt_Grade7_ClassUnitsInEachGrade").val(),
            Grade8: $("#txt_Grade8_ClassUnitsInEachGrade").val(),
            Grade9: $("#txt_Grade9_ClassUnitsInEachGrade").val(),
            Grade10: $("#txt_Grade10_ClassUnitsInEachGrade").val(),
            Grade11: $("#txt_Grade11_ClassUnitsInEachGrade").val(),
			Grade12: $("#txt_Grade12_ClassUnitsInEachGrade").val(),
            Spec: $("#txt_Spec_ClassUnitsInEachGrade").val(),
            Oth: $("#txt_Oth_ClassUnitsInEachGrade").val(),
            Total: $("#txt_Total_ClassUnitsInEachGrade").val(),
            SchoolID: $("#MainContent_hdfSchoolID").val()
		};

		classInformationDetails.push(noOfClassUnitsInEachGrade);

        var noOfClassroomsUsedGradeBeforeLockdown = {
            Category: "ClassroomsUsedGradeBeforeLockdown",
            PreGradeR: $("#txt_PreGradeR_ClassroomsUsedGradeBeforeLockdown").val(),
            GradeR: $("#txt_GradeR_ClassroomsUsedGradeBeforeLockdown").val(),
            Grade1: $("#txt_Grade1_ClassroomsUsedGradeBeforeLockdown").val(),
            Grade2: $("#txt_Grade2_ClassroomsUsedGradeBeforeLockdown").val(),
            Grade3: $("#txt_Grade3_ClassroomsUsedGradeBeforeLockdown").val(),
            Grade4: $("#txt_Grade4_ClassroomsUsedGradeBeforeLockdown").val(),
            Grade5: $("#txt_Grade5_ClassroomsUsedGradeBeforeLockdown").val(),
            Grade6: $("#txt_Grade6_ClassroomsUsedGradeBeforeLockdown").val(),
            Grade7: $("#txt_Grade7_ClassroomsUsedGradeBeforeLockdown").val(),
            Grade8: $("#txt_Grade8_ClassroomsUsedGradeBeforeLockdown").val(),
            Grade9: $("#txt_Grade9_ClassroomsUsedGradeBeforeLockdown").val(),
            Grade10: $("#txt_Grade10_ClassroomsUsedGradeBeforeLockdown").val(),
            Grade11: $("#txt_Grade11_ClassroomsUsedGradeBeforeLockdown").val(),
			Grade12: $("#txt_Grade12_ClassroomsUsedGradeBeforeLockdown").val(),
            Spec: $("#txt_Spec_ClassroomsUsedGradeBeforeLockdown").val(),
            Oth: $("#txt_Oth_ClassroomsUsedGradeBeforeLockdown").val(),
            Total: $("#txt_Total_ClassroomsUsedGradeBeforeLockdown").val(),
            SchoolID: $("#MainContent_hdfSchoolID").val()
		};

        classInformationDetails.push(noOfClassroomsUsedGradeBeforeLockdown);

        var noOfCohortsPerGrade = {
            Category: "CohortsPerGrade",
            PreGradeR: $("#txt_PreGradeR_CohortsPerGrade").val(),
            GradeR: $("#txt_GradeR_CohortsPerGrade").val(),
            Grade1: $("#txt_Grade1_CohortsPerGrade").val(),
            Grade2: $("#txt_Grade2_CohortsPerGrade").val(),
            Grade3: $("#txt_Grade3_CohortsPerGrade").val(),
            Grade4: $("#txt_Grade4_CohortsPerGrade").val(),
            Grade5: $("#txt_Grade5_CohortsPerGrade").val(),
            Grade6: $("#txt_Grade6_CohortsPerGrade").val(),
            Grade7: $("#txt_Grade7_CohortsPerGrade").val(),
            Grade8: $("#txt_Grade8_CohortsPerGrade").val(),
            Grade9: $("#txt_Grade9_CohortsPerGrade").val(),
            Grade10: $("#txt_Grade10_CohortsPerGrade").val(),
            Grade11: $("#txt_Grade11_CohortsPerGrade").val(),
			Grade12: $("#txt_Grade12_CohortsPerGrade").val(),
            Spec: $("#txt_Spec_CohortsPerGrade").val(),
            Oth: $("#txt_Oth_CohortsPerGrade").val(),
            Total: $("#txt_Total_CohortsPerGrade").val(),
            SchoolID: $("#MainContent_hdfSchoolID").val()
		};

        classInformationDetails.push(noOfCohortsPerGrade);

        var periodsOfferedPerDayPerClassUnit = {
            Category: "PeriodsOfferedPerDayPerClassUnit",
            GradeR: $("#txt_GradeR_PeriodsOfferedPerDayPerClassUnit").val(),
            Grade1: $("#txt_Grade1_PeriodsOfferedPerDayPerClassUnit").val(),
            Grade2: $("#txt_Grade2_PeriodsOfferedPerDayPerClassUnit").val(),
            Grade3: $("#txt_Grade3_PeriodsOfferedPerDayPerClassUnit").val(),
            Grade4: $("#txt_Grade4_PeriodsOfferedPerDayPerClassUnit").val(),
            Grade5: $("#txt_Grade5_PeriodsOfferedPerDayPerClassUnit").val(),
            Grade6: $("#txt_Grade6_PeriodsOfferedPerDayPerClassUnit").val(),
            Grade7: $("#txt_Grade7_PeriodsOfferedPerDayPerClassUnit").val(),
            Grade8: $("#txt_Grade8_PeriodsOfferedPerDayPerClassUnit").val(),
            Grade9: $("#txt_Grade9_PeriodsOfferedPerDayPerClassUnit").val(),
            Grade10: $("#txt_Grade10_PeriodsOfferedPerDayPerClassUnit").val(),
            Grade11: $("#txt_Grade11_PeriodsOfferedPerDayPerClassUnit").val(),
            Grade12: $("#txt_Grade12_PeriodsOfferedPerDayPerClassUnit").val(),
            SchoolID: $("#MainContent_hdfSchoolID").val()
		};

        classInformationDetails.push(periodsOfferedPerDayPerClassUnit);

        var amountOfTimeAllocatedPerPeriodPerGrade = {
            Category: "AmountOfTimeAllocatedPerPeriodPerGrade",
            GradeR: $("#txt_GradeR_AmountOfTimeAllocatedPerPeriodPerGrade").val(),
            Grade1: $("#txt_Grade1_AmountOfTimeAllocatedPerPeriodPerGrade").val(),
            Grade2: $("#txt_Grade2_AmountOfTimeAllocatedPerPeriodPerGrade").val(),
            Grade3: $("#txt_Grade3_AmountOfTimeAllocatedPerPeriodPerGrade").val(),
            Grade4: $("#txt_Grade4_AmountOfTimeAllocatedPerPeriodPerGrade").val(),
            Grade5: $("#txt_Grade5_AmountOfTimeAllocatedPerPeriodPerGrade").val(),
            Grade6: $("#txt_Grade6_AmountOfTimeAllocatedPerPeriodPerGrade").val(),
            Grade7: $("#txt_Grade7_AmountOfTimeAllocatedPerPeriodPerGrade").val(),
            Grade8: $("#txt_Grade8_AmountOfTimeAllocatedPerPeriodPerGrade").val(),
            Grade9: $("#txt_Grade9_AmountOfTimeAllocatedPerPeriodPerGrade").val(),
            Grade10: $("#txt_Grade10_AmountOfTimeAllocatedPerPeriodPerGrade").val(),
            Grade11: $("#txt_Grade11_AmountOfTimeAllocatedPerPeriodPerGrade").val(),
            Grade12: $("#txt_Grade12_AmountOfTimeAllocatedPerPeriodPerGrade").val(),
            SchoolID: $("#MainContent_hdfSchoolID").val()
        };

        classInformationDetails.push(amountOfTimeAllocatedPerPeriodPerGrade);

		var selectedCombinedGradesForMultiGradeClasses = $("#ddl_CombinedGradesForMultiGradeClasses").val();
		var selectedGradesThatDidNotRotate = $("#ddl_GradesThatDidNotRotate").val();
		var selectedSchoolDisinfectors = $("#ddl_SchoolDisinfectors").val();

		var params = {
			classInformtion: classInformtion,
			classInformationDetails: classInformationDetails,
			selectedCombinedGradesForMultiGradeClasses: selectedCombinedGradesForMultiGradeClasses,
			selectedGradesThatDidNotRotate: selectedGradesThatDidNotRotate,
            selectedSchoolDisinfectors: selectedSchoolDisinfectors
		};

        $.ajax({
            type: "POST",
            url: "../../Services/Service.asmx/SaveClassInformation",
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
                    $("#divSaveClassInformationSuccess").text("Class Information Saved Successfully.");
                    $("#divSaveClassInformationSuccess").show();
					$("#divSaveClassInformationFailure").hide();

                    setTimeout(
                        function () {
                            $("#divFinanceInformation").show();
                            $("#divClassInformation").hide();
                            HideLoadingSpinner();
                        }
                        , 1000);
                } else {
                    $("#divSaveClassInformationFailure").text(errorMsg);
                    $("#divSaveClassInformationSuccess").hide();
                    $("#divSaveClassInformationFailure").show();
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

	function OnTimetableCyclesChange() {
        if ($("#ddl_TimetableCycles").val() == "14") {
			$("#trOtherCycle").show();
		} else {
			$("#trOtherCycle").hide();
			$("#txt_OtherCycle").val("");
        }
	}

    function LoadClassInformation() {
        var params = { schoolID: $("#MainContent_hdfSchoolID").val() };

        $.ajax({
            type: "POST",
            url: "../../../Services/Service.asmx/GetClassInformationBySchoolID",
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

						$("#chk_DoesTheSchoolPlatoon").prop("checked", data.DoesTheSchoolPlatoon);
						$("#chk_DoesTheSchoolHaveDoubleShifts").prop("checked", data.DoesTheSchoolHaveDoubleShifts);
						$("#chk_DoesTheSchoolHaveMultiGradeClasses").prop("checked", data.DoesTheSchoolHaveMultiGradeclasses);
						$("#txt_NoOfLearnersDailyRotation").val(data.NoOfLearnersAccommodatedForDailyRotation);
						$("#txt_NoOfLearnersWeeklyRotation").val(data.NoOfLearnersAccommodatedForWeeklyRotation);
						$("#txt_NoOfLearnersHybridModel").val(data.NoOfLearnersAccommodatedForHybrid);
						$("#txt_LearnerCapacityOfSchoolNormsAndStandardForSchoolInfrastructure").val(data.LearnerCapacityOfSchoolNormsAndStandardForSchoolInfrastructure);
						$("#chk_HasTheSchoolAdjustedTheSchoolDayToCoverTheRegulatedHoursForCurriculumDelivery").prop("checked", data.HasTheSchoolAdjustedTheSchoolDayToCoverTheRegulatedHoursForCurriculumDelivery);
						$("#txt_TotalTeachingTimeOverTheCycle").val(data.TotalTeachingTimeOverTheCycle);
						$("#chk_WereAdditionalMobileClassroomsRequestedByTheSchool").prop("checked", data.WereAdditionalMobileClassroomsRequestedByTheSchool);
						$("#txt_NoOfMobileClassroomsRequestedByTheSchool").val(data.NoOfMobileClassroomsRequestedByTheSchool);
						$("#txt_NoOfAdditionalMobileClassroomsDelivered").val(data.NoOfAdditionalMobileClassroomsDelivered);
						$("#txt_NoOfClassroomsNotUsedDueToPoorCondition").val(data.NoOfClassroomsNotUsedDueToPoorCondition);
						$("#chk_WasTheSchoolClosedDueToCovid19").prop("checked", data.WasTheSchoolClosedDueToCovid19);
						$("#txt_NoOfOccasionsTheSchoolClosedDueToCovid19").val(data.NoOfOccasionsTheSchoolClosedDueToCovid19);
						$("#txt_LongestDurationTheSchoolClosedDueToCovid19").val(data.LongestDurationTheSchoolClosedDueToCovid19);
						$("#chk_WasTheSchoolDisinfected").prop("checked", data.WasTheSchoolDisinfected);
						$("#ddl_SchoolIntroducedRotations").val(data.IntroducedRotationID);
						$("#ddl_TimetableCycles").val(data.TimetableCycleID);
						$("#ddl_SchoolRotationApproaches").val(data.SchoolRotationApproachID);
						$("#ddl_WasTheSchoolAbleToAccommodatePhysicalDistancing").val(data.WasTheSchoolAbleToAccommodatePhysicalDistancingID);

						$('#ddl_CombinedGradesForMultiGradeClasses').multiselect('select', data.CombinedGradesForMultiGradeClasses);
						$('#ddl_GradesThatDidNotRotate').multiselect('select', data.GradesThatDidNotRotate);
						$('#ddl_SchoolDisinfectors').multiselect('select', data.SchoolDisinfectors);

						OnTimetableCyclesChange();

						if (data.ClassInformationDetails) {

							for (var i = 0; i < data.ClassInformationDetails.length; i++) {
								var item = data.ClassInformationDetails[i];
								var category = item.Category;

								var txtPreGradeR = "#txt_PreGradeR_" + category;
								var txtGradeR = "#txt_GradeR_" + category;
								var txtGrade1 = "#txt_Grade1_" + category;
								var txtGrade2 = "#txt_Grade2_" + category;
								var txtGrade3 = "#txt_Grade3_" + category;
								var txtGrade4 = "#txt_Grade4_" + category;
								var txtGrade5 = "#txt_Grade5_" + category;
								var txtGrade6 = "#txt_Grade6_" + category;
								var txtGrade7 = "#txt_Grade7_" + category;
								var txtGrade8 = "#txt_Grade8_" + category;
								var txtGrade9 = "#txt_Grade9_" + category;
								var txtGrade10 = "#txt_Grade10_" + category;
								var txtGrade11 = "#txt_Grade11_" + category;
								var txtGrade12 = "#txt_Grade12_" + category;
								var txtSpec = "#txt_Spec_" + category;
								var txtOth = "#txt_Oth_" + category;
								var txtTotal = "#txt_Total_" + category;

								$(txtPreGradeR).val(item.PreGradeR);
								$(txtGradeR).val(item.GradeR);
								$(txtGrade1).val(item.Grade1);
								$(txtGrade2).val(item.Grade2);
								$(txtGrade3).val(item.Grade3);
								$(txtGrade4).val(item.Grade4);
								$(txtGrade5).val(item.Grade5);
								$(txtGrade6).val(item.Grade6);
								$(txtGrade7).val(item.Grade7);
								$(txtGrade8).val(item.Grade8);
								$(txtGrade9).val(item.Grade9);
								$(txtGrade10).val(item.Grade10);
								$(txtGrade11).val(item.Grade11);
								$(txtGrade12).val(item.Grade12);
								$(txtSpec).val(item.Spec);
								$(txtOth).val(item.Oth);
								$(txtTotal).val(item.Total);
							}
						}
					}
                } else {

                    $("#divSaveClassInformationFailure").text(jsonData.Message);
                    $("#divSaveClassInformationSuccess").hide();
                    $("#divSaveClassInformationFailure").show();
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

	function AttachClassInformationCalculateEvent(tableID) {
        var table = document.getElementById(tableID);
		var row = table.getElementsByTagName("tr")[0];
		var inputList = row.getElementsByTagName("input");
		var rowTotal = 0;
        var txtID = inputList[0].id;
        var txtData = txtID.split("_");
        var category = txtData[2];

		var txt_Total = "#txt_Total_" + category;

		for (var j = 0; j < inputList.length - 1; j++) {
			var input = inputList[j];
            var val = input.value;
            rowTotal = rowTotal + parseInt(val);
            $(txt_Total).val(rowTotal);
        }

        for (var j = 0; j < inputList.length - 1; j++) {
            var input = inputList[j];
			$(input).blur(function () {
				var val = this.value;
				rowTotal = rowTotal + parseInt(val);
                $(txt_Total).val(rowTotal);
			});
		}
    }

</script>

<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	<div class="card">
		<h5 class="card-header">4. CLASS INFORMATION </h5>
		<div class="card-body">
			  <p style="color:#FF0000"><i>Compulsory for all schools</i></p> 
			<div class="row">
				<div class="form-group col-md-12" >
					<table class="table table-bordered" id="tblManagementOfAbsenceBySMT">
						 <thead>
							  <tr><th scope="col" colspan="2">4.1 Platooning / double shift schools / Multi-Grade Classes</th></tr>
					     </thead>
						 <tbody>
							    <tr>
									<th scope="row">4.1.1 Does the school platoon? <i style="color:#FF0000">Tick if YES</i> </th> 
									<td><input type="checkbox" id="chk_DoesTheSchoolPlatoon" /></td>
								</tr>
							    <tr>
									<th scope="row">4.1.2 Does the school have double shifts (i.e. classes at different times of the day)? <i style="color:#FF0000">Tick if YES</i> </th> 
									<td><input type="checkbox" id="chk_DoesTheSchoolHaveDoubleShifts" /></td>
								</tr>
							    <tr>
									<th scope="row">4.1.3 Does the school have multi-grade classes? <i style="color:#FF0000">Tick if YES</i> </th> 
									<td><input type="checkbox" id="chk_DoesTheSchoolHaveMultiGradeClasses" /></td>
								</tr>
								
							     <tr>
									<th scope="row">4.1.4 Indicate which Grades were combined in respect of the Multi Grade classes offered by the school  </th> 
									<td>
										  <select id="ddl_CombinedGradesForMultiGradeClasses"  multiple="multiple" class="form-control">
												<option value="17">	Pre-Grade R</option>
												<option value="18">	Grade R</option>
												<option value="19">	Grade 1</option>
												<option value="20">	Grade 2</option>
												<option value="21">	Grade 3</option>
												<option value="22">	Grade 4</option>
												<option value="23">	Grade 5</option>
												<option value="24">	Grade 6</option>
												<option value="25">	Grade 7</option>
												<option value="26">	Grade 8</option>
												<option value="27">	Grade 9</option>
												<option value="28">	Grade 10</option>
												<option value="29">	Grade 11</option>
												<option value="30">	Grade 12</option>
                                        </select>
									</td>
								</tr>
							    
						 </tbody>
				     </table>
					</div>
			</div>


			<div class="row">
				<div class="form-group col-md-12" style="overflow-x:auto;" >
						<table class="table table-bordered">
						<thead>
							 <tr><th scope="col" colspan="17"> 4.1.5 State the number of class units in each grade (Examples would be 5 Grade 1 classes, 4 Grade 2 classes and not number of learners). </th></tr>
							 <tr>
								 <th scope="col">Pre-Grade R</th>
								 <th scope="col">Grade R</th>
								 <th scope="col">Grade 1</th>
								 <th scope="col">Grade 2</th>
								 <th scope="col">Grade 3</th>
								 <th scope="col">Grade 4</th>
								 <th scope="col">Grade 5</th>
								 <th scope="col">Grade 6</th>
								 <th scope="col">Grade 7</th>
								 <th scope="col">Grade 8</th>
								 <th scope="col">Grade 9</th>
								 <th scope="col">Grade 10</th>
								 <th scope="col">Grade 11</th>
								 <th scope="col">Grade 12</th>
								 <th scope="col">Spec</th>
								 <th scope="col">Oth</th>
								 <th scope="col">Total</th>
							</tr>
						</thead>
						 <tbody id="tblClassUnitsInEachGradeBody">
							     <tr>
									<td><input type="number" value="0"  min="0" id="txt_PreGradeR_ClassUnitsInEachGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_GradeR_ClassUnitsInEachGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade1_ClassUnitsInEachGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade2_ClassUnitsInEachGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade3_ClassUnitsInEachGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade4_ClassUnitsInEachGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade5_ClassUnitsInEachGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade6_ClassUnitsInEachGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade7_ClassUnitsInEachGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade8_ClassUnitsInEachGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade9_ClassUnitsInEachGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade10_ClassUnitsInEachGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade11_ClassUnitsInEachGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade12_ClassUnitsInEachGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Spec_ClassUnitsInEachGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Oth_ClassUnitsInEachGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_ClassUnitsInEachGrade"  class="form-control" /></td>
								</tr>
						 </tbody>
				     </table>

					</div>
			</div>
			
			
			<div class="row">
				<div class="form-group col-md-12" style="overflow-x:auto;">
					<table class="table table-bordered">
						<thead>
							 <tr><th scope="col" colspan="17">4.1.6 State the Number of classrooms used for each grade before Covid-19 Lockdown was instituted.</th></tr>
							 <tr>
								 <th scope="col">Pre-Grade R</th>
								 <th scope="col">Grade R</th>
								 <th scope="col">Grade 1</th>
								 <th scope="col">Grade 2</th>
								 <th scope="col">Grade 3</th>
								 <th scope="col">Grade 4</th>
								 <th scope="col">Grade 5</th>
								 <th scope="col">Grade 6</th>
								 <th scope="col">Grade 7</th>
								 <th scope="col">Grade 8</th>
								 <th scope="col">Grade 9</th>
								 <th scope="col">Grade 10</th>
								 <th scope="col">Grade 11</th>
								 <th scope="col">Grade 12</th>
								 <th scope="col">Spec</th>
								 <th scope="col">Oth</th>
								 <th scope="col">Total</th>
							</tr>
						</thead>
						 <tbody id="tblClassroomsUsedGradeBeforeLockdownBody">
							     <tr>
									<td><input type="number" value="0"  min="0" id="txt_PreGradeR_ClassroomsUsedGradeBeforeLockdown"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_GradeR_ClassroomsUsedGradeBeforeLockdown"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade1_ClassroomsUsedGradeBeforeLockdown"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade2_ClassroomsUsedGradeBeforeLockdown"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade3_ClassroomsUsedGradeBeforeLockdown"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade4_ClassroomsUsedGradeBeforeLockdown"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade5_ClassroomsUsedGradeBeforeLockdown"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade6_ClassroomsUsedGradeBeforeLockdown"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade7_ClassroomsUsedGradeBeforeLockdown"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade8_ClassroomsUsedGradeBeforeLockdown"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade9_ClassroomsUsedGradeBeforeLockdown"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade10_ClassroomsUsedGradeBeforeLockdown"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade11_ClassroomsUsedGradeBeforeLockdown"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade12_ClassroomsUsedGradeBeforeLockdown"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Spec_ClassroomsUsedGradeBeforeLockdown"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Oth_ClassroomsUsedGradeBeforeLockdown"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_ClassroomsUsedGradeBeforeLockdown"  class="form-control" /></td>
								</tr>
						 </tbody>
				     </table>
					</div>
			</div>

				<div class="row">
				<div class="form-group col-md-12" style="overflow-x: auto;">
					<table class="table table-bordered">
						<thead>
							 <tr><th scope="col" colspan="17">4.1.7 When the school implemented rotation during Lockdown, how many cohorts per grade were created in respect of each of the class units.</th></tr>
							 <tr>
								 <th scope="col">Pre-Grade R</th>
								 <th scope="col">Grade R</th>
								 <th scope="col">Grade 1</th>
								 <th scope="col">Grade 2</th>
								 <th scope="col">Grade 3</th>
								 <th scope="col">Grade 4</th>
								 <th scope="col">Grade 5</th>
								 <th scope="col">Grade 6</th>
								 <th scope="col">Grade 7</th>
								 <th scope="col">Grade 8</th>
								 <th scope="col">Grade 9</th>
								 <th scope="col">Grade 10</th>
								 <th scope="col">Grade 11</th>
								 <th scope="col">Grade 12</th>
								  <th scope="col">Spec</th>
								 <th scope="col">Oth</th>
								 <th scope="col">Total</th>
							</tr>
						</thead>
						 <tbody id="tblCohortsPerGradeBody">
							     <tr>
									<td><input type="number" value="0"  min="0" id="txt_PreGradeR_CohortsPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_GradeR_CohortsPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade1_CohortsPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade2_CohortsPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade3_CohortsPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade4_CohortsPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade5_CohortsPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade6_CohortsPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade7_CohortsPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade8_CohortsPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade9_CohortsPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade10_CohortsPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade11_CohortsPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade12_CohortsPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Spec_CohortsPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Oth_CohortsPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_CohortsPerGrade"  class="form-control" /></td>
								</tr>
						 </tbody>
				     </table>
					</div>
			</div>
			
			<div class="row">
				<div class="form-group col-md-12" >
					<table class="table table-bordered">
						 <tbody>
							     <tr>
									<th scope="row">4.1.8 Which approach to rotation did the school adopt? </th> 
									<td>
										  <select id="ddl_SchoolRotationApproaches" class="form-control">
												<option value="2">No Rotation</option>
												<option value="3">Daily Rotation</option>
												<option value="4">Weekly Rotation</option>
												<option value="5">Hybrid</option>
                                        </select>
									</td>
								</tr>
								
							     <tr>
									<th scope="row">4.1.9 How many rotations did the school introduce using the Daily/Weekly/Hybrid Options adopted by the school? </th> 
									<td>
										  <select id="ddl_SchoolIntroducedRotations" class="form-control">
												<option value="6">Learners Split into 2 cohorts</option>
												<option value="7">Learners Split into more than 2 cohorts</option>
                                        </select>
									</td>
								</tr>
								
								<tr>
							    	<th scope="row" colspan="2">4.1.10 Except for Grade 12 and 7 learners, how many learners were accommodated for each Rotation implemented by the school?  </th> 
							    </tr>
							    <tr>
		                	    	 <th  scope="row" style="padding-left: 35px;">Daily Rotation</th>
            				         <td><input type="number" value="0" min="0" id="txt_NoOfLearnersDailyRotation"  class="form-control" /></td>
		                	    </tr>
							    <tr>
		                	    	 <th  scope="row" style="padding-left: 35px;">Weekly  Rotation</th>
            				         <td><input type="number" value="0" min="0" id="txt_NoOfLearnersWeeklyRotation"  class="form-control" /></td>
		                	    </tr>
							    <tr>
		                	    	 <th  scope="row" style="padding-left: 35px;">Hybrid Model</th>
            				         <td><input type="number" value="0" min="0" id="txt_NoOfLearnersHybridModel"  class="form-control" /></td>
		                	    </tr>
						 </tbody>
				     </table>
					</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12" >
					<table class="table table-bordered">
						 <tbody>
							     <tr>
									<th scope="row">4.1.11 Indicate the grades that did not Alternate / Rotate  </th> 
									<td>
										  <select id="ddl_GradesThatDidNotRotate"  multiple="multiple" class="form-control">
												<option value="17">	Pre-Grade R</option>
												<option value="18">	Grade R</option>
												<option value="19">	Grade 1</option>
												<option value="20">	Grade 2</option>
												<option value="21">	Grade 3</option>
												<option value="22">	Grade 4</option>
												<option value="23">	Grade 5</option>
												<option value="24">	Grade 6</option>
												<option value="25">	Grade 7</option>
												<option value="26">	Grade 8</option>
												<option value="27">	Grade 9</option>
												<option value="28">	Grade 10</option>
												<option value="29">	Grade 11</option>
												<option value="30">	Grade 12</option>
                                        </select>
	
									</td>
								</tr>								
						 </tbody>
				     </table>
					</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12" style="overflow-x:auto;">
					<table class="table table-bordered">
						<thead>
							 <tr><th scope="col" colspan="13">4.1.12 Indicate the number of periods offered per day per class unit during rotation </th></tr>
							 <tr>
								 <th scope="col">Grade R</th>
								 <th scope="col">Grade 1</th>
								 <th scope="col">Grade 2</th>
								 <th scope="col">Grade 3</th>
								 <th scope="col">Grade 4</th>
								 <th scope="col">Grade 5</th>
								 <th scope="col">Grade 6</th>
								 <th scope="col">Grade 7</th>
								 <th scope="col">Grade 8</th>
								 <th scope="col">Grade 9</th>
								 <th scope="col">Grade 10</th>
								 <th scope="col">Grade 11</th>
								 <th scope="col">Grade 12</th>
							</tr>
						</thead>
						 <tbody>
							     <tr>
									<td><input type="number" value="0"  min="0" id="txt_GradeR_PeriodsOfferedPerDayPerClassUnit"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade1_PeriodsOfferedPerDayPerClassUnit"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade2_PeriodsOfferedPerDayPerClassUnit"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade3_PeriodsOfferedPerDayPerClassUnit"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade4_PeriodsOfferedPerDayPerClassUnit"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade5_PeriodsOfferedPerDayPerClassUnit"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade6_PeriodsOfferedPerDayPerClassUnit"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade7_PeriodsOfferedPerDayPerClassUnit"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade8_PeriodsOfferedPerDayPerClassUnit"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade9_PeriodsOfferedPerDayPerClassUnit"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade10_PeriodsOfferedPerDayPerClassUnit"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade11_PeriodsOfferedPerDayPerClassUnit"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade12_PeriodsOfferedPerDayPerClassUnit"  class="form-control" /></td>

								</tr>
						 </tbody>
				     </table>
					</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12" style="overflow-x:auto;">
					<table class="table table-bordered">
						<thead>
							 <tr><th scope="col" colspan="13">4.1.13 Indicate the amount of time (in minutes) allocated per period per grade during rotation  </th></tr>
							 <tr>
								 <th scope="col">Grade R</th>
								 <th scope="col">Grade 1</th>
								 <th scope="col">Grade 2</th>
								 <th scope="col">Grade 3</th>
								 <th scope="col">Grade 4</th>
								 <th scope="col">Grade 5</th>
								 <th scope="col">Grade 6</th>
								 <th scope="col">Grade 7</th>
								 <th scope="col">Grade 8</th>
								 <th scope="col">Grade 9</th>
								 <th scope="col">Grade 10</th>
								 <th scope="col">Grade 11</th>
								 <th scope="col">Grade 12</th>
							</tr>
						</thead>
						 <tbody>
							     <tr>
									<td><input type="number" value="0"  min="0" id="txt_GradeR_AmountOfTimeAllocatedPerPeriodPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade1_AmountOfTimeAllocatedPerPeriodPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade2_AmountOfTimeAllocatedPerPeriodPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade3_AmountOfTimeAllocatedPerPeriodPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade4_AmountOfTimeAllocatedPerPeriodPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade5_AmountOfTimeAllocatedPerPeriodPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade6_AmountOfTimeAllocatedPerPeriodPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade7_AmountOfTimeAllocatedPerPeriodPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade8_AmountOfTimeAllocatedPerPeriodPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade9_AmountOfTimeAllocatedPerPeriodPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade10_AmountOfTimeAllocatedPerPeriodPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade11_AmountOfTimeAllocatedPerPeriodPerGrade"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade12_AmountOfTimeAllocatedPerPeriodPerGrade"  class="form-control" /></td>

								</tr>
						 </tbody>
				     </table>
					</div>
			</div>


				<div class="row">
				<div class="form-group col-md-12" >
					<table class="table table-bordered">
						 <thead>
							  <tr><th scope="col" colspan="2">4.2 Accommodation of Lockdown Provisions at School</th></tr>
					     </thead>
						 <tbody>
							     <tr>
									<th scope="row">4.2.1 What was deemed to be the learner capacity of the school in terms of the Norms and Standards for School Infrastructure?  </th> 
									<td><input type="number" value="0"  min="0" id="txt_LearnerCapacityOfSchoolNormsAndStandardForSchoolInfrastructure"  class="form-control" /></td>
								</tr>
								
							     <tr>
									<th scope="row">4.2.2 Was the school able to accommodate the 1,5m physical distancing requirement in the school </th> 
									<td>
										  <select id="ddl_WasTheSchoolAbleToAccommodatePhysicalDistancing" class="form-control">
												<option value="8">Easily</option>
												<option value="9">With some difficulty</option>
												<option value="10">Unable to fulfil the physical distancing requirements</option>
                                        </select>
									</td>
								</tr>
								
							    <tr>
		                	    	 <th  scope="row">4.2.3 Has the school adjusted the school day to cover the regulated 27 ½ hours for curriculum delivery? <i style="color:#FF0000">Tick if YES</i></th>
            				         <td><input type="checkbox" id="chk_HasTheSchoolAdjustedTheSchoolDayToCoverTheRegulatedHoursForCurriculumDelivery"   /></td>

		                	    </tr>
							    <tr>
		                	    	 <th  scope="row">4.2.4 Did the school organise the school timetable in terms of a: Tick only the option that applies</th>
            				         <td>
										  <select id="ddl_TimetableCycles" class="form-control" onchange="OnTimetableCyclesChange()">
												<option value="11">	5-day cycle</option>
												<option value="12">	7-day cycle</option>
												<option value="13"> 10-day cycle</option>
												<option value="14">	Other (Please specify)</option>
                                        </select>
	
									</td>
		                	    </tr>
							    <tr id="trOtherCycle" style="display:none;">
									<th scope="row" style="padding-left:35px;">Other Cycle</th> 
									<td>
										<input type="text"  id="txt_OtherCycle"  class="form-control" />  
										<span style="color:red;display:none;" id="spnOtherCycle">Field is required</span>
									</td>
								</tr>
								<tr>
									<th scope="row">4.2.5 What is the total teaching time over the cycle indicated</th> 
									<td><input type="number" value="0"  min="0" id="txt_TotalTeachingTimeOverTheCycle"  class="form-control" /></td>
								</tr>
								<tr>
									<th scope="row">4.2.6 Were additional mobile classrooms requested by the school? <i style="color:#FF0000">Tick if YES</i> </th> 
									<td><input type="checkbox" id="chk_WereAdditionalMobileClassroomsRequestedByTheSchool"   /></td>
								</tr>
								<tr>
									<th scope="row">4.2.7 If Yes, how many? </th> 
									<td><input type="number" value="0"  min="0" id="txt_NoOfMobileClassroomsRequestedByTheSchool"  class="form-control" /></td>
								</tr>
								<tr>
									<th scope="row">4.2.8 How many additional mobile classrooms were delivered to the school? </th> 
									<td><input type="number" value="0"  min="0" id="txt_NoOfAdditionalMobileClassroomsDelivered"  class="form-control" /></td>
								</tr>
								<tr>
									<th scope="row">4.2.9 How many classrooms were not used due to the poor condition of the classroom?  </th> 
									<td><input type="number" value="0"  min="0" id="txt_NoOfClassroomsNotUsedDueToPoorCondition"  class="form-control" /></td>
								</tr>
								<tr>
									<th scope="row">4.2.10 Was the school affected by Covid-19 cases that resulted in the closure of the school? <i style="color:#FF0000">Tick if YES</i> </th> 
									<td><input type="checkbox" id="chk_WasTheSchoolClosedDueToCovid19"   /></td>
								</tr>
								<tr>
									<th scope="row">4.2.11 If yes, on how many occasions was the school closed due to Covid-19 infections? </th> 
									<td><input type="number" value="0"  min="0" id="txt_NoOfOccasionsTheSchoolClosedDueToCovid19"  class="form-control" /></td>
								</tr>
								<tr>
									<th scope="row">4.2.12 What was the longest duration (in days) that the school remained closed as a result of Covid-19 infections? </th> 
									<td><input type="number" value="0"  min="0" id="txt_LongestDurationTheSchoolClosedDueToCovid19"  class="form-control" /></td>
								</tr>
								<tr>
									<th scope="row">4.2.13 If the school was impacted by Covid-19 infections was the school disinfected? <i style="color:#FF0000">Tick if YES</i> </th> 
									<td><input type="checkbox" id="chk_WasTheSchoolDisinfected"   /></td>
								</tr>
								<tr>
									<th scope="row">4.2.14 Who disinfected the school? </th> 
									<td>
										  <select id="ddl_SchoolDisinfectors"  multiple="multiple" class="form-control">
												<option value="15">	The GDE</option>
												<option value="16">	The School/SGB</option>
                                        </select>
	
									</td>
								</tr>					
						 </tbody>
				     </table>
					</div>
			</div>



			<div class="form-row">
				<div class="form-group col-12" style="text-align:right;">
					<div class="alert alert-success" role="alert" id="divSaveClassInformationSuccess" style="display:none;"></div>
					<div class="alert alert-danger" role="alert" id="divSaveClassInformationFailure"  style="display:none;"></div>
					  <ul class="inline">
					    <li><input onclick="BackToStaffInformation(); return false;" type="button" class="btn btn-primary btn-sm" value="Previous" /></li>
					    <li><input onclick="SaveClassInformation(); return false;" type="button" class="btn btn-primary btn-sm" value="Save & Continue" /></li>
					  </ul>
				</div>
			</div>

		</div>
	</div>
</div>
				