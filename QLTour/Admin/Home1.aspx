<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="Home1.aspx.cs" Inherits="QLTour.Admin.Home1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link href="../Template/styles/offers_styles.css" rel="stylesheet" />--%>
    <style>
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
                width: 220px;
                height: 50px;
                font-size: 12px;
                font-weight: 700;
                color: #2d2c2c;
                text-transform: uppercase;
                line-height: 50px;
                cursor: pointer;
                border: solid 2px #dadada;
                padding-left: 25px;
                padding-right: 14px;
                margin-right: 16px;
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
                box-shadow: 0 15px 25px rgb(63 78 100 / 15%);
                -webkit-transition: opacity 0.3s ease;
                -moz-transition: opacity 0.3s ease;
                -ms-transition: opacity 0.3s ease;
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
        }
        .pagination {
            display: inline-block;
            padding-left: 0;
            margin: 4px 0;
            border-radius: 4px;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row  border-bottom white-bg dashboard-header">
        <h2>BÁO CÁO THỐNG KÊ E-tOUR</h2>
        <div class="container">
            <ul class="pagination">
                <li class="active"><a href="Home1.aspx">THỐNG KÊ DOANH THU</a></li>
                <li><a href="Home.aspx">THỐNG KÊ TABLE</a></li>
            </ul>
        </div>
        
        <%-- <%------main chính%>--%>
            <div class="wrapper wrapper-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <div>
                                    <span class="pull-right text-right">
                                        <small>Giá trị trung bình của doanh số bán hàng trong tháng qua ở: <strong>Việt Nam</strong></small>
                                        <br />
                                        Tất cả các đợt bán hàng: 162,862
                                        </span>
                                    <h3 class="font-bold no-margins">SƠ ĐỒ DOANH THU
                                        </h3>
                                    <small>Đơn vị VND.</small>
                                </div>

                                <div>
                                    <canvas id="lineChart" height="70"></canvas>
                                </div>

                                <div class="m-t-md">
                                    <small class="pull-right">
                                        <i class="fa fa-clock-o"></i>
                                        Đã cập nhật vào: <asp:Label runat="server" ID="lbupdatetimechart" ></asp:Label>
                                    </small>
                                    <small>
                                        <strong>BIỂU ĐỒ DOANH THU E-TOUR:</strong> Biểu đồ thể hiện doanh thu giữ năm trước và năm hiện tại.
                                   </small>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-lg-4">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right">Tháng trước</span>
                            <h5>DOANH THU THÁNG TRƯỚC</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">
                                <asp:Label runat="server" ID="lbdoanhthuthangtruoc"></asp:Label>
                                <span>VND</span></h1>
                            <div class="stat-percent font-bold text-navy">so với tháng trước: 20% <i class="fa fa-level-up"></i></div>
                            <small>New orders</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <span class="label label-info pull-right">Tháng hiện tại</span>
                            <h5>DOANH THU THÁNG HIỆN TẠI</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">
                                <asp:Label runat="server" ID="lbdoanhthuthanghientai"></asp:Label>
                                <span>VND</span></h1>
                            <div class="stat-percent font-bold text-info">so với tháng trước: 40% <i class="fa fa-level-up"></i></div>
                            <small>New orders</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <span class="label label-warning pull-right">Quý trước</span>
                            <h5>DOANH THU QUÝ TRƯỚC</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">
                                <asp:Label runat="server" ID="lbtongdanhthulastyear"></asp:Label>
                                <span>VND</span></h1>
                            <div class="stat-percent font-bold text-warning">so với quý trước: 16% <i class="fa fa-level-up"></i></div>
                            <small>New orders</small>
                        </div>
                    </div>
                </div>
            </div>    
        </div>

    <asp:TextBox runat="server" ID="txtLineChart" CssClass="hidden"></asp:TextBox>
    <asp:TextBox runat="server" ID="txtLineChart2" CssClass="hidden"> </asp:TextBox>
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
