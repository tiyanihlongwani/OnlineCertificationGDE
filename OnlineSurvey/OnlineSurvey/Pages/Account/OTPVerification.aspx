<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="OTPVerification.aspx.cs" Inherits="OnlineSurvey.Pages.Account.OTPVerification" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--	<script src="../../Content/assets/libs/js/chosen.jquery.min.js"></script>
	<link href="../../Content/assets/libs/css/chosen.min.css" rel="stylesheet" />--%>
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
        .inline li {
             display: inline;
        }
        .alert {
            display: block;
        }
    </style>
 
	<script type="text/javascript">
        function VerifyOTP() {
            var controls = [
                "txtOTPNo"
            ];

            var isValid = validateControls(controls);
            if (isValid) {
                var params = { userOTPNo: $("#txtOTPNo").val(), systemOTPNo: $("#<%=hdfOTP.ClientID %>").val(), schoolID: $("#<%=hdfSchoolID.ClientID %>").val() };

                $.ajax({
                    type: "POST",
                    url: "../../Services/Service.asmx/VerifyOTP",
                    data: JSON.stringify(params),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    beforeSend: function () {
                        ShowLoadingSpinner();
                    },
					success: function (response) {
                        if (response.d != "") {
                            var jsonData = JSON.parse(response.d);
                            if (jsonData.Message = "Success") {
                                location.href = "../Survey/Survey.aspx?Data=" + jsonData.Data;
                            } else {
                                $("#divVerifyOTPFailure").text(jsonData.Data);
                                $("#divVerifyOTPSuccess").hide();
                                $("#divVerifyOTPFailure").show();
                                HideLoadingSpinner()
                            }
                        } else {
                            $("#divVerifyOTPFailure").text("Invalid OTP number.");
                            $("#divVerifyOTPSuccess").hide();
                            $("#divVerifyOTPFailure").show();
                            HideLoadingSpinner();
                        }

                    },
                    complete: function () {
                       //HideLoadingSpinner();
                    },
                    failure: function (jqXHR, textStatus, errorThrown) {
                        $("#divVerifyOTPFailure").text("HTTP Status: " + jqXHR.status + "; Error Text: " + jqXHR.responseText);
                        $("#divVerifyOTPSuccess").hide();
                        $("#divVerifyOTPFailure").show();
                    }
                });
            }
        }

        function ResetOTP() {
            $("#divSMSConfirmationAlert").hide();
            var params = {  schoolID: $("#<%=hdfSchoolID.ClientID %>").val() };

            $.ajax({
                type: "POST",
                url: "../../Services/Service.asmx/ResetOTP",
                data: JSON.stringify(params),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    ShowLoadingSpinner();
                },
                success: function (response) {
                    if (response.d != "") {
                        var jsonData = JSON.parse(response.d);
                        if (jsonData.Message = "Success") {
                            location.href = "OTPVerification.aspx?Data=" + jsonData.Data;
                            $("#divSMSConfirmationAlert").show();
                        } else {
                            $("#divVerifyOTPFailure").text(jsonData.Data);
                            $("#divVerifyOTPSuccess").hide();
                            $("#divVerifyOTPFailure").show();
                            HideLoadingSpinner()
                        }
                    } else {
                        $("#divVerifyOTPFailure").text("Invalid OTP number.");
                        $("#divVerifyOTPSuccess").hide();
                        $("#divVerifyOTPFailure").show();
                        HideLoadingSpinner();
                    }

                },
                complete: function () {
                    //HideLoadingSpinner();
                },
                failure: function (jqXHR, textStatus, errorThrown) {
                    $("#divVerifyOTPFailure").text("HTTP Status: " + jqXHR.status + "; Error Text: " + jqXHR.responseText);
                    $("#divVerifyOTPSuccess").hide();
                    $("#divVerifyOTPFailure").show();
                }
            });
        }
    </script>


	
    <section id="hero2" class="d-flex flex-column justify-content-center align-items-center">
        <div class="container text-center text-md-left" data-aos="fade-up">
            <h1>Welcome to <span>Covid-19 Impact Survey System</span></h1>
        </div>
    </section>
    <div class="container">
        <asp:HiddenField runat="server" ID="hdfOTP" Value="" />
	    <asp:HiddenField runat="server" ID="hdfSchoolID" Value="" />        	
        <main id="main">
            <br />
            <h5>OTP Confirmation</h5>
            <hr />
            <div class="alert alert-info" role="alert" id="divSMSConfirmationAlert">
			  An SMS has been sent to your cellphone number. Please use the OTP for verification.
			</div>
            <%--<div id="divError">
                <div class="alert alert-danger alert-dismissible fade show">
                    <strong>Info!</strong> <span id="error">Fields with red asterik(*) are required.</span>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            </div>--%>
            <div class="modal-body">
                <div class="card">
                    <div class="card-header">
                       OTP Confirmation:
                    </div>
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card-body">
                                 <div class="row">
									<div class="form-group col-md-12">
										<label for="txtOTPNo">OTP No</label>    
										<input type="text" id="txtOTPNo" name="txtOTPNo" class="form-control" />
									</div>
								</div>

                                 <div class="form-row">
                                    <div class="form-group col-12" style="text-align: right;">
                                        <ul class="inline">
                                            <li><input onclick="VerifyOTP(); return false;" type="button" class="btn btn-primary btn-sm" value="Submit" /></li>
                                            <li><input onclick="ResetOTP(); return false;" type="button" class="btn btn-primary btn-sm" value="Resend OTP" /></li>
                                        </ul>
                                        <div class="alert alert-success" role="alert" id="divVerifyOTPSuccess" style="display:none;text-align:left;"></div>
										<div class="alert alert-danger" role="alert" id="divVerifyOTPFailure"  style="display:none;text-align:left;"></div>
                                    </div>
                                </div>

                        </div>
                    </div>
                </div>
               </div>

            </div>
        </main>
    </div>

</asp:Content>

