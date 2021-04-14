<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineSurvey.Pages.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
  .alert {
    display: block;
  }
</style>

	<script type="text/javascript">
        function ShowErrorMessage() {
            $('#btnErrorModal').click();
		}

		function RedirectToProfile() {
            window.location.href = "/Pages/Profile/Profile.aspx";
        }
    </script>

 	<div class="dashboard-wrapper">
		<div class="dashboard-ecommerce">
			<div class="container-fluid dashboard-content ">
				<div class="ecommerce-widget">
					<div class="row">
						<div class="col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="card">
								<h5 class="card-header">Login</h5>
								<div class="card-body">
									<div class="alert alert-danger col-12" id="divError" runat="server" visible="false">
										<span runat="server" id="spError"></span>
									</div>
									<div class="form-group">
										Id Number
							<asp:TextBox ID="txtIDNumber" runat="server" CssClass="form-control" placeholder="ID/PassportNumber" />
										<asp:RequiredFieldValidator runat="server" ControlToValidate="txtIdNumber" CssClass="text-danger" ErrorMessage="The ID/PassportNumber field is required." />
									</div>
									<div class="form-group">
										Password
							<a href="ForgotPassword.aspx" style="float: right; font-size: 14px;">Forgot password?</a>
										<asp:TextBox ID="Password" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" />
										<asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
									</div>
									<asp:Button ID="Button1" OnClick="btnlogin_Click" runat="server" CssClass="btn btn-primary btn-user btn-block" Text="Sign in"></asp:Button>
								</div>
								<hr />
								<div class="card-body">
									<div class="form-group mb-0">
										Don't have an account?<a href="CreateAccount.aspx">Create One</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Button Confirm Delete modal -->
	<button type="button" class="btn btn-primary" id="btnErrorModal" hidden="hidden" data-toggle="modal" data-target="#ErrorModal">
	</button>
	<!--Start Of Error Modal -->
	<div class="modal fade" id="ErrorModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header alert-danger">
					<h5 class="modal-title" id="errorMessageHeader" runat="server"></h5>
				</div>
				<div class="modal-body">
					<div class="form-row">
						<span id="spErorrMessage" runat="server"></span>
					</div>
					<br />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" onclick="RedirectToProfile()">Ok</button>

					<%--<button type="button" class="btn btn-secondary" data-dismiss="modal">Ok</button>--%>
				</div>
			</div>
		</div>
	</div>
	<!-- End Of Error Modal -->
</asp:Content>
