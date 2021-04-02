<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="QLPhuongTien.aspx.cs" Inherits="QLTour.Admin.QLPhuongTien" %>
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
                    <div class="form-horizontal">
                        <asp:Label runat="server" ID="lbErrordangky" CssClass="text-danger"></asp:Label>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Mã phương tiện <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtMaPT" class="form-control"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: Xe khách Xmans</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Tên phương tiện <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtTenPT" class="form-control"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: Xe khách Xmans</span>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Mã loại phương tiện <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:DropDownList runat="server" ID="cmbMaLPT" class="form-control m-b">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Số chỗ <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:DropDownList runat="server" ID="cmbSoCho" class="form-control m-b">
                                </asp:DropDownList>
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
