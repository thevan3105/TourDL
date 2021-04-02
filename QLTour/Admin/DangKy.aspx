<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="QLTour.Admin.DangKy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>DangKy</title>

    <link href="template/css/bootstrap.min.css" rel="stylesheet" />
    <link href="template/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="template/css/plugins/iCheck/custom.css" rel="stylesheet" />
    <link href="template/css/animate.css" rel="stylesheet" />
    <link href="template/css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="loginColumns animated fadeInDown">
            <div class="row">
                <div class="col-md-6">
                    <h2 class="font-bold">Đăng Ký</h2>
                    <p>
                        Perfectly designed and precisely prepared admin theme with over 50 pages with extra new web app views.
                   
                    </p>

                    <p>
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.
                   
                    </p>

                    <p>
                        When an unknown printer took a galley of type and scrambled it to make a type specimen book.
                   
                    </p>

                    <p>
                        <small>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</small>
                    </p>

                </div>
                <div class="col-md-6">
                    <div class="ibox-content">
                        <div class="m-t">
                            <div class="form-group">
                                <asp:TextBox runat="server" TextMode="SingleLine" ID="txtMaNV" class="form-control" placeholder="Mã nhân viên" />
                            </div>
                            <div class="form-group">
                                <asp:TextBox runat="server" TextMode="SingleLine" ID="txtName" class="form-control" placeholder="Tên người dùng" required="" />
                            </div>
                            <div class="form-group">
                                <asp:TextBox runat="server" TextMode="SingleLine" ID="txtTaiKhoan" class="form-control" placeholder="Tên tài khoản" required="" />
                            </div>
                            <div class="form-group">
                                <asp:TextBox runat="server" TextMode="Password" ID="txtMatKhau" class="form-control" placeholder="Mật khẩu" required="" />
                            </div>
                            <div class="form-group">
                                <asp:TextBox runat="server" TextMode="Password" ID="txtMatKhau2" class="form-control" placeholder="Nhập lại mật khẩu" required="" />
                            </div>

                            <div class="form-group">
                                <div class="hr-line-dashed"></div>
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

                            <div class="form-group">
                                <asp:TextBox runat="server" TextMode="SingleLine" ID="txtNgaySinh" class="form-control" placeholder="Ngay sinh"  />
                            </div>
                            <div class="form-group row">
                                <div class="col-md-4">
                                <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbNgay" class="form-control col-sm-2" placeholder="Ngày" />

                                </div>
                                <div class="col-md-4">
                                <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbThang" class="form-control col-sm-2" placeholder="Tháng" />

                                </div>
                                <div class="col-md-4">
                                <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbNam" class="form-control col-sm-2" placeholder="Năm" />

                                </div>
                            </div>

                            <div class="form-group">
                                <asp:TextBox runat="server" TextMode="SingleLine" ID="txtGioiTinh" class="form-control" placeholder="Giới tính" required="" />
                            </div>
                            <div class="form-group">
                                <asp:TextBox runat="server" TextMode="SingleLine" ID="txtDiaChi" class="form-control" placeholder="Địa chỉ" required="" />
                            </div>
                            <div class="form-group">
                                <asp:TextBox runat="server" TextMode="SingleLine" ID="txtSDT" class="form-control" placeholder="Số điện thoại" required="" />
                            </div>
                            <asp:Label runat="server" ID="lbdone" CssClass="text-danger"></asp:Label>
                            <asp:Label runat="server" ID="lbErrordangky" CssClass="text-danger"></asp:Label>
                            <asp:Label runat="server" ID="lbdatontai" CssClass="text-danger"></asp:Label>
                            <asp:Label runat="server" ID="lbmatkhaukhongkhop" CssClass="text-danger"></asp:Label>
                            <asp:Button runat="server"
                                ID="btndangky"
                                Text="Dăng ký"
                                class="btn btn-primary block full-width m-b"
                                OnClick="btndangky_Click" />

                            <p class="text-muted text-center"><small>Already have an account?</small></p>
                            <a class="btn btn-sm btn-white btn-block" href="login.aspx">Login</a>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-6">
                    Copyright Example Company
               
                </div>
                <div class="col-md-6 text-right">
                    <small>© 2014-2015</small>
                </div>
            </div>
        </div>
    </form>
    <!-- Mainly scripts -->
    <script src="template/js/jquery-2.1.1.js"></script>
    <script src="template/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="template/js/plugins/iCheck/icheck.min.js"></script>

    <script>
        function valid() {
            if (confirm("Đăng ký thành công! Bạn có muốn thoát?") == true) {
                return true;
            }
            return false;
        }
    </script>
</body>
</html>
