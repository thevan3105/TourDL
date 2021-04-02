<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="QLNhanVien.aspx.cs" Inherits="QLTour.Admin.QLNhanVien" %>
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
                            <label class="col-sm-2 control-label">Mã nhân viên <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtMaNV" class="form-control" ></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: nv001</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Tên nhân viên <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" placeholder="Bắt buộc" ID="txtTenNV" class="form-control" ></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: An Phương</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Nghiệp Vụ <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:DropDownList runat="server" ID="cmbnghiepvu" class="form-control m-b">
                                    <asp:ListItem Value="Admin" Text="Admin"></asp:ListItem>
                                    <asp:ListItem Value="Manager" Text="Manager"></asp:ListItem>
                                    <asp:ListItem Value="SELL" Text="SELL"></asp:ListItem>
                                    <asp:ListItem Value="CSKH" Text="CSKH"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                        <label class="col-sm-2 control-label">Ngày sinh <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <div class="form-group row">
                                    <div class="col-md-2">
                                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbNgay" class="form-control col-sm-2" placeholder="Ngày" />

                                    </div>
                                    <div class="col-md-2">
                                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbThang" class="form-control col-sm-2" placeholder="Tháng" />

                                    </div>
                                    <div class="col-md-2">
                                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbNam" class="form-control col-sm-2" placeholder="Năm" />

                                    </div>
                                </div>
                                <span class="help-block m-b-none">Ví dụ: 12/03/2020</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Giới Tính <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:DropDownList runat="server" ID="cmbgoitinh" class="form-control m-b">
                                    <asp:ListItem Value="Nam" Text="Nam"></asp:ListItem>
                                    <asp:ListItem Value="Nữ" Text="Nữ"></asp:ListItem>
                                    <asp:ListItem Value="Không xác định" Text="Không xác định"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Địa chỉ <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtDiaChi" class="form-control" ></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: Hà Nội</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Số điện thoại <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtSDT" class="form-control" TextMode="Number"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: 034435349</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Tài Khoản <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" placeholder="Bắt buộc" ID="txtTaiKhoan" class="form-control" ></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: admin</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Mật Khẩu <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" TextMode="Password" ID="txtMatKhau" class="form-control" placeholder="Password"  />
                                <span class="help-block m-b-none">Ví dụ: ksgkdfjnh</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Nhập Lại Mật Khẩu <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" TextMode="Password" ID="txtMatKhau2" class="form-control" placeholder="Retype password"  />
                                <span class="help-block m-b-none">Ví dụ: ksgkdfjnh</span>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <asp:Button runat="server" ID="btnCancel" class="btn btn-white" Text="Hủy" OnClick="btnCancel_Click" />
                                <asp:Button runat="server" ID="btnSave" class="btn btn-primary" Text="Lưu lại" OnClick="btnSave_Click" />
                                <asp:Button runat="server" ID="btnAdd" class="btn btn-primary" Text="Thêm mới" OnClick="btnAdd_Click" />
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
