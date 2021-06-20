<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="BC_THongKE.aspx.cs" Inherits="QLTour.Admin.BC_THongKE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.24/datatables.min.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css" />
    
    
    <style>
        i.fa.fa-chevron-down {
            float: right;
            padding: 14px 3px 10px 0px;
        }
        input#ContentPlaceHolder1_btntimkiem {
            background-color: #23c6c8;
            border-color: #23c6c8;
            color: #FFFFFF;
            width: 94px;
            margin-top: 10px;
            height: 30px;
        }
        input#ContentPlaceHolder1_btnxuatex {
            background-color: #23c6c8;
            border-color: #23c6c8;
            color: #FFFFFF;
            width: 94px;
            margin-top: 10px;
            height: 30px;
            border-radius: 5px;
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
            width: 100%;
            border: none;
            font-family: sans-serif;
        }
        .offers_sorting_container {
            padding-bottom: 20px;
            border-bottom: 3px solid royalblue;
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

        .form-control {
            color: #db5246;
            width: 302px;
            margin: 10px;
            border-radius: 5px;
        }

        ul.offers_sorting {
            text-align: center;
            width: 100%;
            border:none;
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
            height: 50px;
            font-size: 18px;
            font-weight: 700;
            color: #2d2c2c;
            text-transform: uppercase;
            line-height: 50px;
            cursor: pointer;
            border: solid 2px #dadada;
            margin-right: 0px;
            border-radius: 5px;
        }

       
        /*.offers_item.rating_6 .row {
            margin-right: -15px;
            margin-left: 0px;
            color: black;
        }*/

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


        .offers_content {
            margin-top: 64px;
        }

        .offers_image_container {
            width: 100%;
            height: 100%;
            margin-top: 116px;
        }

        /*.offers_item.rating_5 .row {
            width: 100%;
            max-height: 380px;
            margin-left: 2px;
        }*/

        .table-responsive {
            min-height: .01%;
            overflow-x: auto;
            box-shadow: 0 0 10px;
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
        li.col-xs-12.col-md-4.col-lg-4.col-xl-4.content-header-right {
            float: revert;
        }
    </style>

    <style>
        div#example_wrapper {
            margin-top: 80px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="sumdoanhthu">
    </div>--%>
    <div class="hr-line-dashed"></div>
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
            <ul class="row offers_sorting">
                <li class="col-xs-12 col-md-8 col-lg-8 col-xl-8">
                    <span class="sorting_text"><asp:LinkButton runat="server" ID="lbtntourdatmax" OnClick="lbtntourdatmax_Click" >TOUR ĐẶT NHIỀU NHẤT / TỔNG DOANH THU</asp:LinkButton></span>
                    <i class="fa fa-chevron-down"></i>
                </li>
                <li class="col-xs-12 col-md-4 col-lg-4 col-xl-4 content-header-right">
                    <span class="sorting_text"><asp:LinkButton runat="server" ID="lbttimbooktheoten" OnClick="lbttimbooktheoten_Click" >BOOKING THEO NAME $ TIMES</asp:LinkButton></span>
                    <i class="fa fa-chevron-down"></i>
                </li>
            </ul>
        </div>
        <asp:Button  runat="server" ID="btnxuatex" OnClick="btnxuatex_Click" Text="Xuất Excel" />
        <div class="form-group">
            <div class="row">
                <asp:TextBox runat="server" ID="txttimkiem" placeholder="Tìm kiếm..." class="col-xs-12 col-md-4 col-lg-4 form-control"></asp:TextBox>
                <asp:TextBox runat="server" ID="txttimngaybd" placeholder="Ngày bắt đầu 01/01/2020..." class="col-xs-12 col-md-4 col-lg-4 form-control"></asp:TextBox>
                <asp:TextBox runat="server" ID="txttimngaykt" placeholder="Ngày kết thúc 10/10/2021..." class="col-xs-12 col-md-4 col-lg-4 form-control"></asp:TextBox>
                <asp:Button runat="server" ID="btntimkiem"  Text="Tìm kiếm" class="col-xs-12 col-md-1 col-lg-1 form-control" OnClick="btntimkiem_Click" />
            </div>
        </div>
        <%--Reoeater hiển thị all--%>
        <div class="offers_item rating_5">
            <div class="row">
                <div class="col-md-12 ">
                    <div class="card-body table-responsive p-0" style="height: 500px;">
                        <asp:GridView runat="server" ID="dgvtimbooktheoten" AutoGenerateColumns="false" class="table table-bordered table-head-fixed table-hover text-nowrap text-center">
                            <Columns>
                                <asp:BoundField DataField="MaVe" HeaderText="Mã vé" />
                                <asp:BoundField DataField="MaTour" HeaderText="Mã tour" />
                                <asp:BoundField DataField="MaLT" HeaderText="Mã lịch trình" />
                                <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" />
                                <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" />
                                <%--<asp:BoundField DataField="NgayBook" HeaderText="Ngày Book" />--%>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Ngày Book
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# ((DateTime)Eval("NgayBook")).ToString("dd/MM/yyyy")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Giá tiền
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# ((int)Eval("GiaTien")).ToString("N0")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:BoundField DataField="GiaTien" HeaderText="GiaTien" />--%>
                                <asp:BoundField DataField="TenNV" HeaderText="Tên Nhân viên" />

                                <asp:BoundField DataField="MaNV" HeaderText="Mã Nhân viên" />
                                <asp:BoundField DataField="NghiepVu" HeaderText="Nghiệp vụ" />
                                <asp:BoundField DataField="GioiTinh" HeaderText="GioiTinh" />
                                <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" />
                                <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" />
                                <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh" />

                                <%-- <asp:TemplateField>
                                    <HeaderTemplate>
                                        tên nhân viên
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# gettennv(Eval("TenNV").ToString()) %>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                
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

    <%--<script>
        $(document).ready(function () {
            $('#example').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });
    </script>--%>
</asp:Content>
