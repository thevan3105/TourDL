<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="QLTour.Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Travelix Project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="Template/styles/bootstrap4/bootstrap.min.css">
    <link href="Template/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="Template/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="Template/styles/blog_styles.css">
    <link rel="stylesheet" type="text/css" href="Template/styles/blog_responsive.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="slider" runat="server">
    <!-- Home -->

    <div class="home">
        <div class="home_background parallax-window" data-parallax="scroll" data-image-src="Template/images/blog_background.jpg"></div>
        <div class="home_content">
            <div class="home_title">The Blog</div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Blog -->

    <div class="blog">
        <div class="container">
            <div class="row">

                <!-- Blog Content -->

                <div class="col-lg-8">

                    <div><h2 style="text-align:center"><b>Tin mới nhất</b></h2></div>
                    <br />
                    <div class="blog_post_container">

                        <!-- Blog Post -->
                        <asp:Repeater runat="server" ID="rpPost">
                            <ItemTemplate>
                                <div class="blog_post">
                                    <div class="blog_post_image">
                                        <img src='Images/<%# Eval("Url_Img").ToString() %>'>
                                        <div class="blog_post_date d-flex flex-column align-items-center justify-content-center">
                                            <div class="blog_post_day"><%# (Eval("Time", "{0:dd}")).ToString() %></div>
                                            <div class="blog_post_month"><%# (Eval("Time", "{0:M/yyyy}")).ToString() %></div>
                                        </div>
                                    </div>
                                    <div class="blog_post_meta">
                                    </div>
                                    <div class="blog_post_title"><a href="#"><%# Eval("Title").ToString() %></a></div>
                                    <div class="blog_post_text">
                                        <p style="text-align: justify"><%# Eval("Contents").ToString() %></p>
                                    </div>
                                    <div class="blog_post_link"><a href="Offers.aspx">Khám phá</a></div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                </div>

                <!-- Blog Sidebar -->

                <div class="col-lg-4 sidebar_col">

                    <!-- Sidebar Search -->
                    <%--<div class="sidebar_search">
                        <div>

                        </div>
                    </div>--%>

                    <!-- Sidebar Archives -->
                    <div class="sidebar_archives">
                        <div class="sidebar_title">Kho lưu trữ</div>
                        <div class="sidebar_list">
                            <ul>
                                <li><a href="#">Tháng 3 năm 2021</a></li>
                                <li><a href="#">Tháng 4 năm 2021</a></li>
                                <li><a href="#">Tháng 5 năm 2021</a></li>
                            </ul>
                        </div>
                    </div>

                    <!-- Sidebar Archives -->
                    <div class="sidebar_categories">
                        <div class="sidebar_title">Tag</div>
                        <div class="sidebar_list">
                            <ul>
                                <li><a href="#">Travel</a></li>
                                <li><a href="#">Destinations</a></li>
                                <li><a href="#">Tips</a></li>
                                <li><a href="#">Lifestyle</a></li>
                                <li><a href="#">Uncategorized</a></li>
                            </ul>
                        </div>
                    </div>

                    <!-- Sidebar Latest Posts -->

                    <!-- Sidebar Gallery -->
                    <div class="sidebar_gallery">
                        <div class="sidebar_title">Instagram</div>
                        <div class="gallery_container">
                            <ul class="gallery_items d-flex flex-row align-items-start justify-content-between flex-wrap">
                                <li class="gallery_item">
                                    <a class="colorbox" href="https://images.unsplash.com/photo-1473625247510-8ceb1760943f?ixlib=rb-0.3.5&s=c0996cd16eda8c6f54c398de02d03cd3&auto=format&fit=crop&w=720&q=80">
                                        <img src="Template/images/gallery_1.jpg" alt="https://unsplash.com/@mantashesthaven">
                                    </a>
                                </li>
                                <li class="gallery_item">
                                    <a class="colorbox" href="https://images.unsplash.com/photo-1495162048225-6b3b37b8a69e?ixlib=rb-0.3.5&s=861dd3c7b9d3e735d7fd7cbb1eefed64&auto=format&fit=crop&w=720&q=80">
                                        <img src="Template/images/gallery_2.jpg" alt="https://unsplash.com/@kensuarez">
                                    </a>
                                </li>
                                <li class="gallery_item">
                                    <a class="colorbox" href="https://images.unsplash.com/photo-1502646275263-04be86afa386?ixlib=rb-0.3.5&s=682a41d7d9bf6e3feabc73a5fdd61dd2&auto=format&fit=crop&w=720&q=80">
                                        <img src="Template/images/gallery_3.jpg" alt="https://unsplash.com/@jakobowens1">
                                    </a>
                                </li>
                                <li class="gallery_item">
                                    <a class="colorbox" href="https://images.unsplash.com/photo-1484820301304-0b43512779dc?ixlib=rb-0.3.5&s=7a3393e9f507fb4718c36337a8014c52&auto=format&fit=crop&w=720&q=80">
                                        <img src="Template/images/gallery_4.jpg" alt="https://unsplash.com/@seefromthesky">
                                    </a>
                                </li>
                                <li class="gallery_item">
                                    <a class="colorbox" href="https://images.unsplash.com/photo-1490380169520-0a4b88d52565?ixlib=rb-0.3.5&s=7e6b68b1911fb4ffeea4c0750b8a5269&auto=format&fit=crop&w=720&q=80">
                                        <img src="Template/images/gallery_5.jpg" alt="https://unsplash.com/@deannaritchie">
                                    </a>
                                </li>
                                <li class="gallery_item">
                                    <a class="colorbox" href="https://images.unsplash.com/photo-1504434026032-a7e440a30b68?ixlib=rb-0.3.5&s=2cc35bf903b78ba4f7f7ed69bc2abe3f&auto=format&fit=crop&w=720&q=80">
                                        <img src="Template/images/gallery_6.jpg" alt="https://unsplash.com/@benobro">
                                    </a>
                                </li>
                            </ul>
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
    <script src="Template/plugins/colorbox/jquery.colorbox-min.js"></script>
    <script src="Template/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="Template/js/blog_custom.js"></script>
</asp:Content>
