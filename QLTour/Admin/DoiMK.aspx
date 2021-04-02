<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoiMK.aspx.cs" Inherits="QLTour.Admin.DoiMK" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>Đổi mật khẩu | E-Tour</title>

    <link href="Template/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Template/font-awesome/css/font-awesome.css" rel="stylesheet"/>

    <link href="Template/css/animate.css" rel="stylesheet"/>
    <link href="Template/css/style.css" rel="stylesheet"/>
</head>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>Đổi mật khẩu | E-Tour</title>

    <link href="Template/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Template/font-awesome/css/font-awesome.css" rel="stylesheet"/>

    <link href="Template/css/animate.css" rel="stylesheet"/>
    <link href="Template/css/style.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        <div style="background-image: url('../Images/wallpapers1.jpg'); background-size:100% 100%; height: 760px;">
            <div class="loginColumns animated fadeInDown">
                <div class="row">

                    <div class="col-md-6">
                        <h2 class="font-bold">Welcome to IN+</h2>

                        <p>
                            tôi là mạnh
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
                            <div class="m-t" role="form">
                                <%--<div class="form-group">
                                    <asp:TextBox runat="server" TextMode="SingleLine" ID="txtTaiKhoan" class="form-control" placeholder="Tài khoản" required="" />
                                </div>--%>
                                <div class="form-group">
                                    <asp:TextBox runat="server" TextMode="Password" ID="txtMatKhauCu" class="form-control" placeholder="Mật khẩu cũ" required="" />
                                </div>
                                <div class="form-group">
                                    <asp:TextBox runat="server" TextMode="Password" ID="txtMatKhauMoi" class="form-control" placeholder="Mật khẩu mới" required="" />
                                </div>
                                <div class="form-group">
                                    <asp:TextBox runat="server" TextMode="Password" ID="txtMatKhauMoi2" class="form-control" placeholder="NHập lại Mật khẩu mới" required="" />
                                </div>
                                <asp:Label runat="server" ID="lbError" CssClass="text-danger"></asp:Label>
                                <!--<button type="submit" class="btn btn-primary block full-width m-b">Login</button> -->
                                <asp:Button runat="server"
                                    ID="btnDoiMK"
                                    Text="Đổi mật khẩu"
                                    class="btn btn-primary block full-width m-b" 
                                    OnClick="btnLogin_Click" />

                            </div>
                            <p class="m-t">
                                <small>Inspinia we app framework base on Bootstrap 3 &copy; 2014</small>
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