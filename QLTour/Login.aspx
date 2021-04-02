<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QLTour.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>E-Tour | Login</title>

    <link rel="shortcut icon" href="Template/images/ie.ico"/>
    <link href="Admin/Template/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Admin/Template/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link href="Admin/Template/css/animate.css" rel="stylesheet" />
    <link href="Admin/Template/css/style.css" rel="stylesheet" />
</head>
<body class="gray-bg">
    <form id="form1" runat="server">
        <div style="background-image:url('Images/background_login.jpg'); width: 100%; height:100%;">
            <br />
            <br />
            <br />
            <br />
            <h1 class="logo-name" style="text-align:center; font-size:135px">E-Tour</h1>
            <div class="middle-box text-center loginscreen animated fadeInDown">
                <div>
                    <div>
                        
                        <%--<h1 class="logo-name">E-Tour</h1>--%>
                        
                    </div>
                    <h3>Chào mừng đến E-Tour</h3>
                    <p>
                        Bạn mong muốn đi khắp thế giới hãy, để chúng tôi giúp bạn thực hiện điều đó.
                <!--Continually expanded and constantly improved Inspinia Admin Them (IN+)-->
                    </p>
                    <p>Đăng nhập. Để xem điều đó.</p>
                    <div class="m-t">
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
                            Text="Đăng nhập"
                            class="btn btn-primary block full-width m-b"
                            OnClick="btnLogin_Click" />

                        <a href="#"><small>Quên mật khẩu?</small></a>
                        <p class="text-muted text-center"><small>Không có tài khoản?</small></p>
                        <%--<a class="btn btn-sm btn-white btn-block" href="register.html">Create an account</a>--%>
                        <a href="Register.aspx" class="btn btn-sm btn-white btn-block">Tạo một tài khoản</a>
                    </div>
                    <p class="m-t"><small>E-tour đưa bạn đi khắp thế giới &copy; 2019</small> </p>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:HiddenField ID="txtMaHK" runat="server" />
                    <asp:HiddenField ID="txtTenKH" runat="server" />
                    <asp:HiddenField ID="txtGioiTinh" runat="server" />
                    <asp:HiddenField ID="txtCMND" runat="server" />
                    <asp:HiddenField ID="txtDiaChi" runat="server" />
                    <asp:HiddenField ID="txtSDT" runat="server" />
                </div>
            </div>
        </div>
    </form>

    <script src="Admin/Template/js/jquery-2.1.1.js"></script>
    <script src="Admin/Template/js/bootstrap.min.js"></script>
</body>
</html>
