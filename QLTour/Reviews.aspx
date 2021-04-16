<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="QLTour.Reviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Travelix Project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="Template/styles/bootstrap4/bootstrap.min.css">
    <link href="Template/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="Template/styles/elements_styles.css">
    <link rel="stylesheet" type="text/css" href="Template/styles/elements_responsive.css">
    <style>
        .input_field {
            color: black;
        }

        .rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: center;
            margin-left: 25%;
            margin-right: 25%;
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

        .content-rating {
            margin-left: 25%;
            margin-right: 25%;
        }

        .button {
            background-color: cadetblue;
            border: none;
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            float: inherit;
        }

        .button5 {
            border-radius: 350%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="slider" runat="server">
    <!-- Home -->

    <div class="home">
        <div class="home_background parallax-window" data-parallax="scroll" data-image-src="Template/images/Best-Product-Review-Sites.jpg"></div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
            <!-- Modal content-->
            <div class="rating">
                <input type="radio" name="rating" value="5" id="5"><label for="5">☆</label>
                <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label>
                <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label>
                <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label>
                <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label>
            </div>
            <div>Tên tour: <asp:Label runat="server" ID="lbTenTour"></asp:Label></div>
            <div>Giá tour: <asp:Label runat="server" ID="lbGiaTour"></asp:Label> đ</div>
            <div style="margin-left: 41%"><asp:Button runat="server" class="button button5" Text="Đánh giá" ID="btnDanhGia" OnClick="btnDanhGia_Click"></asp:Button></div>
        </div>
        <div class="col-sm-3"></div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script src="Template/js/jquery-3.2.1.min.js"></script>
    <script src="Template/styles/bootstrap4/popper.js"></script>
    <script src="Template/styles/bootstrap4/bootstrap.min.js"></script>
    <script src="Template/plugins/Isotope/isotope.pkgd.min.js"></script>
    <script src="Template/plugins/easing/easing.js"></script>
    <script src="Template/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="Template/js/elements_custom.js"></script>
</asp:Content>
