<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="QLTour.Admin.Search" %>

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
        .home_content {
            margin-top: 157px;
        }

        .offers_item.rating_5 .row {
            display: flex;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Home -->

    <div class="home">
        <%--<div class="home_background parallax-window" data-parallax="scroll" data-image-src="Template/images/about_background.jpg"></div>--%>
        <div class="home_content">
            <div class="home_title">THÔNG TIN TÌM KIẾM >> TỪ KHÓA TÌM KIẾM : '<asp:Label runat="server" ID="lbkeysearch"></asp:Label>'  </div>
        </div>
        <asp:TextBox runat="server" ID="txtSearch" CssClass="hidden"></asp:TextBox>
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
                                <asp:GridView runat="server" ID="dgvNhanVien"
                                    class="table table-bordered table-hover"
                                    AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" />
                                        <asp:BoundField DataField="TenNV" HeaderText="Tên nhân viên" />
                                        <asp:BoundField DataField="NghiepVu" HeaderText="Nghiệp vụ" />
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Ngày sinh
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# ((DateTime)Eval("NgaySinh")).ToString("dd/MM/yyyy")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="GioiTinh" HeaderText="Giới tính" />
                                        <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
                                        <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" />
                                        <asp:BoundField DataField="TaiKhoan" HeaderText="tài khoản" />

                                    </Columns>
                                </asp:GridView>
                                <asp:GridView runat="server" ID="dgvbooking"
                                    class="table table-bordered table-hover"
                                    AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="MaVe" HeaderText="Mã vé" />
                                        <asp:BoundField DataField="MaTour" HeaderText="Tên nhân viên" />
                                        <asp:BoundField DataField="MaLT" HeaderText="Mã Lịch trình" />
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Ngày Book
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# ((DateTime)Eval("NgayBook")).ToString("dd/MM/yyyy")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" />
                                        <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" />
                                        <asp:BoundField DataField="MaDDDL" HeaderText="Mã địa điểm du lịch" />
                                        <asp:BoundField DataField="GiaTien" HeaderText="Giá tiền" />

                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <h2 style="text-align: center">
                <asp:Label runat="server" ID="lbNotFound"></asp:Label></h2>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script src="Template/js/jquery-3.2.1.min.js"></script>
    <script src="Template/styles/bootstrap4/popper.js"></script>
    <script src="Template/styles/bootstrap4/bootstrap.min.js"></script>
    <script src="Template/plugins/Isotope/isotope.pkgd.min.js"></script>
    <script src="Template/plugins/easing/easing.js"></script>
    <script src="Template/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="Template/js/offers_custom.js"></script>
</asp:Content>
