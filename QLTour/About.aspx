<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="QLTour.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Travelix Project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="Template/styles/bootstrap4/bootstrap.min.css">
    <link href="Template/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="Template/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="Template/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="Template/plugins/OwlCarousel2-2.2.1/animate.css">
    <link rel="stylesheet" type="text/css" href="Template/styles/about_styles.css">
    <link rel="stylesheet" type="text/css" href="Template/styles/about_responsive.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="slider" runat="server">
    <!-- Home -->
    <div class="home">
        <div class="home_background parallax-window" data-parallax="scroll" data-image-src="Template/images/about_background.jpg"></div>
        <div class="home_content">
            <div class="home_title">about us</div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Intro -->

    <div class="intro">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="intro_image">
                        <img src="Template/images/intro.png" alt=""></div>
                </div>
                <div class="col-lg-5">
                    <div class="intro_content">
                        <div class="intro_title" style="font-size:22.1px">Chúng tôi có những tour tốt nhất</div>
                        <p class="intro_text" style="text-align: justify">E-Tour – Đơn vị cung cấp tour du lịch, đặt phòng khách sạn uy tín. hoạt động trong lĩnh vực lữ hành quốc tế và nội địa. Với đội ngũ nhân viên năng động, nhiệt tình, giàu kinh nghiệm, với phong cách phục vụ chuyên nghiệp chúng tôi xin được gửi đến Quý khách những chương trình du lịch thú vị, được điều hành bằng tất cả tâm huyết, kinh nghiệm của những con người yêu nghề và sự trân trọng đối với các sản phẩm tour. Chúng tôi cam kết đem đến cho khách hàng những sản phẩm dịch vụ chất lượng tốt nhất, hỗ trợ khách hàng 24/7.</p>
                        <div class="button intro_button">
                            <div class="button_bcg"></div>
                            <a href="Offers.aspx">Khám phá ngay<span></span><span></span><span></span></a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Stats -->

    <div class="stats">
        <div class="container">
            <div class="row">
                <div class="col text-center">
                    <div class="section_title">THỐNG KÊ NĂM</div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-10 offset-lg-1 text-center">
                    <p class="stats_text">Vơi phương châm đa dạng hóa sản phẩm, từ sản phẩm nhỏ nhất cho đến gói sản phẩm, tất cả các khách hàng gọi đến chúng tôi đều được phục vụ và hỗ trợ tư vấn, làm hài lòng tất cả mọi khách hàng khó tính, từ nhóm 1 khách cho đến đoàn khách.</p>
                    <p class="stats_text">Về nội địa chúng tôi có sản phẩm Du Lịch của 3 miền Đất nước và 7 vũng lãnh thổ, mỗi sản phẩm có những nét đặc trưng riêng của Vùng miền, về Lưu trú, Ẩm thực, Đi lại, Tham quan … các sản phẩm luôn mở để quý khách hàng có nhiều sự lựa chọn phù hợp với nhu cầu về cảm xúc và kinh tế . </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Add -->

    <div class="add">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="add_container">
                        <div class="add_background" style="background-image: url(Template/images/add.jpg)"></div>
                        <div class="add_content">
                            <h1 class="add_title">Nha trang</h1>
                            <div class="add_subtitle">Từ <span>$999</span></div>
                            <div class="button add_button">
                                <div class="button_bcg"></div>
                                <a href="Single_listing.aspx?MaTour=t002">Khám phá ngay<span></span><span></span><span></span></a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Milestones -->

    <div class="milestones">
        <div class="container">
            <div class="row">

                <!-- Milestone -->
                <div class="col-lg-3 milestone_col">
                    <div class="milestone text-center">
                        <div class="milestone_icon">
                            <img src="Template/images/milestone_1.png" alt=""></div>
                        <div class="milestone_counter" data-end-value="255">0</div>
                        <div class="milestone_text">Người dùng</div>
                    </div>
                </div>

                <!-- Milestone -->
                <div class="col-lg-3 milestone_col">
                    <div class="milestone text-center">
                        <div class="milestone_icon">
                            <img src="Template/images/milestone_2.png" alt=""></div>
                        <div class="milestone_counter" data-end-value="1176">0</div>
                        <div class="milestone_text">Dự án</div>
                    </div>
                </div>

                <!-- Milestone -->
                <div class="col-lg-3 milestone_col">
                    <div class="milestone text-center">
                        <div class="milestone_icon">
                            <img src="Template/images/milestone_3.png" alt=""></div>
                        <div class="milestone_counter" data-end-value="39">0</div>
                        <div class="milestone_text">Điểm đến</div>
                    </div>
                </div>

                <!-- Milestone -->
                <div class="col-lg-3 milestone_col">
                    <div class="milestone text-center">
                        <div class="milestone_icon">
                            <img src="Template/images/milestone_4.png" alt=""></div>
                        <div class="milestone_counter" data-end-value="127">0</div>
                        <div class="milestone_text">Khách sạn</div>
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
    <script src="Template/plugins/greensock/TweenMax.min.js"></script>
    <script src="Template/plugins/greensock/TimelineMax.min.js"></script>
    <script src="Template/plugins/scrollmagic/ScrollMagic.min.js"></script>
    <script src="Template/plugins/greensock/animation.gsap.min.js"></script>
    <script src="Template/plugins/greensock/ScrollToPlugin.min.js"></script>
    <script src="Template/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
    <script src="Template/plugins/easing/easing.js"></script>
    <script src="Template/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="Template/js/about_custom.js"></script>
</asp:Content>
