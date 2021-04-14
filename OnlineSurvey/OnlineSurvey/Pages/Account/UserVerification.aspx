<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UserVerification.aspx.cs" Inherits="OnlineSurvey.Pages.Account.UserVerification" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <%--   <script src="../../Content/assets/libs/js/chosen.jquery.min.js"></script>
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
    </style>
    <style>
        .alert {
            display: block;
        }
    </style>

    <script type="text/javascript">

        function VerifyUser() {
            var controls = [
                "txtEMISNo"
            ];

            $("#divVerifyUserFailure").hide();

            var isValid = validateControls(controls);
            if (isValid) {
                var params = { emisNo: $("#txtEMISNo").val() };

                $.ajax({
                    type: "POST",
                    url: "../../Services/Service.asmx/GetSchoolByEMISNo",
                    data: JSON.stringify(params),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    beforeSend: function () {
                        ShowLoadingSpinner();
                    },
                    success: function (response) {
                        if (response.d != "") {
                            var jsonData = JSON.parse(response.d);
                            if (jsonData.Data) {
                                var data = jsonData.Data;
                                location.href = "SchoolDetails.aspx?Data=" + data;
                            } else {

                                if (jsonData == "Error - Survey Already Submitted to the GDE.") {
                                    jsonData = "Survey Already Submitted to the GDE.";
                                }

                                $("#divVerifyUserFailure").text(jsonData);
                                $("#divVerifyUserSuccess").hide();
                                $("#divVerifyUserFailure").show();
                            }
                        } else {

                            $("#divVerifyUserFailure").text("Inavlid Details.");
                            $("#divVerifyUserSuccess").hide();
                            $("#divVerifyUserFailure").show();
                        }
                    },
                    complete: function () {
                        HideLoadingSpinner();
                    },
                    failure: function (jqXHR, textStatus, errorThrown) {
                        $("#divVerifyUserFailure").text("HTTP Status: " + jqXHR.status + "; Error Text: " + jqXHR.responseText);
                        $("#divVerifyUserSuccess").hide();
                        $("#divVerifyUserFailure").show();
                    }
                });
            }
        }
    </script>


    <section id="hero2" class="d-flex flex-column justify-content-center align-items-center">
        <div class="container text-center text-md-left" data-aos="fade-up">
            <h1>Welcome to <span>Covid-19 Impact Survey System</span></h1>
        </div>
    </section>
    <div class="container">
        <main id="main">
            <br />
            <h5>User Account</h5>
            <hr />
          <%--  <div id="divError">
                <div class="alert alert-danger alert-dismissible fade show">
                    <strong>Info!</strong> <span id="error">Fields with red asterik(*) are required.</span>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            </div>--%>
            <div class="modal-body">
                <div class="card">
                    <div class="card-header">
                        User Account Verification:
                    </div>
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label for="txtEMISNo">EMIS No</label>
                                        <input type="text" id="txtEMISNo" class="form-control" />
                                    </div>
                                   <%-- <div class="form-group col-md-4">
                                        <label for="txtPersalNo">Persal No</label>
                                        <input type="text" id="txtPersalNo" name="txtPersalNo" class="form-control" value="15251128" />
                                    </div>

                                    <div class="form-group col-md-4">
                                        <label for="txtIdentityNo">Identity No</label>
                                        <input type="text" id="txtIdentityNo" name="txtIdentityNo" class="form-control" value="11223344" />
                                    </div>--%>
                                </div>
                                <hr />

                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <div class="alert alert-success" role="alert" id="divVerifyUserSuccess" style="display: none;"></div>
                                        <div class="alert alert-danger" role="alert" id="divVerifyUserFailure" style="display: none;"></div>
                                        <input onclick="VerifyUser(); return false;" type="button" id="btnVerifyUser" class="btn btn-primary btn-sm" value="Submit" />
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





