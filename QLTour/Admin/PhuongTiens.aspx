<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="PhuongTiens.aspx.cs" Inherits="QLTour.Admin.PhuongTiens" %>

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
            <h2>Phương tiện</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="#">Home</a>
                </li>
                <li>
                    <a>Danh mục</a>
                </li>
                <li class="active">
                    <strong>Phương tiện</strong>
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
                    <asp:HyperLink runat="server" ID="hplBtnThem" class="btn btn-info" NavigateUrl="QLPhuongTien.aspx">Tạo mới phương tiện</asp:HyperLink>

                    <asp:GridView runat="server" ID="dgvPhuongTien"
                        class="table table-bordered table-hover"
                        AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="MaPT" HeaderText="Mã phương tiện" />
                            <asp:BoundField DataField="TenPT" HeaderText="Tên phương tiện" />
                            <asp:BoundField DataField="MaLPT" HeaderText="Mã loại phương tiện" />
                            <asp:BoundField DataField="SoCho" HeaderText="SoCho" />

                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Chức năng
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" ID="btnSua" class="fa fa-pencil-square-o Edit" NavigateUrl='<%# "QLPhuongTien.aspx?mapt=" + Eval("MaPT").ToString() %>' />
                                    <asp:LinkButton runat="server" ID="btnXoa" class="fa fa-times Delete"
                                        OnClientClick="return valid();"
                                        CommandArgument='<%# Eval("MaPT").ToString() %>'
                                        OnCommand="btnXoa_Command1" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:GridView runat="server" ID="dgvPhuongTienCSKH"
                        class="table table-bordered table-hover"
                        AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="MaPT" HeaderText="Mã phương tiện" />
                            <asp:BoundField DataField="TenPT" HeaderText="Tên phương tiện" />
                            <asp:BoundField DataField="MaLPT" HeaderText="Mã loại phương tiện" />
                            <asp:BoundField DataField="SoCho" HeaderText="SoCho" />


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
