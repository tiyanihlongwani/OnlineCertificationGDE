<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EnablingConditions.ascx.cs" Inherits="OnlineSurvey.Pages.Survey.Controls.EnablingConditions" %>

<script type="text/javascript">
	$(document).ready(function () {
        InitializeMultiSelect("ddl_SchoolRequirementsToComplyWithPhysicalDistance");
        InitializeMultiSelect("ddl_HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture");
        InitializeMultiSelect("ddl_HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms");
        InitializeMultiSelect("ddl_SchoolResponsesToLearnerTransportProgrammeChallenges");
        InitializeMultiSelect("ddl_SchoolResponsesToNutritionProgrammeChallenges");
		InitializeMultiSelect("ddl_ReasonsForSchoolClosure");

        $('#ddl_CausesOfDisruptions').multiselect({
            buttonText: function (options, select) {
                if (options.length === 0) {
                    return 'Select...';
                } else if (options.length > 0) {
                    return 'Selected Options (' + options.length + ')';
                } else {
                    var labels = [];
                    options.each(function () {
                        if ($(this).attr('label') !== undefined) {
                            labels.push($(this).attr('label'));
                        }
                        else {
                            labels.push($(this).html());
                        }
					});

                    return labels.join(',') + '';
                }
            },
            onChange: function (option, checked) {
				var selectedOptions = $('#ddl_CausesOfDisruptions').val();
				if (selectedOptions.indexOf("145") >= 0) {
                    $("#txt_CausesOfDisruptionsOther").show();
                } else {
                    $("#txt_CausesOfDisruptionsOther").val("");
                    $("#txt_CausesOfDisruptionsOther").hide();
                    $("#spnCausesOfDisruptionsOther").hide();
                }
			},
            buttonWidth: '250px'
		});

        LoadEnablingConditionsInformation();
	});

	function GoToCurriculumDeliveryAndCompletionInformation() {
        $("#divCurriculumDeliveryAndCompletion").show();
        $("#divEnablingConditions").hide();
	}

	function SaveEnablingConditionsInformation() {
		var isValid = true;
        if (document.getElementById("txt_CausesOfDisruptionsOther").style.display != "none" && $("#txt_CausesOfDisruptionsOther").val() == "") {
            $("#spnCausesOfDisruptionsOther").show();
            isValid = false;
        } else {
            $("#spnCausesOfDisruptionsOther").hide();
        }

        if (isValid == false) {
            return false;
		}

		var schoolRequirementsToComplyWithPhysicalDistance = $("#ddl_SchoolRequirementsToComplyWithPhysicalDistance").val();
        var howDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture = $("#ddl_HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture").val();
        var howDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms = $("#ddl_HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms").val();
        var schoolResponsesToLearnerTransportProgrammeChallenges = $("#ddl_SchoolResponsesToLearnerTransportProgrammeChallenges").val();
        var schoolResponsesToNutritionProgrammeChallenges = $("#ddl_SchoolResponsesToNutritionProgrammeChallenges").val();
        var causesOfDisruptions = $("#ddl_CausesOfDisruptions").val();
        var reasonsForSchoolClosure = $("#ddl_ReasonsForSchoolClosure").val();


        var enablingConditionsInformation = {
            DoesTheSchoolHaveElectricity: $("#chk_DoesTheSchoolHaveElectricity").prop("checked"),
            HasTheSchoolBeenProvidedWithElectricity: $("#chk_HasTheSchoolBeenProvidedWithElectricity").prop("checked"),
            DoesTheSchoolHaveRunningWater: $("#chk_DoesTheSchoolHaveRunningWater").prop("checked"),
            HasTheSchoolBeenProvidedWithWater: $("#chk_HasTheSchoolBeenProvidedWithWater").prop("checked"),
            DoesTheSchoolExperienceWaterPressureIssuesRegularly: $("#chk_DoesTheSchoolExperienceWaterPressureIssuesRegularly").prop("checked"),
            DoesTheSchoolHaveAdequateSanitationFacilities: $("#chk_DoesTheSchoolHaveAdequateSanitationFacilities").prop("checked"),
            DoesTheSchoolHaveSecureFencing: $("#chk_DoesTheSchoolHaveSecureFencing").prop("checked"),
            DidTheSchoolHaveSufficientClassrooms: $("#chk_DidTheSchoolHaveSufficientClassrooms").prop("checked"),
            DidTheSchoolRequestAdditionalFurnitureFromTheGDE: $("#chk_DidTheSchoolRequestAdditionalFurnitureFromTheGDE").prop("checked"),
            WasTheFurnitureDelivered: $("#chk_WasTheFurnitureDelivered").prop("checked"),
            DidTheSchoolRequestAdditionalClassroomsFromTheGDE: $("#chk_DidTheSchoolRequestAdditionalClassroomsFromTheGDE").prop("checked"),
            WereTheClassroomsDelivered: $("#chk_WereTheClassroomsDelivered").prop("checked"),
            WasTheSchoolAffectedByIncidentsOfVandalism: $("#chk_WasTheSchoolAffectedByIncidentsOfVandalism").prop("checked"),
            HowManyOccasionsWasTheSchoolAffectedByIncidentsOfVandalism: $("#txt_HowManyOccasionsWasTheSchoolAffectedByIncidentsOfVandalism").val(),
            DoesTheSchoolHaveLearnersBenefittingFromTheGDELearnerTransportProgramme: $("#chk_DoesTheSchoolHaveLearnersBenefittingFromTheGDELearnerTransportProgramme").prop("checked"),
            NoOfLearnersBenefittingFromTheGDELearnerTransportProgramme: $("#txt_NoOfLearnersBenefittingFromTheGDELearnerTransportProgramme").val(),

            WereThereAnyChallengesExperiencedInTermsOfTheLearnerTransportProgrammeDuringTheLockdown: $("#chk_WereThereAnyChallengesExperiencedInTermsOfTheLearnerTransportProgrammeDuringTheLockdown").prop("checked"),
            AreAllTheLearnersBeingTransportedAsExpected: $("#chk_AreAllTheLearnersBeingTransportedAsExpected").prop("checked"),
            AreAllTheLearnersArrivingOnTime: $("#chk_AreAllTheLearnersArrivingOnTime").prop("checked"),
            AreTheLearnersUsingHandSanitisersBeforeEnteringTheBuses: $("#chk_AreTheLearnersUsingHandSanitisersBeforeEnteringTheBuses").prop("checked"),
            AreTheLearnersWearingMasksWhileOnTheBuses: $("#chk_AreTheLearnersWearingMasksWhileOnTheBuses").prop("checked"),
            IsThePhysicalDistancingRequirementsBeingObservedOnTheBuses: $("#chk_IsThePhysicalDistancingRequirementsBeingObservedOnTheBuses").prop("checked"),
            WereTheCovid19BrigadesAvailableToAssistOnTheLearnerTransportRoutes: $("#chk_WereTheCovid19BrigadesAvailableToAssistOnTheLearnerTransportRoutes").prop("checked"),

            DoesTheSchoolHaveLearnersBenefittingFromNationalSchoolNutritionProgramme: $("#chk_DoesTheSchoolHaveLearnersBenefittingFromNationalSchoolNutritionProgramme").prop("checked"),
            NoOfLearnersBenefittingFromNationalSchoolNutritionProgramme: $("#txt_NoOfLearnersBenefittingFromNationalSchoolNutritionProgramme").val(),
            IsPhysicalDistancingBeingAppliedInTheFoodPreparationArea: $("#chk_IsPhysicalDistancingBeingAppliedInTheFoodPreparationArea").prop("checked"),
            IsPhysicalDistancingBeingAppliedWhereLearnersAreBeingFed: $("#chk_IsPhysicalDistancingBeingAppliedWhereLearnersAreBeingFed").prop("checked"),
            IsTheFoodPreparationAreaBeingCleanedRegularly: $("#chk_IsTheFoodPreparationAreaBeingCleanedRegularly").prop("checked"),
            AreFeedingTimesAreBeingStaggered: $("#chk_AreFeedingTimesAreBeingStaggered").prop("checked"),
            HaveTheFoodHandlersBeenTrainedOnCovid19Protocols: $("#chk_HaveTheFoodHandlersBeenTrainedOnCovid19Protocols").prop("checked"),
            DoTheFoodHandlersHaveTheNecessaryPPEs: $("#chk_DoTheFoodHandlersHaveTheNecessaryPPEs").prop("checked"),
            IsThereProperCleaningOfTheUtensilsTakingPlace: $("#chk_IsThereProperCleaningOfTheUtensilsTakingPlace").prop("checked"),
            IsTheSchoolUsingDisposableUtensils: $("#chk_IsTheSchoolUsingDisposableUtensils").prop("checked"),
            AreTheSchoolLearnersSharingUtensils: $("#chk_AreTheSchoolLearnersSharingUtensils").prop("checked"),
            WereThereAnyChallengesExperiencedInTermsOfTheSchoolNutritionProgrammeDuringLockdown: $("#chk_WereThereAnyChallengesExperiencedInTermsOfTheSchoolNutritionProgrammeDuringLockdown").prop("checked"),
            HowAreThoseLearnersThatAreOnRotatioBeingFed: $("#txt_HowAreThoseLearnersThatAreOnRotatioBeingFed").val(),
            HowAreLearnersLearningFromHomeBeingFed: $("#txt_HowAreLearnersLearningFromHomeBeingFed").val(),

            WereLearnersAllowedToTakeHomeTheirTextbooksDuringLockdown: $("#chk_WereLearnersAllowedToTakeHomeTheirTextbooksDuringLockdown").prop("checked"),
            DoesTheSchoolHaveSufficientTextbooksForAllLearners: $("#chk_DoesTheSchoolHaveSufficientTextbooksForAllLearners").prop("checked"),
            HasTheSchoolBeenAffectedByDisruptions: $("#chk_HasTheSchoolBeenAffectedByDisruptions").prop("checked"),
            HasTheSchoolBeenForcedToClose: $("#chk_HasTheSchoolBeenForcedToClose").prop("checked"),
            HowManyOccassionsWasTheSchoolForcedToClose: $("#txt_HowManyOccassionsWasTheSchoolForcedToClose").val(),
			TotalNoOfSchoolDaysLostDueToClosure: $("#txt_TotalNoOfSchoolDaysLostDueToClosure").val(),
			SchoolID: $("#MainContent_hdfSchoolID").val(),
            CausesOfDisruptionsOther: $("#txt_CausesOfDisruptionsOther").val(),

            SchoolRequirementsToComplyWithPhysicalDistance: schoolRequirementsToComplyWithPhysicalDistance,
            HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture: howDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture,
            HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms: howDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms,
            SchoolResponsesToLearnerTransportProgrammeChallenges: schoolResponsesToLearnerTransportProgrammeChallenges,
            SchoolResponsesToNutritionProgrammeChallenges: schoolResponsesToNutritionProgrammeChallenges,
            CausesOfDisruptions: causesOfDisruptions,
            ReasonsForSchoolClosure: reasonsForSchoolClosure
		};

        var buildingCondition = {
            RoofStatusID: $("#ddl_Roof_SchoolBuildingCondition").val(),
            WindowsStatusID: $("#ddl_Windows_SchoolBuildingCondition").val(),
            DoorsStatusID: $("#ddl_Doors_SchoolBuildingCondition").val(),
            WallsStatusID: $("#ddl_Walls_SchoolBuildingCondition").val(),
            FloorsStatusID: $("#ddl_Floors_SchoolBuildingCondition").val(),
            SchoolID: $("#MainContent_hdfSchoolID").val()
        };

		var noOfTextbooksList = [];
		var expected = {
			Grade1: $("#txt_Grade1_NoOfTextbooksExpected").val(),
			Grade2: $("#txt_Grade2_NoOfTextbooksExpected").val(),
			Grade3: $("#txt_Grade3_NoOfTextbooksExpected").val(),
			Grade4: $("#txt_Grade4_NoOfTextbooksExpected").val(),
			Grade5: $("#txt_Grade5_NoOfTextbooksExpected").val(),
			Grade6: $("#txt_Grade6_NoOfTextbooksExpected").val(),
			Grade7: $("#txt_Grade7_NoOfTextbooksExpected").val(),
			Grade8: $("#txt_Grade8_NoOfTextbooksExpected").val(),
			Grade9: $("#txt_Grade9_NoOfTextbooksExpected").val(),
			Grade10: $("#txt_Grade10_NoOfTextbooksExpected").val(),
			Grade11: $("#txt_Grade11_NoOfTextbooksExpected").val(),
			Grade12: $("#txt_Grade12_NoOfTextbooksExpected").val(),
			Category: "Expected",
			SchoolID: $("#MainContent_hdfSchoolID").val()
		};

		noOfTextbooksList.push(expected);

        var actual = {
            Grade1: $("#txt_Grade1_NoOfTextbooksActual").val(),
            Grade2: $("#txt_Grade2_NoOfTextbooksActual").val(),
            Grade3: $("#txt_Grade3_NoOfTextbooksActual").val(),
            Grade4: $("#txt_Grade4_NoOfTextbooksActual").val(),
            Grade5: $("#txt_Grade5_NoOfTextbooksActual").val(),
            Grade6: $("#txt_Grade6_NoOfTextbooksActual").val(),
            Grade7: $("#txt_Grade7_NoOfTextbooksActual").val(),
            Grade8: $("#txt_Grade8_NoOfTextbooksActual").val(),
            Grade9: $("#txt_Grade9_NoOfTextbooksActual").val(),
            Grade10: $("#txt_Grade10_NoOfTextbooksActual").val(),
            Grade11: $("#txt_Grade11_NoOfTextbooksActual").val(),
            Grade12: $("#txt_Grade12_NoOfTextbooksActual").val(),
            Category: "Actual",
            SchoolID: $("#MainContent_hdfSchoolID").val()
		}

		noOfTextbooksList.push(actual);
     
		var params = { enablingConditionsInformation: enablingConditionsInformation, buildingConditions: buildingCondition, noOfTextbooksList: noOfTextbooksList };
		
        $.ajax({
            type: "POST",
            url: "../../Services/Service.asmx/SaveEnablingConditionsInformation",
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
                    $("#divSaveEnablingConditionsInformationSuccess").text("Enabling Conditions Details Saved Successfully.");
                    $("#divSaveEnablingConditionsInformationSuccess").show();
                    $("#divSaveEnablingConditionsInformationFailure").hide();
					OnSubmitSurvey();
                } else {
                    $("#divSaveEnablingConditionsInformationFailure").text(errorMsg);
                    $("#divSaveEnablingConditionsInformationSuccess").hide();
                    $("#divSaveEnablingConditionsInformationFailure").show();
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

	function OnDoesTheSchoolHaveElectricityCheck() {
        if ($("#chk_DoesTheSchoolHaveElectricity").prop("checked") == false) {
            $("#trHasTheSchoolBeenProvidedWithElectricity").show();
        } else {
            $("#trHasTheSchoolBeenProvidedWithElectricity").hide();
            $('#chk_HasTheSchoolBeenProvidedWithElectricity').prop("checked", false);
        }
	}

	function OnDoesTheSchoolHaveRunningWaterCheck() {
        if ($("#chk_DoesTheSchoolHaveRunningWater").prop("checked") == false) {
            $("#trHasTheSchoolBeenProvidedWithWater").show();
            $("#trDoesTheSchoolExperienceWaterPressureIssuesRegularly").show();
        } else {
            $("#trHasTheSchoolBeenProvidedWithWater").hide();
            $("#trDoesTheSchoolExperienceWaterPressureIssuesRegularly").hide();
            $('#chk_HasTheSchoolBeenProvidedWithWater').prop("checked", false);
            $('#chk_DoesTheSchoolExperienceWaterPressureIssuesRegularly').prop("checked", false);
        }
	}

    function OnWasTheSchoolAffectedByIncidentsOfVandalism(e) {
        if ($(e).prop("checked") == true) {
            $("#trHowManyOccasionsWasTheSchoolAffectedByIncidentsOfVandalism").show();
        } else {
            $("#trHowManyOccasionsWasTheSchoolAffectedByIncidentsOfVandalism").hide();
            $('#txt_HowManyOccasionsWasTheSchoolAffectedByIncidentsOfVandalism').val("");
        }
	}

    function OnHasTheSchoolBeenAffectedByDisruptionsCheck(e) {
        if ($(e).prop("checked") == true) {
            $("#trCausesOfDisruptions").show();
        } else {
            $("#trCausesOfDisruptions").hide();
            $('#ddl_CausesOfDisruptions').multiselect('select', []);
        }
	}

    function OnHasTheSchoolBeenForcedToCloseCheck(e) {
        if ($(e).prop("checked") == true) {
            $("#trReasonsForSchoolClosure").show();
            $("#trHowManyOccassionsWasTheSchoolForcedToClose").show();
            $("#trTotalNoOfSchoolDaysLostDueToClosure").show();
        } else {
            $("#trReasonsForSchoolClosure").hide();
            $("#trHowManyOccassionsWasTheSchoolForcedToClose").hide();
            $("#trTotalNoOfSchoolDaysLostDueToClosure").hide();
			$("#txt_HowManyOccassionsWasTheSchoolForcedToClose").val("0");
            $("#txt_TotalNoOfSchoolDaysLostDueToClosure").val("0");
            $('#ddl_ReasonsForSchoolClosure').multiselect('select', []);
        }
	}

    function LoadEnablingConditionsInformation() {
        var params = { schoolID: $("#MainContent_hdfSchoolID").val() };

        $.ajax({
            type: "POST",
            url: "../../../Services/Service.asmx/GetEnablingConditionsInformationBySchoolID",
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
						var enablingConditionsInformation = data.EnablingConditions;
                        var buildingConditions = data.BuildingConditions;
						var lTSM = data.LTSM;

						if (enablingConditionsInformation) {

							//Set EnablingConditions
							$("#chk_DoesTheSchoolHaveElectricity").prop("checked", enablingConditionsInformation.DoesTheSchoolHaveElectricity);
							$("#chk_HasTheSchoolBeenProvidedWithElectricity").prop("checked", enablingConditionsInformation.HasTheSchoolBeenProvidedWithElectricity);
							$("#chk_DoesTheSchoolHaveRunningWater").prop("checked", enablingConditionsInformation.DoesTheSchoolHaveRunningWater);
							$("#chk_HasTheSchoolBeenProvidedWithWater").prop("checked", enablingConditionsInformation.HasTheSchoolBeenProvidedWithWater);
							$("#chk_DoesTheSchoolExperienceWaterPressureIssuesRegularly").prop("checked", enablingConditionsInformation.DoesTheSchoolExperienceWaterPressureIssuesRegularly);
							$("#chk_DoesTheSchoolHaveAdequateSanitationFacilities").prop("checked", enablingConditionsInformation.DoesTheSchoolHaveAdequateSanitationFacilities);
							$("#chk_DoesTheSchoolHaveSecureFencing").prop("checked", enablingConditionsInformation.DoesTheSchoolHaveSecureFencing);
							$("#chk_DidTheSchoolHaveSufficientClassrooms").prop("checked", enablingConditionsInformation.DidTheSchoolHaveSufficientClassrooms);
							$("#chk_DidTheSchoolRequestAdditionalFurnitureFromTheGDE").prop("checked", enablingConditionsInformation.DidTheSchoolRequestAdditionalFurnitureFromTheGDE);
							$("#chk_WasTheFurnitureDelivered").prop("checked", enablingConditionsInformation.WasTheFurnitureDelivered);
							$("#chk_DidTheSchoolRequestAdditionalClassroomsFromTheGDE").prop("checked", enablingConditionsInformation.DidTheSchoolRequestAdditionalClassroomsFromTheGDE);
							$("#chk_WereTheClassroomsDelivered").prop("checked", enablingConditionsInformation.WereTheClassroomsDelivered);
							$("#chk_WasTheSchoolAffectedByIncidentsOfVandalism").prop("checked", enablingConditionsInformation.WasTheSchoolAffectedByIncidentsOfVandalism);
							$("#txt_HowManyOccasionsWasTheSchoolAffectedByIncidentsOfVandalism").val(enablingConditionsInformation.HowManyOccasionsWasTheSchoolAffectedByIncidentsOfVandalism);
							$("#chk_DoesTheSchoolHaveLearnersBenefittingFromTheGDELearnerTransportProgramme").prop("checked", enablingConditionsInformation.DoesTheSchoolHaveLearnersBenefittingFromTheGDELearnerTransportProgramme);
							$("#txt_NoOfLearnersBenefittingFromTheGDELearnerTransportProgramme").val(enablingConditionsInformation.NoOfLearnersBenefittingFromTheGDELearnerTransportProgramme);

							$("#chk_WereThereAnyChallengesExperiencedInTermsOfTheLearnerTransportProgrammeDuringTheLockdown").prop("checked", enablingConditionsInformation.WereThereAnyChallengesExperiencedInTermsOfTheLearnerTransportProgrammeDuringTheLockdown);
							$("#chk_AreAllTheLearnersBeingTransportedAsExpected").prop("checked", enablingConditionsInformation.AreAllTheLearnersBeingTransportedAsExpected);
							$("#chk_AreAllTheLearnersArrivingOnTime").prop("checked", enablingConditionsInformation.AreAllTheLearnersArrivingOnTime);
							$("#chk_AreTheLearnersUsingHandSanitisersBeforeEnteringTheBuses").prop("checked", enablingConditionsInformation.AreTheLearnersUsingHandSanitisersBeforeEnteringTheBuses);
							$("#chk_AreTheLearnersWearingMasksWhileOnTheBuses").prop("checked", enablingConditionsInformation.AreTheLearnersWearingMasksWhileOnTheBuses);
							$("#chk_IsThePhysicalDistancingRequirementsBeingObservedOnTheBuses").prop("checked", enablingConditionsInformation.IsThePhysicalDistancingRequirementsBeingObservedOnTheBuses);
							$("#chk_WereTheCovid19BrigadesAvailableToAssistOnTheLearnerTransportRoutes").prop("checked", enablingConditionsInformation.WereTheCovid19BrigadesAvailableToAssistOnTheLearnerTransportRoutes);

							$("#chk_DoesTheSchoolHaveLearnersBenefittingFromNationalSchoolNutritionProgramme").prop("checked", enablingConditionsInformation.DoesTheSchoolHaveLearnersBenefittingFromNationalSchoolNutritionProgramme);
							$("#txt_NoOfLearnersBenefittingFromNationalSchoolNutritionProgramme").val(enablingConditionsInformation.NoOfLearnersBenefittingFromNationalSchoolNutritionProgramme);
							$("#chk_IsPhysicalDistancingBeingAppliedInTheFoodPreparationArea").prop("checked", enablingConditionsInformation.IsPhysicalDistancingBeingAppliedInTheFoodPreparationArea);
							$("#chk_IsPhysicalDistancingBeingAppliedWhereLearnersAreBeingFed").prop("checked", enablingConditionsInformation.IsPhysicalDistancingBeingAppliedWhereLearnersAreBeingFed);
							$("#chk_IsTheFoodPreparationAreaBeingCleanedRegularly").prop("checked", enablingConditionsInformation.IsTheFoodPreparationAreaBeingCleanedRegularly);
							$("#chk_AreFeedingTimesAreBeingStaggered").prop("checked", enablingConditionsInformation.AreFeedingTimesAreBeingStaggered);
							$("#chk_HaveTheFoodHandlersBeenTrainedOnCovid19Protocols").prop("checked", enablingConditionsInformation.HaveTheFoodHandlersBeenTrainedOnCovid19Protocols);
							$("#chk_DoTheFoodHandlersHaveTheNecessaryPPEs").prop("checked", enablingConditionsInformation.DoTheFoodHandlersHaveTheNecessaryPPEs);
							$("#chk_IsThereProperCleaningOfTheUtensilsTakingPlace").prop("checked", enablingConditionsInformation.IsThereProperCleaningOfTheUtensilsTakingPlace);
							$("#chk_IsTheSchoolUsingDisposableUtensils").prop("checked", enablingConditionsInformation.IsTheSchoolUsingDisposableUtensils);
							$("#chk_AreTheSchoolLearnersSharingUtensils").prop("checked", enablingConditionsInformation.AreTheSchoolLearnersSharingUtensils);
							$("#chk_WereThereAnyChallengesExperiencedInTermsOfTheSchoolNutritionProgrammeDuringLockdown").prop("checked", enablingConditionsInformation.WereThereAnyChallengesExperiencedInTermsOfTheSchoolNutritionProgrammeDuringLockdown);
							$("#txt_HowAreThoseLearnersThatAreOnRotatioBeingFed").val(enablingConditionsInformation.HowAreThoseLearnersThatAreOnRotatioBeingFed);
                            $("#txt_HowAreLearnersLearningFromHomeBeingFed").val(enablingConditionsInformation.HowAreLearnersLearningFromHomeBeingFed);
                            
							$("#chk_WereLearnersAllowedToTakeHomeTheirTextbooksDuringLockdown").prop("checked", enablingConditionsInformation.WereLearnersAllowedToTakeHomeTheirTextbooksDuringLockdown);
							$("#chk_DoesTheSchoolHaveSufficientTextbooksForAllLearners").prop("checked", enablingConditionsInformation.DoesTheSchoolHaveSufficientTextbooksForAllLearners);
							$("#chk_HasTheSchoolBeenAffectedByDisruptions").prop("checked", enablingConditionsInformation.HasTheSchoolBeenAffectedByDisruptions);
							$("#chk_HasTheSchoolBeenForcedToClose").prop("checked", enablingConditionsInformation.HasTheSchoolBeenForcedToClose);
							$("#txt_HowManyOccassionsWasTheSchoolForcedToClose").val(enablingConditionsInformation.HowManyOccassionsWasTheSchoolForcedToClose);
							$("#txt_TotalNoOfSchoolDaysLostDueToClosure").val(enablingConditionsInformation.TotalNoOfSchoolDaysLostDueToClosure);
							$("#txt_CausesOfDisruptionsOther").val(enablingConditionsInformation.CausesOfDisruptionsOther);

							if (enablingConditionsInformation.CausesOfDisruptions.indexOf(145) >= 0) {
								$("#txt_CausesOfDisruptionsOther").show();
							}

							if (enablingConditionsInformation.HasTheSchoolBeenForcedToClose) {
								$("#trReasonsForSchoolClosure").show();
								$("#trHowManyOccassionsWasTheSchoolForcedToClose").show();
								$("#trTotalNoOfSchoolDaysLostDueToClosure").show();
							}

							if (enablingConditionsInformation.HasTheSchoolBeenAffectedByDisruptions) {
								$("#trCausesOfDisruptions").show();
							}

                            OnDoesTheSchoolHaveElectricityCheck();
                            OnDoesTheSchoolHaveRunningWaterCheck();

                            if (enablingConditionsInformation.WasTheSchoolAffectedByIncidentsOfVandalism) {
                                $("#trHowManyOccasionsWasTheSchoolAffectedByIncidentsOfVandalism").show();
                            }

							//Set multi-select
							$("#ddl_SchoolRequirementsToComplyWithPhysicalDistance").multiselect('select', enablingConditionsInformation.SchoolRequirementsToComplyWithPhysicalDistance);
							$("#ddl_HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture").multiselect('select', enablingConditionsInformation.HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture);
							$("#ddl_HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms").multiselect('select', enablingConditionsInformation.HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms);
							$("#ddl_SchoolResponsesToLearnerTransportProgrammeChallenges").multiselect('select', enablingConditionsInformation.SchoolResponsesToLearnerTransportProgrammeChallenges);
							$("#ddl_SchoolResponsesToNutritionProgrammeChallenges").multiselect('select', enablingConditionsInformation.SchoolResponsesToNutritionProgrammeChallenges);
							$("#ddl_CausesOfDisruptions").multiselect('select', enablingConditionsInformation.CausesOfDisruptions);
							$("#ddl_ReasonsForSchoolClosure").multiselect('select', enablingConditionsInformation.ReasonsForSchoolClosure);
						}

						if (enablingConditionsInformation) {
							$("#ddl_Roof_SchoolBuildingCondition").val(buildingConditions.RoofStatusID);
							$("#ddl_Windows_SchoolBuildingCondition").val(buildingConditions.WindowsStatusID);
							$("#ddl_Doors_SchoolBuildingCondition").val(buildingConditions.DoorsStatusID);
							$("#ddl_Walls_SchoolBuildingCondition").val(buildingConditions.WallsStatusID);
							$("#ddl_Floors_SchoolBuildingCondition").val(buildingConditions.FloorsStatusID);
						}

						if (lTSM) {
							for (var i = 0; i < lTSM.length; i++) {
								var item = lTSM[i];
								var category = item.Category;

								var txt_Grade1 = "#txt_Grade1_NoOfTextbooks" + category;
								var txt_Grade2 = "#txt_Grade2_NoOfTextbooks" + category;
								var txt_Grade3 = "#txt_Grade3_NoOfTextbooks" + category;
								var txt_Grade4 = "#txt_Grade4_NoOfTextbooks" + category;
								var txt_Grade5 = "#txt_Grade5_NoOfTextbooks" + category;
								var txt_Grade6 = "#txt_Grade6_NoOfTextbooks" + category;
								var txt_Grade7 = "#txt_Grade7_NoOfTextbooks" + category;
								var txt_Grade8 = "#txt_Grade8_NoOfTextbooks" + category;
								var txt_Grade9 = "#txt_Grade9_NoOfTextbooks" + category;
								var txt_Grade10 = "#txt_Grade10_NoOfTextbooks" + category;
								var txt_Grade11 = "#txt_Grade1_NoOfTextbooks" + category;
								var txt_Grade12 = "#txt_Grade12_NoOfTextbooks" + category;

								$(txt_Grade1).val(item.Grade1);
								$(txt_Grade2).val(item.Grade2);
								$(txt_Grade3).val(item.Grade3);
								$(txt_Grade4).val(item.Grade4);
								$(txt_Grade5).val(item.Grade5);
								$(txt_Grade6).val(item.Grade6);
								$(txt_Grade7).val(item.Grade7);
								$(txt_Grade8).val(item.Grade8);
								$(txt_Grade9).val(item.Grade9);
								$(txt_Grade10).val(item.Grade10);
								$(txt_Grade11).val(item.Grade11);
								$(txt_Grade12).val(item.Grade12);
							}
						}
                    }
                } else {

                    $("#divSaveEnablingConditionsInformationFailure").text(jsonData.Message);
                    $("#divSaveEnablingConditionsInformationSuccess").hide();
                    $("#divSaveEnablingConditionsInformationFailure").show();
                }

                HideLoadingSpinner();
            },
            complete: function () {
                //   HideLoadingSpinner();
            },
            failure: function (jqXHR, textStatus, errorThrown) {
                alert("HTTP Status: " + jqXHR.status + "; Error Text: " + jqXHR.responseText); // Display error message  
            }
        });
	}

	function OnSubmitSurvey() {
        $("#ConfirmSubmitModal").modal('show');
	}

	function SubmitSurvey() {
		var schoolID = $("#MainContent_hdfSchoolID").val();
	    SaveEnablingConditionsInformation();

        var params = { schoolID: schoolID };

        $.ajax({
            type: "POST",
            url: "../../Services/Service.asmx/SubmitSurvey",
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
                    $("#SurveySubmitConfirmationModal").modal('show');
                    $("#divSaveEnablingConditionsInformationSuccess").text("Survey Submitted Successfully.");
                    $("#divSaveEnablingConditionsInformationSuccess").show();
                    $("#divSaveEnablingConditionsInformationFailure").hide();
                } else {
                    $("#divSaveEnablingConditionsInformationFailure").text(errorMsg);
                    $("#divSaveEnablingConditionsInformationSuccess").hide();
                    $("#divSaveEnablingConditionsInformationFailure").show();
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

	function RedirectToHome() {
		location.href = "../../Home.aspx";
	}
</script>

<div class="card">
		<h5 class="card-header">9.	ENABLING CONDITIONS</h5>
		<div class="card-body">
			 <p style="color:#FF0000"><i>For Public Schools Only</i></p> 
			<div class="row">
				<div class="form-group col-md-12">
					<p>9.1	SCHOOL PHYSICAL INFRASTRUCTURE</p>
					<table class="table table-bordered">
		                <tbody>
		                	<tr>
		                		<th  scope="row">9.1.1 Does the school have electricity? <i style="color:#FF0000">Tick if YES</i>  </th>
            				    <td><input type="checkbox" id="chk_DoesTheSchoolHaveElectricity" onclick="OnDoesTheSchoolHaveElectricityCheck()" /></td>
		                	</tr>
							<tr id="trHasTheSchoolBeenProvidedWithElectricity">
		                		<th  scope="row" style="padding-left:35px;">If not, has the school been provided with electricity? <i style="color:#FF0000">Tick if YES</i> </th>
            				   <td><input type="checkbox" id="chk_HasTheSchoolBeenProvidedWithElectricity" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row">9.1.2 Does the school have running water? <i style="color:#FF0000">Tick if YES</i> </th>
            				     <td><input type="checkbox" id="chk_DoesTheSchoolHaveRunningWater" onclick="OnDoesTheSchoolHaveRunningWaterCheck()" /></td>
		                	</tr>
							<tr id="trHasTheSchoolBeenProvidedWithWater">
		                		<th  scope="row"  style="padding-left:35px;">If not, has the school been provided with water? <i style="color:#FF0000">Tick if YES</i> </th>
								<td ><input type="checkbox" id="chk_HasTheSchoolBeenProvidedWithWater" /></td>
		                	</tr>
							<tr id="trDoesTheSchoolExperienceWaterPressureIssuesRegularly">
		                		<th  scope="row"  style="padding-left:35px;">Does the school experience water pressure issues regularly? <i style="color:#FF0000">Tick if YES</i></th>
								<td ><input type="checkbox" id="chk_DoesTheSchoolExperienceWaterPressureIssuesRegularly" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row">9.1.3 Does the school have adequate sanitation facilities (toilets)? <i style="color:#FF0000">Tick if YES</i></th>
            				    <td><input type="checkbox" id="chk_DoesTheSchoolHaveAdequateSanitationFacilities"  /></td>
		                	</tr>
							<tr>
		                		<th  scope="row">9.1.4 Does the school have secure fencing? <i style="color:#FF0000">Tick if YES</i> </th>
            				    <td><input type="checkbox" id="chk_DoesTheSchoolHaveSecureFencing"  /></td>
		                	</tr>
							
		                </tbody>
					</table>
				</div>
			</div>


			   <div class="row">
				<div class="form-group col-md-12" >
					<table class="table table-bordered">
						 <thead>
							  <tr>
                                  <th scope="col" colspan="2">9.1.5 Please indicate the general condition of the school building according to given categories: </th>
							  </tr>
							 <tr>
								 <th scope="col">Structure</th>
								 <th scope="col">Condition</th>
							 </tr>
					     </thead>
						 <tbody id="tblGeneralSchoolBuildingConditionBody">
							    <tr>
                                    <th scope="row">Roof</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Roof_SchoolBuildingCondition">
                                            <%--<option value="0">Select...</option>--%>
											<option value="110">No maintenance needed</option>
											<option value="111">Needs maintenance</option>
											<option value="112">Needs structural repair</option>
											<option value="113">Beyond repair</option>
											<option value="114">Presently being repaired</option>
                                        </select>
                                    </td>
								</tr>
								<tr>
                                    <th scope="row">Windows</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Windows_SchoolBuildingCondition">
                                            <%--<option value="0">Select...</option>--%>
											<option value="110">No maintenance needed</option>
											<option value="111">Needs maintenance</option>
											<option value="112">Needs structural repair</option>
											<option value="113">Beyond repair</option>
											<option value="114">Presently being repaired</option>
                                        </select>
                                    </td>
								</tr>
								<tr>
                                    <th scope="row">Doors</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Doors_SchoolBuildingCondition">
                                            <%--<option value="0">Select...</option>--%>
											<option value="110">No maintenance needed</option>
											<option value="111">Needs maintenance</option>
											<option value="112">Needs structural repair</option>
											<option value="113">Beyond repair</option>
											<option value="114">Presently being repaired</option>
                                        </select>
                                    </td>
								</tr>


								<tr>
                                    <th scope="row">Walls</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Walls_SchoolBuildingCondition">
                                            <%--<option value="0">Select...</option>--%>
											<option value="110">No maintenance needed</option>
											<option value="111">Needs maintenance</option>
											<option value="112">Needs structural repair</option>
											<option value="113">Beyond repair</option>
											<option value="114">Presently being repaired</option>
                                        </select>
                                    </td>
								</tr>
								<tr>
                                    <th scope="row">Floors</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Floors_SchoolBuildingCondition">
                                            <%--<option value="0">Select...</option>--%>
											<option value="110">No maintenance needed</option>
											<option value="111">Needs maintenance</option>
											<option value="112">Needs structural repair</option>
											<option value="113">Beyond repair</option>
											<option value="114">Presently being repaired</option>
                                        </select>
                                    </td>
								</tr>
                             
                             </tbody>
                        </table>
                    </div>
            </div>

			<div class="row">
				<div class="form-group col-md-12">
				<%--	<h6>9.1	SCHOOL PHYSICAL INFRASTRUCTURE</h6>--%>
					<table class="table table-bordered">
		                <tbody>
		                	<tr>
		                		<th  scope="row">9.1.6 Did the school have sufficient classrooms (including Specialist and Multipurpose Rooms) to deliver the curriculum during Lockdown? <i style="color:#FF0000">Tick if YES</i> </th>
            				    <td><input type="checkbox" id="chk_DidTheSchoolHaveSufficientClassrooms" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row">9.1.7 Did the school require the following to comply with Covid-19 physical distancing requirements? </th>
            					<td>
									<select id="ddl_SchoolRequirementsToComplyWithPhysicalDistance" multiple="multiple" class="form-control">
										<option value="115">Additional furniture</option>
										<option value="116">Additional classrooms</option>
									</select>
							    </td>
							</tr>
							<tr>
		                		<th  scope="row">9.1.8 Did the school request additional furniture from the GDE? <i style="color:#FF0000">Tick if YES</i>  </th>
            				     <td><input type="checkbox" id="chk_DidTheSchoolRequestAdditionalFurnitureFromTheGDE" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row">9.1.9 Was the furniture delivered? <i style="color:#FF0000">Tick if YES</i> </th>
								<td ><input type="checkbox" id="chk_WasTheFurnitureDelivered" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row">9.1.10 If the additional furniture was not provided, how did the school conform to the physical distancing requirements? </th>
								<td>
									<select id="ddl_HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture" multiple="multiple" class="form-control">
										<option value="117">Moved some lessons outside the classroom</option>
										<option value="118">Limited physical distancing to what was obtainable under the circumstances</option>
										<option value="119">Utilised older furniture still in stock</option>
										<option value="120">Loaned furniture from neighbouring school/s</option>
										<option value="121">Purchased additional furniture from school’s own financial resources</option>
									</select>
							    </td>
		                	</tr>
							<tr>
		                		<th  scope="row">9.1.11 Did the school request additional classrooms from the GDE? <i style="color:#FF0000">Tick if YES</i> </th>
            				    <td><input type="checkbox" id="chk_DidTheSchoolRequestAdditionalClassroomsFromTheGDE"  /></td>
		                	</tr>
							<tr>
		                		<th  scope="row">9.1.12 Were the classrooms delivered? <i style="color:#FF0000">Tick if YES</i> </th>
            				    <td><input type="checkbox" id="chk_WereTheClassroomsDelivered"  /></td>
		                	</tr>
							<tr>
		                		<th  scope="row">9.1.13 If the additional classrooms were not provided, how did the school adjust to conform to the physical distancing requirements?</th>
								<td>
									<select id="ddl_HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms" multiple="multiple" class="form-control">
										<option value="122">Moved some lessons outside the classroom</option>
										<option value="123">Introduced an additional round/s of rotation</option>
										<option value="124">Utilised specialist rooms and laboratories</option>
										<option value="125">Utilised the school hall</option>
										<option value="126">Utilised spaces outside the school</option>
									</select>
							    </td>
		                	</tr>
							<tr>
		                		<th  scope="row">9.1.14 Was the school affected by incidents of vandalism? <i style="color:#FF0000">Tick if YES</i></th>
            				    <td><input type="checkbox" id="chk_WasTheSchoolAffectedByIncidentsOfVandalism" onclick="OnWasTheSchoolAffectedByIncidentsOfVandalism(this)" /></td>
		                	</tr>
							<tr id="trHowManyOccasionsWasTheSchoolAffectedByIncidentsOfVandalism" style="display:none;">
		                		<th  scope="row" style="padding-left:35px;">Only in a single instance?  </th>
            				    <td><input type="number" value="0"  min="0" id="txt_HowManyOccasionsWasTheSchoolAffectedByIncidentsOfVandalism"  class="form-control" /></td>
		                	</tr>
		                </tbody>
					</table>
				</div>
			</div>

			
			<div class="row">
				<div class="form-group col-md-12">
					<h6>9.2	LEARNER TRANSPORT PROGRAMME</h6>
					 <p style="color:#FF0000"><i>For Public Schools on the Learner Transport Programme Only</i></p> 
					<table class="table table-bordered">
		                <tbody>
		                	<tr>
		                		<th  scope="row">9.2.1 Does the school have learners benefitting from the GDE learner transport programme? <i style="color:#FF0000">Tick if YES</i></th>
            				    <td><input type="checkbox" id="chk_DoesTheSchoolHaveLearnersBenefittingFromTheGDELearnerTransportProgramme" /></td>
		                	</tr>
							<tr>
								<th scope="row">9.2.2 If Yes, please indicate the total number of learners involved in the programme irrespective of the rotation cycle adopted by the school.</th> 
								<td><input type="number" value="0"  min="0" id="txt_NoOfLearnersBenefittingFromTheGDELearnerTransportProgramme"  class="form-control" /></td>
							</tr>
							<tr>
		                		<th  scope="row">9.2.3 Were there any challenges experienced in terms of the learner transport programme during the lockdown? <i style="color:#FF0000">Tick if YES</i></th>
            				    <td><input type="checkbox" id="chk_WereThereAnyChallengesExperiencedInTermsOfTheLearnerTransportProgrammeDuringTheLockdown" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row">9.2.4 If yes, indicate how the school responded to the learner transport programme challenges? </th>
            					<td>
									<select id="ddl_SchoolResponsesToLearnerTransportProgrammeChallenges" multiple="multiple" class="form-control">
										<option value="127">Started the lessons a little later</option>
										<option value="128">Conducted additional rounds of learner screening</option>
										<option value="129">Reconducted lessons missed as a result of buses not picking up the kids</option>
										<option value="130">Introduced additional rotations</option>
										<option value="131">Adjusted the school day</option>
									</select>
							    </td>
							</tr>
							<tr>
		                		<th  scope="row" colspan="2">9.2.5 At the current time: </th>
		                	</tr>
							<tr>
		                		<th  scope="row" style="padding-left:35px;">Are all the learners being transported as expected? <i style="color:#FF0000">Tick if YES</i> </th>
            				    <td><input type="checkbox" id="chk_AreAllTheLearnersBeingTransportedAsExpected" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row" style="padding-left:35px;">Are all the learners arriving on time? <i style="color:#FF0000">Tick if YES</i> </th>
            				    <td><input type="checkbox" id="chk_AreAllTheLearnersArrivingOnTime" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row" style="padding-left:35px;">Are the learners using hand sanitisers before entering the buses? <i style="color:#FF0000">Tick if YES</i> </th>
            				    <td><input type="checkbox" id="chk_AreTheLearnersUsingHandSanitisersBeforeEnteringTheBuses" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row" style="padding-left:35px;">Are the learners wearing masks while on the buses? <i style="color:#FF0000">Tick if YES</i> </th>
            				    <td><input type="checkbox" id="chk_AreTheLearnersWearingMasksWhileOnTheBuses" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row" style="padding-left:35px;">Is the physical distancing requirements being observed on the buses? <i style="color:#FF0000">Tick if YES</i>  </th>
            				    <td><input type="checkbox" id="chk_IsThePhysicalDistancingRequirementsBeingObservedOnTheBuses" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row">9.2.6 Were the Covid-19 Brigades available to assist on the learner transport routes? <i style="color:#FF0000">Tick if YES</i></th>
            				    <td><input type="checkbox" id="chk_WereTheCovid19BrigadesAvailableToAssistOnTheLearnerTransportRoutes" /></td>
		                	</tr>
		                </tbody>
					</table>
				</div>
			</div>

					
			<div class="row">
				<div class="form-group col-md-12">
					<p>9.3	SCHOOL NUTRITION PROGRAMME</p>
					 <p style="color:#FF0000"><i>For Public Schools on the School Nutrition Programme Only</i></p> 
					<table class="table table-bordered">
		                <tbody>
		                	<tr>
		                		<th  scope="row">9.3.1 Does the school have learners benefitting from the national school nutrition programme? <i style="color:#FF0000">Tick if YES</i> </th>
            				    <td><input type="checkbox" id="chk_DoesTheSchoolHaveLearnersBenefittingFromNationalSchoolNutritionProgramme" /></td>
		                	</tr>
							<tr>
								<th scope="row">9.3.2 If Yes, please indicate the total number of learners involved in the programme irrespective of the rotation cycle adopted by the school. </th> 
								<td><input type="number" value="0"  min="0" id="txt_NoOfLearnersBenefittingFromNationalSchoolNutritionProgramme"  class="form-control" /></td>
							</tr>
													
							<tr>
		                		<th  scope="row" colspan="2">9.3.3 In terms of the School Nutrition Programme: </th>
		                	</tr>
							<tr>
		                		<th  scope="row" style="padding-left:35px;">Is Physical distancing being applied in the food preparation area? <i style="color:#FF0000">Tick if YES</i>  </th>
            				    <td><input type="checkbox" id="chk_IsPhysicalDistancingBeingAppliedInTheFoodPreparationArea" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row" style="padding-left:35px;">Is Physical distancing being applied where learners are being fed? <i style="color:#FF0000">Tick if YES</i> </th>
            				    <td><input type="checkbox" id="chk_IsPhysicalDistancingBeingAppliedWhereLearnersAreBeingFed" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row" style="padding-left:35px;">Is the Food preparation area being cleaned regularly? <i style="color:#FF0000">Tick if YES</i> </th>
            				    <td><input type="checkbox" id="chk_IsTheFoodPreparationAreaBeingCleanedRegularly" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row" style="padding-left:35px;">Are Feeding times are being staggered? <i style="color:#FF0000">Tick if YES</i> </th>
            				    <td><input type="checkbox" id="chk_AreFeedingTimesAreBeingStaggered" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row" style="padding-left:35px;">Have the Food Handlers been trained on Covid-19 Protocols? <i style="color:#FF0000">Tick if YES</i> </th>
            				    <td><input type="checkbox" id="chk_HaveTheFoodHandlersBeenTrainedOnCovid19Protocols" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row" style="padding-left:35px;">Do the Food Handlers have the necessary PPEs? <i style="color:#FF0000">Tick if YES</i></th>
            				    <td><input type="checkbox" id="chk_DoTheFoodHandlersHaveTheNecessaryPPEs" /></td>
		                	</tr>

							<tr>
		                		<th  scope="row" style="padding-left:35px;">Is there Proper cleaning of the utensils taking place? <i style="color:#FF0000">Tick if YES</i> </th>
            				    <td><input type="checkbox" id="chk_IsThereProperCleaningOfTheUtensilsTakingPlace" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row" style="padding-left:35px;">Is the school using Disposable utensils? <i style="color:#FF0000">Tick if YES</i> </th>
            				    <td><input type="checkbox" id="chk_IsTheSchoolUsingDisposableUtensils" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row" style="padding-left:35px;">Are the school Learners sharing utensils? <i style="color:#FF0000">Tick if YES</i> </th>
            				    <td><input type="checkbox" id="chk_AreTheSchoolLearnersSharingUtensils" /></td>
		                	</tr>
							<tr>
		                		<th  scope="row">9.3.4 Were there any challenges experienced in terms of the school nutrition programme during the lockdown? <i style="color:#FF0000">Tick if YES</i> </th>
            				    <td><input type="checkbox" id="chk_WereThereAnyChallengesExperiencedInTermsOfTheSchoolNutritionProgrammeDuringLockdown" /></td>
		                	</tr>

							<tr>
		                		<th  scope="row">9.3.5 If yes, how did the school respond to school nutrition programme challenges?  </th>
            					<td>
									<select id="ddl_SchoolResponsesToNutritionProgrammeChallenges" multiple="multiple" class="form-control">
										<option value="132">School utilised their own financial resources to feed the children</option>
										<option value="133">Introduced additional clean-up sessions</option>
										<option value="134">Utilised classrooms not in use to serve the meals to leaners</option>
										<option value="135">Deployed additional educator resources to manage the daily services</option>
										<option value="136">Encouraged learners to bring their own utensils to school</option>
										<option value="137">Utilised disposable utensils</option>
										<option value="138">Thoroughly oriented the food handlers</option>
										<option value="139">Ensured that food handlers sanitised regularly and wore required PPEs</option>
									</select>
							    </td>
							</tr>
							<tr>
		                		<th  scope="row">9.3.6 How are those learners that are on rotation being fed? Please elaborate.  </th>
            				    <td><textarea id="txt_HowAreThoseLearnersThatAreOnRotatioBeingFed" class="form-control"></textarea></td>
		                	</tr>
							<tr>
		                		<th  scope="row">9.3.7 How are those learners that are eligible for nutritional support but learning from home (lockdown learning) receiving their meals? Please elaborate.  </th>
            				    <td><textarea id="txt_HowAreLearnersLearningFromHomeBeingFed" class="form-control"></textarea></td>
		                	</tr>
		                </tbody>
					</table>
				</div>
			</div>

			
			<div class="row">
				<div class="form-group col-md-12" style="overflow-x: auto;">
						<p>9.4	LTSM</p>
					<table class="table table-bordered">
						<thead>
							 <tr><th scope="col" colspan="17">9.4.1 <strong>Textbooks:</strong> use and availability. Provide the expected number of textbooks per learner in each grade and the number of textbooks per learner issued in each grade.</th></tr>
							 <tr>
								 <th scope="col"></th>
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
						 <tbody id="tblNoOfTextbooksBody">
							     <tr>
									<th scope="col">Expected</th>
									<td><input type="number" value="0"  min="0" id="txt_Grade1_NoOfTextbooksExpected"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade2_NoOfTextbooksExpected"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade3_NoOfTextbooksExpected"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade4_NoOfTextbooksExpected"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade5_NoOfTextbooksExpected"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade6_NoOfTextbooksExpected"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade7_NoOfTextbooksExpected"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade8_NoOfTextbooksExpected"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade9_NoOfTextbooksExpected"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade10_NoOfTextbooksExpected"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade11_NoOfTextbooksExpected"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade12_NoOfTextbooksExpected"  class="form-control" /></td>
								</tr>
							  <tr>
									<th scope="col">Actual</th>
									<td><input type="number" value="0"  min="0" id="txt_Grade1_NoOfTextbooksActual"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade2_NoOfTextbooksActual"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade3_NoOfTextbooksActual"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade4_NoOfTextbooksActual"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade5_NoOfTextbooksActual"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade6_NoOfTextbooksActual"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade7_NoOfTextbooksActual"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade8_NoOfTextbooksActual"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade9_NoOfTextbooksActual"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade10_NoOfTextbooksActual"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade11_NoOfTextbooksActual"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade12_NoOfTextbooksActual"  class="form-control" /></td>
								</tr>
						 </tbody>
				     </table>
					</div>
			</div>
			
			<div class="row">
				<div class="form-group col-md-12">
					<table class="table table-bordered">
		                <tbody>
		                	<tr>
		                		<th  scope="row">9.4.2 Were learners allowed to take home their textbooks during Lockdown? <i style="color:#FF0000">Tick if YES</i>  </th>
            				    <td><input type="checkbox" id="chk_WereLearnersAllowedToTakeHomeTheirTextbooksDuringLockdown" /></td>
		                	</tr>
							<tr>
								<th scope="row">9.4.3 Does the school have sufficient textbooks for all the learners to avoid sharing, especially in light of Covid-19? <i style="color:#FF0000">Tick if YES</i> </th> 
								<td><input type="checkbox" id="chk_DoesTheSchoolHaveSufficientTextbooksForAllLearners" /></td>
							</tr>
		                </tbody>
					</table>
				</div>
			</div>		
			<div class="row">
				<div class="form-group col-md-12">
					<p>9.5	SCHOOL DISRUPTIONS AND CLOSURES</p>
					 <p style="color:#FF0000"><i>For All Public Schools</i></p>
					<table class="table table-bordered">
		                <tbody>
		                	<tr>
		                		<th  scope="row">9.5.1 Has the school been affected by disruptions? <i style="color:#FF0000">Tick if YES</i>  </th>
            				    <td><input type="checkbox" id="chk_HasTheSchoolBeenAffectedByDisruptions" onclick="OnHasTheSchoolBeenAffectedByDisruptionsCheck(this)" /></td>
		                	</tr>

							<tr id="trCausesOfDisruptions" style="display:none;">
		                		<th  scope="row" style="padding-left: 35px;"> If Yes, were the disruptions caused by any of the following: (Tick all that apply)  </th>
            					<td>
									<select id="ddl_CausesOfDisruptions" multiple="multiple" class="form-control">
										<option value="140">Labour Unions</option>
										<option value="141">Student Formations</option>
										<option value="142">Community Organisations</option>
										<option value="143">Actions of the School Governing Body</option>
										<option value="144">Actions of the Parents</option>
										<option value="145">Other (Please Specify)</option>
									</select>
									<input type="text" class="form-control" id="txt_CausesOfDisruptionsOther" style="display:none;" />
                                    <span style="color:red;display:none;" id="spnCausesOfDisruptionsOther">Field is required</span>
							    </td>
							</tr>

							<tr>
		                		<th  scope="row">9.5.2 Has the school been forced to close? <i style="color:#FF0000">Tick if YES</i>  </th>
            				    <td><input type="checkbox" id="chk_HasTheSchoolBeenForcedToClose" onclick="OnHasTheSchoolBeenForcedToCloseCheck(this)" /></td>
		                	</tr>

							<tr id="trReasonsForSchoolClosure" style="display:none;">
		                		<th  scope="row" style="padding-left: 35px;">9.5.3 If Yes, were the disruptions caused by any of the following: (Tick all that apply)  </th>
            					<td>
									<select id="ddl_ReasonsForSchoolClosure" multiple="multiple" class="form-control">
										<option value="146">Covid-19 Infections</option>
										<option value="147">Protest Action</option>
										<option value="148">Structural Defects of the School Buildings</option>
										<option value="149">Water supply Issues</option>
										<option value="150">Electricity supply Issues</option>
									</select>
							    </td>
							</tr>
							<tr id="trHowManyOccassionsWasTheSchoolForcedToClose" style="display:none;">
		                		<th  scope="row" style="padding-left: 35px;">9.5.4 If the school was forced to close, indicate on how many occasions this was the case </th>
            				    <td><input type="number" value="0" min="0" id="txt_HowManyOccassionsWasTheSchoolForcedToClose" class="form-control" /></td>
		                	</tr>

							<tr id="trTotalNoOfSchoolDaysLostDueToClosure" style="display:none;">
		                		<th  scope="row" style="padding-left: 35px;">9.5.5 What was the total number of school days lost as a result of the closure/s? </th>
            				    <td><input type="number" value="0" min="0" id="txt_TotalNoOfSchoolDaysLostDueToClosure" class="form-control" /></td>
		                	</tr>
							
		                </tbody>
					</table>
				</div>
			</div>

			<div class="form-row">
            <div class="form-group col-12" style="text-align: right;">
                <div class="alert alert-success" role="alert" id="divSaveEnablingConditionsInformationSuccess" style="display: none;"></div>
                <div class="alert alert-danger" role="alert" id="divSaveEnablingConditionsInformationFailure" style="display: none;"></div>
                <ul class="inline">
                    <li>
                        <input onclick="GoToCurriculumDeliveryAndCompletionInformation(); return false;" type="button" class="btn btn-primary btn-sm" value="Previous" />
                    </li>
                    <li>
                        <input onclick="SaveEnablingConditionsInformation(); return false;" type="button" class="btn btn-primary btn-sm" value="Save" />
                    </li>
					<li id="liSubmitSurvey" style="display:none;">
                        <input onclick="OnSubmitSurvey(); return false;" type="button" class="btn btn-primary btn-sm" value="Submit Survey" />
					</li>
                </ul>
            </div>
        </div>

		</div>

		
	</div>


		<!-- Button Confirm Delete modal -->
	
	<!--Start Of Error Modal -->
	<div class="modal fade" id="ConfirmSubmitModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header alert-info">
					<h5 class="modal-title">Confirm</h5>
				</div>
				<div class="modal-body">
					<div class="form-row">
						<span>Enabling Conditions Details Saved Successfully. <br />Do you want to submit the survey to the GDE ?</span>
					</div>
					<br />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="SubmitSurvey()">Ok</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="SurveySubmitConfirmationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header alert-success">
					<h5 class="modal-title">Success</h5>
				</div>
				<div class="modal-body">
					<div class="form-row">
						<span>Survey Submitted Successfully </span>
					</div>
					<br />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="RedirectToHome()">Ok</button>
				</div>
			</div>
		</div>
	</div>