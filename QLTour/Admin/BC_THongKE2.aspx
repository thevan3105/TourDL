<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="BC_THongKE2.aspx.cs" Inherits="QLTour.Admin.BC_THongKE2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.24/datatables.min.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css" />
    <link href="../Template/styles/offers_styles.css" rel="stylesheet" />
    <style>
        input#ContentPlaceHolder1_btnxuatex {
            background-color: #23c6c8;
            border-color: #23c6c8;
            color: #FFFFFF;
            width: 94px;
            margin-top: 10px;
            height: 30px;
        }

        .offers_sorting li ul li {
            display: block;
            text-align: center;
            padding-left: 25px;
            padding-right: 25px;
            height: 82px;
        }

        .sumdoanhthu {
            margin-top: 100px;
        }

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
            width: 100%;
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

    <style>
        div#example_wrapper {
            margin-top: 80px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sumdoanhthu">

        <%--<div class="form-group">
            <label class="col-sm-2 control-label">Tổng danh thu từ ngày đến ngày <span class="text-danger">*</span></label>
            <div class="col-sm-10">
                <div class="form-group row">
                    <div class="col-md-2">
                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbNgaybd" class="form-control col-sm-2" placeholder="Ngày" />

                    </div>
                    <div class="col-md-2">
                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbThangbd" class="form-control col-sm-2" placeholder="Tháng" />

                    </div>
                    <div class="col-md-2">
                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbNambd" class="form-control col-sm-2" placeholder="Năm" />

                    </div>

                </div>
                <div class="form-group row">
                    <div class="col-md-2">
                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbNgaykt" class="form-control col-sm-2" placeholder="Ngày" />

                    </div>
                    <div class="col-md-2">
                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbThangkt" class="form-control col-sm-2" placeholder="Tháng" />

                    </div>
                    <div class="col-md-2">
                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbNamkt" class="form-control col-sm-2" placeholder="Năm" />

                    </div>

                </div>
            </div>
        </div>

        <asp:Label runat="server" ID="lbtongdoanhthu" ></asp:Label>
        <asp:Button runat="server" ID="btntest" OnClick="btntest_Click" />
        <div class="offers_item rating_1">
            <div class="row">
                <div class="col-md-12 ">
                    <div class="card-body table-responsive p-0" style="height: 380px;">
                        <asp:GridView runat="server" ID="dgvtongdanhthu" AutoGenerateColumns="false" class="table table-bordered table-head-fixed table-hover text-nowrap text-center">
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
            </div>
        </div>--%>
    </div>
    <div class="hr-line-dashed"></div>
    <%--<table id="example" class="display nowrap" style="width: 100%">

        <thead>
            <tr>
                <th>Mã nhân viên</th>
                <th>tên nhân viên</th>
                <th>Nghiệp vụ</th>
                <th>Ngày sinh</th>
                <th>Giới tính</th>
                <th>Địa chỉ</th>
                <th>Địa</th>
            </tr>
        </thead>

        <tbody>

            <tr>
                <td>Garrett Winters</td>
                <td>Accountant</td>
                <td>Tokyo</td>
                <td>63</td>
                <td>2011/07/25</td>
                <td>$170,750</td>
                <th>Địa</th>
            </tr>
            <tr>
                <td>Ashton Cox</td>
                <td>Junior Technical Author</td>
                <td>San Francisco</td>
                <td>66</td>
                <td>2009/01/12</td>
                <td>$86,000</td>
                <th>Địa</th>
            </tr>
            <tr>
                <td>San Francisco</td>
                <td>Junior Technical Author</td>
                <td>San Francisco</td>
                <td>66</td>
                <td>2009/01/12</td>
                <td>$86,000</td>
                <th>Địa</th>
            </tr>

        </tbody>
        <tfoot>
            <tr>
                <th>Mã nhân viên</th>
                <th>tên nhân viên</th>
                <th>Nghiệp vụ</th>
                <th>Ngày sinh</th>
                <th>Giới tính</th>
                <th>Địa chỉ</th>
                <th>Địa</th>
            </tr>
        </tfoot>
    </table>--%>

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
                            <asp:LinkButton runat="server" ID="lbtntourdatmax" OnClick="lbtntourdatmax_Click">TOUR ĐẶT NHIỀU NHẤT</asp:LinkButton></span></li>
                        <%--<li><span>
                            <asp:LinkButton runat="server" ID="lbtntourdatmax" OnClick="lbtntourdatmax_Click1">TOUR ĐẶT NHIỀU NHẤT</asp:LinkButton></span></li>
                        <li><span>
                            <asp:LinkButton runat="server" ID="lbtntourdatmin" OnClick="lbtntourdatmin_Click">TOUR ĐẶT ÍT NHẤT</asp:LinkButton></span></li>--%>
                    </ul>
                </li>
                <li>
                    <span class="sorting_text">Tổng doanh thu</span>
                    <i class="fa fa-chevron-down"></i>
                    <ul>
                        <li><span>
                            <asp:LinkButton runat="server" ID="lbtongdoanhthu" OnClick="lbtongdoanhthu_Click">Tổng doanh thu</asp:LinkButton></span></li>


                    </ul>
                </li>

                <li>
                    <span class="sorting_text">Tìm booking theo tên NV</span>
                    <i class="fa fa-chevron-down"></i>
                    <ul>
                        <li><span>
                            <asp:LinkButton runat="server" ID="lbttimbooktheoten" OnClick="lbttimbooktheoten_Click">Tìm theo tên nv , trong khoảng thời gian</asp:LinkButton></span></li>

                    </ul>
                </li>

            </ul>
        </div>

        <%--<div class="headtable">
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
        </div>--%>
        <asp:Button runat="server" ID="btnxuatex" OnClick="btnxuatex_Click" Text="Xuất Excel" />
        <div class="form-group">
            <asp:TextBox runat="server" ID="txttimkiem" placeholder="ngay bd" class="form-control" name="top-search"> </asp:TextBox>
            <asp:TextBox runat="server" ID="txttimkiemngaykt" placeholder="ngày kt" class="form-control" name="top-search"> </asp:TextBox>
            <asp:Button runat="server" ID="btntimkiemtourmax" Text="Tìm kiếm" OnClick="btntimkiemtourmax_Click" />
        </div>
        <%--Reoeater hiển thị all--%>
        <div class="offers_item rating_5">
            <div class="row">
                <div class="col-md-12 ">
                    <div class="card-body table-responsive p-0" style="height: 380px;">
                        <asp:GridView runat="server" ID="dgvtourdatmax" AutoGenerateColumns="false" class="table table-bordered table-head-fixed table-hover text-nowrap text-center">
                            <Columns>
                                <asp:BoundField DataField="MaTour" HeaderText="Mã tour" />
                                <asp:BoundField DataField="TenTour" HeaderText="Tên tour" />
                                <asp:BoundField DataField="MaLoaiTour" HeaderText="Mã loại tour" />
                                <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng đặt" />

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <%--tìm booking--%>
                <%--<div class="col-md-12 ">
                    <div class="card-body table-responsive p-0" style="height: 380px;">
                        <asp:GridView runat="server" ID="dgvtimbooktheoten" AutoGenerateColumns="false" class="table table-bordered table-head-fixed table-hover text-nowrap text-center">
                            <Columns>
                                <asp:BoundField DataField="MaVe" HeaderText="Mã vé" />
                                <asp:BoundField DataField="MaTour" HeaderText="MaTour" />
                                <asp:BoundField DataField="MaLT" HeaderText="MaLT" />
                                <asp:BoundField DataField="MaKH" HeaderText="MaKH" />
                                <asp:BoundField DataField="MaNV" HeaderText="MaNV" />
                                <asp:BoundField DataField="NgayBook" HeaderText="Ngày Book" />
                               <%-- <asp:TemplateField>
                                    <HeaderTemplate>
                                        Ngày Book
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# ((DateTime)Eval("NgayBook")).ToString("dd/MM/yyyy")%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                <%-- <asp:BoundField DataField="GiaTien" HeaderText="GiaTien" />
                                <asp:BoundField DataField="TenNV" HeaderText="Tên Nhân viên" />--%>
                <%-- <asp:TemplateField>
                                    <HeaderTemplate>
                                        tên nhân viên
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# gettennv(Eval("TenNV").ToString()) %>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                <%--</Columns>
                        </asp:GridView>
                    </div--%>>
            </div>
            --%>
                Tổng doanh thu:
            <asp:Label runat="server" ID="lbtongdt"></asp:Label>
            <span>VND</span>
        </div>
    </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.24/datatables.min.js"></script>

    <script src="//code.jquery.com/jquery-3.5.1.js"></script>
    <script src="//cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="//cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="//cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
    <script src="//cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>
</asp:Content>
