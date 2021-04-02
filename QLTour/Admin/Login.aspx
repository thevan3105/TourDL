<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QLTour.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>Login | E-Tour</title>

    <link href="Template/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Template/font-awesome/css/font-awesome.css" rel="stylesheet"/>

    <link href="Template/css/animate.css" rel="stylesheet"/>
    <link href="Template/css/style.css" rel="stylesheet"/>
</head>
<body class="gray-bg">
    <form id="form1" runat="server">
        <div style="background-image: url('../Images/wallpapers1.jpg'); background-size:100% 100%; height: 760px;">
            <div class="loginColumns animated fadeInDown">
                <div class="row">

                    <div class="col-md-6">
                        <h2 class="font-bold" style="color: darkblue">Chào mừng đến E-Tour</h2>

                        <p>
                            Trang quản trị cung cấp những chức năng quản trị thực sự của một người quản trị.
                        </p>

                        <p>
                            Hãy cẩn thận với những gì bạn sẽ làm sau đây.
                        </p>

                        <p>
                            Khi tiếp tục, bạn hãy chú ý những cảnh báo, chúng tôi không chịu tránh nhiệm về bất kể thứ gì bạn gây ra.
                        </p>

                        <p>
                            <small>Khi bạn tiếp tục, bạn đồng ý với các điều khoản của chúng tôi.</small>
                        </p>

                    </div>
                    <div class="col-md-6">
                        <div class="ibox-content">
                            <div class="m-t" role="form">
                                <div class="form-group">
                                    <asp:TextBox runat="server" TextMode="SingleLine" ID="txtTaiKhoan" class="form-control" placeholder="Username" required="" />
                                </div>
                                <div class="form-group">
                                    <asp:TextBox runat="server" TextMode="Password" ID="txtMatKhau" class="form-control" placeholder="Password" required="" />
                                </div>
                                <asp:Label runat="server" ID="lbError" CssClass="text-danger"></asp:Label>
                                <!--<button type="submit" class="btn btn-primary block full-width m-b">Login</button> -->
                                <asp:Button runat="server"
                                    ID="btnLogin"
                                    Text="Login"
                                    class="btn btn-primary block full-width m-b"
                                    OnClick="btnLogin_Click" />

                                <a href="#">
                                    <small>Quên mật khẩu?</small>
                                </a>

                                <p class="text-muted text-center">
                                    <small>Bạn không có tài khoản?</small>
                                </p>
                                <a class="btn btn-sm btn-white btn-block" href="DangKy.aspx">Tạo tài khoản</a>
                            </div>
                            <p class="m-t">
                                <small>Thiết kế bởi Group ăn kem D12QTANM-DHDL &copy; 2020</small>
                            </p>
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
        </div>
    </form>
</body>
</html>
