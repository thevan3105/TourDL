<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="QLTour.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>E-Tour | Register</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="shortcut icon" href="Template/images/ie.ico"/>
    <link href="Admin/Template/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Admin/Template/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="Admin/Template/css/plugins/iCheck/custom.css" rel="stylesheet" />
    <link href="Admin/Template/css/animate.css" rel="stylesheet" />
    <link href="Admin/Template/css/style.css" rel="stylesheet" />
</head>
<body class="gray-bg">
    <form id="form1" runat="server">
        <div style="background-image: url('Images/background_register.jpg'); width: 100%; height: 100%;">
            <br />
            <br />
            <br />
            <h1 class="logo-name" style="text-align: center; font-size: 135px;">E-Tour</h1>
            <div class="middle-box text-center loginscreen   animated fadeInDown">
                <div>
                    <div>
                    </div>
                    <h3>Đăng ký E-Tour</h3>
                    <p>Tạo tài khoản để xem những nơi đẹp nhất.</p>
                    <div class="m-t">
                        <div class="form-group">
                            <asp:TextBox runat="server" TextMode="SingleLine" ID="txtTaiKhoan" class="form-control" placeholder="Tài khoản" required="" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox runat="server" TextMode="Password" ID="txtMatKhau" class="form-control" placeholder="Mật khẩu" required="" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox runat="server" TextMode="Password" ID="txtXTMatKhau" class="form-control" placeholder="Xác nhận mật khẩu" required="" />
                        </div>
                        <div class="form-group">
                            <div class="checkbox i-checks">
                                <asp:CheckBox ID="checkbox1" runat="server"
                                    Text="Đồng ý với các điều khoản và chính sách"
                                    TextAlign="Right" />
                            </div>
                        </div>
                        <%--<button type="submit" class="btn btn-primary block full-width m-b">Register</button>--%>
                        <asp:Label runat="server" ID="lbError" CssClass="text-danger"></asp:Label>
                        <asp:Button runat="server"
                            ID="btnRegister"
                            Text="Đăng ký"
                            class="btn btn-primary block full-width m-b"
                            OnClick="btnRegister_Click" />

                        <p class="text-muted text-center"><small>Bạn có sẵn một tài khoản?</small></p>
                        <%--<a class="btn btn-sm btn-white btn-block" href="login.html">Login</a>--%>
                        <a href="Login.aspx" class="btn btn-sm btn-white btn-block">Login</a>
                    </div>
                    <p class="m-t"><small>E-tour đưa bạn đi khắp thế giới &copy; 2019</small> </p>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
            </div>
        </div>

        <!-- Mainly scripts -->
        <script src="js/jquery-2.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- iCheck -->
        <script src="js/plugins/iCheck/icheck.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green'
                });
            });
        </script>
    </form>

    <script src="Admin/Template/js/jquery-2.1.1.js"></script>
    <script src="Admin/Template/js/bootstrap.min.js"></script>
</body>
</html>
