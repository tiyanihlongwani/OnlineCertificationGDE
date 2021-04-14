<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="OnlineSurvey.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section id="hero" class="d-flex flex-column justify-content-center align-items-center">
        <div class="container text-center text-md-left" data-aos="fade-up">
            <h1>Welcome to <span>Covid-19 Impact Survey System</span></h1>
            <h2>identify the responses of school to the pandemic in Gauteng</h2>
            <button type="button" class="btn-get-started scrollto" data-backdrop="static" data-toggle="modal" id="btnNew" data-target="#verifyModal">Start Survey</button>
        </div>
    </section>
    <main id="main">
        <!-- ======= What We Do Section ======= -->
        <section id="what-we-do" class="what-we-do">
            <div class="container">
                <div class="section-title">
                    <h2>EMIS SNAP SURVEY</h2>
                    <p>Schools are requested to partake in an online snap survey to determine the impact of Covid-19 on schooling in the province and to identify the responses of schools to the pandemic in Gauteng. </p>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 d-flex">
                        <div class="icon-box" style="text-align:left">
                            <h4>The purpose of the survey is to explore how schools have</h4>
                           <ol>
                               <li>Schools are requested to partake in an online snap survey to determine the impact of Covid-19 on schooling in the province and to identify the responses of schools to the pandemic in Gauteng. 

</li>
                                <li>Kindly note that the survey is to be completed online. The hard copy survey instrument that was attached to Circular 13 of 2020 was shared in advance so that the Principal was made aware of the scope of the survey. This would have allowed the principal to engage with key stakeholders such as the Governing Body and prepare all the required information for before completing the current online exercise.</li>
                               <li>Kindly complete the survey before close of business on 9 October 2020. </li>
                           </ol>
                           </div>
                    </div>
                </div>

            </div>
        </section>

    </main>
    <div class="modal fade" id="verifyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content ">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Accept Terms and Conditions</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <div class="form-group col-sm-12">
                            <div class="card">
								<h6 class="card-header">In order to continue with the registration you are requested to familiarise yourself with the terms and conditions set for participation in the Online Survey in order to accept it</h6>
								<div class="card-body">
									<ol style="font-size:14px">
										<li>The survey is compulsory for ALL public and independent ordinary school principals</li>
                                        <li>The survey must be completed online over the period 5-9 October 2020</li>
                                        <li>All relevant sections must be completed in full</li>
                                        <li>The principal of each school must authenticate the online submission with their relevant credentials (for public schools this could be the Principal’s ID and for independent schools this could be their ID or cell number and OTP)</li>
                                        <li>Where relevant the inputs of the School Governance Structure (SGB or Board of Trustees) must be solicited</li>
                                        <li>Schools must retain a copy of their completed survey form – a fully populated paper-based version of the survey issued with Circular 13 of 2020  will suffice</li>
									</ol>
								</div>
							</div>
                        </div>
                    </div>
                     <input type="checkbox" onclick="OnAcceptingTandCs()" id="chkIsActive" runat="server" />
                     <asp:Button ID="btnCreateAccount" runat="server" CssClass="btn btn-primary" OnClick="btnCreateAccount_Click" Text="Accept Terms and Conditions"/>
                </div>
            </div>
        </div>
    </div>
       <script type="text/javascript">
           function OnAcceptingTandCs(){
               if ($("#<%=chkIsActive.ClientID%>").prop("checked") == true) {
                $('#<%=btnCreateAccount.ClientID%>').prop('disabled', false);

           } else {
                $('#<%=btnCreateAccount.ClientID%>').prop('disabled', true);
               }
           }
       </script>
</asp:Content>
