<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="Demo.aspx.cs" Inherits="QLTour.Demo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Travelix Project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="Template/styles/bootstrap4/bootstrap.min.css">
    <link href="Template/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="Template/styles/offers_styles.css">
    <link rel="stylesheet" type="text/css" href="Template/styles/offers_responsive.css">
    <style>
        .input_field {
            color: black;
        }
        .rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: center
        }
            .rating > input {
                display: none
            }

            .rating > label {
                position: relative;
                width: 1em;
                font-size: 6vw;
                color: #FFD600;
                cursor: pointer
            }

                .rating > label::before {
                    content: "\2605";
                    position: absolute;
                    opacity: 0
                }

                .rating > label:hover:before,
                .rating > label:hover ~ label:before {
                    opacity: 1 !important
                }

            .rating > input:checked ~ label:before {
                opacity: 1
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="slider" runat="server">
    <!-- Home -->

    <div class="home">
        <div class="home_background parallax-window" data-parallax="scroll" data-image-src="Template/images/elements_background.jpg"></div>
        <div class="home_content">
            <div class="home_title">Giỏ tour</div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="line-height: 0.5">Đánh giá</button>

        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Đánh giá tour ...</h5>
                    </div>
                    <div class="modal-body">
                        <div class="rating">
                            <input type="radio" name="rating" value="5" id="5"><label for="5">☆</label>
                            <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label>
                            <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label>
                            <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label>
                            <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button runat="server" ID="btnDong" Text="Đóng" class="btn btn-default" OnClick="btnDong_Click"></asp:Button>
                    </div>
                </div>

            </div>
        </div>

    </div>
    <div>
        <asp:Label runat="server" ID="lbTest"></asp:Label>
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
    <script type="text/javascript" src="Template/js/jquery.min.js"></script>
</asp:Content>
