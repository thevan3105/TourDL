<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="EditInfo.aspx.cs" Inherits="QLTour.EditInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Travelix Project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="Template/styles/bootstrap4/bootstrap.min.css">
    <link href="Template/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="Template/styles/contact_styles.css">
    <link rel="stylesheet" type="text/css" href="Template/styles/contact_responsive.css">
    <style>
        .input_field {
            color: black;
        }
        .rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: center
        }

            .rating > input {
                display: none
            }

            /*.rating > label {
                position: relative;
                width: 1em;
                font-size: 6vw;
                color: #FFD600;
                cursor: pointer
            }*/

                .rating > label::before {
                    content: "\2605";
                    position: absolute;
                    opacity: 0
                }

                .rating > label:hover:before,
                .rating > label:hover ~ label:before {
                    opacity: 1 !important
                }

            .rating > input:checked ~ label:before {
                opacity: 1
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="slider" runat="server">
    <div class="home">
        <div class="home_background parallax-window" data-parallax="scroll" data-image-src="Template/images/elements_background.jpg"></div>
        <div class="home_content">
            <div class="home_title">
                <a style="font-size: 50px">Xin chào
                <asp:Label runat="server" ID="lbTaiKhoan"></asp:Label>
                    !</a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Contact -->

    <%--<div class="contact_form_section">--%>
    <div class="container">
        <div class="row">
            <div class="col">

                <br />
                <!-- Contact Form -->
                <div class="contact_form_container">
                    <div class="contact_title text-center">Thông tin của bạn</div>
                    <div id="contact_form" class="contact_form text-center">
                        <asp:TextBox runat="server" TextMode="SingleLine" ID="txtName" class="contact_form_name input_field" placeholder="Tên" required="required" data-error="Name is required." />
                        <asp:DropDownList runat="server" TextMode="SingleLine" ID="cbGioiTinh" class="contact_form_email input_field" placeholder="Giới tính" required="required" data-error="Name is required.">
                            <asp:ListItem Value="Nam" Text="Nam" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="Nu" Text="Nữ" Selected="False"></asp:ListItem>
                            <asp:ListItem Value="Ko" Text="Không xác định"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox runat="server" TextMode="SingleLine" ID="txtQuocTich" class="contact_form_name input_field" placeholder="Quốc tịch" required="required" data-error="Name is required." />
                        <asp:TextBox runat="server" TextMode="SingleLine" ID="txtCMND" class="contact_form_email input_field" placeholder="Chứng minh nhân dân" required="required" data-error="Email is required." />
                        <asp:TextBox runat="server" TextMode="SingleLine" ID="txtDiaChi" class="contact_form_subject input_field" placeholder="Địa chỉ" required="required" data-error="Subject is required." />
                        <asp:TextBox runat="server" TextMode="SingleLine" ID="txtSoDT" class="contact_form_subject input_field" placeholder="Số điện thoại" required="required" data-error="Please, write us a message." />
                        <asp:Button runat="server"
                            ID="btnUpdate"
                            Text="Cập nhật"
                            class="form_submit_button button trans_200"
                            OnClick="btnUpdate_Click" />
                    </div>
                    <div style="text-align: right;">
                        <asp:HyperLink runat="server" ID="lDoiMK" Text="Đổi mật khẩu" NavigateUrl="DoiMK.aspx"></asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--</div>--%>

    <!-- About -->
    <div class="about">
        <div class="container">
            <div class="row">
                <%--<asp:Label runat="server" ID="lbtongtien" CssClass="text-danger"></asp:Label>--%>
                <div style="font-size: 41px;">&nbsp;&nbsp;Lịch sử của bạn</div>
                <asp:Label runat="server" ID="lbError" CssClass="text-danger"></asp:Label>
                <div style="float: left; width: 100%; text-align: center">
                    <asp:GridView runat="server" ID="dgvLichSu" class="table table-bordered table-hover" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="MaVe" HeaderText="Mã vé" />

                        <asp:TemplateField>
                                <HeaderTemplate>
                                    Tên tour
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# getTenTour(Eval("MaTour").ToString()) %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        <%--<asp:BoundField DataField="MaTour" HeaderText="Mã tour" />--%>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                SL người lớn
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# ((int)Eval("SLNguoiLon")).ToString() %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                SL trẻ em
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# ((int)Eval("SLTreEm")).ToString() %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Ngày bắt đầu
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# getLichtrinhBD(Eval("MaLT", "{0:dd/M/yyyy}").ToString()) %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Ngày kết thúc
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# getLichtrinhKT(Eval("MaLT", "{0:dd/M/yyyy}").ToString()) %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Địa điểm
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# getDiaDiem(Eval("MaDDDL").ToString()) %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Giá tiền
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# ((int)Eval("GiaTien")).ToString("N0") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Trạng thái
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# getTrangThai(Eval("TrangThai").ToString())%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Chức năng hủy tour
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="btnXoa" Text="Hủy"
                                    OnClientClick="return valid();"
                                    CommandArgument='<%# Eval("Mave").ToString() %>'
                                    OnCommand="btnXoa_Command" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Đánh giá tour
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%--<div class="rating">
                                    <input type="radio" name="rating" value="5" id="5"><label for="5">☆</label>
                                    <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label>
                                    <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label>
                                    <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label>
                                    <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label>
                                </div>--%>
                                <asp:LinkButton runat="server" ID="btnDanhGia" Text="Đánh giá"
                                    CommandArgument='<%# Eval("Mave").ToString() %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script src="Template/js/jquery-3.2.1.min.js"></script>
    <script src="Template/styles/bootstrap4/popper.js"></script>
    <script src="Template/styles/bootstrap4/bootstrap.min.js"></script>
    <script src="Template/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="Template/js/contact_custom.js"></script>
    <script>
        function valid() {
            if (confirm("Bạn thực sự muốn xóa?") == true) {
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
