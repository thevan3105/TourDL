<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="QLTour.Contacts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Travelix Project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="Template/styles/bootstrap4/bootstrap.min.css">
    <link href="Template/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="Template/styles/contact_styles.css">
    <link rel="stylesheet" type="text/css" href="Template/styles/contact_responsive.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="slider" runat="server">
    	<!-- Home -->

	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="Template/images/contact_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">Liên lạc</div>
		</div>
	</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Contact -->

	<div class="contact_form_section">
		<div class="container">
			<div class="row">
				<div class="col">

					<!-- Contact Form -->
					<div class="contact_form_container">
						<div class="contact_title text-center">Để lại lời nhắn với chúng tôi</div>
						<div id="contact_form" class="contact_form text-center">
                            <asp:TextBox runat="server" TextMode="SingleLine" ID="txtName" class="contact_form_name input_field" placeholder="Tên" required="required" data-error="Name is required."/>
                            <asp:TextBox runat="server" TextMode="SingleLine" ID="txtEmail" class="contact_form_email input_field" placeholder="Email" required="required" data-error="Email is required."/>
                            <asp:TextBox runat="server" TextMode="SingleLine" ID="txtSubject" class="contact_form_subject input_field" placeholder="Tiêu đề" required="required" data-error="Subject is required."/>
                            <asp:TextBox runat="server" TextMode="Multiline" ID="txtMessage" class="text_field contact_form_message" placeholder="Tin nhắn" required="required" data-error="Please, write us a message."/>
                            <asp:Button runat="server"
                                ID="btnSubmit"
                                Text="Gửi tin nhắn"
                                class="form_submit_button button trans_200"
                                OnClick="btnSubmit_Click" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- About -->
	<div class="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-5">
					
					<!-- About - Image -->

					<div class="about_image">
						<img src="Template/images/man.png" alt="">
					</div>

				</div>

				<div class="col-lg-4">
					
					<!-- About - Content -->

					<div class="about_content">
						<div class="logo_container about_logo">
							<div class="logo"><a href="#"><img src="Template/images/logo.png" alt="">E-Tour</a></div>
						</div>
						<p class="about_text">E-Tour khẳng định cung cấp dịch vụ tốt nhất có thể trên mọi phương diện của sản phẩm mà bạn lựa chọn, hỗ trợ khách hàng mọi lúc mọi nơi.</p>
						<ul class="about_social_list">
							<li class="about_social_item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							<li class="about_social_item"><a href="#"><i class="fa fa-facebook-f"></i></a></li>
							<li class="about_social_item"><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li class="about_social_item"><a href="#"><i class="fa fa-dribbble"></i></a></li>
							<li class="about_social_item"><a href="#"><i class="fa fa-behance"></i></a></li>
						</ul>
					</div>

				</div>

				<div class="col-lg-3">
					
					<!-- About Info -->

					<div class="about_info">
						<ul class="contact_info_list">
							<li class="contact_info_item d-flex flex-row">
								<div><div class="contact_info_icon"><img src="Template/images/placeholder.svg" alt=""></div></div>
								<div class="contact_info_text">235 Hoàng Quốc Việt -Bắc Từ liêm - Hà Nội</div>
							</li>
							<li class="contact_info_item d-flex flex-row">
								<div><div class="contact_info_icon"><img src="Template/images/phone-call.svg" alt=""></div></div>
								<div class="contact_info_text">039-416-6076</div>
							</li>
							<li class="contact_info_item d-flex flex-row">
								<div><div class="contact_info_icon"><img src="Template/images/message.svg" alt=""></div></div>
								<div class="contact_info_text"><a href="mailto:thevan3105@gmail.com?Subject=Hello" target="_top">thevan3105@gmail.com</a></div>
							</li>
							<li class="contact_info_item d-flex flex-row">
								<div><div class="contact_info_icon"><img src="Template/images/planet-earth.svg" alt=""></div></div>
								<div class="contact_info_text"><a href="https://www.wikipedia.org/">www.wikipedia.org</a></div>
							</li>
						</ul>
					</div>

				</div>

			</div>
		</div>
	</div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script src="Template/js/jquery-3.2.1.min.js"></script>
    <script src="Template/styles/bootstrap4/popper.js"></script>
    <script src="Template/styles/bootstrap4/bootstrap.min.js"></script>
    <script src="Template/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="Template/js/contact_custom.js"></script>
</asp:Content>
