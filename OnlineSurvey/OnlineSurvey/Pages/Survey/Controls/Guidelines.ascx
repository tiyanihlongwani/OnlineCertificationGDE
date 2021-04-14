<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Guidelines.ascx.cs" Inherits="OnlineSurvey.Pages.Survey.Controls.Guidelines" %>

<script type="text/javascript">
    function GoToLearnerInformation() {
        $("#divLearnerInformation").show();
        $("#divGuidelines").hide();
    }

    function GoToGeneralSchoolInformation() {
        $("#divGeneralSchoolInformation").show();
        $("#divGuidelines").hide();
    }
</script>

<div class="card">
    <h5 class="card-header">GUIDELINES </h5>
    <div class="card-body">
        <div class="row">
            <div class="form-group col-md-12">
                <p>This section provides guidance for the completion of the EMIS Snap Survey. The survey is to be completed online and is compulsory for all Public and independent Ordinary Schools. Special Schools are exempt from this process. </p>
                <p>The guidelines listed below are intended to assist all ordinary schools with the completion of the instrument. There are 9 sections in total. Some sections are to be completed by all schools while others are sector specific. The sections are presented below, and guidance is provided around who should complete the relevant section:</p>

                <ol>
                    <li><b>General school information</b> – is a compulsory section for all schools and seeks details of the school and those of the principal</li>
                    <li><b>Learner information </b>- Compulsory for all schools. Independent schools are requested to complete all fields that apply to their sector </li>
                    <li><b>Staff information  </b>- Compulsory for all public schools. Independent schools are requested to complete all fields that apply to their sector
                                                <br />
                        <b>Q3.2 and Q3.3.</b> For public schools only</li>
                    <li><b>Class information  </b>- compulsory for all schools.</li>
                    <li><b>Finance  information </b>- this section is compulsory for all <b>fee charging </b>public schools. Independent schools are to only respond to section 5.3.</li>
                    <li><b>Hostel Boarders  </b>- Compulsory for all public schools with hostels only </li>
                    <li><b>COVID-19 infections & mortality: Learner & Educator </b>- This section is compulsory for all schools, public and independent.</li>
                    <li><b>Curriculum delivery & completion: high level </b>- Compulsory for all schools, public and independent. </li>
                    <li><b>Enabling conditions  </b>- Compulsory for public schools only.
                                                <br />
                        <b>Q9.2 </b>Compulsory for public schools on the <b>learner transport programme</b> and 
                                                <br />
                        <b>Q9.3</b> Compulsory for public schools on the <b>school nutrition programme </b>
                    </li>
                </ol>

                <img src="../../Content/assets/images/summary.JPG" width="100%" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-12" style="text-align: right;">
                <ul class="inline">
                    <li>
                        <input onclick="GoToGeneralSchoolInformation(); return false;" type="button" class="btn btn-primary btn-sm" value="Previous" /></li>
                    <li>
                        <input type="button" class="btn btn-primary btn-sm" value="Start Survey" onclick="GoToLearnerInformation()" /></li>
                </ul>
            </div>
        </div>
    </div>
</div>


