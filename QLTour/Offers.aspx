<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="Offers.aspx.cs" Inherits="QLTour.Offers" %>

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
                    <div class="offers_sorting_container">
                        <ul class="offers_sorting">
                            <li>
                                <span class="sorting_text">Giá</span>
                                <i class="fa fa-chevron-down"></i>
                                <ul>
                                    <li><span><asp:LinkButton runat="server" ID="lbtnALL" OnClick="lbtnALL_Click">Tất cả</asp:LinkButton></span></li>
                                    <li><span><asp:LinkButton runat="server" ID="lbtnThap" OnClick="lbtnThap_Click">Thấp</asp:LinkButton></span></li>
                                    <li><span><asp:LinkButton runat="server" ID="lbtnCao" OnClick="lbtnCao_Click">Cao</asp:LinkButton></span></li>
                                </ul>
                            </li>
                            <li>
                                <span class="sorting_text">Vị trí</span>
                                <i class="fa fa-chevron-down"></i>
                                <ul>
                                    <li><span><asp:LinkButton runat="server" ID="lbtnBac" OnClick="lbtnBac_Click">Bắc</asp:LinkButton></span></li>
                                    <li><span><asp:LinkButton runat="server" ID="lbtnTrung" OnClick="lbtnTrung_Click">Trung</asp:LinkButton></span></li>
                                    <li><span><asp:LinkButton runat="server" ID="lbtnNam" OnClick="lbtnNam_Click">Nam</asp:LinkButton></span></li>
                                </ul>
                            </li>
                            <li>
                                <span class="sorting_text">Đánh giá</span>
                                <i class="fa fa-chevron-down"></i>
                                <ul>
                                    <li class="filter_btn" data-filter="*"><span style="color:dodgerblue">Tất cả đánh giá</span></li>
                                    <li class="filter_btn" data-filter=".rating_3"><span style="color:dodgerblue">3</span></li>
                                    <li class="filter_btn" data-filter=".rating_4"><span style="color:dodgerblue">4</span></li>
                                    <li class="filter_btn" data-filter=".rating_5"><span style="color:dodgerblue">5</span></li>
                                </ul>
                            </li>
                            <li class="distance_item">
                                <span class="sorting_text">Chọn khoảng giá</span>
                                <i class="fa fa-chevron-down"></i>
                                <ul>
                                    <li><span><asp:LinkButton runat="server" ID="lbtnDuoi1T" OnClick="lbtnDuoi1T_Click">Dưới 1 triệu</asp:LinkButton></span></li>
                                    <li><span><asp:LinkButton runat="server" ID="lbtnBW1T2T" OnClick="lbtnBW1T2T_Click">Từ 1 triệu đến 2 triệu</asp:LinkButton></span></li>
                                    <li><span><asp:LinkButton runat="server" ID="lbtnBW2T5T" OnClick="lbtnBW2T5T_Click">Từ 2 triệu đến 5 triệu</asp:LinkButton></span></li>
                                    <li><span><asp:LinkButton runat="server" ID="lbtnTren5T" OnClick="lbtnTren5T_Click">trên 5 triệu</asp:LinkButton></span></li>
                                </ul>
                            </li>
                            <li>
                                <span class="sorting_text">bảng alphabet</span>
                                <i class="fa fa-chevron-down"></i>
                                <ul>
                                    <li><span><asp:LinkButton runat="server" ID="lbtnsortAZ" OnClick="lbtnsortAZ_Click">a->z</asp:LinkButton></span></li>
                                    <li><span><asp:LinkButton runat="server" ID="lbtnsortZA" OnClick="lbtnsortZA_Click">z->a</asp:LinkButton></span></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
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
                                                        <div class="offer_reviews_title">Điểm</div>
                                                        <div class="offer_reviews_subtitle"><%# getCount(Eval("MaTour").ToString()) %> Đánh giá</div>
                                                    </div>
                                                    <div class="offer_reviews_rating text-center"><%# getPoint(Eval("MaTour").ToString()) %></div>
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
