<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="KhachSans.aspx.cs" Inherits="QLTour.Admin.KhachSans" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Edit {
            color: #1ab394;
            font-size: 30px;
            padding: 7px 5px 0px 0px;
        }
        .Delete {
            color: #fc2406;
            font-size: 30px;
            padding: 0px 0px 0px 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Khách Sạn</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="index.html">Home</a>
                </li>
                <li>
                    <a>Danh mục</a>
                </li>
                <li class="active">
                    <strong>Khách Sạn</strong>
                </li>
            </ol>
        </div>
        <div class="col-lg-2">
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <%--<h5>Border Table </h5>--%>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#">Config option 1</a>
                            </li>
                            <li><a href="#">Config option 2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content" style="box-shadow: 0 0 10px;">
                    <asp:HyperLink runat="server" ID="hplBtnThem" class="btn btn-info" NavigateUrl="QLKhachSan.aspx">Thêm Khách sạn</asp:HyperLink>

                    <asp:GridView runat="server" ID="dgvKhachSan"
                        class="table table-bordered table-hover"
                        AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="MaKS" HeaderText="Mã khách sạn" />
                            <asp:BoundField DataField="TenKS" HeaderText="Tên khách sạn" />
                            <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="MaDDDL" HeaderText="Mã địa điểm du lịch" />

                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Chức năng
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" ID="btnSua" class="fa fa-pencil-square-o Edit" NavigateUrl='<%# "QLKhachSan.aspx?maks=" + Eval("MaKS").ToString() %>' />
                                    <asp:LinkButton runat="server" ID="btnXoa" class="fa fa-times Delete"
                                        OnClientClick="return valid();"
                                        CommandArgument='<%# Eval("MaKS").ToString() %>'
                                        OnCommand="btnXoa_Command" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:GridView runat="server" ID="dgvKhachSanCSKH"
                        class="table table-bordered table-hover"
                        AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="MaKS" HeaderText="Mã khách sạn" />
                            <asp:BoundField DataField="TenKS" HeaderText="Tên khách sạn" />
                            <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="MaDDDL" HeaderText="Mã địa điểm du lịch" />


                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script>
        function valid() {
            if (confirm("Bạn thực sự muốn xóa?") == true) {
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
