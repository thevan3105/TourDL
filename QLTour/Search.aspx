<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="QLTour.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Travelix Project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="Template/styles/bootstrap4/bootstrap.min.css">
    <link href="Template/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="Template/styles/offers_styles.css">
    <link rel="stylesheet" type="text/css" href="Template/styles/offers_responsive.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="slider" runat="server">
    <!-- Home -->

    <div class="home">
        <div class="home_background parallax-window" data-parallax="scroll" data-image-src="Template/images/about_background.jpg"></div>
        <div class="home_content">
            <div class="home_title">lựa chọn là ở bạn</div>
        </div>
        <asp:TextBox runat="server" ID="txtSearch" Enabled="false"></asp:TextBox>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Offers -->
    
    <div class="offers">
        <!-- Offers -->

        <div class="container">
            <div class="row">
                <div class="col-lg-1 temp_col"></div>
                <div class="col-lg-11">

                    <!-- Offers Sorting -->
                </div>

                <div class="col-lg-12">
                    <!-- Offers Grid -->

                    <div class="offers_grid">

                        <!-- Offers Item -->

                        <div class="offers_item rating_5">
                            <div class="row">
                                <asp:Repeater runat="server" ID="rpSanPhamHot">
                                    <ItemTemplate>
                                        <div class="col-lg-1 temp_col"></div>
                                        <div class="col-lg-3 col-1680-4">
                                            <div class="offers_image_container">
                                                <div class="offers_image_background">
                                                    <img src='<%# "Images/" + getAnhDaiDien(Eval("MaTour").ToString()) %>' alt="Tour Name" width="350" height="267">
                                                </div>
                                                <div class="offer_name"><a href="<%# "Single_listing.aspx?MaTour=" + Eval("MaTour").ToString() %>"><%# Eval("TenTour").ToString() %> </a></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="offers_content">
                                                <div class="offers_price"><%# ((int)Eval("GiaTien")).ToString("N0") %><span> VNĐ/per</span></div>
                                                <div class="rating_r rating_r_5 offers_rating" data-rating="3">
                                                    <i></i>
                                                    <i></i>
                                                    <i></i>
                                                    <i></i>
                                                    <i></i>
                                                </div>
                                                <div class="offers_text" style="white-space: nowrap; width: 720px; overflow: hidden; text-overflow: ellipsis;"><%# Eval("MoTa").ToString() %></div>
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
                                                <div class="button book_button">
                                                    <asp:HyperLink runat="server" ID="btnBook" Text="Khám phá" NavigateUrl='<%# "Single_listing.aspx?MaTour=" + Eval("MaTour").ToString() %>' /><span></span><span></span><span></span></a>
                                                </div>
                                                <hr />
                                                <div class="offer_reviews">
                                                    <div class="offer_reviews_content">
                                                        <div class="offer_reviews_title">rất tốt</div>
                                                        <div class="offer_reviews_subtitle">100 nhận xét</div>
                                                    </div>
                                                    <div class="offer_reviews_rating text-center">8.1</div>
                                                </div>
                                            </div>
                                            <br>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div>
        <h2 style="text-align:center"><asp:Label runat="server" ID="lbNotFound"></asp:Label></h2>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script src="Template/js/jquery-3.2.1.min.js"></script>
    <script src="Template/styles/bootstrap4/popper.js"></script>
    <script src="Template/styles/bootstrap4/bootstrap.min.js"></script>
    <script src="Template/plugins/Isotope/isotope.pkgd.min.js"></script>
    <script src="Template/plugins/easing/easing.js"></script>
    <script src="Template/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="Template/js/offers_custom.js"></script>
</asp:Content>
