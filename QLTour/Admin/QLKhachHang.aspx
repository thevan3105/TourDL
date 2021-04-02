<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="QLKhachHang.aspx.cs" Inherits="QLTour.Admin.QLKhachHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        span#ContentPlaceHolder1_lbErrordangky {
            margin-left: 45%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Quản lý nhân viên</h5>
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
                    <div class="form-horizontal">
                        <asp:Label runat="server" ID="lbdone" CssClass="text-danger"></asp:Label>
                        <asp:Label runat="server" ID="lbErrordangky" CssClass="text-danger"></asp:Label>
                        <asp:Label runat="server" ID="lbdatontai" CssClass="text-danger"></asp:Label>
                        <asp:Label runat="server" ID="lbmatkhaukhongkhop" CssClass="text-danger"></asp:Label>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Mã khách hàng <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtMaKH" class="form-control"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: kh001</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Tên khách hàng <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtTenKH" class="form-control" placeholder="Bắt buộc"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: An Phương</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Giới tính <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtGioiTinh" class="form-control"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: Nam</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Quốc tịch<span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtQuocTich" class="form-control"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: Việt Nam</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Chứng minh thư<span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtCMND" class="form-control" placeholder="Bắt buộc"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: 12/3/1990</span>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Địa chỉ <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtDiaChi" class="form-control"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: Hà Nội</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Số điện thoại <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtSDT" class="form-control"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: 034435349</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Tài Khoản <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtTaiKhoan" class="form-control" placeholder="Bắt buộc"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: nguyễn Mạnh</span>
                            </div>
                        </div>
                        

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <asp:Button runat="server" ID="btnCancel" class="btn btn-white" Text="Hủy" OnClick="btnCancel_Click1"/>
                                <asp:Button runat="server" ID="btnSave" class="btn btn-primary" Text="Lưu lại" OnClick="btnSave_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
