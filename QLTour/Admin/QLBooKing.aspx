<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="QLBooKing.aspx.cs" Inherits="QLTour.Admin.QLBooKing" %>

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
                    <h5>Chi tiết thông tin BooKing</h5>
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
                        <asp:Label runat="server" ID="lbErrordangky" CssClass="text-danger"></asp:Label>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Mã Vé <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtMaVe" CssClass="form-control"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: v001</span>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Mã Tour <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:DropDownList runat="server" ID="cmbMaTour" class="form-control m-b">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Số người lớn <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <div class="form-group row">
                                    <div class="col-md-2">
                                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbSLNL" class="form-control col-sm-2" placeholder="số người lớn" />

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Số trẻ em <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <div class="form-group row">
                                    <div class="col-md-2">
                                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbSLTE" class="form-control col-sm-2" placeholder="số trẻ em" />

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Mã lịch trình <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:DropDownList runat="server" ID="cmbMaLT" class="form-control m-b">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Giá Tiền <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtGiaTien" class="form-control"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: 15,000,000</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Mã khách hàng <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:DropDownList runat="server" ID="cmbMaKH" class="form-control m-b">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Mã địa điểm du lịch <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:DropDownList runat="server" ID="cmbMaDDDL" class="form-control m-b">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Mã nhân viên <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtMaNV" class="form-control"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: 15,000,000</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Trạng thái <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:DropDownList runat="server" ID="cmbTrangThai" class="form-control m-b">
                                    <asp:ListItem Value="0" Text="Chờ duyệt"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Đã duyệt"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Không được duyệt"></asp:ListItem>
                                </asp:DropDownList>
                                <span class="help-block m-b-none">VD: chờ duyệt</span>
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
