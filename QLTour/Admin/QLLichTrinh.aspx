<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="QLLichTrinh.aspx.cs" Inherits="QLTour.Admin.QLLichTrinh" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Mã lịch trình <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtMaLT" class="form-control"></asp:TextBox>
                                <span class="help-block m-b-none">Ví dụ: lt001</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Ngày bắt đầu <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <div class="form-group row">
                                    <div class="col-md-2">
                                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbNgaybd" class="form-control col-sm-2" placeholder="Ngày" />

                                    </div>
                                    <div class="col-md-2">
                                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbThangbd" class="form-control col-sm-2" placeholder="Tháng" />

                                    </div>
                                    <div class="col-md-2">
                                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbNambd" class="form-control col-sm-2" placeholder="Năm" />

                                    </div>
                                    <div class="col-md-2">
                                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbGiobd" class="form-control col-sm-2" placeholder="Giờ" />

                                    </div>
                                    <div class="col-md-2">
                                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbPhutbd" class="form-control col-sm-2" placeholder="Phút" />

                                    </div>
                                    <%--<div class="col-md-2">
                                    <asp:TextBox runat="server" ID="txtGiobd" class="form-control"></asp:TextBox>

                                </div>--%>
                                </div>
                                <span class="help-block m-b-none">Ví dụ: 12/03/2020 15:00 AM</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Ngày kết thúc <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <span class="help-block m-b-none">Ví dụ: 12/03/2020 15:00 AM</span>
                                <div class="form-group row">
                                    <div class="col-md-2">
                                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbNgay" class="form-control col-sm-2" placeholder="Ngày" />

                                    </div>
                                    <div class="col-md-2">
                                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbThang" class="form-control col-sm-2" placeholder="Tháng" />

                                    </div>
                                    <div class="col-md-2">
                                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbNam" class="form-control col-sm-2" placeholder="Năm" />

                                    </div>
                                    <div class="col-md-2">
                                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbGio" class="form-control col-sm-2" placeholder="Giờ" />

                                    </div>
                                    <div class="col-md-2">
                                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbPhut" class="form-control col-sm-2" placeholder="Phút" />

                                    </div>
                                    <%--<div class="col-md-1">
                                <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbGio" class="form-control col-sm-2" placeholder="Giờ" />

                                </div>
                                <div class="col-md-1">
                                <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbPhut" class="form-control col-sm-2" placeholder="Phút" />
                                        
                                </div>
                                <div class="col-md-1">
                                <asp:DropDownList runat="server" TextMode="SingleLine" ID="cmbGiay" class="form-control col-sm-2" placeholder="Giây" />
                                        
                                </div>--%>
                                </div>
                            </div>

                        </div>

                        

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Mã Tour <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:DropDownList runat="server" ID="cmbMaTour" class="form-control m-b" Width="500">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Mã Phương tiện  <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:DropDownList runat="server" ID="cmbMaPT" class="form-control m-b" Width="500">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Số chỗ còn lại  <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox runat ="server" ID="txtSlot" Width="100" TextMode="Number"></asp:TextBox>
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
