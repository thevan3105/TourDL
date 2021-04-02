<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="QLTour.Home" %>

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
    <link rel="stylesheet" type="text/css" href="Template/styles/main_styles.css">
    <link rel="stylesheet" type="text/css" href="Template/styles/responsive.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="slider" runat="server">
    <!-- Home -->

    <div class="home">

        <!-- Home Slider -->

        <div class="home_slider_container">

            <div class="owl-carousel owl-theme home_slider">

                <!-- Slider Item -->
                <asp:Repeater runat="server" ID="rpSlide">
                    <ItemTemplate>
                        <div class="owl-item home_slider_item">
                            <div <%--class="home_slider_background"--%> <%--style="background-image: url(Template/images/home_slider.jpg)"--%>>
                                <img src='<%# "Images/" + Eval("Img") %>' width="1519" height="821" />
                                <%--<img src='Template/images/home_slider.jpg' />--%>
                            </div>
                            <%--<img src='<%# "Images/" + Eval("Img") %>' width="1510" height="1000" />--%>
                            <%--<img src='<%# "Images/" + Eval("Img") %>' />--%>

                            <div class="home_slider_content text-center">
                                <div class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
                                    <h1></h1>
                                    <h1><%# Eval("TenSlide").ToString() %></h1>
                                    <div class="button home_slider_button">
                                        <div class="button_bcg"></div>
                                        <a href="Offers.aspx">Khám phá ngay<span></span><span></span><span></span></a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <!-- Slider Item -->
                <!--chỗ này để thêm slide-->


            </div>

            <!-- Home Slider Nav - Prev -->
            <div class="home_slider_nav home_slider_prev">
                <svg version="1.1" id="Layer_2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                    width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                    <defs>
                        <linearGradient id='home_grad_prev'>
                            <stop offset='0%' stop-color='#fa9e1b' />
                            <stop offset='100%' stop-color='#8d4fff' />
                        </linearGradient>
                    </defs>
                    <path class="nav_path" fill="#F3F6F9" d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
					M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
					C22.545,2,26,5.541,26,9.909V23.091z" />
                    <polygon class="nav_arrow" fill="#F3F6F9" points="15.044,22.222 16.377,20.888 12.374,16.885 16.377,12.882 15.044,11.55 9.708,16.885 11.04,18.219 
					11.042,18.219 " />
                </svg>
            </div>

            <!-- Home Slider Nav - Next -->
            <div class="home_slider_nav home_slider_next">
                <svg version="1.1" id="Layer_3" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                    width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                    <defs>
                        <linearGradient id='home_grad_next'>
                            <stop offset='0%' stop-color='#fa9e1b' />
                            <stop offset='100%' stop-color='#8d4fff' />
                        </linearGradient>
                    </defs>
                    <path class="nav_path" fill="#F3F6F9" d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
				M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
				C22.545,2,26,5.541,26,9.909V23.091z" />
                    <polygon class="nav_arrow" fill="#F3F6F9" points="13.044,11.551 11.71,12.885 15.714,16.888 11.71,20.891 13.044,22.224 18.379,16.888 17.048,15.554 
				17.046,15.554 " />
                </svg>
            </div>

            <!-- Home Slider Dots -->

            <div class="home_slider_dots">
                <ul id="home_slider_custom_dots" class="home_slider_custom_dots">
                    <li class="home_slider_custom_dot active">
                        <div></div>
                        01.</li>
                    <li class="home_slider_custom_dot">
                        <div></div>
                        02.</li>
                    <li class="home_slider_custom_dot">
                        <div></div>
                        03.</li>
                </ul>
            </div>

        </div>

    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Intro -->

    <div class="intro">
        <div class="container">
            <div class="row">
                <div class="col">
                    <h2 class="intro_title text-center">Chúng tôi có những tour tốt nhất</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="intro_text text-center">
                        <p>Chúng tôi hiểu rằng trong thời buổi công nghệ, thương mại phát triển công việc áp lực làm mỗi con người chúng ta căng thẳng, mệt mỏi và rất cần những chuyến đi, kỳ nghỉ. Chúng tôi tạo ra những sản phẩm Du Lịch, Dịch vụ với phương trâm thỏa mãn sự hài lòng của quý khách hàng, mang lại một chuyến đi, kỳ nghỉ thoải mái, thư giãn với những không gian nghỉ ngơi, vui chơi, trải nghiệm mang những nét riêng, tạo cảm giác đón nhận mới lạ. Chắc chắn sẽ làm hài lòng các bạn</p>
                    </div>
                </div>
            </div>
            <div class="row intro_items">

                <!-- Intro Item -->

                <div class="col-lg-4 intro_col">
                    <div class="intro_item">
                        <div class="intro_item_overlay"></div>
                        <!-- Image by https://unsplash.com/@dnevozhai -->
                        <div class="intro_item_background" style="background-image: url(Template/images/intro_1.jpg)"></div>
                        <div class="intro_item_content d-flex flex-column align-items-center justify-content-center">
                            <div class="intro_date">Thời gian thoải mái</div>
                            <div class="button intro_button">
                                <div class="button_bcg"></div>
                                <asp:LinkButton runat="server" ID="lbtnBac" OnClick="lbtnBac_Click">Tìm hiểu</asp:LinkButton>
                                <%--<asp:HyperLink runat="server" ID="btnBook" Text="Tìm hiểu" OnLoad="btnBook_Load"/>--%>
                                <%--<a href="#">Tìm hiểu<span></span><span></span><span></span></a>--%>
                            </div>
                            <div class="intro_center text-center">
                                <h1>Bắc</h1>
                                <div class="intro_price">From $1450</div>
                                <div class="rating rating_4">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Intro Item -->

                <div class="col-lg-4 intro_col">
                    <div class="intro_item">
                        <div class="intro_item_overlay"></div>
                        <!-- Image by https://unsplash.com/@hellolightbulb -->
                        <div class="intro_item_background" style="background-image: url(Template/images/intro_2.jpg)"></div>
                        <div class="intro_item_content d-flex flex-column align-items-center justify-content-center">
                            <div class="intro_date">Thời gian thoải mái</div>
                            <div class="button intro_button">
                                <div class="button_bcg"></div>
                                <%--<a href="#">Tìm hiểu<span></span><span></span><span></span></a>--%>
                                <asp:LinkButton runat="server" ID="lbtnTrung" OnClick="lbtnTrung_Click">Tìm hiểu</asp:LinkButton>
                            </div>
                            <div class="intro_center text-center">
                                <h1>Trung</h1>
                                <div class="intro_price">From $1450</div>
                                <div class="rating rating_4">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Intro Item -->

                <div class="col-lg-4 intro_col">
                    <div class="intro_item">
                        <div class="intro_item_overlay"></div>
                        <!-- Image by https://unsplash.com/@willianjusten -->
                        <div class="intro_item_background" style="background-image: url(Template/images/intro_3.jpg)"></div>
                        <div class="intro_item_content d-flex flex-column align-items-center justify-content-center">
                            <div class="intro_date">Thời gian thoải mái</div>
                            <div class="button intro_button">
                                <div class="button_bcg"></div>
                                <%--<a href="#">Tìm hiểu<span></span><span></span><span></span></a>--%>
                                <asp:LinkButton runat="server" ID="lbtnNam" OnClick="lbtnNam_Click">Tìm hiểu</asp:LinkButton>
                            </div>
                            <div class="intro_center text-center">
                                <h1>Nam</h1>
                                <div class="intro_price">From $1450</div>
                                <div class="rating rating_4">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- CTA -->

    <!-- Offers -->

    <div class="offers">
        <div class="container">
            <div class="row">
                <div class="col text-center">
                    <h2 class="section_title">Lựa chọn điểm đến tốt nhất</h2>
                </div>
            </div>
            <div class="row offers_items">

                <!-- Offers Item -->

                <asp:Repeater runat="server" ID="rpSanPhamHot">
                    <ItemTemplate>
                        <div class="col-lg-6 offers_col">
                            <div class="offers_item">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="offers_image_container">
                                            <!-- Image by Egzon Bytyqi -->
                                            <div class="offers_image_background">
                                                <img src='<%# "Images/" + getAnhDaiDien(Eval("MaTour").ToString()) %>' alt="Tour Name" width="255" height="261">
                                            </div>
                                            <div class="offer_name">
                                                <a href="<%# "Single_listing.aspx?MaTour=" + Eval("MaTour").ToString() %>"><%# Eval("TenTour").ToString() %></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">

                                        <div class="offers_content">
                                            <div class="offers_price"><%# ((int)Eval("GiaTien")).ToString("N0") %><span>vnđ/per</span></div>
                                            <div class="rating_r rating_r_4 offers_rating">
                                                <i></i>
                                                <i></i>
                                                <i></i>
                                                <i></i>
                                                <i></i>
                                            </div>
                                            <p class="offers_text" style="white-space: nowrap; width: 220px; overflow: hidden; text-overflow: ellipsis;"><%# Eval("MoTa").ToString() %></p>
                                            <div class="offers_icons">
                                                <ul class="offers_icons_list">
                                                    <li class="offers_icons_item">
                                                        <img src="Template/images/post.png" alt=""></li>
                                                    <li class="offers_icons_item">
                                                        <img src="Template/images/compass.png" alt=""></li>
                                                    <li class="offers_icons_item">
                                                        <img src="Template/images/bicycle.png" alt=""></li>
                                                    <li class="offers_icons_item">
                                                        <img src="Template/images/sailboat.png" alt=""></li>
                                                </ul>
                                            </div>
                                            <br />
                                            <br />
                                            <div class="offers_link">
                                                <asp:HyperLink runat="server" ID="btnBook" Text="Khám phá" NavigateUrl='<%# "Single_listing.aspx?MaTour=" + Eval("MaTour").ToString() %>' /></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

    <!-- Testimonials -->

    <div class="testimonials">
        <div class="test_border"></div>
        <div class="container">
            <div class="row">
                <div class="col text-center">
                    <h2 class="section_title">Mọi người nói gì về chúng tôi</h2>
                </div>
            </div>
            <div class="row">
                <div class="col">

                    <!-- Testimonials Slider -->

                    <div class="test_slider_container">
                        <div class="owl-carousel owl-theme test_slider">

                            <!-- Testimonial Item -->
                            <div class="owl-item">
                                <div class="test_item">
                                    <div class="test_image">
                                        <img src="Template/images/test_1.jpg" alt="https://unsplash.com/@anniegray">
                                    </div>
                                    <div class="test_icon">
                                        <img src="Template/images/backpack.png" alt="">
                                    </div>
                                    <div class="test_content_container">
                                        <div class="test_content">
                                            <div class="test_item_info">
                                                <div class="test_name">carla smith</div>
                                                <div class="test_date">May 24, 2017</div>
                                            </div>
                                            <div class="test_quote_title">" Best holliday ever "</div>
                                            <p class="test_quote_text">Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Testimonial Item -->
                            <div class="owl-item">
                                <div class="test_item">
                                    <div class="test_image">
                                        <img src="Template/images/test_2.jpg" alt="https://unsplash.com/@tschax">
                                    </div>
                                    <div class="test_icon">
                                        <img src="Template/images/island_t.png" alt="">
                                    </div>
                                    <div class="test_content_container">
                                        <div class="test_content">
                                            <div class="test_item_info">
                                                <div class="test_name">carla smith</div>
                                                <div class="test_date">May 24, 2017</div>
                                            </div>
                                            <div class="test_quote_title">" Best holliday ever "</div>
                                            <p class="test_quote_text">Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Testimonial Item -->
                            <div class="owl-item">
                                <div class="test_item">
                                    <div class="test_image">
                                        <img src="Template/images/test_3.jpg" alt="https://unsplash.com/@seefromthesky">
                                    </div>
                                    <div class="test_icon">
                                        <img src="Template/images/kayak.png" alt="">
                                    </div>
                                    <div class="test_content_container">
                                        <div class="test_content">
                                            <div class="test_item_info">
                                                <div class="test_name">carla smith</div>
                                                <div class="test_date">May 24, 2017</div>
                                            </div>
                                            <div class="test_quote_title">" Best holliday ever "</div>
                                            <p class="test_quote_text">Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Testimonial Item -->
                            <div class="owl-item">
                                <div class="test_item">
                                    <div class="test_image">
                                        <img src="Template/images/test_2.jpg" alt="">
                                    </div>
                                    <div class="test_icon">
                                        <img src="Template/images/island_t.png" alt="">
                                    </div>
                                    <div class="test_content_container">
                                        <div class="test_content">
                                            <div class="test_item_info">
                                                <div class="test_name">carla smith</div>
                                                <div class="test_date">May 24, 2017</div>
                                            </div>
                                            <div class="test_quote_title">" Best holliday ever "</div>
                                            <p class="test_quote_text">Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Testimonial Item -->
                            <div class="owl-item">
                                <div class="test_item">
                                    <div class="test_image">
                                        <img src="Template/images/test_1.jpg" alt="">
                                    </div>
                                    <div class="test_icon">
                                        <img src="Template/images/backpack.png" alt="">
                                    </div>
                                    <div class="test_content_container">
                                        <div class="test_content">
                                            <div class="test_item_info">
                                                <div class="test_name">carla smith</div>
                                                <div class="test_date">May 24, 2017</div>
                                            </div>
                                            <div class="test_quote_title">" Best holliday ever "</div>
                                            <p class="test_quote_text">Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Testimonial Item -->
                            <div class="owl-item">
                                <div class="test_item">
                                    <div class="test_image">
                                        <img src="Template/images/test_3.jpg" alt="">
                                    </div>
                                    <div class="test_icon">
                                        <img src="Template/images/kayak.png" alt="">
                                    </div>
                                    <div class="test_content_container">
                                        <div class="test_content">
                                            <div class="test_item_info">
                                                <div class="test_name">carla smith</div>
                                                <div class="test_date">May 24, 2017</div>
                                            </div>
                                            <div class="test_quote_title">" Best holliday ever "</div>
                                            <p class="test_quote_text">Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- Testimonials Slider Nav - Prev -->
                        <div class="test_slider_nav test_slider_prev">
                            <svg version="1.1" id="Layer_6" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                                <defs>
                                    <linearGradient id='test_grad_prev'>
                                        <stop offset='0%' stop-color='#fa9e1b' />
                                        <stop offset='100%' stop-color='#8d4fff' />
                                    </linearGradient>
                                </defs>
                                <path class="nav_path" fill="#F3F6F9" d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
								M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
								C22.545,2,26,5.541,26,9.909V23.091z" />
                                <polygon class="nav_arrow" fill="#F3F6F9" points="15.044,22.222 16.377,20.888 12.374,16.885 16.377,12.882 15.044,11.55 9.708,16.885 11.04,18.219 
								11.042,18.219 " />
                            </svg>
                        </div>

                        <!-- Testimonials Slider Nav - Next -->
                        <div class="test_slider_nav test_slider_next">
                            <svg version="1.1" id="Layer_7" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                                <defs>
                                    <linearGradient id='test_grad_next'>
                                        <stop offset='0%' stop-color='#fa9e1b' />
                                        <stop offset='100%' stop-color='#8d4fff' />
                                    </linearGradient>
                                </defs>
                                <path class="nav_path" fill="#F3F6F9" d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
							M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
							C22.545,2,26,5.541,26,9.909V23.091z" />
                                <polygon class="nav_arrow" fill="#F3F6F9" points="13.044,11.551 11.71,12.885 15.714,16.888 11.71,20.891 13.044,22.224 18.379,16.888 17.048,15.554 
							17.046,15.554 " />
                            </svg>
                        </div>

                    </div>

                </div>
            </div>

        </div>
    </div>

    <!-- Contact -->
    <div class="contact">
        <br />
        <br />
        <hr />
        <hr />
        <div class="contact_background" style="background-image: url(Template/images/contact.png)"></div>

        <div class="container">
            <div class="row">
                <div class="col-lg-5">
                    <div class="contact_image">
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="contact_form_container">
                        <div class="contact_title">Để lại lời nhắn với chúng tôi</div>
                        <div id="contact_form" class="contact_form">
                            <input type="text" id="contact_form_name" class="contact_form_name input_field" placeholder="Tên" required="required">
                            <input type="text" id="contact_form_email" class="contact_form_email input_field" placeholder="Thư" required="required">
                            <input type="text" id="contact_form_subject" class="contact_form_subject input_field" placeholder="Tiêu đề" required="required">
                            <textarea id="contact_form_message" class="text_field contact_form_message" name="message" rows="4" placeholder="Tin nhắn" required="required"></textarea>
                            <button type="submit" id="form_submit_button" class="form_submit_button button" onclick="document.location='Contacts.aspx'">Gửi tin nhắn<span></span><span></span><span></span></button>
                        </div>
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
    <script src="Template/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
    <script src="Template/plugins/easing/easing.js"></script>
    <script src="Template/js/custom.js"></script>
</asp:Content>
