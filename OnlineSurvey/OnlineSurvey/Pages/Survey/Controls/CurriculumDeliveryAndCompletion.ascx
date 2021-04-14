<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CurriculumDeliveryAndCompletion.ascx.cs" Inherits="OnlineSurvey.Pages.Survey.Controls.CurriculumDeliveryAndCompletion" %>


<script type="text/javascript">
    $(document).ready(function () {
        LoadICurriculumDeliveryInformation();
        InitializeMultiSelect("ddl_ReachedGradesDuringLockdonLevel5");
        InitializeMultiSelect("ddl_AccomodatedGradesFollowingMinistersFirstSetOfDirection");
        InitializeMultiSelect("ddl_AccomodatedGradesFollowingMinistersFirstSetOfDirection29June2020");
        InitializeMultiSelect("ddl_AccomodatedGradesFollowingMinistersSetOfDirection07July2020");
        InitializeMultiSelect("ddl_AccomodatedGradesFollowingMinistersSetOfDirection02August2020");
        InitializeMultiSelect("ddl_TeacherDevicesAreReliantOn");
        InitializeMultiSelect("ddl_HowDidTheSchoolInformParentsAboutThePerformanceOfTheirChildren");
        InitializeMultiSelect("ddl_ApprovedSubjects");
        InitializeMultiSelect("ddl_SeniorPhaseInitiatives");
       // InitializeMultiSelect("ddl_LaggingBehindSchoolInterventions");
        InitializeMultiSelect("ddl_MeansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning");
        InitializeMultiSelect("ddl_HowHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks");
        InitializeMultiSelect("ddl_DistrictSupportRecievedForLockdownLearning");
     //   InitializeMultiSelect("ddl_SubjectAdvisorsSupportedTheStaff");
        InitializeMultiSelect("ddl_InitiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme");
        InitializeMultiSelect("ddl_InitiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme");
        InitializeMultiSelect("ddl_InitiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme");

        InitializeMultiSelect("ddl_OnlineWithStudentTeacherInteraction");
        InitializeMultiSelect("ddl_OnlineWithoutStudentTeacherInteraction");
        InitializeMultiSelect("ddl_TVBasedLessonsAndProgrammes");
        InitializeMultiSelect("ddl_RadioLearningProgrammes");
        InitializeMultiSelect("ddl_SocialMediaForStudentTeacherInteraction");
        InitializeMultiSelect("ddl_PaperBasedPackages");
        InitializeMultiSelect("ddl_HomeVisitsByTeachers");
        InitializeMultiSelect("ddl_UseOfExternalServiceProviders");
        InitializeMultiSelect("ddl_OtherDistanceLearning");

        $('#ddl_SubjectAdvisorsSupportedTheStaff').multiselect({
            buttonText: function (options, select) {
                if (options.length === 0) {
                    return '- Select -';
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
                    return labels.join(', ') + '';
                }
            },
            onChange: function (option, checked) {
                var selectedOptions = $('#ddl_SubjectAdvisorsSupportedTheStaff').val();
                if (selectedOptions.indexOf("79") >= 0) {
                    $("#txt_SubjectAdvisorsSupportedTheStaffOther").show();
                } else {
                    $("#txt_SubjectAdvisorsSupportedTheStaffOther").val("");
                    $("#txt_SubjectAdvisorsSupportedTheStaffOther").hide();
                }
            }
        });

        $('#ddl_LaggingBehindSchoolInterventions').multiselect({
            buttonText: function (options, select) {
                if (options.length === 0) {
                    return '- Select -';
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
                    return labels.join(', ') + '';
                }
            },
            onChange: function (option, checked) {
                var selectedOptions = $('#ddl_LaggingBehindSchoolInterventions').val();
                if (selectedOptions.indexOf("52") >= 0) {
                    $("#txt_LaggingBehindSchoolInterventionsOther").show();
                } else {
                    $("#txt_LaggingBehindSchoolInterventionsOther").val("");
                    $("#txt_LaggingBehindSchoolInterventionsOther").hide();
                }
            }
        });

        OnQ1Term1ReportCardsIssuedCheck();

        //$("#chk_SelectAll").change(function () {
        //    if (this.checked) {
        //        $(".learning-mode").each(function () {
        //            this.checked = true;
        //        });
        //    } else {
        //        $(".learning-mode").each(function () {
        //            this.checked = false;
        //        });
        //    }
        //});
    });

    function GoToInfectionsAndMortalityInformation() {
        $("#divInfectionsAndMortalityInformation").show();
        $("#divCurriculumDeliveryAndCompletion").hide();
    }

    function SaveCurriculumDeliveryInformation() {
        var isValid = true;

        if (document.getElementById("txt_LaggingBehindSchoolInterventionsOther").style.display != "none" && $("#txt_LaggingBehindSchoolInterventionsOther").val() == "") {
            $("#spnLaggingBehindSchoolInterventionsOther").show();
            isValid = false;
        } else {
            $("#spnLaggingBehindSchoolInterventionsOther").hide();
        }

        if (document.getElementById("txt_SubjectAdvisorsSupportedTheStaffOther").style.display != "none" && $("#txt_SubjectAdvisorsSupportedTheStaffOther").val() == "") {
            $("#spnSubjectAdvisorsSupportedTheStaffOther").show();
            isValid = false;
        } else {
            $("#spnSubjectAdvisorsSupportedTheStaffOther").hide();
        }

        if (isValid == false) {
            return false;
        }

        var teacherResourcesRows = $("#tblTeacherResourcesBody tr");
        var coveredGradeFundamentalsRows = $("#tblCoveredGradeFundamentalsBody tr");
        var grade12LevelOfCompletionRows = $("#tblGrade12LevelOfCompletionBody tr");

        var teacherResourcesList = [];
        var coveredGradeFundamentalsList = [];
        var grade12LevelOfCompletionList = [];

        var reachedGradesDuringLockdonLevel5 = $("#ddl_ReachedGradesDuringLockdonLevel5").val();
        var accomodatedGradesFollowingMinistersFirstSetOfDirection = $("#ddl_AccomodatedGradesFollowingMinistersFirstSetOfDirection").val();
        var accomodatedGradesFollowingMinistersFirstSetOfDirection29June2020 = $("#ddl_AccomodatedGradesFollowingMinistersFirstSetOfDirection29June2020").val();

        var accomodatedGradesFollowingMinistersSetOfDirection07July2020 = $("#ddl_AccomodatedGradesFollowingMinistersSetOfDirection07July2020").val();
        var accomodatedGradesFollowingMinistersSetOfDirection02August2020 = $("#ddl_AccomodatedGradesFollowingMinistersSetOfDirection02August2020").val();
        var teacherDevicesAreReliantOn = $("#ddl_TeacherDevicesAreReliantOn").val();
        var howDidTheSchoolInformParentsAboutThePerformanceOfTheirChildren = $("#ddl_HowDidTheSchoolInformParentsAboutThePerformanceOfTheirChildren").val();
        var approvedSubjects = $("#ddl_ApprovedSubjects").val();
        var seniorPhaseInitiatives = $("#ddl_SeniorPhaseInitiatives").val();
        var laggingBehindSchoolInterventions = $("#ddl_LaggingBehindSchoolInterventions").val();
      
        var meansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning = $("#ddl_MeansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning").val();
        var howHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks = $("#ddl_HowHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks").val();
        var districtSupportRecievedForLockdownLearning = $("#ddl_DistrictSupportRecievedForLockdownLearning").val();
        var subjectAdvisorsSupportedTheStaff = $("#ddl_SubjectAdvisorsSupportedTheStaff").val();
        var initiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme = $("#ddl_InitiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme").val();
        var initiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme = $("#ddl_InitiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme").val();
        var initiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme = $("#ddl_InitiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme").val();

        //Mode of learning multi select
        //var onlineWithStudentTeacherInteractionIDs = $("#ddl_OnlineWithStudentTeacherInteraction").val();
        //var onlineWithoutStudentTeacherInteractionIDs = $("#ddl_OnlineWithoutStudentTeacherInteraction").val();
        //var tVBasedLessonsAndProgrammesIDs = $("#ddl_TVBasedLessonsAndProgrammes").val();
        //var radioLearningProgrammesIDs = $("#ddl_RadioLearningProgrammes").val();
        //var socialMediaForStudentTeacherInteractionIDs = $("#ddl_SocialMediaForStudentTeacherInteraction").val();
        //var paperBasedPackagesIDs = $("#ddl_PaperBasedPackages").val();
        //var homeVisitsByTeachersIDs = $("#ddl_HomeVisitsByTeachers").val();
        //var useOfExternalServiceProvidersIDs = $("#ddl_UseOfExternalServiceProviders").val();
        //var otherDistanceLearningIDs = $("#ddl_OtherDistanceLearning").val();
        
        var curriculum = {
            WasTheSchoolAbleToDeliverLessonsToLearnersDuringLockdownLevel5: $("#chk_WasTheSchoolAbleToDeliverLessonsToLearnersDuringLockdownLevel5").prop("checked"),
            //Multi Select
            OnlineWithStudentTeacherInteractionIDs: $("#ddl_OnlineWithStudentTeacherInteraction").val(),
            OnlineWithoutStudentTeacherInteractionIDs: $("#ddl_OnlineWithoutStudentTeacherInteraction").val(),
            TVBasedLessonsAndProgrammesIDs: $("#ddl_TVBasedLessonsAndProgrammes").val(),
            RadioLearningProgrammesIDs: $("#ddl_RadioLearningProgrammes").val(),
            SocialMediaForStudentTeacherInteractionIDs: $("#ddl_SocialMediaForStudentTeacherInteraction").val(),
            PaperBasedPackagesIDs: $("#ddl_PaperBasedPackages").val(),
            HomeVisitsByTeachersIDs: $("#ddl_HomeVisitsByTeachers").val(),
            UseOfExternalServiceProvidersIDs: $("#ddl_UseOfExternalServiceProviders").val(),
            OtherDistanceLearningIDs: $("#ddl_OtherDistanceLearning").val(),

            DevicesUtilisedByEducatorsUseID: $("#ddl_DevicesUtilisedByTeachersFor").val(),

            OtherDistanceLearningDescription: $("#txtOtherModeOfDeliveryAdoptedBySchoolsToDeliverCurriculumDuringLockdown").val(),

            DidTheSchoolProvideEducatorsWithDataToEnableWiFiConnectivityWhenWorkingFromHome: $("#chk_DidTheSchoolProvideEducatorsWithDataToEnableWiFiConnectivityWhenWorkingFromHome").prop("checked"), 
            NoOfEducatorsTrainedToConductOnlineClasses: $("#txt_NoOfEducatorsTrainedToConductOnlineClasses").val(),
            NoOfEducatorsNotTrainedToConductOnlineClasses: $("#txt_NoOfEducatorsNotTrainedToConductOnlineClasses").val(),
            NoOfEducatorsSuccessfullyConductedOnlineClasses: $("#txt_NoOfEducatorsSuccessfullyConductedOnlineClasses").val(),
            WasTerm1OfTheATPCompleted: $("#chk_WasTerm1OfTheATPCompleted").prop("checked"),
            WasTerm1AssessmentCompleted: $("#chk_WasTerm1AssessmentCompleted").prop("checked"),
            WereTerm1ReportCardsIssued: $("#chk_WereTerm1ReportCardsIssued").prop("checked"),

            IsTheSchoolImplementingTheRevisedATP: $("#chk_IsTheSchoolImplementingTheRevisedATP").prop("checked"),

            CompletedRequiredNofAssesmentsGrade1To3ID: $("#ddl_Grade1To3_CompletedRequiredNofAssesments").val(),
            CompletedRequiredNofAssesmentsGrade4To9ID: $("#ddl_Grade4To9_CompletedRequiredNofAssesments").val(),
            CompletedRequiredNofAssesmentsGrade10To11ID: $("#ddl_Grade10To11_CompletedRequiredNofAssesments").val(),
            CompletedRequiredNofAssesmentsGrade12ID: $("#ddl_Grade12_CompletedRequiredNofAssesments").val(),

            HaSchoolCommunicatedWithParentsRegardingAssessmentTasksExpectedFromLearners: $("#chk_HaSchoolCommunicatedWithParentsRegardingAssessmentTasksExpectedFromLearners").prop("checked"),
            HasSchoolReceivedFortnightlyLearnerActivityPacks: $("#chk_HasSchoolReceivedFortnightlyLearnerActivityPacks").prop("checked"),
            HasTheSchoolProvidedTheirOwnResourcesToFacilitateLockdownLearning: $("#chk_HasTheSchoolProvidedTheirOwnResourcesToFacilitateLockdownLearning").prop("checked"),
            HaveParentsPickedUpTheFortnightlyLearnerActivityPacks: $("#chk_HaveParentsPickedUpTheFortnightlyLearnerActivityPacks").prop("checked"),
            HasTheSchoolFollowedUpWithTheParentsOfLearnersThatFailedToSubmitTheirLearningTasks: $("#chk_HasTheSchoolFollowedUpWithTheParentsOfLearnersThatFailedToSubmitTheirLearningTasks").prop("checked"),

            AreTheLearnersAttendingClassAtSchoolAndThoseAtHomeAtTheSameLevelOfCompletion: $("#chk_AreTheLearnersAttendingClassAtSchoolAndThoseAtHomeAtTheSameLevelOfCompletion").prop("checked"),
            DoesTheSchoolEnsureThatTheParentsSubmitTheirChildrenAssessmentTasksInTime: $("#chk_DoesTheSchoolEnsureThatTheParentsSubmitTheirChildrenAssessmentTasksInTime").prop("checked"),
            NoOfLearnersBenefittedFromTheHomeLearningPacks: $("#txt_NoOfLearnersBenefittedFromTheHomeLearningPacks").val(),

            WillTheSchoolHaveCompletedTheGrade12ProgrammeInAdvanceOfThePrelimExaminations: $("#chk_WillTheSchoolHaveCompletedTheGrade12ProgrammeInAdvanceOfThePrelimExaminations").prop("checked"),
            ReasonForNotCompletingTheGrade12ProgrammeInAdvanceOfThePrelimExaminations: $("#txt_ReasonForNotCompletingTheGrade12ProgrammeInAdvanceOfThePrelimExaminations").val(),

            SubjectAdvisorsSupportedTheStaffOther: $("#txt_SubjectAdvisorsSupportedTheStaffOther").val(),
            LaggingBehindSchoolInterventionsOther: $("#txt_LaggingBehindSchoolInterventionsOther").val(),

            SchoolID: $("#MainContent_hdfSchoolID").val(),

            ReachedGradesDuringLockdonLevel5: reachedGradesDuringLockdonLevel5,
            AccomodatedGradesFollowingMinistersFirstSetOfDirection: accomodatedGradesFollowingMinistersFirstSetOfDirection,
            AccomodatedGradesFollowingMinistersFirstSetOfDirection29June2020: accomodatedGradesFollowingMinistersFirstSetOfDirection29June2020,

            AccomodatedGradesFollowingMinistersSetOfDirection07July2020: accomodatedGradesFollowingMinistersSetOfDirection07July2020,
            AccomodatedGradesFollowingMinistersSetOfDirection02August2020: accomodatedGradesFollowingMinistersSetOfDirection02August2020,
            TeacherDevicesAreReliantOn: teacherDevicesAreReliantOn,
            HowDidTheSchoolInformParentsAboutThePerformanceOfTheirChildren: howDidTheSchoolInformParentsAboutThePerformanceOfTheirChildren,
            ApprovedSubjects: approvedSubjects,
            SeniorPhaseInitiatives: seniorPhaseInitiatives,
            LaggingBehindSchoolInterventions: laggingBehindSchoolInterventions,
            MeansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning: meansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning,
            HowHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks: howHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks,
            DistrictSupportRecievedForLockdownLearning: districtSupportRecievedForLockdownLearning,
            SubjectAdvisorsSupportedTheStaff: subjectAdvisorsSupportedTheStaff,
            InitiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme: initiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme,
            InitiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme: initiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme,
            InitiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme: initiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme
        };

        teacherResourcesRows.each(function (index, row) {
            var inputControls = $(row).closest("tr").find("input");
            var inputControlNames = [];

            inputControls.each(function (i, input) {
                inputControlNames.push(input.id);
            });

            var resource = {            
                ProvidedByGDE: $("#" + FindCurriculumDeliveryInput(inputControlNames, "ProvidedByGDE")).val(),
                ProvidedBySchool: $("#" + FindCurriculumDeliveryInput(inputControlNames, "ProvidedBySchool")).val(),
                PersonallyOwned: $("#" + FindCurriculumDeliveryInput(inputControlNames, "OwnedProvided")).val(),
                Type: FindCurriculumDeliveryInput(inputControlNames, "ProvidedByGDE").split("_")[1],
                SchoolID: $("#MainContent_hdfSchoolID").val()
            };

            teacherResourcesList.push(resource);
        });

        coveredGradeFundamentalsRows.each(function (index, row) {
            var inputControls = $(row).closest("tr").find("select");
            var inputControlNames = [];

            inputControls.each(function (i, input) {
                if (input.value != "0") {
                    inputControlNames.push(input.id);

                    var coveredGradeFundamental = {
                        Grade: input.id.split("_")[1],
                        StatusID: input.value,
                        SchoolID: $("#MainContent_hdfSchoolID").val()
                    };

                    coveredGradeFundamentalsList.push(coveredGradeFundamental);
                }
            });

        });

        grade12LevelOfCompletionRows.each(function (index, row) {
            var inputControls = $(row).closest("tr").find("select");
            inputControls.each(function (i, input) {
                if (input.value != "0") {
                    var grade12LevelOfCompletion = {
                        Subject: input.id.split("_")[1],
                        StatusID: input.value,
                        SchoolID: $("#MainContent_hdfSchoolID").val()
                    };

                    grade12LevelOfCompletionList.push(grade12LevelOfCompletion);
                }
            });
        });

        var params = { curriculumDelivery: curriculum, teacherResources: teacherResourcesList, coveredGradeFundamentals: coveredGradeFundamentalsList, grade12LevelOfCompletion: grade12LevelOfCompletionList };

        $.ajax({
            type: "POST",
            url: "../../Services/Service.asmx/SaveCurriculumDeliveryInformation",
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
                    $("#divSaveCurriculumDeliveryInformationSuccess").text("Curriculum Delivery and Completion Details Saved Successfully.");
                    $("#divSaveCurriculumDeliveryInformationSuccess").show();
                    $("#divSaveCurriculumDeliveryInformationFailure").hide();

                    setTimeout(
                        function () {
                            $("#divEnablingConditions").show();
                            $("#divCurriculumDeliveryAndCompletion").hide();
                            HideLoadingSpinner();
                        }
                        , 1000);

                } else {
                    $("#divSaveCurriculumDeliveryInformationFailure").text(errorMsg);
                    $("#divSaveCurriculumDeliveryInformationSuccess").hide();
                    $("#divSaveCurriculumDeliveryInformationFailure").show();
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

    function OnWasTheSchoolAbleToDeliverLessonsToLearnersDuringLockdownLevel5Check() {
        if ($("#chk_WasTheSchoolAbleToDeliverLessonsToLearnersDuringLockdownLevel5").prop("checked") == true) {
            $("#trReachedGradesDuringLockdonLevel5").show();
        } else {
            $("#trReachedGradesDuringLockdonLevel5").hide();
            $('#ddl_ReachedGradesDuringLockdonLevel5').multiselect('select', []);
        }
    }

    function OnOtherModeOfDeliveryAdoptedBySchoolsToDeliverCurriculumDuringLockdownCheck(e) {
        if ($(e).prop("checked") == true) {
            $("#trOtherModeOfDeliveryAdoptedBySchoolsToDeliverCurriculumDuringLockdown").show();
        } else {
            $("#trOtherModeOfDeliveryAdoptedBySchoolsToDeliverCurriculumDuringLockdown").hide();
            $('#txtOtherModeOfDeliveryAdoptedBySchoolsToDeliverCurriculumDuringLockdown').val("")
        }
    }

    function OnQ1Term1ReportCardsIssuedCheck() {
        if ($("#chk_Q1Term1ReportCardsIssued").prop("checked") == false) {
            $("#trQ1Term1ReportCardsIssued").show(200);
        } else {
            $("#trQ1Term1ReportCardsIssued").hide(200);
        }
    }

    function OnWillTheSchoolHaveCompletedTheGrade12ProgrammeInAdvanceOfThePrelimExaminationsCheck(e) {
        if ($(e).prop("checked") == true) {
            $("#trReasonForNotCompletingTheGrade12ProgrammeInAdvanceOfThePrelimExaminations").hide();
            $('#txt_ReasonForNotCompletingTheGrade12ProgrammeInAdvanceOfThePrelimExaminations').val("");
        } else {
            $("#trReasonForNotCompletingTheGrade12ProgrammeInAdvanceOfThePrelimExaminations").show();
        }
    }

    function FindCurriculumDeliveryInput(textboxes, fieldName) {

        for (var i = 0; i < textboxes.length; i++) {
            var input = textboxes[i];
            var grade = input.split("_")[1];
            var fName = input.split("_")[2];

            if (fName == fieldName) {
                return input;
            }
        }
    }

    function LoadICurriculumDeliveryInformation() {
        var params = { schoolID: $("#MainContent_hdfSchoolID").val() };

        $.ajax({
            type: "POST",
            url: "../../../Services/Service.asmx/GetCurriculumDeliveryInformationBySchoolID",
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
                        var curriculumDelivery = data.CurriculumDelivery;
                        var teacherResources = data.TeacherResources;
                        var coveredGradeFundamentals = data.CoveredGradeFundamentals;
                        var grade12LevelOfCompletion = data.Grade12LevelOfCompletion;

                        //Set curriculumDelivery
                        if (curriculumDelivery) {
                            $("#chk_WasTheSchoolAbleToDeliverLessonsToLearnersDuringLockdownLevel5").prop("checked", curriculumDelivery.WasTheSchoolAbleToDeliverLessonsToLearnersDuringLockdownLevel5);
                            //Multi Select
                            $("#ddl_OnlineWithStudentTeacherInteraction").val(curriculumDelivery.OnlineWithStudentTeacherInteractionID);
                            $("#ddl_OnlineWithoutStudentTeacherInteraction").val(curriculumDelivery.OnlineWithoutStudentTeacherInteractionID);
                            $("#ddl_TVBasedLessonsAndProgrammes").val(curriculumDelivery.TVBasedLessonsAndProgrammesID);
                            $("#ddl_RadioLearningProgrammes").val(curriculumDelivery.RadioLearningProgrammesID);
                            $("#ddl_SocialMediaForStudentTeacherInteraction").val(curriculumDelivery.SocialMediaForStudentTeacherInteractionID);
                            $("#ddl_PaperBasedPackages").val(curriculumDelivery.PaperBasedPackagesID);
                            $("#ddl_HomeVisitsByTeachers").val(curriculumDelivery.HomeVisitsByTeachersID);
                            $("#ddl_UseOfExternalServiceProviders").val(curriculumDelivery.UseOfExternalServiceProvidersID);
                            $("#ddl_OtherDistanceLearning").val(curriculumDelivery.OtherDistanceLearningID);

                            $("#txtOtherModeOfDeliveryAdoptedBySchoolsToDeliverCurriculumDuringLockdown").val(curriculumDelivery.OtherDistanceLearningDescription);

                            $("#ddl_DevicesUtilisedByTeachersFor").val(curriculumDelivery.DevicesUtilisedByEducatorsUseID);
                            $("#chk_DidTheSchoolProvideEducatorsWithDataToEnableWiFiConnectivityWhenWorkingFromHome").prop("checked", curriculumDelivery.DidTheSchoolProvideEducatorsWithDataToEnableWiFiConnectivityWhenWorkingFromHome);
                            $("#txt_NoOfEducatorsTrainedToConductOnlineClasses").val(curriculumDelivery.NoOfEducatorsTrainedToConductOnlineClasses);
                            $("#txt_NoOfEducatorsNotTrainedToConductOnlineClasses").val(curriculumDelivery.NoOfEducatorsNotTrainedToConductOnlineClasses);
                            $("#txt_NoOfEducatorsSuccessfullyConductedOnlineClasses").val(curriculumDelivery.NoOfEducatorsSuccessfullyConductedOnlineClasses);
                            $("#chk_WasTerm1OfTheATPCompleted").prop("checked", curriculumDelivery.WasTerm1OfTheATPCompleted);
                            $("#chk_WasTerm1AssessmentCompleted").prop("checked", curriculumDelivery.WasTerm1AssessmentCompleted);
                            $("#chk_WereTerm1ReportCardsIssued").prop("checked", curriculumDelivery.WereTerm1ReportCardsIssued);

                            $("#chk_IsTheSchoolImplementingTheRevisedATP").prop("checked", curriculumDelivery.IsTheSchoolImplementingTheRevisedATP);

                            $("#ddl_Grade1To3_CompletedRequiredNofAssesments").val(curriculumDelivery.CompletedRequiredNofAssesmentsGrade1To3ID);
                            $("#ddl_Grade4To9_CompletedRequiredNofAssesments").val(curriculumDelivery.CompletedRequiredNofAssesmentsGrade4To9ID);
                            $("#ddl_Grade10To11_CompletedRequiredNofAssesments").val(curriculumDelivery.CompletedRequiredNofAssesmentsGrade10To11ID);
                            $("#ddl_Grade12_CompletedRequiredNofAssesments").val(curriculumDelivery.CompletedRequiredNofAssesmentsGrade12ID);

                            $("#chk_HaSchoolCommunicatedWithParentsRegardingAssessmentTasksExpectedFromLearners").prop("checked", curriculumDelivery.HaSchoolCommunicatedWithParentsRegardingAssessmentTasksExpectedFromLearners);
                            $("#chk_HasSchoolReceivedFortnightlyLearnerActivityPacks").prop("checked", curriculumDelivery.HasSchoolReceivedFortnightlyLearnerActivityPacks);
                            $("#chk_HasTheSchoolProvidedTheirOwnResourcesToFacilitateLockdownLearning").prop("checked", curriculumDelivery.HasTheSchoolProvidedTheirOwnResourcesToFacilitateLockdownLearning);
                            $("#chk_HaveParentsPickedUpTheFortnightlyLearnerActivityPacks").prop("checked", curriculumDelivery.HaveParentsPickedUpTheFortnightlyLearnerActivityPacks);
                            $("#chk_HasTheSchoolFollowedUpWithTheParentsOfLearnersThatFailedToSubmitTheirLearningTasks").prop("checked", curriculumDelivery.HasTheSchoolFollowedUpWithTheParentsOfLearnersThatFailedToSubmitTheirLearningTasks);

                            $("#chk_AreTheLearnersAttendingClassAtSchoolAndThoseAtHomeAtTheSameLevelOfCompletion").prop("checked", curriculumDelivery.AreTheLearnersAttendingClassAtSchoolAndThoseAtHomeAtTheSameLevelOfCompletion);
                            $("#chk_DoesTheSchoolEnsureThatTheParentsSubmitTheirChildrenAssessmentTasksInTime").prop("checked", curriculumDelivery.DoesTheSchoolEnsureThatTheParentsSubmitTheirChildrenAssessmentTasksInTime);
                            $("#txt_NoOfLearnersBenefittedFromTheHomeLearningPacks").val(curriculumDelivery.NoOfLearnersBenefittedFromTheHomeLearningPacks);

                            $("#chk_WillTheSchoolHaveCompletedTheGrade12ProgrammeInAdvanceOfThePrelimExaminations").prop("checked", curriculumDelivery.WillTheSchoolHaveCompletedTheGrade12ProgrammeInAdvanceOfThePrelimExaminations);
                            $("#txt_ReasonForNotCompletingTheGrade12ProgrammeInAdvanceOfThePrelimExaminations").val(curriculumDelivery.ReasonForNotCompletingTheGrade12ProgrammeInAdvanceOfThePrelimExaminations);

                            $("#txt_SubjectAdvisorsSupportedTheStaffOther").val(curriculumDelivery.SubjectAdvisorsSupportedTheStaffOther);
                            $("#txt_LaggingBehindSchoolInterventionsOther").val(curriculumDelivery.LaggingBehindSchoolInterventionsOther);

                            if (curriculumDelivery.SubjectAdvisorsSupportedTheStaff.indexOf(79) >= 0) {
                                $("#txt_SubjectAdvisorsSupportedTheStaffOther").show();
                            }

                            if (curriculumDelivery.LaggingBehindSchoolInterventions.indexOf(52) >= 0) {
                                $("#txt_LaggingBehindSchoolInterventionsOther").show();
                            }

                            //Set multi-select
                            $("#ddl_ReachedGradesDuringLockdonLevel5").multiselect('select', curriculumDelivery.ReachedGradesDuringLockdonLevel5);
                            $("#ddl_AccomodatedGradesFollowingMinistersFirstSetOfDirection").multiselect('select', curriculumDelivery.AccomodatedGradesFollowingMinistersFirstSetOfDirection);
                            $("#ddl_AccomodatedGradesFollowingMinistersFirstSetOfDirection29June2020").multiselect('select', curriculumDelivery.AccomodatedGradesFollowingMinistersFirstSetOfDirection29June2020);

                            $("#ddl_AccomodatedGradesFollowingMinistersSetOfDirection07July2020").multiselect('select', curriculumDelivery.AccomodatedGradesFollowingMinistersSetOfDirection07July2020);
                            $("#ddl_AccomodatedGradesFollowingMinistersSetOfDirection02August2020").multiselect('select', curriculumDelivery.AccomodatedGradesFollowingMinistersSetOfDirection02August2020);
                            $("#ddl_TeacherDevicesAreReliantOn").multiselect('select', curriculumDelivery.TeacherDevicesAreReliantOn);
                            $("#ddl_HowDidTheSchoolInformParentsAboutThePerformanceOfTheirChildren").multiselect('select', curriculumDelivery.HowDidTheSchoolInformParentsAboutThePerformanceOfTheirChildren);
                            $("#ddl_ApprovedSubjects").multiselect('select', curriculumDelivery.ApprovedSubjects);
                            $("#ddl_SeniorPhaseInitiatives").multiselect('select', curriculumDelivery.SeniorPhaseInitiatives);
                            $("#ddl_LaggingBehindSchoolInterventions").multiselect('select', curriculumDelivery.LaggingBehindSchoolInterventions);
                            $("#ddl_MeansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning").multiselect('select', curriculumDelivery.MeansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning);
                            $("#ddl_HowHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks").multiselect('select', curriculumDelivery.HowHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks);
                            $("#ddl_DistrictSupportRecievedForLockdownLearning").multiselect('select', curriculumDelivery.DistrictSupportRecievedForLockdownLearning);
                            $("#ddl_SubjectAdvisorsSupportedTheStaff").multiselect('select', curriculumDelivery.SubjectAdvisorsSupportedTheStaff);
                            $("#ddl_InitiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme").multiselect('select', curriculumDelivery.InitiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme);
                            $("#ddl_InitiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme").multiselect('select', curriculumDelivery.InitiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme);
                            $("#ddl_InitiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme").multiselect('select', curriculumDelivery.InitiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme);

                            //Mode of learning multi select
                            $("#ddl_OnlineWithStudentTeacherInteraction").multiselect('select', curriculumDelivery.OnlineWithStudentTeacherInteractionIDs);
                            $("#ddl_OnlineWithoutStudentTeacherInteraction").multiselect('select', curriculumDelivery.OnlineWithoutStudentTeacherInteractionIDs);
                            $("#ddl_TVBasedLessonsAndProgrammes").multiselect('select', curriculumDelivery.TVBasedLessonsAndProgrammesIDs);
                            $("#ddl_RadioLearningProgrammes").multiselect('select', curriculumDelivery.RadioLearningProgrammesIDs);
                            $("#ddl_SocialMediaForStudentTeacherInteraction").multiselect('select', curriculumDelivery.SocialMediaForStudentTeacherInteractionIDs);
                            $("#ddl_PaperBasedPackages").multiselect('select', curriculumDelivery.PaperBasedPackagesIDs);
                            $("#ddl_HomeVisitsByTeachers").multiselect('select', curriculumDelivery.HomeVisitsByTeachersIDs);
                            $("#ddl_UseOfExternalServiceProviders").multiselect('select', curriculumDelivery.UseOfExternalServiceProvidersIDs);
                            $("#ddl_OtherDistanceLearning").multiselect('select', curriculumDelivery.OtherDistanceLearningIDs);
                        }
                   
                        for (var i = 0; i < teacherResources.length; i++) {
                            var item = teacherResources[i];
                            var type = item.Type;

                            var txtProvidedByGDE = "#txt_" + type + "_ProvidedByGDE";
                            var txtProvidedBySchool = "#txt_" + type + "_ProvidedBySchool";
                            var txtOwnedProvided = "#txt_" + type + "_OwnedProvided";
                            
                            $(txtProvidedByGDE).val(item.ProvidedByGDE);
                            $(txtProvidedBySchool).val(item.ProvidedBySchool);
                            $(txtOwnedProvided).val(item.PersonallyOwned);
                        };

                        for (var i = 0; i < coveredGradeFundamentals.length; i++) {
                            var item = coveredGradeFundamentals[i];
                            var grade = item.Grade;

                            var ddlCoveredFundementals = "#ddl_" + grade + "_CoveredFundementals";
                            $(ddlCoveredFundementals).val(item.StatusID);
                        };

                        for (var i = 0; i < grade12LevelOfCompletion.length; i++) {
                            var item = grade12LevelOfCompletion[i];
                            var subject = item.Subject;

                            var ddlLevelOfCompletionOfCurriculum = "#ddl_" + subject + "_LevelOfCompletionOfCurriculum";
                            $(ddlLevelOfCompletionOfCurriculum).val(item.StatusID);
                        };
                    }
                } else {

                    $("#divSaveCurriculumDeliveryInformationFailure").text(jsonData.Message);
                    $("#divSaveCurriculumDeliveryInformationSuccess").hide();
                    $("#divSaveCurriculumDeliveryInformationFailure").show();
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
</script>
<div class="card">
    <h5 class="card-header">8.	CURRICULUM DELIVERY & COMPLETION – HIGH LEVEL  </h5>
    <div class="card-body">
          <p style="color:#FF0000"><i>Compulsory for all schools</i></p> 
          <p>8.1 CURRICULUM DELIVERY ACROSS THE DIFFERENT LOCKDOWN STAGES</p>
        <div class="row">
            <div class="form-group col-md-12">
                <table class="table table-bordered" id="tblManagementOfAbsenceBySMT">
                    <tbody>
                        <tr>
                            <th scope="row">8.1.1 Was the school able to deliver lessons to learners during Lockdown Stage 5? <i style="color:#FF0000">Tick if YES</i> </th>
                            <td>
                                <input type="checkbox" id="chk_WasTheSchoolAbleToDeliverLessonsToLearnersDuringLockdownLevel5" onclick="OnWasTheSchoolAbleToDeliverLessonsToLearnersDuringLockdownLevel5Check()" /></td>
                        </tr>

                        <tr id="trReachedGradesDuringLockdonLevel5" style="display:none;">
                            <th scope="row">8.1.2 If Yes, select all the grades that were reached in the table below  </th>
                            <td>
                                <select id="ddl_ReachedGradesDuringLockdonLevel5" multiple="multiple" class="form-control">
                                    <option value="17">Pre-Grade R</option>
                                    <option value="18">Grade R</option>
                                    <option value="19">Grade 1</option>
                                    <option value="20">Grade 2</option>
                                    <option value="21">Grade 3</option>
                                    <option value="22">Grade 4</option>
                                    <option value="23">Grade 5</option>
                                    <option value="24">Grade 6</option>
                                    <option value="25">Grade 7</option>
                                    <option value="26">Grade 8</option>
                                    <option value="27">Grade 9</option>
                                    <option value="28">Grade 10</option>
                                    <option value="29">Grade 11</option>
                                    <option value="30">Grade 12</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">8.1.3 Which grades was the school able to accommodate following the issue of the Minister’s first set of Directions (23 June 2020)?  </th>
                            <td>
                                <select id="ddl_AccomodatedGradesFollowingMinistersFirstSetOfDirection" multiple="multiple" class="form-control">
                                    <option value="17">Pre-Grade R</option>
                                    <option value="18">Grade R</option>
                                    <option value="19">Grade 1</option>
                                    <option value="20">Grade 2</option>
                                    <option value="21">Grade 3</option>
                                    <option value="22">Grade 4</option>
                                    <option value="23">Grade 5</option>
                                    <option value="24">Grade 6</option>
                                    <option value="25">Grade 7</option>
                                    <option value="26">Grade 8</option>
                                    <option value="27">Grade 9</option>
                                    <option value="28">Grade 10</option>
                                    <option value="29">Grade 11</option>
                                    <option value="30">Grade 12</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">8.1.4 Which grades was the school able to accommodate following the revision of the Minister’s first set of Directions (29 June 2020)?  </th>
                            <td>
                                <select id="ddl_AccomodatedGradesFollowingMinistersFirstSetOfDirection29June2020" multiple="multiple" class="form-control">
                                    <option value="17">Pre-Grade R</option>
                                    <option value="18">Grade R</option>
                                    <option value="19">Grade 1</option>
                                    <option value="20">Grade 2</option>
                                    <option value="21">Grade 3</option>
                                    <option value="22">Grade 4</option>
                                    <option value="23">Grade 5</option>
                                    <option value="24">Grade 6</option>
                                    <option value="25">Grade 7</option>
                                    <option value="26">Grade 8</option>
                                    <option value="27">Grade 9</option>
                                    <option value="28">Grade 10</option>
                                    <option value="29">Grade 11</option>
                                    <option value="30">Grade 12</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">8.1.5 Which grades was the school able to accommodate following the Minister’s Directions of 7 July 2020?   </th>
                            <td>
                                <select id="ddl_AccomodatedGradesFollowingMinistersSetOfDirection07July2020" multiple="multiple" class="form-control">
                                    <option value="17">Pre-Grade R</option>
                                    <option value="18">Grade R</option>
                                    <option value="19">Grade 1</option>
                                    <option value="20">Grade 2</option>
                                    <option value="21">Grade 3</option>
                                    <option value="22">Grade 4</option>
                                    <option value="23">Grade 5</option>
                                    <option value="24">Grade 6</option>
                                    <option value="25">Grade 7</option>
                                    <option value="26">Grade 8</option>
                                    <option value="27">Grade 9</option>
                                    <option value="28">Grade 10</option>
                                    <option value="29">Grade 11</option>
                                    <option value="30">Grade 12</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">8.1.6 Which grades was the school able to accommodate following the amendment of the Minister’s Directions of 2 August 2020? </th>
                            <td>
                                <select id="ddl_AccomodatedGradesFollowingMinistersSetOfDirection02August2020" multiple="multiple" class="form-control">
                                    <option value="17">Pre-Grade R</option>
                                    <option value="18">Grade R</option>
                                    <option value="19">Grade 1</option>
                                    <option value="20">Grade 2</option>
                                    <option value="21">Grade 3</option>
                                    <option value="22">Grade 4</option>
                                    <option value="23">Grade 5</option>
                                    <option value="24">Grade 6</option>
                                    <option value="25">Grade 7</option>
                                    <option value="26">Grade 8</option>
                                    <option value="27">Grade 9</option>
                                    <option value="28">Grade 10</option>
                                    <option value="29">Grade 11</option>
                                    <option value="30">Grade 12</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
     <div class="row">
				<div class="form-group col-md-12" >
                      <p>8.2 ONLINE, REMOTE AND DISTANCE LEARNING ALTERNATIVE DURING COVID-19</p>
					<table class="table table-bordered">
						 <thead>
							  <tr>
							      <th scope="col">Mode</th>
							      <th scope="col">Usage</th>
							  </tr>
					     </thead>
						 <tbody>
							    <tr>
                                    <th scope="row">Online/digital virtual classroom app/website with student-teacher interaction </th> 
                                     <td>
                                         <select class="form-control" id="ddl_OnlineWithStudentTeacherInteraction" multiple="multiple" >
                                            <option value="17">Pre-primary</option>
                                            <option value="18">Primary</option>
                                            <option value="19">Secondary</option>
                                        </select>
                                    </td>
								</tr>
                                <tr>
                                     <th scope="row">Online/digital learning apps/websites with no student-teacher interaction </th> 
                                      <td>
                                          <select class="form-control" id="ddl_OnlineWithoutStudentTeacherInteraction" multiple="multiple" >
                                             <option value="17">Pre-primary</option>
                                             <option value="18">Primary</option>
                                             <option value="19">Secondary</option>
                                         </select>
                                     </td>
								</tr>
                                 <tr>
                                     <th scope="row">TV-based lessons and programmes </th> 
                                      <td>
                                          <select class="form-control" id="ddl_TVBasedLessonsAndProgrammes" multiple="multiple" >
                                             <option value="17">Pre-primary</option>
                                             <option value="18">Primary</option>
                                             <option value="19">Secondary</option>
                                         </select>
                                     </td>
								</tr>
                                <tr>
                                     <th scope="row">Radio learning programs </th> 
                                      <td>
                                          <select class="form-control" id="ddl_RadioLearningProgrammes" multiple="multiple" >
                                             <option value="17">Pre-primary</option>
                                             <option value="18">Primary</option>
                                             <option value="19">Secondary</option>
                                         </select>
                                     </td>
								</tr>
                                 <tr>
                                     <th scope="row">SMS/mobile/ social media for student-teacher interaction (e.g. WhatsApp school group) </th> 
                                      <td>
                                          <select class="form-control" id="ddl_SocialMediaForStudentTeacherInteraction" multiple="multiple" >
                                             <option value="17">Pre-primary</option>
                                             <option value="18">Primary</option>
                                             <option value="19">Secondary</option>
                                         </select>
                                     </td>
								</tr>
                                 <tr>
                                     <th scope="row">Paper-based “take home” packages (textbooks, teacher worksheets, reading materials, etc) </th> 
                                      <td>
                                          <select class="form-control" id="ddl_PaperBasedPackages" multiple="multiple" >
                                             <option value="17">Pre-primary</option>
                                             <option value="18">Primary</option>
                                             <option value="19">Secondary</option>
                                         </select>
                                     </td>
								</tr>
                                <tr>
                                     <th scope="row">Home visits by teachers </th> 
                                      <td>
                                          <select class="form-control" id="ddl_HomeVisitsByTeachers" multiple="multiple" >
                                             <option value="17">Pre-primary</option>
                                             <option value="18">Primary</option>
                                             <option value="19">Secondary</option>
                                         </select>
                                     </td>
								</tr>
                                <tr>
                                     <th scope="row">Use of External Service providers to deliver teaching and learning content </th> 
                                      <td>
                                          <select class="form-control" id="ddl_UseOfExternalServiceProviders" multiple="multiple" >
                                             <option value="17">Pre-primary</option>
                                             <option value="18">Primary</option>
                                             <option value="19">Secondary</option>
                                         </select>
                                     </td>
								</tr>
                                <tr>
                                     <th scope="row" colspan="2">Other </th> 
								</tr>
                                 <tr id="trOtherModeOfDeliveryAdoptedBySchoolsToDeliverCurriculumDuringLockdown">
                                     <th scope="row"> 
                                         <input type="text" class="form-control" id="txtOtherModeOfDeliveryAdoptedBySchoolsToDeliverCurriculumDuringLockdown"  />
                                     </th> 
                                      <td>
                                          <select class="form-control" id="ddl_OtherDistanceLearning" multiple="multiple" >
                                             <option value="17">Pre-primary</option>
                                             <option value="18">Primary</option>
                                             <option value="19">Secondary</option>
                                         </select>
                                     </td>
								</tr>
                             </tbody>
                        </table>
                    </div>
            </div>

        
			<div class="row">
				<div class="form-group col-md-12" style="overflow-x:auto;" >
                    <p>8.3 EDUCATOR RESOURCES</p>
						<table class="table table-bordered">
						<thead>
                            <tr><th  scope="col" colspan="4">8.3.1 Educators</th></tr>
							 <tr>
                                 <th scope="col">IT Resources</th>
                                 <th scope="col">Provided by GDE</th>
                                 <th scope="col">Provided by School</th>
                                 <th scope="col">Personally Owned/Provided</th>

							 </tr>
							
						</thead>
						 <tbody id="tblTeacherResourcesBody">
							     <tr>
            						<th scope="row">Laptop</th> 
            						<td><input type="number" value="0"  min="0" id="txt_Laptop_ProvidedByGDE"  class="form-control" /></td>
            						<td><input type="number" value="0"  min="0" id="txt_Laptop_ProvidedBySchool"  class="form-control" /></td>
            						<td><input type="number" value="0"  min="0" id="txt_Laptop_OwnedProvided"  class="form-control" /></td>
            					</tr>
                                <tr>
            						<th scope="row">Tablet</th> 
            						<td><input type="number" value="0"  min="0" id="txt_Tablet_ProvidedByGDE"  class="form-control" /></td>
            						<td><input type="number" value="0"  min="0" id="txt_Tablet_ProvidedBySchool"  class="form-control" /></td>
            						<td><input type="number" value="0"  min="0" id="txt_Tablet_OwnedProvided"  class="form-control" /></td>
            					</tr>
                                <tr>
            						<th scope="row">Desktop</th> 
            						<td><input type="number" value="0"  min="0" id="txt_Desktop_ProvidedByGDE"  class="form-control" /></td>
            						<td><input type="number" value="0"  min="0" id="txt_Desktop_ProvidedBySchool"  class="form-control" /></td>
            						<td><input type="number" value="0"  min="0" id="txt_Desktop_OwnedProvided"  class="form-control" /></td>
            					</tr>
                                <tr>
            						<th scope="row">Mobile Phone</th> 
            						<td><input type="number" value="0"  min="0" id="txt_MobilePhone_ProvidedByGDE"  class="form-control" /></td>
            						<td><input type="number" value="0"  min="0" id="txt_MobilePhone_ProvidedBySchool"  class="form-control" /></td>
            						<td><input type="number" value="0"  min="0" id="txt_MobilePhone_OwnedProvided"  class="form-control" /></td>
            					</tr>
                                <tr>
            						<th scope="row">Data</th> 
            						<td><input type="number" value="0"  min="0" id="txt_Data_ProvidedByGDE"  class="form-control" /></td>
            						<td><input type="number" value="0"  min="0" id="txt_Data_ProvidedBySchool"  class="form-control" /></td>
            						<td><input type="number" value="0"  min="0" id="txt_Data_OwnedProvided"  class="form-control" /></td>
            					</tr>
						 </tbody>
				     </table>

					</div>
			</div>
			
        <div class="row">
				<div class="form-group col-md-12">
					<table class="table table-bordered">
						<%--<thead>
		                  <tr>
		                    <th scope="col">Questions</th>
		                    <th scope="col">Responses</th>
		                  </tr>
		                </thead>--%>
		                <tbody>
		                	<tr>
		                		<th  scope="row">8.3.2 The teacher devices are reliant on: </th>
            				    <td>
                                    <select id="ddl_TeacherDevicesAreReliantOn"  multiple="multiple" class="form-control">
                                         <option value="97">Broadband connectivity</option>
                                         <option value="98">The purchase of Data Bundles</option>
                                         <option value="99">Wi-Fi connectivity</option>
                                    </select>
                                </td>
		                	</tr>
							<tr>
		                		<th  scope="row">8.3.3 The devices utilised by educators were used for: </th>
            				    <td>
                                        <select id="ddl_DevicesUtilisedByTeachersFor" class="form-control">
                                          <option value="0">Select...</option>
                                          <option value="94">Teaching from School</option>
                                          <option value="95">Teaching from Home</option>
                                          <option value="96">Teaching from both School and Home</option>
                                        </select>
                                </td>
		                	</tr>
							<tr>
		                		<th scope="row">8.3.4 Did the school provide educators with data to enable WiFi connectivity when working from home? <i style="color:#FF0000">Tick if YES</i>  </th>
            				   <td><input type="checkbox" id="chk_DidTheSchoolProvideEducatorsWithDataToEnableWiFiConnectivityWhenWorkingFromHome" /></td>
		                	</tr>
							<tr>
		                		<th scope="row" colspan="2">8.3.5 In respect of MS teams or any other supporting solution/s e.g. Zoom, Google Classroom etc. used to conduct online classes: </th>
		                	</tr>
							<tr>
		                		<th scope="row" style="padding-left:35px;">How many of the educators have been trained to use the solution? </th>
            				   <td><input type="number" value="0"  min="0" id="txt_NoOfEducatorsTrainedToConductOnlineClasses"  class="form-control" /></td>
		                	</tr>
                            <tr>
		                		<th scope="row" style="padding-left:35px;">How many educators have not been trained to use the solution?  </th>
            				   <td><input type="number" value="0"  min="0" id="txt_NoOfEducatorsNotTrainedToConductOnlineClasses"  class="form-control" /></td>
		                	</tr>


                             <tr>
		                		<th scope="row">8.3.6 How many educators have been able to use MS teams (or any other solution) for teaching and learning successfully? </th>
            				   <td><input type="number" value="0"  min="0" id="txt_NoOfEducatorsSuccessfullyConductedOnlineClasses"  class="form-control" /></td>
		                	</tr>

                            <tr>
		                		<th scope="row" colspan="2">8.4 CURRICULUM COMPLETION</th>
		                	</tr>
                            <tr>
		                		<th scope="row" colspan="2">8.4.1 In respect of Term 1 (2020): </th>
		                	</tr>
                            <tr>
		                		<th scope="row" style="padding-left:35px;">Was Q1/term 1 of the ATP completed <i style="color:#FF0000">Tick if YES</i></th>
            				   <td><input type="checkbox" id="chk_WasTerm1OfTheATPCompleted" /></td>
		                	</tr>
                            <tr>
		                		<th scope="row" style="padding-left:35px;">Was the Q1/term 1 Assessment completed? <i style="color:#FF0000">Tick if YES</i></th>
            				   <td><input type="checkbox" id="chk_WasTerm1AssessmentCompleted" /></td>
		                	</tr>
                            <tr>
		                		<th scope="row" style="padding-left:35px;">Were Q1/Term 1 Report Cards Issued? <i style="color:#FF0000">Tick if YES</i> </th>
            				   <td><input type="checkbox" id="chk_WereTerm1ReportCardsIssued" onclick="OnQ1Term1ReportCardsIssuedCheck()" /></td>
		                	</tr>

                            <tr id="trQ1Term1ReportCardsIssued" style="display:none;">
		                		<th  scope="row"> 8.4.2If no report cards were issued for term1, how did the school inform parents about the performance of their children? </th>
            				    <td>
                                    <select id="ddl_HowDidTheSchoolInformParentsAboutThePerformanceOfTheirChildren" multiple="multiple" class="form-control">
                                        <option value="100">Email feedback</option>
                                        <option value="101">Meeting with parents</option>
                                        <option value="102">Telephonic Feedback</option>
                                        <option value="103">Written communication or correspondence</option>
                                    </select>
                                </td>
		                	</tr>

                             <tr>
		                		<th scope="row">8.4.3 Since the resumption of learning, is the school implementing the revised ATP? <i style="color:#FF0000">Tick if YES</i> </th>
            				   <td><input type="checkbox" id="chk_IsTheSchoolImplementingTheRevisedATP" /></td>
		                	</tr>
                            <tr>
		                		<th  scope="row">8.4.4 In respect of the Senior Phase (Grades 7-9), did the school: </th>
            				    <td>
                                        <select id="ddl_SeniorPhaseInitiatives"  multiple="multiple" class="form-control">
                                          <option value="104"> Apply for a reduction in the number of subjects in the Senior Phase (Grades 7-9)</option>
                                          <option value="105">Obtain approval for a reduction in the number of subjects in the Senior Phase (Grades 7-9)</option>
                                        </select>
                                </td>
		                	</tr>
                            <tr>
		                		<th  scope="row">8.4.5 If approval was obtained, indicate for which subjects:</th>
            				    <td>
                                    <select id="ddl_ApprovedSubjects"  multiple="multiple" class="form-control">
                                        <option value="106">Arts and Culture</option>
                                        <option value="107">EMS</option>
                                        <option value="108">Social Sciences</option>
                                        <option value="109">Technology</option>
                                     </select>
                                </td>
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
                                  <th scope="col" colspan="2">8.4.6 In line with the trimmed curriculum and the revised ATP, at the time of completing the survey, to what extent have the Fundamentals been covered in each of the following Grades? </th>
							  </tr>
					     </thead>
						 <tbody id="tblCoveredGradeFundamentalsBody">
							    <tr>
                                    <%--<td style="width:10px;"><input type="checkbox" class="covered-fundementals" /></td>--%>
                                    <th scope="row">Grade 1</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Grade1_CoveredFundementals">
                                            <option value="0">Select...</option>
                                            <option value="18">Fully</option>
                                            <option value="19">Partially</option>
                                            <option value="19">Not at all</option>
                                        </select>
                                    </td>
								</tr>
                                <tr>
                                    <%--<td style="width:10px;"><input type="checkbox" class="covered-fundementals" /></td>--%>
                                    <th scope="row">Grade 2</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Grade2_CoveredFundementals">
                                            <option value="0">Select...</option>
                                            <option value="18">Fully</option>
                                            <option value="19">Partially</option>
                                            <option value="19">Not at all</option>
                                        </select>
                                    </td>
								</tr>
                                <tr>
                                       <%--<td style="width:10px;"><input type="checkbox" class="covered-fundementals" /></td>--%>
                                       <th scope="row">Grade 3</th> 
                                       <td>
                                            <select class="form-control" id="ddl_Grade3_CoveredFundementals">
                                               <option value="0">Select...</option>
                                               <option value="18">Fully</option>
                                               <option value="19">Partially</option>
                                               <option value="19">Not at all</option>
                                           </select>
                                    </td>
								</tr>
                                <tr>
                                    <%--<td style="width:10px;"><input type="checkbox" class="covered-fundementals" /></td>--%>
                                    <th scope="row">Grade 4</th> 
                                    <td>
                                         <select class="form-control"  id="ddl_Grade4_CoveredFundementals">
                                            <option value="0">Select...</option>
                                            <option value="18">Fully</option>
                                            <option value="19">Partially</option>
                                            <option value="19">Not at all</option>
                                        </select>
                                    </td>
								</tr>
                                <tr>
                                    <%--<td style="width:10px;"><input type="checkbox" class="covered-fundementals" /></td>--%>
                                    <th scope="row">Grade 5</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Grade5_CoveredFundementals">
                                            <option value="0">Select...</option>
                                            <option value="18">Fully</option>
                                            <option value="19">Partially</option>
                                            <option value="19">Not at all</option>
                                        </select>
                                    </td>
								</tr>
                                <tr>
                                    <%--<td style="width:10px;"><input type="checkbox" class="covered-fundementals" /></td>--%>
                                    <th scope="row">Grade 6</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Grade6_CoveredFundementals">
                                            <option value="0">Select...</option>
                                            <option value="18">Fully</option>
                                            <option value="19">Partially</option>
                                            <option value="19">Not at all</option>
                                        </select>
                                    </td>
								</tr>
                                 <tr>
                                    <%--<td style="width:10px;"><input type="checkbox" class="covered-fundementals" /></td>--%>
                                    <th scope="row">Grade 7</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Grade7_CoveredFundementals">
                                            <option value="0">Select...</option>
                                            <option value="18">Fully</option>
                                            <option value="19">Partially</option>
                                            <option value="19">Not at all</option>
                                        </select>
                                    </td>
								</tr>
                               <tr>
                                    <%--<td style="width:10px;"><input type="checkbox" class="covered-fundementals" /></td>--%>
                                    <th scope="row">Grade 8</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Grade8_CoveredFundementals">
                                            <option value="0">Select...</option>
                                            <option value="18">Fully</option>
                                            <option value="19">Partially</option>
                                            <option value="19">Not at all</option>
                                        </select>
                                    </td>
								</tr>
                                <tr>
                                    <%--<td style="width:10px;"><input type="checkbox" class="covered-fundementals" /></td>--%>
                                    <th scope="row">Grade 9</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Grade9_CoveredFundementals">
                                            <option value="0">Select...</option>
                                            <option value="18">Fully</option>
                                            <option value="19">Partially</option>
                                            <option value="19">Not at all</option>
                                        </select>
                                    </td>
								</tr>
                               <tr>
                                   <%-- <td style="width:10px;"><input type="checkbox" class="covered-fundementals" /></td>--%>
                                    <th scope="row">Grade 10</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Grade10_CoveredFundementals">
                                            <option value="0">Select...</option>
                                            <option value="18">Fully</option>
                                            <option value="19">Partially</option>
                                            <option value="19">Not at all</option>
                                        </select>
                                    </td>
								</tr>
                               <tr>
                                   <%-- <td style="width:10px;"><input type="checkbox" class="covered-fundementals" /></td>--%>
                                    <th scope="row">Grade 11</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Grade11_CoveredFundementals">
                                            <option value="0">Select...</option>
                                            <option value="18">Fully</option>
                                            <option value="19">Partially</option>
                                            <option value="19">Not at all</option>
                                        </select>
                                    </td>
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
                                  <th scope="col" colspan="2">8.4.7 Has the school been able to complete the required number of assessment tasks for the following </th>
							  </tr>
					     </thead>
						 <tbody id="tblCompletedRequiredNofAssesmentsBody">
							    <tr>
                                    <th scope="row">Grades 1 - 3</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Grade1To3_CompletedRequiredNofAssesments">
                                            <option value="0">Select...</option>
                                            <option value="18">Fully</option>
                                            <option value="19">Partially</option>
                                            <option value="19">Not at all</option>
                                        </select>
                                    </td>
								</tr>
                                <tr>
                                    <th scope="row">Grades 4 - 9</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Grade4To9_CompletedRequiredNofAssesments">
                                            <option value="0">Select...</option>
                                            <option value="18">Fully</option>
                                            <option value="19">Partially</option>
                                            <option value="19">Not at all</option>
                                        </select>
                                    </td>
								</tr>
                                <tr>
                                    <th scope="row">Grades 10 - 11</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Grade10To11_CompletedRequiredNofAssesments">
                                            <option value="0">Select...</option>
                                            <option value="18">Fully</option>
                                            <option value="19">Partially</option>
                                            <option value="19">Not at all</option>
                                        </select>
                                    </td>
								</tr>
                                <tr>
                                    <th scope="row">Grades 12</th> 
                                    <td>
                                         <select class="form-control" id="ddl_Grade12_CompletedRequiredNofAssesments">
                                            <option value="0">Select...</option>
                                            <option value="18">Fully</option>
                                            <option value="19">Partially</option>
                                            <option value="19">Not at all</option>
                                        </select>
                                    </td>
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
                                  <th scope="col" colspan="2">8.4.8 In respect of Grade 12: What is the % level of completion of the curriculum for the following?  </th>
							  </tr>
					     </thead>
						 <tbody id="tblGrade12LevelOfCompletionBody">
							    <tr>
                                    <th scope="row" style="padding-left:35px;">Home Language</th> 
                                    <td>
                                         <select class="form-control" id="ddl_HomeLanguage_LevelOfCompletionOfCurriculum">
                                            <option value="0">Select...</option>
                                            <option value="44">Below 50%</option>
                                            <option value="45">Between 50-80%</option>
                                            <option value="46">Above 80%</option>
                                        </select>
                                    </td>
								</tr>
                                 <tr>
                                    <th scope="row" style="padding-left:35px;">First & Second Additional Languages</th> 
                                    <td>
                                         <select class="form-control" id="ddl_FirstAndSecondAdditionalLanguages_LevelOfCompletionOfCurriculum">
                                            <option value="0">Select...</option>
                                            <option value="44">Below 50%</option>
                                            <option value="45">Between 50-80%</option>
                                            <option value="46">Above 80%</option>
                                        </select>
                                    </td>
								</tr>
                                <tr>
                                    <th scope="row" style="padding-left:35px;">Life Orientation</th> 
                                    <td>
                                         <select class="form-control" id="ddl_LifeOrientation_LevelOfCompletionOfCurriculum">
                                            <option value="0">Select...</option>
                                            <option value="44">Below 50%</option>
                                            <option value="45">Between 50-80%</option>
                                            <option value="46">Above 80%</option>
                                        </select>
                                    </td>
								</tr>
                                <tr>
                                    <th scope="row" style="padding-left:35px;">Commercial Subjects </th> 
                                    <td>
                                         <select class="form-control" id="ddl_CommercialSubjects_LevelOfCompletionOfCurriculum">
                                            <option value="0">Select...</option>
                                            <option value="44">Below 50%</option>
                                            <option value="45">Between 50-80%</option>
                                            <option value="46">Above 80%</option>
                                        </select>
                                    </td>
								</tr>
                                <tr>
                                    <th scope="row" style="padding-left:35px;">Mathematics </th> 
                                    <td>
                                         <select class="form-control" id="ddl_Mathematics_LevelOfCompletionOfCurriculum">
                                            <option value="0">Select...</option>
                                            <option value="44">Below 50%</option>
                                            <option value="45">Between 50-80%</option>
                                            <option value="46">Above 80%</option>
                                        </select>
                                    </td>
								</tr>
                                <tr>
                                    <th scope="row" style="padding-left:35px;">Mathematical Literacy </th> 
                                    <td>
                                         <select class="form-control" id="ddl_MathematicalLiteracy_LevelOfCompletionOfCurriculum">
                                            <option value="0">Select...</option>
                                            <option value="44">Below 50%</option>
                                            <option value="45">Between 50-80%</option>
                                            <option value="46">Above 80%</option>
                                        </select>
                                    </td>
								</tr>
                                
                                <tr>
                                    <th scope="row" style="padding-left:35px;">Life Sciences </th> 
                                    <td>
                                         <select class="form-control" id="ddl_LifeSciences_LevelOfCompletionOfCurriculum">
                                            <option value="0">Select...</option>
                                            <option value="44">Below 50%</option>
                                            <option value="45">Between 50-80%</option>
                                            <option value="46">Above 80%</option>
                                        </select>
                                    </td>
								</tr>
                                 <tr>
                                        <th scope="row" style="padding-left:35px;">Physical Sciences </th> 
                                        <td>
                                             <select class="form-control" id="ddl_PhysicalSciences_LevelOfCompletionOfCurriculum">
                                                <option value="0">Select...</option>
                                                <option value="44">Below 50%</option>
                                                <option value="45">Between 50-80%</option>
                                                <option value="46">Above 80%</option>
                                            </select>
                                        </td>
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
                                    <th scope="row">8.4.9 If the school is lagging behind in terms of curriculum delivery, are the following interventions being implemented by the school to catch up: </th> 
                                    <td>
                                         <select  multiple="multiple" class="form-control" id="ddl_LaggingBehindSchoolInterventions">
                                            <option value="47">The School day has been Extended.</option>
                                            <option value="48">The school is offering Extra Weekend Classes.</option>
                                            <option value="49">The school is/has offered Holiday Classes.</option>
                                            <option value="50">The school has Supported Independent Study by learners.</option>
                                            <option value="51">The school has pre-recorded lessons and made these available to learners.</option>
                                            <option value="52">Other</option>
                                        </select>
                                         <input type="text" class="form-control" id="txt_LaggingBehindSchoolInterventionsOther" style="display:none;" />
                                         <span style="color:red;display:none;" id="spnLaggingBehindSchoolInterventionsOther">Field is required</span>
                                    </td>
								</tr>
                             </tbody>
                        </table>
                    </div>
            </div>

            <div class="row">
				<div class="form-group col-md-12">
                    <p>8.5 LOCKDOWN LEARNING</p>
					<table class="table table-bordered">
                        <thead>
							<tr>
							  <th scope="col" colspan="2">8.5.1 In respect of lockdown learning:</th>
                            </tr>
                        </thead>
		                <tbody id="tblLockdownLearningBody">
							<tr>
								<th scope="row" style="padding-left:35px;">Has the school communicated with the parents regarding the assessment tasks expected from learners? <i style="color:#FF0000">Tick if YES</i></th>
								<td>
                                       <input type="checkbox" id="chk_HaSchoolCommunicatedWithParentsRegardingAssessmentTasksExpectedFromLearners" />
                                </td>
							</tr>
                            <tr>
								<th scope="row" style="padding-left:35px;">Has the school received the fortnightly Learner Activity Packs (LAPs) from the district for lockdown learners? <i style="color:#FF0000">Tick if YES</i></th>
								<td>
                                       <input type="checkbox" id="chk_HasSchoolReceivedFortnightlyLearnerActivityPacks" />
                                </td>
							</tr>
                            <tr>
								<th scope="row" style="padding-left:35px;">If no, has the school provided their own resources to facilitate lockdown learning? <i style="color:#FF0000">Tick if YES</i> </th>
								<td>
                                       <input type="checkbox" id="chk_HasTheSchoolProvidedTheirOwnResourcesToFacilitateLockdownLearning" />
                                </td>
							</tr>
                             <tr>
								<th scope="row" style="padding-left:35px;">Have the parents picked up the fortnightly Learner Activity Packs (LAPs) from the school? <i style="color:#FF0000">Tick if YES</i> </th>
								<td>
                                       <input type="checkbox" id="chk_HaveParentsPickedUpTheFortnightlyLearnerActivityPacks" />
                                </td>
							</tr>
                            <tr>
								<th scope="row" style="padding-left:35px;">Has the school followed up with the parents of learners that failed to submit their learning tasks? <i style="color:#FF0000">Tick if YES</i> </th>
								<td>
                                       <input type="checkbox" id="chk_HasTheSchoolFollowedUpWithTheParentsOfLearnersThatFailedToSubmitTheirLearningTasks" />
                                </td>
							</tr>
                             <tr>
		                		<th  scope="row">8.5.2 Which of the following means has the school used to provide guidance to parents and learners to facilitate lockdown learning?</th>
            				    <td>
                                        <select id="ddl_MeansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning"  multiple="multiple" class="form-control">
                                            <option value="53">Provision of Guidelines</option>
                                            <option value="54">Online Tutorials or Lessons</option>
                                            <option value="55">Email Support</option>
                                            <option value="56">Cellphone/Mobile Communication</option>
                                            <option value="57">WhatsApp or other social media platforms</option>
                                            <option value="58">No guidance offered</option>
                                        </select>
                                </td>
		                	</tr>
                              <tr>
								<th scope="col">8.5.3 Are the learners attending class at school and those at home at the same level of completion? <i style="color:#FF0000">Tick if YES</i> </th>
								<td>
                                       <input type="checkbox" id="chk_AreTheLearnersAttendingClassAtSchoolAndThoseAtHomeAtTheSameLevelOfCompletion" />
                                </td>
							</tr>
                             <tr>
		                		<th  scope="row">8.5.4 How has the school assisted “lockdown learners” with their assessment tasks?</th>
            				    <td>
                                        <select id="ddl_HowHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks"  multiple="multiple" class="form-control">
                                            <option value="59">Provided Remote support</option>
                                            <option value="60">Provided support packs</option>
                                            <option value="61">Invited learners/parents to attend school for assessment discussion</option>
                                            <option value="62">Provided Written Feedback (email/text)</option>
                                            <option value="63">Established and utilised Chat Groups to provide support</option>
                                            <option value="64">Telephonic Support</option>
                                        </select>
                                </td>
		                	</tr>
                             <tr>
								<th scope="col">8.5.5 Does the school ensure that the parents submit their children’s assessment tasks on time? <i style="color:#FF0000">Tick if YES</i>  </th>
								<td>
                                       <input type="checkbox" id="chk_DoesTheSchoolEnsureThatTheParentsSubmitTheirChildrenAssessmentTasksInTime" />
                                </td>
							</tr>
                            <tr>
            						<th scope="row">8.5.6 How many learners have benefitted from the home learning packs that were prepared and distributed by the school?  </th> 
            						<td><input type="number" value="0"  min="0" id="txt_NoOfLearnersBenefittedFromTheHomeLearningPacks"  class="form-control" /></td>
            					</tr>
		                </tbody>
					</table>
				</div>
			</div>

          <div class="row">
				<div class="form-group col-md-12">
                    <p>8.6 DISTRICT SUPPORT</p>
					<table class="table table-bordered">
		                <tbody>
							<tr>
								<th scope="col">8.6.1 What kind of support do you receive from the district with respect to lockdown learning? </th>
								<td>
                                        <select id="ddl_DistrictSupportRecievedForLockdownLearning" multiple="multiple" class="form-control">
                                            <option value="65">Provided with Guidelines for Lockdown Learning (Memo)</option>
                                            <option value="66">Revision Worksheets</option>
                                            <option value="67">Exemplar Lesson Plans</option>
                                            <option value="68">Exemplar Assessment tasks</option>
                                            <option value="69">PowerPoint Presentations</option>
                                            <option value="70">Study Guides</option>
                                            <option value="71">Learner Activity Packs (LAPs)</option>
                                            <option value="72">Fundamentals (DBE Circular 3)</option>
                                            <option value="73">Revised Annual Teaching Programme (Revised ATPs DBE Circular S2)</option>
                                            <option value="74">Subject Advisor Monitoring & Support</option>
                                        </select>
                                </td>
							</tr>
                            <tr>
								<th scope="col">8.6.2 The Subject Advisors supported the staff in terms of curriculum delivery in the following manner? </th>
								 <td>
                                   <select id="ddl_SubjectAdvisorsSupportedTheStaff" multiple="multiple" class="form-control">
                                       <option value="75">Monitoring the implementation of the revised ATPs</option>
                                       <option value="76">Identified and resolved curriculum and assessment challenges</option>
                                       <option value="77">Provision of teaching and learning resources</option>
                                       <option value="78">Online/Remote support</option>
                                       <option value="79">Other</option>
                                   </select>
                                   <input type="text" class="form-control" id="txt_SubjectAdvisorsSupportedTheStaffOther" style="display:none;" />
                                   <span style="color:red;display:none;" id="spnSubjectAdvisorsSupportedTheStaffOther">Field is required</span>
                                </td>
							</tr>
		                </tbody>
					</table>
				</div>
			</div>

        <div class="row">
				<div class="form-group col-md-12">
                    <P>8.7 SUPPORT TO GRADE 12 LEARNERS</P>
					<table class="table table-bordered">
		                <tbody>
							<tr>
								<th scope="col">8.7.1 Which of the following was availed to the matriculants by the school to complete the Grade 12 Programme? </th>
								<td>
                                        <select id="ddl_InitiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme" multiple="multiple" class="form-control">
                                            <option value="80"> Extended School Days</option>
                                            <option value="81"> Weekend Sessions</option>
                                            <option value="82"> Supplementary Programme by the School</option>
                                            <option value="83"> Online/Remote Support</option>
                                            <option value="84"> Access to Weblinks with curriculum content</option>
                                        </select>
                                </td>
							</tr>
                            <tr>
                                <th scope="col">8.7.2 Which of the following was availed to the matriculants by Independent Providers/partners to complete the Grade 12 Programme? </th>
								 <td>
                                   <select id="ddl_InitiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme" multiple="multiple" class="form-control">
                                        <option value="85">Provincial SSIP programme</option>
                                        <option value="86">GDE Support Portal</option>
                                        <option value="87">DBE Portal and Website</option>
                                        <option value="88">GDE Study Guides</option>
                                        <option value="89">Mind the Gap Study Guides Series</option>
                                   </select>
                                </td>
							</tr>
                            <tr>
								<th scope="col">8.7.3 Which of the following was availed to the matriculants by the GDE/DBE to complete the Grade 12 Programme?  </th>
								 <td>
                                   <select id="ddl_InitiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme" multiple="multiple" class="form-control">
                                        <option value="90">Mindset</option>
                                        <option value="91">SABC Woza Matrics</option>
                                        <option value="92">Radio 2000 Broadcasts</option>
                                        <option value="93">Zero-rated Websites</option>
                                   </select>
                                </td>
							</tr>
                            <tr>
		                		<th  scope="row">8.7.4 Will the school have completed the Grade 12 programme in advance of the Prelim Examinations? <i style="color:#FF0000">Tick if YES</i></th>
            				     <td ><input type="checkbox" id="chk_WillTheSchoolHaveCompletedTheGrade12ProgrammeInAdvanceOfThePrelimExaminations" onclick="OnWillTheSchoolHaveCompletedTheGrade12ProgrammeInAdvanceOfThePrelimExaminationsCheck(this)" /></td>
		                	</tr>
                             <tr id="trReasonForNotCompletingTheGrade12ProgrammeInAdvanceOfThePrelimExaminations">
		                		<th  scope="row" style="padding-left:35px;">If not, why </th>
            				     <td ><textarea id="txt_ReasonForNotCompletingTheGrade12ProgrammeInAdvanceOfThePrelimExaminations" class="form-control"></textarea></td>
		                	</tr>
		                </tbody>
					</table>
				</div>
			</div>



        <div class="form-row">
            <div class="form-group col-12" style="text-align: right;">
                <div class="alert alert-success" role="alert" id="divSaveCurriculumDeliveryInformationSuccess" style="display: none;"></div>
                <div class="alert alert-danger" role="alert" id="divSaveCurriculumDeliveryInformationFailure" style="display: none;"></div>
                <ul class="inline">
                    <li>
                        <input onclick="GoToInfectionsAndMortalityInformation(); return false;" type="button" class="btn btn-primary btn-sm" value="Previous" /></li>
                    <li>
                        <input onclick="SaveCurriculumDeliveryInformation(); return false;" type="button" class="btn btn-primary btn-sm" value="Save & Continue" /></li>
                </ul>
            </div>
        </div>
         </div>
    </div>

