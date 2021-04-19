<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="Single_listing.aspx.cs" Inherits="QLTour.Single_listing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Travelix Project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="Template/styles/bootstrap4/bootstrap.min.css">
    <link href="Template/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="Template/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="Template/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="Template/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="Template/plugins/OwlCarousel2-2.2.1/animate.css">
    <link rel="stylesheet" type="text/css" href="Template/styles/single_listing_styles.css">
    <link rel="stylesheet" type="text/css" href="Template/styles/single_listing_responsive.css">

    <link rel="stylesheet" type="text/css" href="Template/styles/offers_styles.css">
    <link rel="stylesheet" type="text/css" href="Template/styles/offers_responsive.css">
    <link rel="stylesheet" type="text/css" href="Template/styles/elements_styles.css">
    <link rel="stylesheet" type="text/css" href="Template/styles/elements_responsive.css">
    <style>
        .ml2 {
            font-weight: 900;
            font-size: 3.5em;
        }

            .ml2 .letter {
                display: inline-block;
                line-height: 1em;
            }

        .count {
            color: #fa9e1b;
        }
    </style>
    <style>
        .open-button {
            background-color: #b17be0;
            color: white;
            padding: 9px 20px;
            border: none;
            cursor: pointer;
            opacity: 0.8;
            bottom: 23px;
            right: 28px;
            width: 100%;
            margin-left: 35%;
            max-width: 30%;
        }

        /* The popup chat - hidden by default */
        .chat-popup {
            display: none;
        }

        /* Add styles to the form container */
        .form-container {
            max-width: 100%;
            padding: 10px;
            background-color: white;
        }

            /* Full-width textarea */
            .form-container textarea {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                border: none;
                background: #f1f1f1;
                resize: none;
                min-height: 101px;
            }

                /* When the textarea gets focus, do something */
                .form-container textarea:focus {
                    background-color: #ddd;
                    outline: none;
                }

            /* Set a style for the submit/send button */
            .form-container .btn {
                background-color: #f1b860;
                color: white;
                padding: 8px 20px;
                border: none;
                cursor: pointer;
                width: 100%;
                margin-bottom: 10px;
                opacity: 0.8;
                max-width: 15%;
            }

            /* Add a red background color to the cancel button */
            .form-container .cancel {
                background-color: #ffb7b7;
            }

            /* Add some hover effects to buttons */
            .form-container .btn:hover, .open-button:hover {
                opacity: 1;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="slider" runat="server">
    <!-- Home -->

    <div class="home">
        <div class="home_background parallax-window" data-parallax="scroll" data-image-src="Template/images/single_background.jpg"></div>
        <div class="home_content">
            <div class="home_title">Lựa chọn tuyệt</div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Offers -->

    <div class="listing">
        <!-- Single Listing -->

        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <%--<div class="single_listing">--%>

                    <!-- Hotel Info -->

                    <div class="hotel_info">

                        <!-- Title -->
                        <div class="hotel_title_container d-flex flex-lg-row flex-column">
                            <div class="hotel_title_content">
                                <div>
                                    <br>
                                    <br>
                                </div>
                                <%--<h1 class="hotel_title">Grand Hotel Eurostar</h1>--%>
                                <asp:Repeater runat="server" ID="rpName">
                                    <ItemTemplate>
                                        <div class="abc">
                                            <h2 class="ml2" style="font-family: 'Script MT'/*,'Comic Sans MS', 'Palace Script MT'*/; color: red; font-size: 3em;"><%# Eval("TenTour").ToString() %></h2>
                                            <div class="hotel_location">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Khu vực: <%# getLoaiTour(Eval("MaLoaiTour").ToString()) %></div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                                <div class="rating_r rating_r_4 hotel_rating">
                                    <asp:Repeater runat="server" ID="rpGiaVe">
                                        <ItemTemplate>
                                            <div class="room_text">&nbsp;&nbsp;&nbsp;&nbsp;Giá người lớn: <span class="count"><%# ((int)Eval("GiaVeNL")).ToString() %></span> vnđ/adult</div>
                                            <div class="room_text">&nbsp;&nbsp;&nbsp;&nbsp;Giá trẻ em: <span class="count"><%# ((int)Eval("GiaVeTE")).ToString() %></span> vnđ/children</div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <%--<div class="hotel_location">Loại tour: <%# getLoaiTour(Eval("MaLoaiTour").ToString()) %></div>--%>
                            </div>
                        </div>

                        <!-- Listing Image -->
                        <%--<asp:TextBox Enabled="false" runat="server" ID="txtMaTour" CssClass="form-control"/>--%>
                        <asp:HiddenField ID="abc" runat="server" />
                        <div class="hotel_image">
                            <%--<img src="Template/images/listing_hotel.jpg" alt="">--%>
                            <asp:Repeater runat="server" ID="rpAnhDaiDien">
                                <ItemTemplate>
                                    <img src='<%# "Images/" + Eval("Url") %>' width="1110" height="670" />
                                </ItemTemplate>
                            </asp:Repeater>

                            <%--<asp:Repeater runat="server" ID="rpAnhDaiDien">
                                    <ItemTemplate>
                                        <img src='<%# "Images/" + getAnhDaiDien(Eval("MaTour").ToString()) %>' />
                                    </ItemTemplate>
                                </asp:Repeater>--%>
                            <div class="hotel_review_container d-flex flex-column align-items-center justify-content-center">
                                <div class="hotel_review">
                                    <div class="hotel_review_content">
                                        <div class="hotel_review_title">very good</div>
                                        <div class="hotel_review_subtitle"><asp:Label runat="server" ID="lbCountCmt"></asp:Label> reviews</div>
                                    </div>
                                    <div class="hotel_review_rating text-center"><asp:Label runat="server" ID="lbPoint"></asp:Label></div>
                                </div>
                            </div>
                        </div>

                        <!-- Hotel Gallery -->

                        <div class="hotel_gallery">
                            <div class="hotel_slider_container">
                                <div class="owl-carousel owl-theme hotel_slider">
                                    <asp:Repeater runat="server" ID="rpAnhTour">
                                        <ItemTemplate>
                                            <div class="owl-item">
                                                <a class="colorbox cboxElement" href="<%# "Images/" + Eval("Url") %>">
                                                    <img src='<%# "Images/" + Eval("Url") %>' width="109" height="108" />
                                                </a>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>

                                <!-- Hotel Slider Nav - Prev -->
                                <div class="hotel_slider_nav hotel_slider_prev">
                                    <svg version="1.1" id="Layer_6" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                        width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                                        <defs>
                                            <linearGradient id='hotel_grad_prev'>
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

                                <!-- Hotel Slider Nav - Next -->
                                <div class="hotel_slider_nav hotel_slider_next">
                                    <svg version="1.1" id="Layer_7" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                        width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                                        <defs>
                                            <linearGradient id='hotel_grad_next'>
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

                        <!-- Hotel Info Text -->

                        <div class="hotel_info_text">
                            <asp:Repeater runat="server" ID="rpMoTa">
                                <ItemTemplate>
                                    <div class="offers_text"><%# Eval("MoTa").ToString() %></div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <br />
                        <br />
                        <div style="color: darkblue"><b>Chi tiết lịch trình</b></div>
                        <!-- Mô tả chi tiết tour -->

                        <asp:Repeater runat="server" ID="rpMoTaCT">
                            <ItemTemplate>
                                <div class="offers_text"><%# Eval("MoTaCT").ToString() %></div>
                            </ItemTemplate>
                        </asp:Repeater>


                        <!-- Hotel Info Tags -->

                        <div class="hotel_info_tags">
                            <ul class="hotel_icons_list">
                                <li class="hotel_icons_item">
                                    <img src="Template/images/post.png" alt=""></li>
                                <li class="hotel_icons_item">
                                    <img src="Template/images/compass.png" alt=""></li>
                                <li class="hotel_icons_item">
                                    <img src="Template/images/bicycle.png" alt=""></li>
                                <li class="hotel_icons_item">
                                    <img src="Template/images/sailboat.png" alt=""></li>
                            </ul>
                        </div>

                        <!-- Offers Sorting -->
                        <%--<div class="hotel_info_text">
                            <!--cmb-->
                        </div>--%>
                    </div>

                </div>

                <!-- Rooms -->

                <div class="rooms">

                    <!-- Room -->
                    <div class="room_title" style="text-align: center">
                        Danh sách lịch trình!!!
                    </div>
                    <br />
                    <div class="room">

                        <!-- Room -->
                        <div class="row">
                            <asp:Repeater runat="server" ID="rpLichTrinh">
                                <ItemTemplate>
                                    <div class="col-lg-2">
                                        <div class="room_image">
                                            <%--<img src="Template/images/room_1.jpg" alt="https://unsplash.com/@grovemade">--%>
                                            <img src='<%# "Images/" + getAnhDaiDien(Eval("MaTour").ToString()) %>' width="160" height="137" />
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <div class="room_content">
                                            <%--<div class="room_title">
                                                Danh sách lịch trình
                                            </div>--%>
                                            <div class="room_price">Thời gian bắt đầu và kết thúc tour</div>
                                            <div class="room_text"><%# (Eval("NgayBD", "{0:dd/M/yyyy}")).ToString() %> to <%# (Eval("NgayKT", "{0:dd/M/yyyy}")).ToString() %></div>
                                            <div class="room_extra">Slot: <%# ((int)Eval("Slot")).ToString("N0") %></div>
                                            <div class="room_extra">Loại phương tiện: <%# getLoaiPT(Eval("MaPT").ToString()) %></div>
                                            <asp:Label runat="server" ID="lbHetHan" CssClass="text-danger">
                                                <%# ((DateTime)Eval("NgayBD")) < DateTime.Now ? "Lịch trình đã hết hạn" : ""  %>
                                            </asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 text-lg-right">
                                        <div class="room_button">
                                            <div class="button book_button trans_200">
                                                <asp:HyperLink runat="server" ID="btnBook" Text="Book" NavigateUrl='<%# "Status.aspx?MaLT=" + Eval("MaLT").ToString() %>' />
                                            </div>
                                        </div>
                                        <hr>
                                    </div>
                                    <hr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                    </div>

                </div>

                <!-- Reviews -->

                <div class="reviews">
                    <div class="reviews_title">
                        Nhận xét
                    </div>
                    <button class="open-button" onclick="openForm()">Bình luận</button>

                    <div class="chat-popup" id="myForm">
                        <div class="form-container">

                            <%--<textarea placeholder="Type message.." name="msg" required></textarea>--%>
                            <asp:TextBox runat="server" TextMode="Multiline" ID="txtComments" class="form-container textarea" placeholder="Nhập tin nhắn ..." required="required" data-error="Please, write us a message."/>
                            <asp:Button runat="server" ID="btnSend" OnClick="btnSend_Click" class="btn" Text="Send"></asp:Button>
                            <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
                        </div>
                    </div>
                    <div class="reviews_container">

                        <!-- Review -->
                        <div style="height: 365px; overflow-x: hidden;">
                            <asp:Repeater runat="server" ID="rpReview">
                                <ItemTemplate>
                                    <div class="review">
                                        <div class="row">
                                            <div class="col-lg-1">
                                                <div class="review_image">
                                                    <img src="Images/T006_202101201534410675.jpg" alt="https://unsplash.com/@saaout">
                                                </div>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="review_content">
                                                    <%--<div class="review_title_container">--%>
                                                        <%--<div class="review_title">"Chúng tôi hài lòng về các dịch vụ"</div>--%>
                                                        <%--<div class="review_rating">9.5</div>--%>
                                                    <%--</div>--%>
                                                    <div class="review_title_container">
                                                        <p><%# Eval("Contents").ToString() %> </p>
                                                    </div>
                                                    <div class="review_name"><%# Eval("Name").ToString() %></div>
                                                    <div class="review_date"><%# (Eval("Date_seen", "{0:dd/M/yyyy}")).ToString() %></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <h4>
                                <asp:Label runat="server" ID="lbText"></asp:Label></h4>
                        </div>

                        <!-- Location on Map -->

                        <div class="location_on_map">
                            <div class="location_on_map_title">Vị trí trên bản đồ</div>

                            <!-- Google Map -->

                            <div class="travelix_map">
                                <div id="google_map" class="google_map">
                                    <div class="map_container">
                                        <div id="map"></div>
                                    </div>
                                </div>
                            </div>

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
    <script src="Template/plugins/easing/easing.js"></script>
    <script src="Template/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="Template/plugins/colorbox/jquery.colorbox-min.js"></script>
    <script src="Template/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
    <script src="Template/js/single_listing_custom.js"></script>
    <script src="Template/js/anime.min.js"></script>
    <script>
        // Wrap every letter in a span
        var textWrapper = document.querySelector('.ml2');
        textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

        anime.timeline({ loop: false })
            .add({
                targets: '.ml2 .letter',
                scale: [4, 1],
                opacity: [0, 1],
                translateZ: 0,
                easing: "easeOutExpo",
                duration: 3250,
                delay: (el, i) => 70 * i
            });
    </script>
    <script>
        $('.count').each(function () {
            $(this).prop('Counter', 0).animate({
                Counter: $(this).text()
            }, {
                    duration: 1800,
                    easing: 'swing',
                    step: function (now) {
                        $(this).text(Math.ceil(now));
                    }
                });
        });
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
    <script>
        function openForm() {
            document.getElementById("myForm").style.display = "block";
        }

        function closeForm() {
            document.getElementById("myForm").style.display = "none";
        }
    </script>
</asp:Content>
