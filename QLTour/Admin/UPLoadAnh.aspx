<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/mtHome.Master" AutoEventWireup="true" CodeBehind="UPLoadAnh.aspx.cs" Inherits="QLTour.Admin.UPLoadAnh" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-7">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Danh sách ảnh/video của sản phẩm</h5>
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
                    <div class="row">
                        <div class="col-12">
                            <asp:GridView runat="server" 
                                class="table table-bordered table-hover" 
                                ID="dgvAnh" 
                                AutoGenerateColumns="false"
                            >
                                <Columns>
                                    <asp:BoundField DataField="ID_Media" HeaderText="ID" />
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            Ảnh
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <img width="200" src='<%# "../Images/" + Eval("Url") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CheckBoxField DataField="Main" HeaderText="Ảnh đại diện" />
                                   
                                    
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            Chức năng
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            
                                            <asp:LinkButton runat="server" ID="btnXoa" Text="Xóa"
                                                OnClientClick="return valid();"
                                                CommandArgument='<%# Eval("MaTour").ToString() %>' 
                                                OnCommand="btnXoa_Command"></asp:LinkButton>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-5">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Upload ảnh sản phẩm</h5>
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
                        <div class="form-group"><label class="col-lg-2 control-label">ID</label>
                            <div class="col-lg-10">
                                <asp:TextBox Enabled="false" runat="server" ID="txtIDMedia" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="form-group"><label class="col-lg-2 control-label">Tour</label>
                            <div class="col-lg-10">
                                <asp:TextBox Enabled="false" runat="server" ID="txtMaTour" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="form-group"><label class="col-lg-2 control-label">Upload file</label>
                            <div class="col-lg-10">
                                <asp:FileUpload runat="server" id="fuUrl" class="form-control"></asp:FileUpload>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <div class="checkbox i-checks"><label> 
                                    <asp:CheckBox runat="server" ID="chkMain" /><i></i> Ảnh đại diện </label></div>
                            </div>
                        </div>  
                        <asp:Label runat="server" ID="lbloi" CssClass="text-danger"></asp:Label>
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <asp:LinkButton runat="server" ID="btnSave" class="btn btn-sm btn-info" 
                                    OnClick="btnSave_Click">Lưu</asp:LinkButton>
                                <asp:Button runat="server" ID="btnCancel" class="btn btn-white" Text="Thoát" OnClick="btnCancel_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script>
        function valid() {
            if (confirm("Bạn thực sự muốn xóa?") == true) {
                return true;
            }
            return false;
        }
    </script>

    <script>
        function CheckOne(obj) {
            var grid = obj.parentNode.parentNode.parentNode;
            var inputs = grid.getElementsByTagName("input");
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].type == "checkbox") {
                    if (obj.checked && inputs[i] != obj && inputs[i].checked) {
                        inputs[i].checked = false;
                    }
                }
            }
        }
    </script>
</asp:Content>
