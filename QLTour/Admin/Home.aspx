<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="QLTour.Admin.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Template/styles/offers_styles.css" rel="stylesheet" />
    <style>
        .table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
            border-top: 1px solid #e7eaec;
            line-height: 1.42857;
            padding: 8px;
            vertical-align: top;
            text-align: center;
        }

        img#anhhome {
            width: 100%;
        }

        .col-lg-8 {
            width: 50.666667%;
        }

        .col-lg-3 {
            width: 34%;
        }

        .col-lg-1 {
            width: 8.33333333%;
        }

        .col-sm-2 {
            width: 76.666667%;
        }

        table#ContentPlaceHolder1_dgvtourdatmax {
            width: 138px;
        }

        table#ContentPlaceHolder1_dgvtourdatmin {
            width: 138px;
        }

        .col-md-6 {
            width: 100%;
            max-height: 380px;
        }

        div#page-wrapper {
            margin-left: 221px;
        }


        ul.offers_sorting {
            text-align: center;
            border: 4px solid #04ff00;
        }

        .offers_content {
            margin-top: 22px;
        }

        .offers_image_container {
            margin-top: 80px;
        }

        .offer_name {
            position: absolute;
            left: 0;
            bottom: 23px;
            width: 81px;
            height: 33px;
            background: #2b9f4a;
            overflow: hidden;
        }

        .offers_sorting_container {
            background: #19eaf1;
            font-weight: bold;
        }

        ul.offers_sorting {
            text-align: center;
            border: 4px solid #04ff00;
            width: 100%;
        }

        .offer_name {
            position: absolute;
            left: 0;
            bottom: 27px;
            width: 81px;
            height: 33px;
            background: #2b9f4a;
            overflow: hidden;
        }

        .offers_item {
            width: 50%;
            margin-bottom: 46px;
            float: left;
            height: auto;
        }

        .offers_sorting {
            display: inline-block;
        }

            .offers_sorting li ul {
                display: none;
            }

            .offers_sorting > li:hover .offers_sorting li ul {
                display: block;
            }

            .offers_sorting > li {
                display: inline-table;
                position: relative;
                width: 404px;
                height: 50px;
                font-size: 18px;
                font-weight: 700;
                color: #2d2c2c;
                text-transform: uppercase;
                line-height: 50px;
                cursor: pointer;
                border: solid 2px #dadada;
                padding-left: 25px;
                padding-right: 14px;
                margin-right: 0px;
            }

        .row.border-bottom.white-bg.dashboard-header {
            font-family: cursive;
        }

        .offers_item.rating_6 .row {
            margin-right: -15px;
            margin-left: 0px;
            color: black;
        }

        .offers_sorting li ul {
            display: block;
            position: absolute;
            right: 0;
            top: 120%;
            margin: 0;
            width: 100%;
            background: #FFFFFF;
            visibility: hidden;
            opacity: 0;
            z-index: 1;
            /*box-shadow: 0 15px 25px rgb(63 78 100 / 15%);*/
            -webkit-transition: opacity 0.3s ease;
            -moz-transition: opacity 0.3s ease;
            /*-ms-transition: opacity 0.3s ease;*/
            -o-transition: opacity 0.3s ease;
            transition: all 0.3s ease;
        }
        /*nav.navbar-default.navbar-static-side {
            position: fixed;
            z-index: 10;
        }*/
        #wrapper {
            width: 100%;
            overflow-x: hidden;
            background: #0e1f35;
        }

        #wrapper {
            width: 100%;
            overflow-x: hidden;
            background: #0e1f35;
        }

        .row {
            margin-right: -15px;
            margin-left: -15px;
            color: black;
        }

        .offers_content {
            margin-top: 64px;
        }

        .offers_image_container {
            width: 100%;
            height: 100%;
            margin-top: 116px;
        }

        .offers_item.rating_5 .row {
            width: 100%;
            max-height: 380px;
            margin-left: 2px;
        }

        .pagination {
            display: inline-block;
            padding-left: 0;
            margin: 4px 0;
            border-radius: 4px;
        }

        .offers_item.rating_5 {
            width: 33%;
            border-right: 2px outset;
        }

        .offers_item.rating_6 {
            width: 33%;
            border-right: 2px outset;
        }

        .offers_item.rating_7 {
            width: 33.6%;
        }

        .offers_item.rating_5 .col-md-8 {
            width: 66.66666667%;
            padding: 0px;
        }

        .offers_item.rating_5 .col-md-4 {
            width: 33.33333333%;
            padding: 0px;
        }

            .offers_item.rating_5 .col-md-4 h3 {
                font-size: 19px;
            }

        .offers_item.rating_5 .col-md-8 h3 {
            margin-left: 31px;
        }

        .offers_item.rating_6 .col-md-4 {
            width: 48.333333%;
            padding: 0px;
            margin: 0px;
        }

        .offers_item.rating_7 .row {
            margin-left: 0px;
        }

        .offers_item.rating_7 .col-md-4 h4 {
            font-size: 19px;
        }

        .offers_item.rating_7 .col-md-8 h4 {
            margin-left: 31px;
        }

        .offers_item.rating_7 .col-md-4 {
            width: 47.333333%;
            padding: 0px;
            margin-left: 0px;
        }

        .headtable {
            display: flex;
            text-align: center;
            padding: 2px;
            border: 2px inset;
            font-size: 17px;
        }

        .hd1_1 {
            width: 274px;
            border-right: 2px outset;
            padding: 10px 0px 10px 0px;
        }

        .hd1 {
            width: 411px;
            display: flex;
            text-align: center;
            border: 1px lightslategrey;
        }

        .hd2 {
            width: 421px;
            display: flex;
        }

        .offers_item.rating_6 {
            width: 33.4%;
            border-right: 2px outset;
        }

        .offers_item.rating_7 .col-md-4 {
            width: 48.333333%;
            padding: 0px;
            margin-left: 0px;
        }

        .offers_item.rating_5 .col-md-4 {
            width: 33.33333333%;
            padding: 0px;
            border-left: 2px inset;
        }

        .hd1_3 {
            width: 264px;
            border-right: 2px outset;
            padding: 10px 0px 10px 0px;
        }

        .hd1_2 {
            text-align: center;
            width: 137px;
            border-right: 2px outset;
            padding: 10px 0px 10px 0px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row  border-bottom white-bg dashboard-header">
        <h2>BÁO CÁO THỐNG KÊ E-tOUR</h2>
        <div class="container">
            <ul class="pagination">
                <li><a href="Home1.aspx">THỐNG KÊ DOANH THU</a></li>
                <li class="active"><a href="Home.aspx">THỐNG KÊ TABLE</a></li>
            </ul>
        </div>
        <%--menu hiển thị lọc kết quả--%>
        <div class="offers_sorting_container">
            <ul class="offers_sorting">
                <li>
                    <span class="sorting_text">THỐNG KÊ TOUR</span>
                    <i class="fa fa-chevron-down"></i>
                    <ul>
                        <li><span>
                            <asp:LinkButton runat="server" ID="lbtnALL" OnClick="lbtnALL_Click">ALL TOUR THÁNG TRƯỚC</asp:LinkButton></span></li>
                        <li><span>
                            <asp:LinkButton runat="server" ID="lbtntourdatmax" OnClick="lbtntourdatmax_Click1">TOUR ĐẶT NHIỀU NHẤT</asp:LinkButton></span></li>
                        <li><span>
                            <asp:LinkButton runat="server" ID="lbtntourdatmin" OnClick="lbtntourdatmin_Click">TOUR ĐẶT ÍT NHẤT</asp:LinkButton></span></li>
                    </ul>
                </li>
                <li>
                    <span class="sorting_text">THỐNG KÊ KHÁCH HÀNG</span>
                    <i class="fa fa-chevron-down"></i>
                    <ul>
                        <li><span>
                            <asp:LinkButton runat="server" ID="lbtnkhbookmax" OnClick="lbtnkhbookmax_Click">KHÁCH HÀNG BOOK MAX</asp:LinkButton></span></li>
                        <li><span>
                            <asp:LinkButton runat="server" ID="lbtnkhbookmin" OnClick="lbtnkhbookmin_Click">KHÁCH HÀNG BOOK MIN</asp:LinkButton></span></li>
                        <li><span>
                            <asp:LinkButton runat="server" ID="lbtnkhbooktren5">KHÁCH HÀNG BOOK > 5 BOOKING</asp:LinkButton></span></li>
                        <li><span>
                            <asp:LinkButton runat="server" ID="lbtnkhbookit5">KHÁCH HÀNG BOOK < 5 BOOKING</asp:LinkButton></span></li>
                    </ul>
                </li>

                <li>
                    <span class="sorting_text">THỐNG NHÂN VIÊN SELL</span>
                    <i class="fa fa-chevron-down"></i>
                    <ul>
                        <li><span>
                            <asp:LinkButton runat="server" ID="lbtnnhnvienbanmax" OnClick="lbtnnhnvienbanmax_Click">NHÂN VIÊN SELL NHIỀU TOUR NHẤT</asp:LinkButton></span></li>
                        <li><span>
                            <asp:LinkButton runat="server" ID="lbtnnhanvienbanmin" OnClick="lbtnnhanvienbanmin_Click">NHÂN VIÊN SELL ÍT TOUR NHẤT</asp:LinkButton></span></li>
                        <li><span>
                            <asp:LinkButton runat="server" ID="lbtnBW2T5T">NHÂN VIÊN SELL > 300TR</asp:LinkButton></span></li>
                        <li><span>
                            <asp:LinkButton runat="server" ID="lbtnTren5T">NHÂN VIÊN SELL < 100TR</asp:LinkButton></span></li>
                    </ul>
                </li>

            </ul>
        </div>
        <div class="headtable">
            <div class="hd1">
                <div class="hd1_1">
                    Tất cả booking tháng trước
                </div>
                <div class="hd1_2">
                    Tour book max/ Tour book min
                </div>
            </div>
            <div class="hd2">
                <div class="hd1_3">
                    Khách hàng book ít tour nhất
                </div>
                <div class="hd1_3">
                    Khách hàng book nhiều tour nhất
                </div>
            </div>
            <div class="hd2">
                <div class="hd1_3">
                    Nhân viên bán nhiều tour nhất
                </div>
                <div class="hd1_3">
                    Nhân viên bán ít tour nhất
                </div>
            </div>
        </div>
        <%--Reoeater hiển thị all--%>
        <div class="offers_item rating_5">
            <div class="row">
                <div class="col-md-8 ">
                    <div class="card-body table-responsive p-0" style="height: 380px;">
                        <asp:GridView runat="server" ID="dgvalltour" AutoGenerateColumns="false" class="table table-bordered table-head-fixed table-hover text-nowrap text-center">
                            <Columns>
                                <asp:BoundField DataField="MaTour" HeaderText="Mã tour" />
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Ngày Book
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# ((DateTime)Eval("NgayBook")).ToString("dd/MM/yyyy")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div class="col-md-4 ">
                    <div class="card-body table-responsive p-0" style="height: 380px;">
                        <asp:GridView runat="server" ID="dgvtourdatmin" AutoGenerateColumns="false" class="table table-bordered table-head-fixed table-hover text-nowrap text-center">
                            <Columns>
                                <asp:BoundField DataField="TenTour" HeaderText="Tên Tour" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        <%-- grivdiew kh đặt nhiều nhất/ ít nhất--%>
        <div class="offers_item rating_6">
            <div class="row">

                <div class="col-md-4 ">
                    <div class="card-body table-responsive p-0" style="height: 380px;">
                        <asp:GridView runat="server" ID="dgvkhdatmin" AutoGenerateColumns="false" class="table table-bordered table-head-fixed table-hover text-nowrap text-center">
                            <Columns>
                                <asp:BoundField DataField="TenKH" HeaderText="Tên Khách Hàng" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div class="col-md-4 ">
                    <div class="card-body table-responsive p-0" style="height: 380px;">
                        <asp:GridView runat="server" ID="dgvkhdatmax" AutoGenerateColumns="false" class="table table-bordered table-head-fixed table-hover text-nowrap text-center">
                            <Columns>
                                <asp:BoundField DataField="TenKH" HeaderText="Tên Khách Hàng" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        <%-- grivdiew nhân viên sell nhiều nhất/ ít nhất--%>
        <div class="offers_item rating_7">
            <div class="row">
                <div class="col-md-4 ">
                    <div class="card-body table-responsive p-0" style="height: 380px;">
                        <asp:GridView runat="server" ID="dgvnhanvienbanmax" AutoGenerateColumns="false" class="table table-bordered table-head-fixed table-hover text-nowrap text-center">
                            <Columns>
                                <asp:BoundField DataField="TenNV" HeaderText="Tên Nhân Viên" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div class="col-md-4 ">
                    <div class="card-body table-responsive p-0" style="height: 380px;">
                        <asp:GridView runat="server" ID="dgvnhanvienbanmin" AutoGenerateColumns="false" class="table table-bordered table-head-fixed table-hover text-nowrap text-center">
                            <Columns>
                                <asp:BoundField DataField="TenNV" HeaderText="Tên Nhân Viên" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script src="Template/js/plugins/flot/jquery.flot.js"></script>
    <script src="Template/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="Template/js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="Template/js/plugins/flot/jquery.flot.pie.js"></script>
    <script src="Template/js/plugins/flot/jquery.flot.time.js"></script>

    <!-- Flot -->
    <script src="Template/js/plugins/flot/jquery.flot.js"></script>
    <script src="Template/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="Template/js/plugins/flot/jquery.flot.spline.js"></script>
    <script src="Template/js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="Template/js/plugins/flot/jquery.flot.pie.js"></script>
    <script src="Template/js/plugins/flot/jquery.flot.symbol.js"></script>
    <script src="Template/js/plugins/flot/curvedLines.js"></script>
    <script src="Template/js/plugins/chartJs/Chart.min.js"></script>
    <script>
        $(document).ready(function () {

            var dataTest = document.getElementById('ContentPlaceHolder1_txtLineChart').value;
            var arrData = dataTest.split(" ");
            var arrData1 = [];
            for (var i = 0; i < arrData.length; i++) {
                arrData1.push([i + 1, parseInt(arrData[i])]);
            }
            console.log(arrData1);

            var dataTest = document.getElementById('ContentPlaceHolder1_txtLineChart2').value;
            var arrData2 = dataTest.split(" ");
            var arrData3 = [];
            for (var i = 0; i < arrData2.length; i++) {
                arrData3.push([i + 1, parseInt(arrData2[i])]);
            }
            console.log(arrData3);
            var lineData = {
                labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
                datasets: [
                    {
                        label: "dữ liệu",
                        fillColor: "rgba(220,220,220,0.5)",
                        strokeColor: "rgba(220,220,220,1)",
                        pointColor: "rgba(220,220,220,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(220,220,220,1)",
                        data: arrData2
                    },
                    {
                        label: "Doanh thu",
                        fillColor: "rgba(26,179,148,0.5)",
                        strokeColor: "rgba(26,179,148,0.7)",
                        pointColor: "rgba(26,179,148,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(26,179,148,1)",
                        data: arrData
                    },
                ]
            };

            var lineOptions = {
                scaleShowGridLines: true,
                scaleGridLineColor: "rgba(0,0,0,.05)",
                scaleGridLineWidth: 1,
                bezierCurve: true,
                bezierCurveTension: 0.4,
                pointDot: true,
                pointDotRadius: 4,
                pointDotStrokeWidth: 1,
                pointHitDetectionRadius: 20,
                datasetStroke: true,
                datasetStrokeWidth: 2,
                datasetFill: true,
                responsive: true,
            };

            var ctx = document.getElementById("lineChart").getContext("2d");
            var myNewChart = new Chart(ctx).Line(lineData, lineOptions);



        });
    </script>
</asp:Content>
