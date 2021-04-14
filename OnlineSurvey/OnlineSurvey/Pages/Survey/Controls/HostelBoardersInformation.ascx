<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HostelBoardersInformation.ascx.cs" Inherits="OnlineSurvey.Pages.Survey.Controls.HostelBoardersInformation" %>

<script type="text/javascript">

    $(document).ready(function () {
        LoadHostelBoardersInformation();
    });

	function GoToFinanceInformation() {
        $("#divFinanceInformation").show();
        $("#divHostelBoardersInformation").hide();
	}

	function SaveHostelBoardersInformation() {
        var hostelBoarderInformation = {
            NoOfLearnersAdmittedToTheHostelInJanuary2020Male: $("#txt_NoOfLearnersAdmittedToTheHostelInJanuary2020Male").val(),
            NoOfLearnersAdmittedToTheHostelInJanuary2020Female: $("#txt_NoOfLearnersAdmittedToTheHostelInJanuary2020Female").val(),
            DidTheSchoolApplyTheRelevantPhysicalDistancingMealTime: $("#chk_DidTheSchoolApplyTheRelevantPhysicalDistancingMealTime").prop("checked"),
            DidTheSchoolApplyTheRelevantPhysicalDistancingStudyTime: $("#chk_DidTheSchoolApplyTheRelevantPhysicalDistancingStudyTime").prop("checked"),
            DidTheSchoolApplyTheRelevantPhysicalDistancingLeisureTime: $("#chk_DidTheSchoolApplyTheRelevantPhysicalDistancingLeisureTime").prop("checked"),
            DidTheSchoolIncreaseTheFrequencyOfCleaningAtTheHostel: $("#chk_DidTheSchoolIncreaseTheFrequencyOfCleaningAtTheHostel").prop("checked"),
            WereTheLearnersProvidedWithAdequatePPEs: $("#chk_WereTheLearnersProvidedWithAdequatePPEs").prop("checked"),
            WereTheLearnersProvidedWithAdequateHandSanitiser: $("#chk_WereTheLearnersProvidedWithAdequateHandSanitiser").prop("checked"),
            SchoolID: $("#MainContent_hdfSchoolID").val(),
		};

        var params = {
            hostelBoarderInformation: hostelBoarderInformation
        };

        $.ajax({
            type: "POST",
            url: "../../Services/Service.asmx/SaveHostelBoardersInformation",
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
                    $("#divSaveClassInformationSuccess").text("Hostel Boarders Information Saved Successfully.");
                    $("#divSaveFinanceInformationSuccess").show();
                    $("#divSaveFinanceInformationFailure").hide();

                    setTimeout(
                        function () {
                            $("#divHostelBoardersInformation").hide();
                            $("#divInfectionsAndMortalityInformation").show();
                            HideLoadingSpinner();
                        }
                        , 1000);
                } else {
                    $("#divSaveHostelBoardersInformationFailure").text(errorMsg);
                    $("#divSaveHostelBoardersInformationSuccess").hide();
                    $("#divSaveHostelBoardersInformationFailure").show();
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

    function LoadHostelBoardersInformation() {
        var params = { schoolID: $("#MainContent_hdfSchoolID").val() };

        $.ajax({
            type: "POST",
            url: "../../../Services/Service.asmx/GetHostelBoardersInformationBySchoolID",
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
                        $("#txt_NoOfLearnersAdmittedToTheHostelInJanuary2020Male").val(data.NoOfLearnersAdmittedToTheHostelInJanuary2020Male);
                        $("#txt_NoOfLearnersAdmittedToTheHostelInJanuary2020Female").val(data.NoOfLearnersAdmittedToTheHostelInJanuary2020Female);
                        $("#chk_DidTheSchoolApplyTheRelevantPhysicalDistancingMealTime").prop("checked", data.DidTheSchoolApplyTheRelevantPhysicalDistancingMealTime);
                        $("#chk_DidTheSchoolApplyTheRelevantPhysicalDistancingStudyTime").prop("checked", data.DidTheSchoolApplyTheRelevantPhysicalDistancingStudyTime);
                        $("#chk_DidTheSchoolApplyTheRelevantPhysicalDistancingLeisureTime").prop("checked", data.DidTheSchoolApplyTheRelevantPhysicalDistancingLeisureTime);
                        $("#chk_DidTheSchoolIncreaseTheFrequencyOfCleaningAtTheHostel").prop("checked", data.DidTheSchoolIncreaseTheFrequencyOfCleaningAtTheHostel);
                        $("#chk_WereTheLearnersProvidedWithAdequatePPEs").prop("checked", data.WereTheLearnersProvidedWithAdequatePPEs);
                        $("#chk_WereTheLearnersProvidedWithAdequateHandSanitiser").prop("checked", data.WereTheLearnersProvidedWithAdequateHandSanitiser);
                    }
                } else {

                    $("#divSaveHostelBoardersInformationFailure").text(jsonData.Message);
                    $("#divSaveHostelBoardersInformationSuccess").hide();
                    $("#divSaveHostelBoardersInformationFailure").show();
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
	<h5 class="card-header">6. HOSTEL BOARDERS </h5>
	<div class="card-body">
        <p style="color:#FF0000"><i>Compulsory for all Public schools with hostels. </i></p> 
        <p>6.1 Kindly insert the number of hostel learners by gender in the table below. </p>
		<div class="row">
			<div class="form-group col-md-12" style="overflow-x:auto;">
				<table class="table table-bordered">
					 <thead>
						 <tr>
							 <th scope="col">Boarders</th>
							 <th scope="col">Male</th>
							 <th scope="col">Female</th>
						 </tr>
					 </thead>
					  <tbody>
							<tr>
								<th scope="row">The Number of learners admitted to the hostel in January 2020. </th> 
								<td><input type="number" value="0" min="0" id="txt_NoOfLearnersAdmittedToTheHostelInJanuary2020Male"  class="form-control" /></td>
            				    <td><input type="number" value="0" min="0" id="txt_NoOfLearnersAdmittedToTheHostelInJanuary2020Female"  class="form-control" /></td>
							</tr>
					</tbody>
				</table>
		    </div>
		</div>

		<div class="row">
			<div class="form-group col-md-12" style="overflow-x:auto;">
				<table class="table table-bordered">
					 <thead>
						 <tr><th scope="col" colspan="3">Hostels</th></tr>
					 </thead>
					  <tbody>
							<tr>
								<th scope="row" colspan="3">6.2 Did the school apply the relevant physical Distancing provisions during Lockdown?  </th> 
							</tr>
							<tr>
							   <th  scope="row" style="padding-left: 35px;" colspan="2">Meal time <i style="color:#FF0000">Tick if YES</i></th>
            				  <td><input type="checkbox" id="chk_DidTheSchoolApplyTheRelevantPhysicalDistancingMealTime" /></td>
						    </tr>
						    <tr>
							   <th  scope="row" style="padding-left: 35px;" colspan="2">Study time <i style="color:#FF0000">Tick if YES</i></th>
            				  <td><input type="checkbox" id="chk_DidTheSchoolApplyTheRelevantPhysicalDistancingStudyTime" /></td>
						    </tr>
						    <tr>
							   <th  scope="row" style="padding-left: 35px;" colspan="2">Leisure Time <i style="color:#FF0000">Tick if YES</i></th>
            				  <td><input type="checkbox" id="chk_DidTheSchoolApplyTheRelevantPhysicalDistancingLeisureTime" /></td>
						    </tr>
						    <tr>
							   <th  scope="row" colspan="2">6.3 Did the school increase the frequency of cleaning at the hostel? <i style="color:#FF0000">Tick if YES</i> </th>
            				  <td><input type="checkbox" id="chk_DidTheSchoolIncreaseTheFrequencyOfCleaningAtTheHostel" /></td>
						    </tr>


						   <tr>
								<th scope="row" colspan="3">6.3 Were the learners provided with adequate?  </th> 
							</tr>
							<tr>
							   <th  scope="row" style="padding-left: 35px;" colspan="2">Hand Sanitiser <i style="color:#FF0000">Tick if YES</i></th>
            				  <td><input type="checkbox" id="chk_WereTheLearnersProvidedWithAdequateHandSanitiser" /></td>
						    </tr>
						    <tr>
							   <th  scope="row" style="padding-left: 35px;" colspan="2">PPEs <i style="color:#FF0000">Tick if YES</i></th>
            				  <td><input type="checkbox" id="chk_WereTheLearnersProvidedWithAdequatePPEs" /></td>
						    </tr>
					</tbody>
				</table>

		    </div>
		</div>

		<div class="form-row">
			<div class="form-group col-12" style="text-align:right;">
				<div class="alert alert-success" role="alert" id="divSaveHostelBoardersInformationSuccess" style="display:none;"></div>
				<div class="alert alert-danger" role="alert" id="divSaveHostelBoardersInformationFailure"  style="display:none;"></div>
				  <ul class="inline">
				    <li><input onclick="GoToFinanceInformation(); return false;" type="button" class="btn btn-primary btn-sm" value="Previous" /></li>
				    <li><input onclick="SaveHostelBoardersInformation(); return false;" type="button" class="btn btn-primary btn-sm" value="Save & Continue" /></li>
				  </ul>
				</div>
			</div>
		</div>
</div>