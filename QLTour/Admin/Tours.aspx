<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="Tours.aspx.cs" Inherits="QLTour.Admin.Tours" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        span#ContentPlaceHolder1_lbErrorxoa {
            margin-left: 45%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Tour</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="index.html">Home</a>
                </li>
                <li>
                    <a>Danh mục</a>
                </li>
                <li class="active">
                    <strong>Tour</strong>
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
                    <asp:Label runat="server" ID="lbErrorxoa" CssClass="text-danger"></asp:Label>
                    <br />
                    <asp:HyperLink runat="server" ID="hplBtnThem"  class="btn btn-info" NavigateUrl="QLTours.aspx">Thêm Tour</asp:HyperLink>
                    
                    <asp:GridView runat="server" ID="dgvTour" 
                        class="table table-bordered table-hover"
                        AutoGenerateColumns="false"
                    >
                        <Columns>
                            <asp:BoundField DataField="MaTour" HeaderText="Mã Tour" />
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Ảnh đại diện
                                </HeaderTemplate>
                                <ItemTemplate>
                                   
                                   <img width="400" height="266" id="atour" src='<%# "../Images/" + getAnhDaiDien(Eval("MaTour").ToString()) %>' />
                                    
                                    <br />
                                    <asp:HyperLink runat="server" ID="btnSuaAnh" Text="Sửa" NavigateUrl='<%# "UPLoadAnh.aspx?matour=" + Eval("MaTour").ToString() %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="TenTour" HeaderText="Tên Tour" />
                            <asp:BoundField DataField="MaLoaiTour" HeaderText="Mã loai tour" />
                            
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Giá Tour
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# ((Int32)Eval("GiaTien")).ToString("N0")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:BoundField DataField="MaxUser" HeaderText="Max User" />
                            <asp:BoundField DataField="MinUser" HeaderText="Min User" />
                            <asp:BoundField DataField="MoTa" HeaderText="Miêu tả ngắn" />
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Chức năng
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" ID="btnSua" Text="Sửa" NavigateUrl='<%# "QLTours.aspx?matour=" + Eval("MaTour").ToString() %>' />
                                    <asp:LinkButton runat="server" ID="btnXoa" Text="Xóa"
                                        OnClientClick="return valid();"
                                        CommandArgument='<%# Eval("MaTour").ToString() %>' 
                                        OnCommand="btnXoa_Command"
                                        />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    <asp:GridView runat="server" ID="dgvtourcskh" 
                        class="table table-bordered table-hover"
                        AutoGenerateColumns="false"
                    >
                        <Columns>
                            <asp:BoundField DataField="MaTour" HeaderText="Mã Tour" />
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Ảnh đại diện
                                </HeaderTemplate>
                                <ItemTemplate>
                                   
                                   <img width="400" height="266" id="atour" src='<%# "../Images/" + getAnhDaiDien(Eval("MaTour").ToString()) %>' />
                                   
                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="TenTour" HeaderText="Tên Tour" />
                            <asp:BoundField DataField="MaLoaiTour" HeaderText="Mã loai tour" />
                            
                            <asp:BoundField DataField="MaxUser" HeaderText="Max User" />
                            <asp:BoundField DataField="MinUser" HeaderText="Min User" />
                            <asp:BoundField DataField="MoTa" HeaderText="Miêu tả ngắn" />
                            
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
