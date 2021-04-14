<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InfectionsAndMortalityInformation.ascx.cs" Inherits="OnlineSurvey.Pages.Survey.Controls.InfectionsAndMortalityInformation" %>

<script type="text/javascript">
	$(document).ready(function () {
        AttachInfectionsAndMortalityInformationInformationCalculateEvent("tblLearnerByGradeCovid19StatisticsBody");
        AttachInfectionsAndMortalityInformationInformationCalculateEvent("tblLearnersByAgeGroupCovid19StatisticsBody");
        AttachInfectionsAndMortalityInformationInformationCalculateEvent("tblEducatorsCovid19StatisticsBody");
		AttachInfectionsAndMortalityInformationInformationCalculateEvent("tblNonEducatorsCovid19StatisticsBody");

		LoadInfectionsAndMortalityInformation();
	});


    function GoToHostelBoardersInformation() {
        $("#divInfectionsAndMortalityInformation").hide();
        $("#divHostelBoardersInformation").show();
    }

    function SaveInfectionsAndMortalityInformation() {
        var learnersByGradeCovid19StatisticsRows = $("#tblLearnerByGradeCovid19StatisticsBody tr");
        var learnersByAgeGroupCovid19StatisticsRows = $("#tblLearnersByAgeGroupCovid19StatisticsBody tr");
        var educatorsCovid19StatisticsRows = $("#tblEducatorsCovid19StatisticsBody tr");
        var nonEducatorsCovid19StatisticsRows = $("#tblNonEducatorsCovid19StatisticsBody tr");

        var learnersByGradeCovid19Statistics = [];
        var learnersByAgeGroupCovid19Statistics = [];
        var staffCovid19Statistics = [];

        learnersByGradeCovid19StatisticsRows.each(function (index, row) {
            var textboxes = $(row).closest("tr").find("input");
            var inputControls = [];

            textboxes.each(function (i, input) {
                inputControls.push(input.id);
            });

			if (inputControls.length > 0) {
				var txtConfirmedCovid19InfectionsMale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Infections", "LearnersByGrade", "Male");
				var txtConfirmedCovid19RecoveriesMale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Recoveries", "LearnersByGrade", "Male");
				var txtConfirmedCovid19DeathsMale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Deaths", "LearnersByGrade", "Male");

				var txtConfirmedCovid19InfectionsFemale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Infections", "LearnersByGrade", "Female");
				var txtConfirmedCovid19RecoveriesFemale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Recoveries", "LearnersByGrade", "Female");
				var txtConfirmedCovid19DeathsFemale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Deaths", "LearnersByGrade", "Female");

				var covid19Statistic = {
                    NoOfConfirmedInfectionsMale: $("#" + txtConfirmedCovid19InfectionsMale).val(),
                    NoOfConfirmedInfectionsFemale: $("#" + txtConfirmedCovid19InfectionsFemale).val(),
                    NoOfConfirmedRecoveriesMale: $("#" + txtConfirmedCovid19RecoveriesMale).val(),
                    NoOfConfirmedRecoveriesFemale: $("#" + txtConfirmedCovid19RecoveriesFemale).val(),
                    NoOfConfirmedDeathsMale: $("#" + txtConfirmedCovid19DeathsMale).val(),
                    NoOfConfirmedDeathsFemale: $("#" + txtConfirmedCovid19DeathsFemale).val(),
                    Grade: txtConfirmedCovid19InfectionsMale.split("_")[1],
                    SchoolID: $("#MainContent_hdfSchoolID").val()
				}

				learnersByGradeCovid19Statistics.push(covid19Statistic);
            }
		});
        
        learnersByAgeGroupCovid19StatisticsRows.each(function (index, row) {
            var textboxes = $(row).closest("tr").find("input");
            var inputControls = [];

            textboxes.each(function (i, input) {
                inputControls.push(input.id);
            });

            if (inputControls.length > 0) {
                var txtConfirmedCovid19InfectionsMale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Infections", "LearnersByAgeGroup", "Male");
                var txtConfirmedCovid19RecoveriesMale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Recoveries", "LearnersByAgeGroup", "Male");
                var txtConfirmedCovid19DeathsMale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Deaths", "LearnersByAgeGroup", "Male");

                var txtConfirmedCovid19InfectionsFemale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Infections", "LearnersByAgeGroup", "Female");
                var txtConfirmedCovid19RecoveriesFemale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Recoveries", "LearnersByAgeGroup", "Female");
                var txtConfirmedCovid19DeathsFemale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Deaths", "LearnersByAgeGroup", "Female");

                var covid19Statistic = {
                    NoOfConfirmedInfectionsMale: $("#" + txtConfirmedCovid19InfectionsMale).val(),
                    NoOfConfirmedInfectionsFemale: $("#" + txtConfirmedCovid19InfectionsFemale).val(),
                    NoOfConfirmedRecoveriesMale: $("#" + txtConfirmedCovid19RecoveriesMale).val(),
                    NoOfConfirmedRecoveriesFemale: $("#" + txtConfirmedCovid19RecoveriesFemale).val(),
                    NoOfConfirmedDeathsMale: $("#" + txtConfirmedCovid19DeathsMale).val(),
                    NoOfConfirmedDeathsFemale: $("#" + txtConfirmedCovid19DeathsFemale).val(),
                    AgeGroup: txtConfirmedCovid19InfectionsMale.split("_")[1],
                    SchoolID: $("#MainContent_hdfSchoolID").val()
                }

                learnersByAgeGroupCovid19Statistics.push(covid19Statistic);
            }
        });

        educatorsCovid19StatisticsRows.each(function (index, row) {
            var textboxes = $(row).closest("tr").find("input");
            var inputControls = [];

            textboxes.each(function (i, input) {
                inputControls.push(input.id);
            });
			
            if (inputControls.length > 0) {
                var txtConfirmedCovid19InfectionsMale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Infections", "Educators", "Male");
                var txtConfirmedCovid19RecoveriesMale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Recoveries", "Educators", "Male");
                var txtConfirmedCovid19DeathsMale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Deaths", "Educators", "Male");

                var txtConfirmedCovid19InfectionsFemale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Infections", "Educators", "Female");
                var txtConfirmedCovid19RecoveriesFemale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Recoveries", "Educators", "Female");
                var txtConfirmedCovid19DeathsFemale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Deaths", "Educators", "Female");

                var covid19Statistic = {
                    NoOfConfirmedInfectionsMale: $("#" + txtConfirmedCovid19InfectionsMale).val(),
                    NoOfConfirmedInfectionsFemale: $("#" + txtConfirmedCovid19InfectionsFemale).val(),
                    NoOfConfirmedRecoveriesMale: $("#" + txtConfirmedCovid19RecoveriesMale).val(),
                    NoOfConfirmedRecoveriesFemale: $("#" + txtConfirmedCovid19RecoveriesFemale).val(),
                    NoOfConfirmedDeathsMale: $("#" + txtConfirmedCovid19DeathsMale).val(),
                    NoOfConfirmedDeathsFemale: $("#" + txtConfirmedCovid19DeathsFemale).val(),
                    AgeGroup: txtConfirmedCovid19InfectionsMale.split("_")[1],
                    StaffType: "Educators",
                    SchoolID: $("#MainContent_hdfSchoolID").val()
                };

				staffCovid19Statistics.push(covid19Statistic);
            }
        });

        nonEducatorsCovid19StatisticsRows.each(function (index, row) {
            var textboxes = $(row).closest("tr").find("input");
            var inputControls = [];

            textboxes.each(function (i, input) {
                inputControls.push(input.id);
            });

            if (inputControls.length > 0) {
                var txtConfirmedCovid19InfectionsMale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Infections", "NonEducators", "Male");
                var txtConfirmedCovid19RecoveriesMale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Recoveries", "NonEducators", "Male");
                var txtConfirmedCovid19DeathsMale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Deaths", "NonEducators", "Male");

                var txtConfirmedCovid19InfectionsFemale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Infections", "NonEducators", "Female");
                var txtConfirmedCovid19RecoveriesFemale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Recoveries", "NonEducators", "Female");
                var txtConfirmedCovid19DeathsFemale = FindCovid19StatisticsInput(inputControls, "ConfirmedCovid19Deaths", "NonEducators", "Female");

                var covid19Statistic = {
                    NoOfConfirmedInfectionsMale: $("#" + txtConfirmedCovid19InfectionsMale).val(),
                    NoOfConfirmedInfectionsFemale: $("#" + txtConfirmedCovid19InfectionsFemale).val(),
                    NoOfConfirmedRecoveriesMale: $("#" + txtConfirmedCovid19RecoveriesMale).val(),
                    NoOfConfirmedRecoveriesFemale: $("#" + txtConfirmedCovid19RecoveriesFemale).val(),
                    NoOfConfirmedDeathsMale: $("#" + txtConfirmedCovid19DeathsMale).val(),
                    NoOfConfirmedDeathsFemale: $("#" + txtConfirmedCovid19DeathsFemale).val(),
                    AgeGroup: txtConfirmedCovid19InfectionsMale.split("_")[1],
                    StaffType: "NonEducators",
                    SchoolID: $("#MainContent_hdfSchoolID").val()
                };

                staffCovid19Statistics.push(covid19Statistic);
            }
        });

        var params = { learnersByGradeCovid19Statistics: learnersByGradeCovid19Statistics, learnersByAgeGroupCovid19Statistics: learnersByAgeGroupCovid19Statistics, staffCovid19Statistics: staffCovid19Statistics };
		
        $.ajax({
            type: "POST",
            url: "../../Services/Service.asmx/SaveInfectionsAndMortalityInformation",
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
                    $("#divSaveInfectionsAndMortalityInformationSuccess").text("Covid-19 Statistics Saved Successfully.");
                    $("#divSaveInfectionsAndMortalityInformationSuccess").show();
					$("#divSaveInfectionsAndMortalityInformationFailure").hide();

                    setTimeout(
                        function () {
                            $("#divCurriculumDeliveryAndCompletion").show();
                            $("#divInfectionsAndMortalityInformation").hide();
                            HideLoadingSpinner();
                        }
                        , 1000);
                } else {
                    $("#divSaveInfectionsAndMortalityInformationFailure").text(errorMsg);
                    $("#divSaveInfectionsAndMortalityInformationSuccess").hide();
                    $("#divSaveInfectionsAndMortalityInformationFailure").show();
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

    function AttachInfectionsAndMortalityInformationInformationCalculateEvent(tableID) {
        var table = document.getElementById(tableID);
        var allrows = table.getElementsByTagName("tr");

        for (i = 0; i < allrows.length; i++) {
            var inputList = allrows[i].getElementsByTagName("input");
            for (var j = 0; j < inputList.length; j++) {
                var input = inputList[j];
                $(input).blur(function () {
                    CalculateInfectionsAndMortalityInformationInformationColumnTotals(this);
                });
            }
        }
    }

	function CalculateInfectionsAndMortalityInformationInformationColumnTotals(e) {
        var table = $(e).closest("tbody")[0];
        var columnIndex = $(e).closest("TD")[0].cellIndex;
        var colTotal = 0;

        var txtID = e.id;
        var txtData = txtID.split("_");
        var group = txtData[2];
		var category = txtData[3];
        var gender = txtData[4];

        var txt_Total = "#txt_Total_" + group + "_" + category + "_" + gender;
        allrows = table.getElementsByTagName("tr");

        for (i = 0; i < allrows.length; i++) {
            var row_cells = allrows[i].getElementsByTagName("input");
			var targetControl = row_cells[columnIndex - 1];
			if (targetControl) {
				var val = targetControl.value;

				if (targetControl.id.split("_")[1] != "Total") {
					colTotal = colTotal + parseInt(val);
				}
			}
        }

        $(txt_Total).val(colTotal);
	}

    function FindCovid19StatisticsInput(textboxes, fieldName, group, gender) {

        for (var i = 0; i < textboxes.length; i++) {
            var txtID = textboxes[i];
            var txtData = txtID.split("_");
            //var category = txtData[1];
            var lGroup = txtData[2];
            var statisticCategory = txtData[3];
			var lGender = txtData[4];

			//txt_PreGradeR_LearnersByGrade_ConfirmedCovid19Infections_Male
			//txt_30To34_Educators_ConfirmedCovid19Deaths_Female

            if (statisticCategory == fieldName && lGender == gender && lGroup == group) {
                return txtID;
            }
        }
    }

    function LoadInfectionsAndMortalityInformation() {
        var params = { schoolID: $("#MainContent_hdfSchoolID").val() };

        $.ajax({
            type: "POST",
            url: "../../../Services/Service.asmx/GetInfectionsAndMortalityInformationBySchoolID",
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
						var learnersByGradeCovid19Statistics = data.LearnersByGradeCovid19Statistics;
						var learnersByAgeGroupCovid19Statistics = data.LearnersByAgeGroupCovid19Statistics;
						var staffCovid19Statistics = data.StaffCovid19Statistics;

                        for (var i = 0; i < learnersByGradeCovid19Statistics.length; i++) {
                            var item = learnersByGradeCovid19Statistics[i];
							var gender = item.Gender;
							var grade = item.Grade;

                            var txtConfirmedCovid19InfectionsMale = "#txt_" + grade + "_LearnersByGrade_ConfirmedCovid19Infections_Male";
                            var txtConfirmedCovid19RecoveriesMale = "#txt_" + grade + "_LearnersByGrade_ConfirmedCovid19Recoveries_Male";
                            var txtConfirmedCovid19DeathsMale = "#txt_" + grade + "_LearnersByGrade_ConfirmedCovid19Deaths_Male";

                            var txtConfirmedCovid19InfectionsFemale = "#txt_" + grade + "_LearnersByGrade_ConfirmedCovid19Infections_Female";
                            var txtConfirmedCovid19RecoveriesFemale = "#txt_" + grade + "_LearnersByGrade_ConfirmedCovid19Recoveries_Female";
                            var txtConfirmedCovid19DeathsFemale = "#txt_" + grade + "_LearnersByGrade_ConfirmedCovid19Deaths_Female";

                            $(txtConfirmedCovid19InfectionsMale).val(item.NoOfConfirmedInfectionsMale);
                            $(txtConfirmedCovid19RecoveriesMale).val(item.NoOfConfirmedRecoveriesMale);
                            $(txtConfirmedCovid19DeathsMale).val(item.NoOfConfirmedDeathsMale);

                            $(txtConfirmedCovid19InfectionsFemale).val(item.NoOfConfirmedInfectionsFemale);
                            $(txtConfirmedCovid19RecoveriesFemale).val(item.NoOfConfirmedRecoveriesFemale);
                            $(txtConfirmedCovid19DeathsFemale).val(item.NoOfConfirmedDeathsFemale);
						};

                        for (var i = 0; i < learnersByAgeGroupCovid19Statistics.length; i++) {
                            var item = learnersByAgeGroupCovid19Statistics[i];
                            var ageGroup = item.AgeGroup;

                            var txtConfirmedCovid19InfectionsMale = "#txt_" + ageGroup + "_LearnersByAgeGroup_ConfirmedCovid19Infections_Male";
                            var txtConfirmedCovid19RecoveriesMale = "#txt_" + ageGroup + "_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Male";
                            var txtConfirmedCovid19DeathsMale = "#txt_" + ageGroup + "_LearnersByAgeGroup_ConfirmedCovid19Deaths_Male";

                            var txtConfirmedCovid19InfectionsFemale = "#txt_" + ageGroup + "_LearnersByAgeGroup_ConfirmedCovid19Infections_Female";
                            var txtConfirmedCovid19RecoveriesFemale = "#txt_" + ageGroup + "_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Female";
                            var txtConfirmedCovid19DeathsFemale = "#txt_" + ageGroup + "_LearnersByAgeGroup_ConfirmedCovid19Deaths_Female";

                            $(txtConfirmedCovid19InfectionsMale).val(item.NoOfConfirmedInfectionsMale);
                            $(txtConfirmedCovid19RecoveriesMale).val(item.NoOfConfirmedRecoveriesMale);
                            $(txtConfirmedCovid19DeathsMale).val(item.NoOfConfirmedDeathsMale);

                            $(txtConfirmedCovid19InfectionsFemale).val(item.NoOfConfirmedInfectionsFemale);
                            $(txtConfirmedCovid19RecoveriesFemale).val(item.NoOfConfirmedRecoveriesFemale);
                            $(txtConfirmedCovid19DeathsFemale).val(item.NoOfConfirmedDeathsFemale);
						};

                        for (var i = 0; i < staffCovid19Statistics.length; i++) {
                            var item = staffCovid19Statistics[i];
							var grade = item.Grade;
							var staffType = item.StaffType;
                            var ageGroup = item.AgeGroup;

                            var txtConfirmedCovid19InfectionsMale = "#txt_" + ageGroup + "_" + staffType + "_ConfirmedCovid19Infections_Male";
                            var txtConfirmedCovid19RecoveriesMale = "#txt_" + ageGroup + "_" + staffType + "_ConfirmedCovid19Recoveries_Male";
                            var txtConfirmedCovid19DeathsMale = "#txt_" + ageGroup + "_" + staffType + "_ConfirmedCovid19Deaths_Male";

                            var txtConfirmedCovid19InfectionsFemale = "#txt_" + ageGroup + "_" + staffType + "_ConfirmedCovid19Infections_Female";
                            var txtConfirmedCovid19RecoveriesFemale = "#txt_" + ageGroup + "_" + staffType + "_ConfirmedCovid19Recoveries_Female";
                            var txtConfirmedCovid19DeathsFemale = "#txt_" + ageGroup + "_" + staffType + "_ConfirmedCovid19Deaths_Female";

                            $(txtConfirmedCovid19InfectionsMale).val(item.NoOfConfirmedInfectionsMale);
                            $(txtConfirmedCovid19RecoveriesMale).val(item.NoOfConfirmedRecoveriesMale);
                            $(txtConfirmedCovid19DeathsMale).val(item.NoOfConfirmedDeathsMale);

                            $(txtConfirmedCovid19InfectionsFemale).val(item.NoOfConfirmedInfectionsFemale);
                            $(txtConfirmedCovid19RecoveriesFemale).val(item.NoOfConfirmedRecoveriesFemale);
                            $(txtConfirmedCovid19DeathsFemale).val(item.NoOfConfirmedDeathsFemale);
                        };
                    }
                } else {

                    $("#divSaveInfectionsAndMortalityInformationFailure").text(jsonData.Message);
                    $("#divSaveInfectionsAndMortalityInformationSuccess").hide();
                    $("#divSaveInfectionsAndMortalityInformationFailure").show();
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
</script>


<div class="card">
    <h5 class="card-header">7. COVID-19 INFECTIONS & MORTALITY – LEARNER & EDUCATOR </h5>
    <div class="card-body">
		<p style="color:#FF0000"><i>Compulsory for all schools</i></p> 
        <p>7.1 Learners: Kindly insert the total number of learners by grade and gender in each of the following categories</p>
        <div class="row">
            <div class="form-group col-md-12" style="overflow-x: auto;">
            	<table class="table table-bordered" id="tblLearnerCovid19Statistics">
						<thead>
							<tr>
								<th colspan="7">Covid-19 Statistics: Learners </th>
							</tr>
							<tr>
							  <th scope="col">Grade</th>
							  <th scope="col" colspan="2">Confirmed Covid-19 Infections</th>
							  <th scope="col" colspan="2">Covid-19 Recoveries</th>
							  <th scope="col" colspan="2">Confirmed Covid-19 Deaths</th>
							</tr>
						</thead>
							<tbody id="tblLearnerByGradeCovid19StatisticsBody">
								<tr>
									<th scope="row">Grades</th> 
									<th scope="row">Male</th> 
									<th scope="row">Female</th> 
									<th scope="row">Male</th> 
									<th scope="row">Female</th> 
									<th scope="row">Male</th> 
									<th scope="row">Female</th> 
								</tr>
							  
							    <tr>
									<th scope="row">Pre-Grade R</th>
									<td><input type="number" value="0"  min="0" id="txt_PreGradeR_LearnersByGrade_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_PreGradeR_LearnersByGrade_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_PreGradeR_LearnersByGrade_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_PreGradeR_LearnersByGrade_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_PreGradeR_LearnersByGrade_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_PreGradeR_LearnersByGrade_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">Grade R</th>
									<td><input type="number" value="0"  min="0" id="txt_GradeR_LearnersByGrade_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_GradeR_LearnersByGrade_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_GradeR_LearnersByGrade_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_GradeR_LearnersByGrade_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_GradeR_LearnersByGrade_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_GradeR_LearnersByGrade_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">Grade 1</th>
									<td><input type="number" value="0"  min="0" id="txt_Grade1_LearnersByGrade_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade1_LearnersByGrade_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade1_LearnersByGrade_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade1_LearnersByGrade_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade1_LearnersByGrade_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade1_LearnersByGrade_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">Grade 2</th>
									<td><input type="number" value="0"  min="0" id="txt_Grade2_LearnersByGrade_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade2_LearnersByGrade_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade2_LearnersByGrade_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade2_LearnersByGrade_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade2_LearnersByGrade_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade2_LearnersByGrade_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">Grade 3</th>
									<td><input type="number" value="0"  min="0" id="txt_Grade3_LearnersByGrade_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade3_LearnersByGrade_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade3_LearnersByGrade_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade3_LearnersByGrade_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade3_LearnersByGrade_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade3_LearnersByGrade_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">Grade 4</th>
									<td><input type="number" value="0"  min="0" id="txt_Grade4_LearnersByGrade_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade4_LearnersByGrade_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade4_LearnersByGrade_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade4_LearnersByGrade_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade4_LearnersByGrade_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade4_LearnersByGrade_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">Grade 5</th>
									<td><input type="number" value="0"  min="0" id="txt_Grade5_LearnersByGrade_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade5_LearnersByGrade_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade5_LearnersByGrade_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade5_LearnersByGrade_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade5_LearnersByGrade_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade5_LearnersByGrade_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">Grade 6</th>
									<td><input type="number" value="0"  min="0" id="txt_Grade6_LearnersByGrade_ConfirmedCovid19Infections_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade6_LearnersByGrade_ConfirmedCovid19Infections_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade6_LearnersByGrade_ConfirmedCovid19Recoveries_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade6_LearnersByGrade_ConfirmedCovid19Recoveries_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade6_LearnersByGrade_ConfirmedCovid19Deaths_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade6_LearnersByGrade_ConfirmedCovid19Deaths_Female"  class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">Grade 7</th>
									<td><input type="number" value="0"  min="0" id="txt_Grade7_LearnersByGrade_ConfirmedCovid19Infections_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade7_LearnersByGrade_ConfirmedCovid19Infections_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade7_LearnersByGrade_ConfirmedCovid19Recoveries_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade7_LearnersByGrade_ConfirmedCovid19Recoveries_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade7_LearnersByGrade_ConfirmedCovid19Deaths_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade7_LearnersByGrade_ConfirmedCovid19Deaths_Female"  class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">Grade 8</th>
									<td><input type="number" value="0"  min="0" id="txt_Grade8_LearnersByGrade_ConfirmedCovid19Infections_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade8_LearnersByGrade_ConfirmedCovid19Infections_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade8_LearnersByGrade_ConfirmedCovid19Recoveries_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade8_LearnersByGrade_ConfirmedCovid19Recoveries_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade8_LearnersByGrade_ConfirmedCovid19Deaths_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade8_LearnersByGrade_ConfirmedCovid19Deaths_Female"  class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">Grade 9</th>
									<td><input type="number" value="0"  min="0" id="txt_Grade9_LearnersByGrade_ConfirmedCovid19Infections_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade9_LearnersByGrade_ConfirmedCovid19Infections_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade9_LearnersByGrade_ConfirmedCovid19Recoveries_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade9_LearnersByGrade_ConfirmedCovid19Recoveries_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade9_LearnersByGrade_ConfirmedCovid19Deaths_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade9_LearnersByGrade_ConfirmedCovid19Deaths_Female"  class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">Grade 10</th>
									<td><input type="number" value="0"  min="0" id="txt_Grade10_LearnersByGrade_ConfirmedCovid19Infections_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade10_LearnersByGrade_ConfirmedCovid19Infections_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade10_LearnersByGrade_ConfirmedCovid19Recoveries_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade10_LearnersByGrade_ConfirmedCovid19Recoveries_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade10_LearnersByGrade_ConfirmedCovid19Deaths_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade10_LearnersByGrade_ConfirmedCovid19Deaths_Female"  class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">Grade 11</th>
									<td><input type="number" value="0"  min="0" id="txt_Grade11_LearnersByGrade_ConfirmedCovid19Infections_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade11_LearnersByGrade_ConfirmedCovid19Infections_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade11_LearnersByGrade_ConfirmedCovid19Recoveries_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade11_LearnersByGrade_ConfirmedCovid19Recoveries_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade11_LearnersByGrade_ConfirmedCovid19Deaths_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade11_LearnersByGrade_ConfirmedCovid19Deaths_Female"  class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">Grade 12</th>
									<td><input type="number" value="0"  min="0" id="txt_Grade12_LearnersByGrade_ConfirmedCovid19Infections_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade12_LearnersByGrade_ConfirmedCovid19Infections_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade12_LearnersByGrade_ConfirmedCovid19Recoveries_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade12_LearnersByGrade_ConfirmedCovid19Recoveries_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade12_LearnersByGrade_ConfirmedCovid19Deaths_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Grade12_LearnersByGrade_ConfirmedCovid19Deaths_Female"  class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">Other</th>
									<td><input type="number" value="0"  min="0" id="txt_Other_LearnersByGrade_ConfirmedCovid19Infections_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Other_LearnersByGrade_ConfirmedCovid19Infections_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Other_LearnersByGrade_ConfirmedCovid19Recoveries_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Other_LearnersByGrade_ConfirmedCovid19Recoveries_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Other_LearnersByGrade_ConfirmedCovid19Deaths_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Other_LearnersByGrade_ConfirmedCovid19Deaths_Female"  class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">Total</th>
									<td><input type="number" value="0"  min="0" id="txt_Total_LearnersByGrade_ConfirmedCovid19Infections_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_LearnersByGrade_ConfirmedCovid19Infections_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_LearnersByGrade_ConfirmedCovid19Recoveries_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_LearnersByGrade_ConfirmedCovid19Recoveries_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_LearnersByGrade_ConfirmedCovid19Deaths_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_LearnersByGrade_ConfirmedCovid19Deaths_Female"  class="form-control" /></td>
							    </tr>

							</tbody>
						</table>
            </div>
        </div>

		 <div class="row">
				<div class="form-group col-md-12">
					   <p>7.2 Learners: Kindly insert the total number of learners by age and gender in each of the following categories</p>
					<table class="table table-bordered" id="tblLearnersByAgeGroupCovid19Statistics">
						<thead>
							<tr>
								<th colspan="7">Covid-19 statistics: Learners</th>
							</tr>
							<tr>
							  <th scope="col"></th>
							  <th scope="col" colspan="2">Confirmed Covid-19 Infections</th>
							  <th scope="col" colspan="2">Covid-19 Recoveries</th>
							  <th scope="col" colspan="2">Confirmed Covid-19 Deaths</th>
							</tr>
						</thead>
							<tbody id="tblLearnersByAgeGroupCovid19StatisticsBody">
								<tr>								

									<th scope="row">Age in Years</th> 
									<th scope="row">Male</th> 
									<th scope="row">Female</th> 
									<th scope="row">Male</th> 
									<th scope="row">Female</th> 
									<th scope="row">Male</th> 
									<th scope="row">Female</th> 
								</tr>
							  
							    <tr>
									<th scope="row">Under 7</th>
									<td><input type="number" value="0"  min="0" id="txt_Under7_LearnersByAgeGroup_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Under7_LearnersByAgeGroup_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Under7_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Under7_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Under7_LearnersByAgeGroup_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Under7_LearnersByAgeGroup_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">8</th>
									<td><input type="number" value="0"  min="0" id="txt_8_LearnersByAgeGroup_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_8_LearnersByAgeGroup_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_8_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_8_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_8_LearnersByAgeGroup_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_8_LearnersByAgeGroup_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">9</th>
									<td><input type="number" value="0"  min="0" id="txt_9_LearnersByAgeGroup_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_9_LearnersByAgeGroup_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_9_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_9_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_9_LearnersByAgeGroup_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_9_LearnersByAgeGroup_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">10</th>
									<td><input type="number" value="0"  min="0" id="txt_10_LearnersByAgeGroup_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_10_LearnersByAgeGroup_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_10_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_10_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_10_LearnersByAgeGroup_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_10_LearnersByAgeGroup_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">11</th>
									<td><input type="number" value="0"  min="0" id="txt_11_LearnersByAgeGroup_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_11_LearnersByAgeGroup_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_11_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_11_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_11_LearnersByAgeGroup_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_11_LearnersByAgeGroup_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">12</th>
									<td><input type="number" value="0"  min="0" id="txt_12_LearnersByAgeGroup_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_12_LearnersByAgeGroup_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_12_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_12_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_12_LearnersByAgeGroup_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_12_LearnersByAgeGroup_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">13</th>
									<td><input type="number" value="0"  min="0" id="txt_13_LearnersByAgeGroup_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_13_LearnersByAgeGroup_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_13_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_13_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_13_LearnersByAgeGroup_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_13_LearnersByAgeGroup_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">14</th>
									<td><input type="number" value="0"  min="0" id="txt_14_LearnersByAgeGroup_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_14_LearnersByAgeGroup_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_14_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_14_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_14_LearnersByAgeGroup_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_14_LearnersByAgeGroup_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">15</th>
									<td><input type="number" value="0"  min="0" id="txt_15_LearnersByAgeGroup_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_15_LearnersByAgeGroup_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_15_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_15_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_15_LearnersByAgeGroup_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_15_LearnersByAgeGroup_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">16</th>
									<td><input type="number" value="0"  min="0" id="txt_16_LearnersByAgeGroup_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_16_LearnersByAgeGroup_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_16_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_16_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_16_LearnersByAgeGroup_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_16_LearnersByAgeGroup_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">17</th>
									<td><input type="number" value="0"  min="0" id="txt_17_LearnersByAgeGroup_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_17_LearnersByAgeGroup_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_17_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_17_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_17_LearnersByAgeGroup_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_17_LearnersByAgeGroup_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">18</th>
									<td><input type="number" value="0"  min="0" id="txt_18_LearnersByAgeGroup_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_18_LearnersByAgeGroup_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_18_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_18_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_18_LearnersByAgeGroup_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_18_LearnersByAgeGroup_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">Above 18</th>
									<td><input type="number" value="0"  min="0" id="txt_Above18_LearnersByAgeGroup_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Above18_LearnersByAgeGroup_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Above18_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Above18_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Above18_LearnersByAgeGroup_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Above18_LearnersByAgeGroup_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								<tr>
									<th scope="row">Total</th>
									<td><input type="number" value="0"  min="0" id="txt_Total_LearnersByAgeGroup_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_LearnersByAgeGroup_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_LearnersByAgeGroup_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_LearnersByAgeGroup_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_LearnersByAgeGroup_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
							</tbody>
						</table>
					</div>
				</div> 

		 <div class="row">
				<div class="form-group col-md-12">
					<p>7.3 Educators: Kindly insert the total number of educators by age-band and gender in each of the following categories</p>
					<table class="table table-bordered" id="tblEducatorsCovid19Statistics">
						<thead>
							<tr>
								<th colspan="7">Covid-19 statistics: Educators </th>
							</tr>
							<tr>
							  <th scope="col"></th>
							  <th scope="col" colspan="2">Confirmed Covid-19 Infections</th>
							  <th scope="col" colspan="2">Covid-19 Recoveries</th>
							  <th scope="col" colspan="2">Confirmed Covid-19 Deaths</th>
							</tr>
						</thead>
							<tbody id="tblEducatorsCovid19StatisticsBody">
								<tr>								

									<th scope="row">Age in Years</th> 
									<th scope="row">Male</th> 
									<th scope="row">Female</th> 
									<th scope="row">Male</th> 
									<th scope="row">Female</th> 
									<th scope="row">Male</th> 
									<th scope="row">Female</th> 
								</tr>
							  
							    <tr>
									<th scope="row">20 – 24</th>
									<td><input type="number" value="0"  min="0" id="txt_20To24_Educators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_20To24_Educators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_20To24_Educators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_20To24_Educators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_20To24_Educators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_20To24_Educators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>

							    <tr>
									<th scope="row">25 – 29</th>
									<td><input type="number" value="0"  min="0" id="txt_25To29_Educators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_25To29_Educators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_25To29_Educators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_25To29_Educators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_25To29_Educators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_25To29_Educators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>

								<tr>
									<th scope="row">30 – 34</th>
									<td><input type="number" value="0"  min="0" id="txt_30To34_Educators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_30To34_Educators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_30To34_Educators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_30To34_Educators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_30To34_Educators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_30To34_Educators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>

								<tr>
									<th scope="row">35 – 39</th>
									<td><input type="number" value="0"  min="0" id="txt_35To39_Educators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_35To39_Educators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_35To39_Educators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_35To39_Educators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_35To39_Educators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_35To39_Educators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>

								<tr>
									<th scope="row">40 – 44</th>
									<td><input type="number" value="0"  min="0" id="txt_40To44_Educators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_40To44_Educators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_40To44_Educators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_40To44_Educators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_40To44_Educators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_40To44_Educators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>

								<tr>
									<th scope="row">45 – 49</th>
									<td><input type="number" value="0"  min="0" id="txt_45To49_Educators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_45To49_Educators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_45To49_Educators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_45To49_Educators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_45To49_Educators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_45To49_Educators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>

								<tr>
									<th scope="row">50 – 54</th>
									<td><input type="number" value="0"  min="0" id="txt_50To54_Educators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_50To54_Educators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_50To54_Educators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_50To54_Educators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_50To54_Educators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_50To54_Educators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>

								<tr>
									<th scope="row">55 - 60</th>
									<td><input type="number" value="0"  min="0" id="txt_55To60_Educators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_55To60_Educators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_55To60_Educators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_55To60_Educators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_55To60_Educators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_55To60_Educators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>

								<tr>
									<th scope="row">60+</th>
									<td><input type="number" value="0"  min="0" id="txt_Above60_Educators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Above60_Educators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Above60_Educators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Above60_Educators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Above60_Educators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Above60_Educators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								
								<tr>
									<th scope="row">Total</th>
									<td><input type="number" value="0"  min="0" id="txt_Total_Educators_ConfirmedCovid19Infections_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_Educators_ConfirmedCovid19Infections_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_Educators_ConfirmedCovid19Recoveries_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_Educators_ConfirmedCovid19Recoveries_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_Educators_ConfirmedCovid19Deaths_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_Educators_ConfirmedCovid19Deaths_Female"  class="form-control" /></td>
							    </tr>

							</tbody>
						</table>
					</div>
				</div>

			 <div class="row">
				<div class="form-group col-md-12">
					<p>7.4 Non-Teaching Staff: Kindly insert the total number of non-teaching staff by age-band and gender in each of the following categories</p>
					<table class="table table-bordered" id="tblNonEducatorsCovid19Statistics">
						<thead>
							<tr>
								<th colspan="7">Covid-19 statistics: Non-Teaching Staff </th>
							</tr>
							<tr>
							  <th scope="col"></th>
							  <th scope="col" colspan="2">Confirmed Covid-19 Infections</th>
							  <th scope="col" colspan="2">Covid-19 Recoveries</th>
							  <th scope="col" colspan="2">Confirmed Covid-19 Deaths</th>
							</tr>
						</thead>
							<tbody id="tblNonEducatorsCovid19StatisticsBody">
								<tr>								

									<th scope="row">Age in Years</th> 
									<th scope="row">Male</th> 
									<th scope="row">Female</th> 
									<th scope="row">Male</th> 
									<th scope="row">Female</th> 
									<th scope="row">Male</th> 
									<th scope="row">Female</th> 
								</tr>
							  
							    <tr>
									<th scope="row">20 – 24</th>
									<td><input type="number" value="0"  min="0" id="txt_20To24_NonEducators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_20To24_NonEducators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_20To24_NonEducators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_20To24_NonEducators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_20To24_NonEducators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_20To24_NonEducators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>

							    <tr>
									<th scope="row">25 – 29</th>
									<td><input type="number" value="0"  min="0" id="txt_25To29_NonEducators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_25To29_NonEducators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_25To29_NonEducators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_25To29_NonEducators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_25To29_NonEducators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_25To29_NonEducators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>

								<tr>
									<th scope="row">30 – 34</th>
									<td><input type="number" value="0"  min="0" id="txt_30To34_NonEducators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_30To34_NonEducators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_30To34_NonEducators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_30To34_NonEducators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_30To34_NonEducators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_30To34_NonEducators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>

								<tr>
									<th scope="row">35 – 39</th>
									<td><input type="number" value="0"  min="0" id="txt_35To39_NonEducators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_35To39_NonEducators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_35To39_NonEducators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_35To39_NonEducators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_35To39_NonEducators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_35To39_NonEducators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>

								<tr>
									<th scope="row">40 – 44</th>
									<td><input type="number" value="0"  min="0" id="txt_40To44_NonEducators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_40To44_NonEducators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_40To44_NonEducators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_40To44_NonEducators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_40To44_NonEducators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_40To44_NonEducators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>

								<tr>
									<th scope="row">45 – 49</th>
									<td><input type="number" value="0"  min="0" id="txt_45To49_NonEducators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_45To49_NonEducators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_45To49_NonEducators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_45To49_NonEducators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_45To49_NonEducators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_45To49_NonEducators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>

								<tr>
									<th scope="row">50 – 54</th>
									<td><input type="number" value="0"  min="0" id="txt_50To54_NonEducators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_50To54_NonEducators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_50To54_NonEducators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_50To54_NonEducators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_50To54_NonEducators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_50To54_NonEducators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>

								<tr>
									<th scope="row">55 - 60</th>
									<td><input type="number" value="0"  min="0" id="txt_55To60_NonEducators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_55To60_NonEducators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_55To60_NonEducators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_55To60_NonEducators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_55To60_NonEducators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_55To60_NonEducators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>

								<tr>
									<th scope="row">60+</th>
									<td><input type="number" value="0"  min="0" id="txt_Above60_NonEducators_ConfirmedCovid19Infections_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Above60_NonEducators_ConfirmedCovid19Infections_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Above60_NonEducators_ConfirmedCovid19Recoveries_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Above60_NonEducators_ConfirmedCovid19Recoveries_Female" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Above60_NonEducators_ConfirmedCovid19Deaths_Male" class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Above60_NonEducators_ConfirmedCovid19Deaths_Female" class="form-control" /></td>
							    </tr>
								
								<tr>
									<th scope="row">Total</th>
									<td><input type="number" value="0"  min="0" id="txt_Total_NonEducators_ConfirmedCovid19Infections_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_NonEducators_ConfirmedCovid19Infections_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_NonEducators_ConfirmedCovid19Recoveries_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_NonEducators_ConfirmedCovid19Recoveries_Female"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_NonEducators_ConfirmedCovid19Deaths_Male"  class="form-control" /></td>
									<td><input type="number" value="0"  min="0" id="txt_Total_NonEducators_ConfirmedCovid19Deaths_Female"  class="form-control" /></td>
							    </tr>

							</tbody>
						</table>
					</div>
				</div>

        <div class="form-row">
            <div class="form-group col-12" style="text-align: right;">
                <div class="alert alert-success" role="alert" id="divSaveInfectionsAndMortalityInformationSuccess" style="display: none;"></div>
                <div class="alert alert-danger" role="alert" id="divSaveInfectionsAndMortalityInformationFailure" style="display: none;"></div>
                <ul class="inline">
                    <li>
                        <input onclick="GoToHostelBoardersInformation(); return false;" type="button" class="btn btn-primary btn-sm" value="Previous" /></li>
                    <li>
                        <input onclick="SaveInfectionsAndMortalityInformation(); return false;" type="button" class="btn btn-primary btn-sm" value="Save & Continue" /></li>
                </ul>
            </div>
        </div>
    </div>
</div>

