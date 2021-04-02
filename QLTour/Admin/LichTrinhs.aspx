<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="LichTrinhs.aspx.cs" Inherits="QLTour.Admin.LichTrinhs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Lịch Trình</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="index.html">Home</a>
                </li>
                <li>
                    <a>Danh mục</a>
                </li>
                <li class="active">
                    <strong>Lịch Trình</strong>
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
                <div class="ibox-content">
                    <asp:HyperLink runat="server" ID="hplBtnThem" class="btn btn-info" NavigateUrl="QLLichTrinh.aspx">Thêm Lịch Trình</asp:HyperLink>

                    <asp:GridView runat="server" ID="dgvLichTrinh"
                        class="table table-bordered table-hover"
                        AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="MaLT" HeaderText="Mã Lịch Trình" />
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Ngày bắt đầu
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# ((DateTime)Eval("NgayBD")).ToString("dd/MM/yyyy - HH:mm")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Ngày kết thúc
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# ((DateTime)Eval("NgayKT")).ToString("dd/MM/yyyy - HH:mm")%>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="MaTour" HeaderText="Mã Tour" />
                            <asp:BoundField DataField="MaPT" HeaderText="Mã Phương tiện" />
                            <asp:BoundField DataField="Slot" HeaderText="Slot" />

                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Chức năng
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" ID="btnSua" Text="Sửa" NavigateUrl='<%# "QLLichTrinh.aspx?malt=" + Eval("MaLT").ToString() %>' />
                                    <asp:LinkButton runat="server" ID="btnXoa" Text="Xóa"
                                        OnClientClick="return valid();"
                                        CommandArgument='<%# Eval("MaLT").ToString() %>'
                                        OnCommand="btnXoa_Command" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:GridView runat="server" ID="dgvLichTrinhCSKH"
                        class="table table-bordered table-hover"
                        AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="MaLT" HeaderText="Mã Lịch Trình" />
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Ngày bắt đầu
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# ((DateTime)Eval("NgayBD")).ToString("dd/MM/yyyy - HH:mm")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Ngày kết thúc
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# ((DateTime)Eval("NgayKT")).ToString("dd/MM/yyyy - HH:mm")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:BoundField DataField="MaTour" HeaderText="Mã Tour" />
                            <asp:BoundField DataField="MaPT" HeaderText="Mã Phương tiện" />

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
