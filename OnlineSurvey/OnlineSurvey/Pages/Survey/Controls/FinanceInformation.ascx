<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FinanceInformation.ascx.cs" Inherits="OnlineSurvey.Pages.Survey.Controls.FinanceInformation" %>

<script type="text/javascript">

	$(document).ready(function () {
        InitializeMultiSelect("ddl_RevenueShortfallManagementInitiatives");
		InitializeMultiSelect("ddl_SchoolDealingWithSchoolFeeDefaulters");
		LoadFinanceInformation();
		OnSchoolTypeChange();
    })

	function GoToClassInformation(){
        $("#divFinanceInformation").hide();
        $("#divClassInformation").show();
	}

    function SaveFinanceInformation() {
        if ($("#ddl_SchoolTypes").val() == "31") {
            var finance = {
                SchoolTypeID: $("#ddl_SchoolTypes").val(),
                IsTheSchoolProjectingShortfallInRevenue: $("#chk_IsTheSchoolProjectingShortfallInRevenue").prop("checked"),
                NoOfLearnersApprovedForSchoolFeeExemptionsConditional2019: $("#txt_NoOfLearnersApprovedForSchoolFeeExemptionsConditional_2019").val(),
                NoOfLearnersApprovedForSchoolFeeExemptionsConditional2020: $("#txt_NoOfLearnersApprovedForSchoolFeeExemptionsConditional_2020").val(),
                NoOfLearnersApprovedForSchoolFeeExemptionsPartial2019: $("#txt_NoOfLearnersApprovedForSchoolFeeExemptionsPartial_2019").val(),
                NoOfLearnersApprovedForSchoolFeeExemptionsPartial2020: $("#txt_NoOfLearnersApprovedForSchoolFeeExemptionsPartial_2020").val(),
                NoOfLearnersApprovedForSchoolFeeExemptionsTotal2019: $("#txt_NoOfLearnersApprovedForSchoolFeeExemptionsTotal_2019").val(),
                NoOfLearnersApprovedForSchoolFeeExemptionsTotal2020: $("#txt_NoOfLearnersApprovedForSchoolFeeExemptionsTotal_2020").val(),
                NoOfLearnersApprovedPostLockdownConditional: $("#txt_NoOfLearnersApprovedPostLockdownConditional").val(),
                NoOfLearnersApprovedPostLockdownPartial: $("#txt_NoOfLearnersApprovedPostLockdownPartial").val(),
                NoOfLearnersApprovedPostLockdownTotal: $("#txt_NoOfLearnersApprovedPostLockdownTotal").val(),
                NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2019: $("#txt_NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2019").val(),
                NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2020: $("#txt_NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2020").val(),
                HowDidTheReducedRevenueCollectionImpactOnOperations: $("#txt_HowDidTheReducedRevenueCollectionImpactOnOperations").val(),
                DidYouContinueWithSection38APaymentsToStaff: $("#chk_DidYouContinueWithSection38APaymentsToStaff").prop("checked"),
                HowDidTheSchoolManagePayments: $("#txt_HowDidTheSchoolManagePayments").val(),

                CanTheSchoolConfirmThatLTSMHasBeenProcuredFor2021: $("#chk_CanTheSchoolConfirmThatLTSMHasBeenProcuredFor2021").prop("checked"),
                CanTheSchoolConfirmThatItHasBeenAbleToPayTheirMunicipalAccounts: $("#chk_CanTheSchoolConfirmThatItHasBeenAbleToPayTheirMunicipalAccounts").prop("checked"),
                CanTheSchoolConfirmThatItHasBeenAbleToUndertakeMinorRepairsUsingTheMaintenanceBudget: $("#chk_CanTheSchoolConfirmThatItHasBeenAbleToUndertakeMinorRepairsUsingTheMaintenanceBudget").prop("checked"),
                CanTheSchoolConfirmThatTheyHavePaidAllTheirSGBAppointedStaff: $("#chk_CanTheSchoolConfirmThatTheyHavePaidAllTheirSGBAppointedStaff").prop("checked"),
                DidTheSchoolRelieveSGBAppointedTeachingStaffOfTheirDuties: $("#chk_DidTheSchoolRelieveSGBAppointedTeachingStaffOfTheirDuties").prop("checked"),
                NoOfSGBAppointedTeachingStaffWereAffected: $("#txt_NoOfSGBAppointedTeachingStaffWereAffected").val(),
                WasTheReprioritisedBudgetApprovedAtAnAGM: $("#chk_WasTheReprioritisedBudgetApprovedAtAnAGM").prop("checked"),
                DidTheInitiativesPursuedAssistTheSchoolInRealisingTheBudgetRevenueShortfall: $("#chk_DidTheInitiativesPursuedAssistTheSchoolInRealisingTheBudgetRevenueShortfall").prop("checked"),
                IsThisSchoolSubsidisedByTheState: $("#chk_IsThisSchoolSubsidisedByTheState").prop("checked"),
                WhatAreTheMainSourcesOfRevenueForTheSchool: $("#txt_WhatAreTheMainSourcesOfRevenueForTheSchool").val(),
                IsTheSchoolProjectingShortfallInRevenueCollectionFor2020: $("#chk_IsTheSchoolProjectingShortfallInRevenueCollectionFor2020").prop("checked"),
                HaveYouPurchasedAdditionalLearnerAndEducatorSupportMaterial: $("#chk_HaveYouPurchasedAdditionalLearnerAndEducatorSupportMaterial").prop("checked"),
                DoesTheSchoolHaveSufficientTextbooksForAllTheLearners: $("#chk_DoesTheSchoolHaveSufficientTextbooksForAllTheLearners").prop("checked"),
                WasTheSchoolAbleToPayTheirMunicipalAccounts: $("#chk_WasTheSchoolAbleToPayTheirMunicipalAccounts").prop("checked"),
                WasTheSchoolAbleToPurchasePPEsAndCovid19RelatedSupplies: $("#chk_WasTheSchoolAbleToPurchasePPEsAndCovid19RelatedSupplies").prop("checked"),
                DidTheSchoolRelieveTeachingStaffOfTheirDutiesToBalanceTheBudget: $("#chk_DidTheSchoolRelieveTeachingStaffOfTheirDutiesToBalanceTheBudget").prop("checked"),
                HowManyTeachingStaffWereRelievedOfTheirDutiesToBalanceTheBudget: $("#txt_HowManyTeachingStaffWereRelievedOfTheirDutiesToBalanceTheBudget").val(),
                SchoolID: $("#MainContent_hdfSchoolID").val(),
                RevenueShortfallManagementInitiatives: $("#ddl_RevenueShortfallManagementInitiatives").val(),
                SchoolDealingWithSchoolFeeDefaulters: $("#ddl_SchoolDealingWithSchoolFeeDefaulters").val()
            };

            var params = {
                financeInformtion: finance
            };

            $.ajax({
                type: "POST",
                url: "../../Services/Service.asmx/SaveFinanceInformation",
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
                        $("#divSaveClassInformationSuccess").text("Finance Information Saved Successfully.");
                        $("#divSaveFinanceInformationSuccess").show();
                        $("#divSaveFinanceInformationFailure").hide();

                        setTimeout(
                            function () {
                                $("#divFinanceInformation").hide();
                                $("#divHostelBoardersInformation").show();
                                HideLoadingSpinner();
                            }
                            , 1000);
                    } else {
                        $("#divSaveFinanceInformationFailure").text(errorMsg);
                        $("#divSaveFinanceInformationSuccess").hide();
                        $("#divSaveFinanceInformationFailure").show();
                    }
                },
                complete: function () {
                    HideLoadingSpinner();
                },
                failure: function (jqXHR, textStatus, errorThrown) {
                    alert("HTTP Status: " + jqXHR.status + "; Error Text: " + jqXHR.responseText); // Display error message  
                }
            });
        } else {
            setTimeout(
                function () {
                    $("#divFinanceInformation").hide();
                    $("#divHostelBoardersInformation").show();
                    HideLoadingSpinner();
                }
                , 1000);
        }
	}

	function OnSchoolTypeChange() {
        if ($("#ddl_SchoolTypes").val() == "31") {
            var fundingType = $('#MainContent_GeneralSchoolInformation_lblRelationWithState').text();
            if (fundingType.toUpperCase() == "INDEPENDENT NON SUBSIDISED" || fundingType.toUpperCase() == "INDEPENDENT SUBSIDISED") {
                $("#tblIndependentSchools").show();
            } else if (fundingType.toUpperCase() == "PUBLIC") {
                $("#tblPublicSchools").show();
            }
		} else if ($("#ddl_SchoolTypes").val() == "32") {
            $("#tblPublicSchools").hide();
			$("#tblIndependentSchools").hide();
        }
	}

    function LoadFinanceInformation() {       
            var params = { schoolID: $("#MainContent_hdfSchoolID").val() };

            $.ajax({
                type: "POST",
                url: "../../../Services/Service.asmx/GetFinanceInformationBySchoolID",
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
                            $("#ddl_SchoolTypes").val(data.SchoolTypeID);
                            $("#chk_IsTheSchoolProjectingShortfallInRevenue").prop("checked", data.IsTheSchoolProjectingShortfallInRevenue);
                            $("#txt_NoOfLearnersApprovedForSchoolFeeExemptionsConditional_2019").val(data.NoOfLearnersApprovedForSchoolFeeExemptionsConditional2019);
                            $("#txt_NoOfLearnersApprovedForSchoolFeeExemptionsConditional_2020").val(data.NoOfLearnersApprovedForSchoolFeeExemptionsConditional2020);
                            $("#txt_NoOfLearnersApprovedForSchoolFeeExemptionsPartial_2019").val(data.NoOfLearnersApprovedForSchoolFeeExemptionsPartial2019);
                            $("#txt_NoOfLearnersApprovedForSchoolFeeExemptionsPartial_2020").val(data.NoOfLearnersApprovedForSchoolFeeExemptionsPartial2020);
                            $("#txt_NoOfLearnersApprovedForSchoolFeeExemptionsTotal_2019").val(data.NoOfLearnersApprovedForSchoolFeeExemptionsTotal2019);
                            $("#txt_NoOfLearnersApprovedForSchoolFeeExemptionsTotal_2020").val(data.NoOfLearnersApprovedForSchoolFeeExemptionsTotal2020);
                            $("#txt_NoOfLearnersApprovedPostLockdownConditional").val(data.NoOfLearnersApprovedPostLockdownConditional);
                            $("#txt_NoOfLearnersApprovedPostLockdownPartial").val(data.NoOfLearnersApprovedPostLockdownPartial);
                            $("#txt_NoOfLearnersApprovedPostLockdownTotal").val(data.NoOfLearnersApprovedPostLockdownTotal);
                            $("#txt_NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2019").val(data.NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2019);
                            $("#txt_NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2020").val(data.NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2020);
                            $("#txt_HowDidTheReducedRevenueCollectionImpactOnOperations").val(data.HowDidTheReducedRevenueCollectionImpactOnOperations);
                            $("#chk_DidYouContinueWithSection38APaymentsToStaff").prop("checked", data.DidYouContinueWithSection38APaymentsToStaff);
                            $("#txt_HowDidTheSchoolManagePayments").val(data.HowDidTheSchoolManagePayments);

                            $("#chk_CanTheSchoolConfirmThatLTSMHasBeenProcuredFor2021").prop("checked", data.CanTheSchoolConfirmThatLTSMHasBeenProcuredFor2021);
                            $("#chk_CanTheSchoolConfirmThatItHasBeenAbleToPayTheirMunicipalAccounts").prop("checked", data.CanTheSchoolConfirmThatItHasBeenAbleToPayTheirMunicipalAccounts);
                            $("#chk_CanTheSchoolConfirmThatItHasBeenAbleToUndertakeMinorRepairsUsingTheMaintenanceBudget").prop("checked", data.CanTheSchoolConfirmThatItHasBeenAbleToUndertakeMinorRepairsUsingTheMaintenanceBudget);
                            $("#chk_CanTheSchoolConfirmThatTheyHavePaidAllTheirSGBAppointedStaff").prop("checked", data.CanTheSchoolConfirmThatTheyHavePaidAllTheirSGBAppointedStaff);
                            $("#chk_DidTheSchoolRelieveSGBAppointedTeachingStaffOfTheirDuties").prop("checked", data.DidTheSchoolRelieveSGBAppointedTeachingStaffOfTheirDuties);
                            $("#txt_NoOfSGBAppointedTeachingStaffWereAffected").val(data.NoOfSGBAppointedTeachingStaffWereAffected);
                            $("#chk_WasTheReprioritisedBudgetApprovedAtAnAGM").prop("checked", data.WasTheReprioritisedBudgetApprovedAtAnAGM);
                            $("#chk_DidTheInitiativesPursuedAssistTheSchoolInRealisingTheBudgetRevenueShortfall").prop("checked", data.DidTheInitiativesPursuedAssistTheSchoolInRealisingTheBudgetRevenueShortfall);
                            $("#chk_IsThisSchoolSubsidisedByTheState").prop("checked", data.IsThisSchoolSubsidisedByTheState);
                            $("#txt_WhatAreTheMainSourcesOfRevenueForTheSchool").val(data.WhatAreTheMainSourcesOfRevenueForTheSchool);
                            $("#chk_IsTheSchoolProjectingShortfallInRevenueCollectionFor2020").prop("checked", data.IsTheSchoolProjectingShortfallInRevenueCollectionFor2020);
                            $("#chk_HaveYouPurchasedAdditionalLearnerAndEducatorSupportMaterial").prop("checked", data.HaveYouPurchasedAdditionalLearnerAndEducatorSupportMaterial);
                            $("#chk_DoesTheSchoolHaveSufficientTextbooksForAllTheLearners").prop("checked", data.DoesTheSchoolHaveSufficientTextbooksForAllTheLearners);
                            $("#chk_WasTheSchoolAbleToPayTheirMunicipalAccounts").prop("checked", data.WasTheSchoolAbleToPayTheirMunicipalAccounts);
                            $("#chk_WasTheSchoolAbleToPurchasePPEsAndCovid19RelatedSupplies").prop("checked", data.WasTheSchoolAbleToPurchasePPEsAndCovid19RelatedSupplies);
                            $("#chk_DidTheSchoolRelieveTeachingStaffOfTheirDutiesToBalanceTheBudget").prop("checked", data.DidTheSchoolRelieveTeachingStaffOfTheirDutiesToBalanceTheBudget);
                            $("#txt_HowManyTeachingStaffWereRelievedOfTheirDutiesToBalanceTheBudget").val(data.HowManyTeachingStaffWereRelievedOfTheirDutiesToBalanceTheBudget);
                            $('#ddl_RevenueShortfallManagementInitiatives').multiselect('select', data.RevenueShortfallManagementInitiatives);
                            $('#ddl_SchoolDealingWithSchoolFeeDefaulters').multiselect('select', data.SchoolDealingWithSchoolFeeDefaulters);
                            OnSchoolTypeChange();
                        }
                    } else {

                        $("#divSaveFinanceInformationFailure").text(jsonData.Message);
                        $("#divSaveFinanceInformationSuccess").hide();
                        $("#divSaveFinanceInformationFailure").show();
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
	<h5 class="card-header">5. FINANCE</h5>
	<div class="card-body">
		<p style="color:#FF0000"><i>Compulsory for all Public schools</i></p> 
		<p style="color:#FF0000"><i>Independent Schools need only respond to Section 5.3</i></p>
		<div class="row">
			<div class="form-group col-md-12" style="overflow-x:auto;">
				<table class="table table-bordered">
					<%-- <thead>
						 <tr><th scope="col" colspan="2">Learner Information: Lockdown Learning & Potential Drop-Out</th></tr>
						 <tr><th scope="col" colspan="2">Number of learners involved in Lockdown Learning (Must Match Column D Total):</th></tr>
					 </thead>--%>
					  <tbody>
							<tr>
								<th scope="row">5.1 The school is </th> 
								<td  colspan="2">
									<select id="ddl_SchoolTypes" class="form-control" onchange="OnSchoolTypeChange()">
										<option value="31">Fee-Charging School</option>
										<option value="32">No Fee School</option>
                                    </select>
								</td>
							</tr>
					</tbody>
				</table>
		    </div>
		</div>

		<div class="row">
			<div class="form-group col-md-12" style="overflow-x:auto;">
				 
				<table class="table table-bordered" id="tblPublicSchools" style="display:none;">
					 <thead>
						 <tr><th scope="col" colspan="3">5.2 Public Schools: <i style="color:#FF0000">(For Fee Charging Public Schools Only)</i></th></tr>
					 </thead>
					  <tbody>
							<tr>
								<th scope="row" colspan="2">5.2.1 Is the school projecting a shortfall in revenue collection for 2020? <i style="color:#FF0000">Tick if YES</i> </th> 
								<td><input type="checkbox" id="chk_IsTheSchoolProjectingShortfallInRevenue" /></td>
							</tr>
						  <tr>
							   <th  scope="row">5.2.2 Provide the number of learners that were approved for school fee exemptions per category per year in the appropriate column.</th>
							   <th  scope="row">2019</th>
							   <th  scope="row">2020</th>
						  </tr>
						  <tr>
							   <th  scope="row" style="padding-left: 35px;">Conditional</th>
            				   <td><input type="number" value="0" min="0" id="txt_NoOfLearnersApprovedForSchoolFeeExemptionsConditional_2019" class="form-control" /></td>
            				   <td><input type="number" value="0" min="0" id="txt_NoOfLearnersApprovedForSchoolFeeExemptionsConditional_2020"  class="form-control" /></td>
						  </tr>
						   <tr>
							   <th  scope="row" style="padding-left: 35px;">Partial</th>
            				   <td><input type="number" value="0" min="0" id="txt_NoOfLearnersApprovedForSchoolFeeExemptionsPartial_2019" class="form-control" /></td>
            				   <td><input type="number" value="0" min="0" id="txt_NoOfLearnersApprovedForSchoolFeeExemptionsPartial_2020" class="form-control" /></td>
						  </tr>
						   <tr>
							   <th  scope="row" style="padding-left: 35px;">Total</th>
            				   <td><input type="number" value="0" min="0" id="txt_NoOfLearnersApprovedForSchoolFeeExemptionsTotal_2019" class="form-control" /></td>
            				   <td><input type="number" value="0" min="0" id="txt_NoOfLearnersApprovedForSchoolFeeExemptionsTotal_2020" class="form-control" /></td>
						  </tr>


						   <tr>
							   <th  scope="row" colspan="3">5.2.3 How many of the above were approved post-Lockdown? </th>
						  </tr>
						  <tr>
							   <th  scope="row" style="padding-left: 35px;" colspan="2">Conditional</th>
            				   <td><input type="number" value="0" min="0" id="txt_NoOfLearnersApprovedPostLockdownConditional" class="form-control" /></td>
						  </tr>
						   <tr>
							   <th  scope="row" style="padding-left: 35px;" colspan="2">Partial</th>
            				   <td><input type="number" value="0" min="0" id="txt_NoOfLearnersApprovedPostLockdownPartial" class="form-control" /></td>
						  </tr>
						   <tr>
							   <th  scope="row" style="padding-left: 35px;" colspan="2">Total</th>
            				   <td><input type="number" value="0" min="0" id="txt_NoOfLearnersApprovedPostLockdownTotal" class="form-control" /></td>
						  </tr>


						    <tr>
							   <th  scope="row" rowspan="2">5.2.4 What was the number of learners whose parents defaulted on their school fee payments?</th>
							   <th  scope="row">2019</th>
							   <th  scope="row">2020</th>
						  </tr>
						  <tr>
            				   <td><input type="number" value="0" min="0" id="txt_NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2019"  class="form-control" /></td>
            				   <td><input type="number" value="0" min="0" id="txt_NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2020"  class="form-control" /></td>
						  </tr>
						  <tr>
								<th scope="row">5.2.5 How did the reduced revenue collection impact on the operations of the school?  </th> 
								<td colspan="2"><textarea id="txt_HowDidTheReducedRevenueCollectionImpactOnOperations" class="form-control"></textarea></td>
						  </tr>
						  <tr>
								<th scope="row" colspan="2">5.2.6 Did you continue with Section 38A payments to staff? <i style="color:#FF0000">Tick if YES</i> </th> 
								<td><input type="checkbox" id="chk_DidYouContinueWithSection38APaymentsToStaff" /></td>
						  </tr>
						  <tr>
								<th scope="row">5.2.7 If yes, how did the school manage payments made in terms of Section 38A? Please elaborate  </th> 
								<td colspan="2"><textarea id="txt_HowDidTheSchoolManagePayments" class="form-control"></textarea></td>
						  </tr>
						  <tr>
						  	<th scope="row" colspan="3">5.2.8 Can the school confirm that:  </th> 
						  </tr>
						  <tr>
		                  	 <th  colspan="2" scope="row" style="padding-left: 35px;">LTSM has been procured for 2021 <i style="color:#FF0000">Tick if YES</i></th>
            			      <td><input type="checkbox" id="chk_CanTheSchoolConfirmThatLTSMHasBeenProcuredFor2021" /></td>
		                  </tr>
						  <tr>
		                  	  <th  colspan="2" scope="row" style="padding-left: 35px;">It has been able to pay their Municipal Accounts <i style="color:#FF0000">Tick if YES</i></th>
            			      <td><input type="checkbox" id="chk_CanTheSchoolConfirmThatItHasBeenAbleToPayTheirMunicipalAccounts" /></td>
		                  </tr>
						  <tr>
		                  	 <th  colspan="2" scope="row" style="padding-left: 35px;">It has the school been able to undertake minor Repairs using the maintenance budget offered by the GDE? <i style="color:#FF0000">Tick if YES</i></th>
            			      <td><input type="checkbox" id="chk_CanTheSchoolConfirmThatItHasBeenAbleToUndertakeMinorRepairsUsingTheMaintenanceBudget" /></td>
		                  </tr>
						  <tr>
		                  	  <th  colspan="2" scope="row" style="padding-left: 35px;">They have paid all their SGB-appointed staff? <i style="color:#FF0000">Tick if YES</i></th>
            			      <td><input type="checkbox" id="chk_CanTheSchoolConfirmThatTheyHavePaidAllTheirSGBAppointedStaff" /></td>
		                  </tr>
						   <tr>
		                  	  <th  colspan="2" scope="row">5.2.9 Did the school relieve SGB-appointed teaching staff of their duties to balance the budget?  <i style="color:#FF0000">Tick if YES</i></th>
            			      <td><input type="checkbox" id="chk_DidTheSchoolRelieveSGBAppointedTeachingStaffOfTheirDuties" /></td>
		                  </tr>
						  <tr>
							  <th colspan="2" scope="row">5.2.10 If Yes, how many SGB-Appointed teaching staff were affected? </th>
							  <td><input type="number" value="0" min="0" id="txt_NoOfSGBAppointedTeachingStaffWereAffected"  class="form-control" /></td>
						  </tr>
						  <tr>
							  <th scope="row">5.2.11 If there was an under-collection in respect of revenue, did the school manage the shortfall through the following </th> 
							  <td colspan="2">
							  	  <select id="ddl_RevenueShortfallManagementInitiatives"  multiple="multiple" class="form-control">
							  			<option value="33">	Reprioritisation of the budget</option>
							  			<option value="34">	Requesting donations and sponsorships from businesses/alumni</option>
										<option value="35">	Requesting Voluntary contributions from parents</option>
										<option value="36">	Drawing funds from school investments</option>
										<option value="37">	Renegotiation of Section 38A contracts</option>
                                  </select>
							  </td>
						  </tr>		
						  <tr>
		                  	  <th  colspan="2">5.2.12 If the school selected the Reprioritisation of the budget option above, was the reprioritised budget approved at an AGM? <i style="color:#FF0000">Tick if YES</i> </th>
            			      <td><input type="checkbox" id="chk_WasTheReprioritisedBudgetApprovedAtAnAGM" /></td>
		                  </tr>
						   <tr>
		                  	  <th  colspan="2">5.2.13 Did the initiatives pursued assist the school in realising the budget revenue shortfall? <i style="color:#FF0000">Tick if YES</i> </th>
            			      <td><input type="checkbox" id="chk_DidTheInitiativesPursuedAssistTheSchoolInRealisingTheBudgetRevenueShortfall" /></td>
		                  </tr>
					</tbody>
				</table>
				
				<table class="table table-bordered" id="tblIndependentSchools" style="display:none;"> 
					 <thead>
						 <tr><th scope="col" colspan="2">5.3 Independent schools: <i style="color:#FF0000">(For Independent Schools Only)</i></th></tr>
					 </thead>
					  <tbody>
							<tr>
								<th scope="row">5.3.1 Is this school subsidised by the state? <i style="color:#FF0000">Tick if YES</i>  </th> 
								<td colspan="2"><input type="checkbox" id="chk_IsThisSchoolSubsidisedByTheState" /></td>
							</tr>
						  <tr>
								<th scope="row">5.3.2 What are the main sources of revenue for the school?</th> 
								<td   colspan="2"><textarea id="txt_WhatAreTheMainSourcesOfRevenueForTheSchool" class="form-control"></textarea></td>
						  </tr>
						  <tr>
								<th scope="row">5.3.3 Is the school projecting a shortfall in revenue collection for 2020? <i style="color:#FF0000">Tick if YES</i></th> 
								<td colspan="2"><input type="checkbox" id="chk_IsTheSchoolProjectingShortfallInRevenueCollectionFor2020" /></td>
						  </tr>
						
						  <tr>
							  <th scope="row">5.3.4 How has the school dealt with school fee defaulters? </th> 
							  <td   colspan="2">
							  	  <select id="ddl_SchoolDealingWithSchoolFeeDefaulters"  multiple="multiple" class="form-control">
							  			<option value="38">	Instituted legal action against the parents</option>
							  			<option value="39">	Deregistered all fee defaulters</option>
										<option value="40">	Allowed fee defaulters to return to school without any repercussions</option>
										<option value="41">	Rescheduled fee payment plans</option>
										<option value="42">	Reduced the school fee for all fee defaulters and retained the learners</option>
										<option value="43">	Approved additional bursaries to accommodate the learners</option>
                                  </select>
							  </td>
						  </tr>		
						  <tr>
		                  	  <th scope="row">5.3.5 Have you been able to purchase additional Learner and Educator Support Material to accommodate for Covid-19? <i style="color:#FF0000">Tick if YES</i></th>
            			      <td  colspan="2"><input type="checkbox" id="chk_HaveYouPurchasedAdditionalLearnerAndEducatorSupportMaterial" /></td>
		                  </tr>
						   <tr>
		                  	  <th scope="row">5.3.6 Does the school have sufficient textbooks for all the learners to avoid sharing, especially in light of Covid-19? <i style="color:#FF0000">Tick if YES</i></th>
            			      <td  colspan="2"><input type="checkbox" id="chk_DoesTheSchoolHaveSufficientTextbooksForAllTheLearners" /></td>
		                  </tr>

						   <tr>
		                  	  <th scope="row">5.3.7 Was the school able to pay their Municipal Accounts? <i style="color:#FF0000">Tick if YES</i> </th>
            			      <td  colspan="2"><input type="checkbox" id="chk_WasTheSchoolAbleToPayTheirMunicipalAccounts" /></td>
		                  </tr>
						   <tr>
		                  	  <th scope="row">5.3.8 Was the school able to purchase PPEs and Covid-19 related Supplies? <i style="color:#FF0000">Tick if YES</i> </th>
            			      <td  colspan="2"><input type="checkbox" id="chk_WasTheSchoolAbleToPurchasePPEsAndCovid19RelatedSupplies" /></td>
		                  </tr>
						   <tr>
		                  	  <th scope="row">5.3.9 Did the school relieve teaching staff of their duties to balance the budget? <i style="color:#FF0000">Tick if YES</i> </th>
            			      <td  colspan="2"><input type="checkbox" id="chk_DidTheSchoolRelieveTeachingStaffOfTheirDutiesToBalanceTheBudget" /></td>
		                  </tr>
						   <tr>
							  <th scope="row">5.3.10 If Yes, how many teaching staff were affected? </th>
            				  <td  colspan="2"><input type="number" value="0" min="0" id="txt_HowManyTeachingStaffWereRelievedOfTheirDutiesToBalanceTheBudget"  class="form-control" /></td>
							</tr>
					</tbody>
				</table>

		    </div>
		</div>

		<div class="form-row">
			<div class="form-group col-12" style="text-align:right;">
				<div class="alert alert-success" role="alert" id="divSaveFinanceInformationSuccess" style="display:none;"></div>
				<div class="alert alert-danger" role="alert" id="divSaveFinanceInformationFailure"  style="display:none;"></div>
				  <ul class="inline">
				    <li><input onclick="GoToClassInformation(); return false;" type="button" class="btn btn-primary btn-sm" value="Previous" /></li>
				    <li><input onclick="SaveFinanceInformation(); return false;" type="button" class="btn btn-primary btn-sm" value="Save & Continue" /></li>
				  </ul>
				</div>
			</div>
		</div>
</div>

												