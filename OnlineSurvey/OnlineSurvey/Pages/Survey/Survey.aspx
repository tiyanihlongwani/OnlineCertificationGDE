<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Survey.aspx.cs" Inherits="OnlineSurvey.Pages.Survey.Survey" %>

<%@ Register Src="~/Pages/Survey/Controls/GeneralSchoolInformation.ascx" TagPrefix="uc1" TagName="GeneralSchoolInformation" %>
<%@ Register Src="~/Pages/Survey/Controls/LearnerInformation.ascx" TagPrefix="uc1" TagName="LearnerInformation" %>
<%@ Register Src="~/Pages/Survey/Controls/StaffInformation.ascx" TagPrefix="uc1" TagName="StaffInformation" %>
<%@ Register Src="~/Pages/Survey/Controls/ClassInformation.ascx" TagPrefix="uc1" TagName="ClassInformation" %>
<%@ Register Src="~/Pages/Survey/Controls/FinanceInformation.ascx" TagPrefix="uc1" TagName="FinanceInformation" %>
<%@ Register Src="~/Pages/Survey/Controls/HostelBoardersInformation.ascx" TagPrefix="uc1" TagName="HostelBoardersInformation" %>
<%@ Register Src="~/Pages/Survey/Controls/InfectionsAndMortalityInformation.ascx" TagPrefix="uc1" TagName="InfectionsAndMortalityInformation" %>
<%@ Register Src="~/Pages/Survey/Controls/CurriculumDeliveryAndCompletion.ascx" TagPrefix="uc1" TagName="CurriculumDeliveryAndCompletion" %>
<%@ Register Src="~/Pages/Survey/Controls/EnablingConditions.ascx" TagPrefix="uc1" TagName="EnablingConditions" %>
<%@ Register Src="~/Pages/Survey/Controls/FinalizeSurvey.ascx" TagPrefix="uc1" TagName="FinalizeSurvey" %>
<%@ Register Src="~/Pages/Survey/Controls/Guidelines.ascx" TagPrefix="uc1" TagName="Guidelines" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
	<style type="text/css">
		input {
		    box-sizing: border-box;
		    border: 1px solid #ccc;
		    height: 30px;
		    padding: 10px;
		}
		input.loading {
		    background: url(http://www.xiconeditor.com/image/icons/loading.gif) no-repeat right center;
		}
    
	</style>
	<script type="text/javascript">

</script>

	<div class="wrapper">
		<asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Id , Name FROM [Lookup_].[dbo].Citizen"></asp:SqlDataSource>
		<asp:HiddenField runat="server" ID="hdfTraineeID" />
		<input type="hidden" runat="server" id="hdfQualificationId" />
		<input type="hidden" runat="server" id="hdfWorkExperienceId" />
		<div class="dashboard-wrapper">
			<div class="dashboard-ecommerce">
				<div class="container-fluid dashboard-content ">
					<div class="ecommerce-widget">
							<div class="row">
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
									<div id="divGeneralSchoolInformation">
                                        <uc1:GeneralSchoolInformation runat="server" id="GeneralSchoolInformation"  />   
									</div>

									<div id="divGuidelines"  style="display:none;">
                                        <uc1:Guidelines runat="server" id="Guidelines" />
									</div>

								   <div id="divLearnerInformation" style="display:none; " >
                                       <uc1:LearnerInformation runat="server" id="LearnerInformation" />
									</div>
									<div id="divStaffInformation" style="display:none;">
                                        <uc1:StaffInformation runat="server" id="StaffInformation" />
									</div>
									<div id="divClassInformation" style="display:none;">
                                        <uc1:ClassInformation runat="server" id="ClassInformation" />
									</div>

									<div id="divFinanceInformation" style="display:none;">
                                        <uc1:FinanceInformation runat="server" ID="FinanceInformation" />
									</div>

									<div id="divHostelBoardersInformation" style="display:none;">
                                        <uc1:HostelBoardersInformation runat="server" id="HostelBoardersInformation" />
									</div>

									<div id="divInfectionsAndMortalityInformation" style="display:none;">
                                        <uc1:InfectionsAndMortalityInformation runat="server" id="InfectionsAndMortalityInformation" />
									</div>
									<div id="divCurriculumDeliveryAndCompletion" style="display:none;">
                                        <uc1:CurriculumDeliveryAndCompletion runat="server" id="CurriculumDeliveryAndCompletion" />
									</div>

									<div id="divEnablingConditions" style="display:none;">
                                        <uc1:EnablingConditions runat="server" id="EnablingConditions" />
									</div>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>
	<asp:HiddenField runat="server" ID="hdnData" Value="" />
	<asp:HiddenField runat="server" ID="hdfSchoolID" />
</asp:Content>

