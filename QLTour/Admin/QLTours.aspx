<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="QLTours.aspx.cs" Inherits="QLTour.Admin.QLTours" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        span#ContentPlaceHolder1_lbloi {
            margin-left: 45%;
        }
    </style>
    <%--<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Chi tiết sản phẩm</title>

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Chi tiết thông tin Tour</h5>
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
                <asp:Label runat="server" ID="lbloi" CssClass="text-danger"></asp:Label>
                    <br />
                <div class="form-horizontal">
                    <div class="form-group"><label class="col-sm-2 control-label">Mã Tour <span class="text-danger">*</span></label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" ID="txtMaTour" class="form-control"></asp:TextBox>
                            <span class="help-block m-b-none">Ví dụ: x001</span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group"><label class="col-sm-2 control-label">Tên Tour <span class="text-danger">*</span></label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" ID="txtTenTour" class="form-control"></asp:TextBox>
                            <span class="help-block m-b-none">Ví dụ: Bắc Giang</span>
                        </div>
                    </div>
                    
                    <div class="hr-line-dashed"></div>
                    <div class="form-group"><label class="col-sm-2 control-label">Mã loại tour <span class="text-danger">*</span></label>
                        <div class="col-sm-10">
                            <asp:DropDownList runat="server" ID="cmbMaLoaiTour" class="form-control m-b">
                                <asp:ListItem Value="lt001" Text="Miền Bắc"></asp:ListItem>
                                <asp:ListItem Value="lt002" Text="Miền Trung"></asp:ListItem>
                                <asp:ListItem Value="lt003" Text="Miền Nam"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group"><label class="col-sm-2 control-label">Giá Tour <span class="text-danger">*</span></label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" ID="txtGiaTour" class="form-control"></asp:TextBox>
                            <span class="help-block m-b-none">Ví dụ: 15,000,000</span>
                        </div>
                    </div>
                    
                    <div class="hr-line-dashed"></div>
                    <div class="form-group"><label class="col-sm-2 control-label">Min User<span class="text-danger">*</span></label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" ID="txtMinUser" class="form-control"></asp:TextBox>
                            <span class="help-block m-b-none">Ví dụ: 20</span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group"><label class="col-sm-2 control-label">Max User <span class="text-danger">*</span></label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" ID="txtMaxUser" class="form-control"></asp:TextBox>
                            <span class="help-block m-b-none">Ví dụ: 30</span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group"><label class="col-sm-2 control-label">Miêu tả ngắn <span class="text-danger">*</span></label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" ID="txtMieuTaNgan" class="form-control"></asp:TextBox>
                            <span class="help-block m-b-none">Ví dụ: 30</span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="col-sm-4 col-sm-offset-2">
                            <asp:Button runat="server" ID="btnCancel" class="btn btn-white" Text="Hủy" OnClick="btnCancel_Click"/>
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
    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>

    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
            });
        </script>
</asp:Content>
