<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="QLDDDL.aspx.cs" Inherits="QLTour.Admin.QLDDDL" %>

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
                    <h5>Chi tiết thông tin địa điểm du lịch</h5>
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
                            <label class="col-sm-2 control-label">Mã địa điểm du lịch <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtMaDDDL" class="form-control"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: dl001</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Tên địa điểm du lịch <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtTenDDDL" class="form-control"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: Tràng An</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Địa chỉ <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtDiaChi" class="form-control"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: Huế</span>
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
