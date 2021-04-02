<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="QLCTTour.aspx.cs" Inherits="QLTour.Admin.QLCTTour" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        span#ContentPlaceHolder1_lbthongbao {
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
                    <asp:Label runat="server" ID="lbthongbao" class="form-group" CssClass="text-danger"></asp:Label>
                    <div class="form-group"><label class="col-sm-2 control-label">Mã chi tiết Tour <span class="text-danger">*</span></label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" ID="txtMaCTTour" class="form-control"></asp:TextBox>
                            <span class="help-block m-b-none">Ví dụ: ctt001</span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group"><label class="col-sm-2 control-label">Mã Tour <span class="text-danger">*</span></label>
                        <div class="col-sm-10">
                            <asp:DropDownList runat="server" ID="cmbMaTour" class="form-control m-b">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group"><label class="col-sm-2 control-label">Tên Tour <span class="text-danger">*</span></label>
                        <div class="col-sm-10">
                            <asp:DropDownList runat="server" ID="cmbTenTour" class="form-control m-b">
                            </asp:DropDownList>
                        </div>
                    </div>
                   
                    <div class="hr-line-dashed"></div>
                    <div class="form-group"><label class="col-sm-2 control-label">Mã địa điểm du lịch <span class="text-danger">*</span></label>
                        <div class="col-sm-10">
                            <asp:DropDownList runat="server" ID="cmbMaDDDL" class="form-control m-b">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group"><label class="col-sm-2 control-label">Mã khách sạn <span class="text-danger">*</span></label>
                        <div class="col-sm-10">
                            <asp:DropDownList runat="server" ID="cmbMaKS" class="form-control m-b">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group"><label class="col-sm-2 control-label">Giá vé người lớn <span class="text-danger" >*</span></label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" ID="txtGiaVeNL" class="form-control"></asp:TextBox>
                            <span class="help-block m-b-none">Ví dụ: 15,000,000</span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group"><label class="col-sm-2 control-label">Giá vé trẻ em <span class="text-danger">*</span></label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" ID="txtGiaVeTE" class="form-control"></asp:TextBox>
                            <span class="help-block m-b-none">Ví dụ: 15,000,000</span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group"><label class="col-sm-2 control-label">Mã loại phương tiện <span class="text-danger">*</span></label>
                        <div class="col-sm-10">
                            <asp:DropDownList runat="server" ID="cmbMaLPT" class="form-control m-b">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group"><label class="col-sm-2 control-label">Mô tả chi tiết tour <span class="text-danger">*</span></label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" ID="txtMoTaCT" class="form-control"></asp:TextBox>
                            <span class="help-block m-b-none">Ví dụ: ctt001</span>
                        </div>
                    </div>
                    
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="col-sm-4 col-sm-offset-2">
                            <asp:Button runat="server" ID="btnCancel" class="btn btn-white" Text="Hủy" OnClick="btnCancel_Click" />
                            <asp:Button runat="server" ID="btnSave" class="btn btn-primary" Text="Lưu lại" OnClick="btnSave_Click"/>
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
