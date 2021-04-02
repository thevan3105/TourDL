<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="Status.aspx.cs" Inherits="QLTour.Status" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Travelix Project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="Template/styles/bootstrap4/bootstrap.min.css">
    <link href="Template/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="Template/styles/elements_styles.css">
    <link rel="stylesheet" type="text/css" href="Template/styles/elements_responsive.css">
    <style>
        .cart-quantity-input {
            height: 34px;
            width: 200px;
            border-radius: 5px;
            border: 1px solid #56CCF2;
            background-color: #eee;
            color: #333;
            padding: 0;
            text-align: center;
            font-size: 1.2em;
            margin-right: 25px;
        }

        .cart-total {
            text-align: end;
            margin-top: 10px;
            margin-right: 10px;
        }
        body {
            font-family: Arial;
            font-size: 10pt;
        }

        table {
            border: 1px solid #ccc;
            border-collapse: collapse;
        }

            table th {
                background-color: #F7F7F7;
                color: #333;
                font-weight: bold;
            }

            table th, table td {
                padding: 5px;
                border: 1px solid #ccc;
            }

        .LinhTinh {
            background-color: azure;
            width: 50%;
            float: left;
        }
        .LinhTinhTinh {
            background-color: azure;
            width: 50%;
            float: right;
        }

        .abc {
            height: 25px;
            width: 80px;
            border-radius: 5px;
            border: 1px solid #56CCF2;
            background-color: #eee;
            color: #333;
            padding: 0;
            margin: 5px;
            text-align: center;
            font-size: 1.1em;
            margin-right: 25px;
        }
        .abcd {
            margin: 5px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="slider" runat="server">
    <!-- Home -->

    <div class="home">
        <div class="home_background parallax-window" data-parallax="scroll" data-image-src="Template/images/elements_background.jpg"></div>
        <div class="home_content">
            <%--<div class="home_title">Đừng trần chừ</div>--%>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Elements -->

    <div class="elements">
        <div class="container">
            <div class="row">
                <div class="col">

                    <!-- Buttons -->
                    <%--<div class="buttons">--%>
                        <div class="row">
                            <div class="col">
                                <div class="elements_title" style="text-align: center; color: deepskyblue; font-family: 'Comic Sans MS';">Tour <asp:Label runat="server" ID="lbTenTour"></asp:Label></div>
                            </div>
                        </div>
                    <%--</div>--%>

                    <!-- Progress Bars and Accordions -->

                    <div class="pbars_accordions">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="elements_title">Đặt tour</div>
                            </div>
                        </div>

                        <div class="row pbars_accordions_container">

                            <!-- Progress Bars & Accordions -->

                            <div class="col-lg-7">

                                <!-- Accordions -->
                                <div class="elements_accordions">

                                    <div class="accordion_container">
                                        <div class="accordion d-flex flex-row align-items-center active">
                                            <div>Thông tin tour</div>
                                        </div>
                                        <div class="accordion_panel">
                                            <div>
                                                Mã tour: <asp:Label runat="server" ID="lbMaTour"></asp:Label>
                                            </div>
                                            <div class="price1">
                                                Giá tour: <asp:Label runat="server" ID="lbGiaTour"></asp:Label> <span>đ/adult</span></div>
                                            <div>Max số người trong 1 tour: <asp:Label runat="server" ID="lbmaxNguoi"></asp:Label></div>
                                            <asp:Repeater runat="server" ID="rpGiaVe">
                                                <ItemTemplate>
                                                    <div class="room_text">Giá người lớn: <span class="cart-price cart-column"><%# ((int)Eval("GiaVeNL")).ToString("N0") %></span> đ/adult</div>
                                                    <div class="room_text">Giá trẻ em: <span class="cart-price cart-column"><%# ((int)Eval("GiaVeTE")).ToString("N0") %></span> đ/children</div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <div>
                                                <asp:Repeater runat="server" ID="rpLichTinhTour">
                                                    <ItemTemplate>
                                                        <a>Ngày bắt đầu: <%# (Eval("NgayBD")).ToString() %> </a>
                                                        <a>===</a>
                                                        <a>Ngày kết thúc: <%# (Eval("NgayKT")).ToString() %> </a>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>

                                            <br />
                                            
                                            <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField DataField="MaCTTour" HeaderText="ID" />
                                                    <asp:BoundField DataField="GiaVeNL" HeaderText="GiaNL" ItemStyle-CssClass="price" />
                                                    <asp:TemplateField HeaderText="Quantity">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Total">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>--%>
                                            <%--<asp:GridView runat="server" ID="dgvCTTour"
                                                class="table table-bordered table-hover"
                                                AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField DataField="MaCTTour" HeaderText="Mã CTTour" />
                                                    <asp:TemplateField HeaderText="Quantity">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" min="1" max="20" step="0" Text="1"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            Giá người lớn
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <%# ((int)Eval("GiaVeNL")).ToString() %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Quantity">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" min="1" max="20" step="0" Text="0"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            Giá trẻ em
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <%# ((int)Eval("GiaVeTE")).ToString() %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            Tổng tiền
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="tongtien"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>--%>
                                                        <%--<input name="sonl" type="number" value="2" required>

                                                        <input name="gianl" type="number" value="200000" required>

                                                        <input name="sote" type="number" value="3" required>

                                                        <input name="giate" type="number" value="100000" required>

                                                        <label id="tongtien"></label>--%>

                                            <%--<a>Số người lớn: </a>
                                            <asp:TextBox runat="server" ID="txtSoNL" type="number" value="1" min="1" max="20" step="0" class="cart-quantity-input"></asp:TextBox>
                                            <a>Số Trẻ em: </a>
                                            <asp:TextBox runat="server" ID="txtSoTE" type="number" value="0" min="0" max="20" step="0" class="cart-quantity-input"></asp:TextBox>--%>
                                            
                                            
                                            <%--load datatable--%>
                                            
                                            
                                            <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField DataField="Item" HeaderText="Item" />
                                                    <asp:BoundField DataField="Price" HeaderText="Price" ItemStyle-CssClass="price" />
                                                    <asp:TemplateField HeaderText="Quantity">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" min="0" max="20" class="cart-quantity-input" ></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Total">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>--%>

                                            
                                            <%--<div class="cart-total-title">
                                                 Tiền thêm:<asp:Label ID="lblGrandTotal" runat="server" Text="0"></asp:Label> vnđ.
                                            </div>--%>
                                            <hr />
                                            <!---->
                                            <div>Thêm người</div>
                                            <table>
                                                <tr>
                                                    <th>Loại vé</th>
                                                    <th>Giá</th>
                                                    <th>Số lượng</th>
                                                </tr>
                                                <tr>
                                                    <td>Người lớn</td>
                                                    <td><asp:TextBox runat="server" ID="txtGiaNL" Enabled="false"></asp:TextBox></td>
                                                    <td><asp:TextBox runat="server" ID="txtSoNL" onchange="return Calculate();" TextMode="Number" min="0" max="25" EnableViewState="false" Text="0" class="abc" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Trẻ em</td>
                                                    <td><asp:TextBox runat="server" ID="txtGiaTE" Enabled="false"></asp:TextBox></td>
                                                    <td><asp:TextBox runat="server" ID="txtSoTE" onchange="return Calculate();" TextMode="Number" min="0" max="25" Text="0" class="abc" /></td>
                                                </tr>
                                            </table>
                                            <div class="abcd">
                                                Khoản thu thêm: <asp:TextBox runat="server" ID="txtTotal" Enabled="false" Text="0" width="120"/> vnđ + Giá tour <asp:TextBox runat="server" ID="txtGiaTour" Enabled="false" width="100"/>
                                            </div>
                                            
                                            <!---->

                                            <br />
                                            <div class="cart-total">
                                                <strong class="cart-total-title">Tổng Cộng:</strong>
                                                <asp:TextBox runat="server" ID="txtTongTien" Enabled="false" Width="100" TextMode="Number" Text="0"></asp:TextBox>VNĐ

                                            </div>
                                            <br />
                                            <div><em>*Chú ý:</em><i>Giá tour là giá bao gồm 1 người lớn và đẵ bao gồm thuế VAT và bảo hiểm cho khách hàng trọn gói, trẻ em là trẻ từ 1-5 tuổi</i></div>
                                        </div>
                                    </div>

                                    <div class="accordion_container">
                                        <div class="accordion d-flex flex-row align-items-center">
                                            <div>Thông tin phương tiện</div>
                                        </div>
                                        <div class="accordion_panel">
                                            <p>Loại phương tiện: <asp:Label runat="server" ID="lbPhuongTien"></asp:Label></p>
                                        </div>
                                    </div>

                                    <div class="accordion_container">
                                        <div class="accordion d-flex flex-row align-items-center">
                                            <div>Thông tin lịch trình</div>
                                        </div>
                                        <div class="accordion_panel">
                                            <p>- Địa điểm du lịch: <asp:Label runat="server" ID="lbDDDL"></asp:Label></p>
                                            <b>- Khách sạn: <asp:Label runat="server" ID="lbKhachSan"></asp:Label></b>
                                            <p><i>Chỉ ghi cho có thôi, khách không chọn được</i></p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-5">

                                <!-- Accordions -->
                                <div class="elements_accordions">

                                    <div class="accordion_container">
                                        <div class="accordion d-flex flex-row align-items-center active">
                                            <div>Thông khách hàng</div>
                                        </div>
                                        <div class="accordion_panel">
                                            <div>Tên khách hàng: <asp:Label runat="server" ID="lbTenKH"></asp:Label></div>
                                            <div></div>
                                            <a>-Thông tin liên hệ:</a>
                                            <div>&nbsp;&nbsp;Địa chỉ: <asp:Label runat="server" ID="lbDiaChi"></asp:Label></div>
                                            <div>&nbsp;&nbsp;Số điện thoại: +84 <asp:Label runat="server" ID="lbSoDT"></asp:Label></div>
                                            <div style="text-align: right"><asp:HyperLink runat="server" ID="lbtnEditInfo" NavigateUrl="EditInfo.aspx" Text="Chỉnh sửa thông tin"></asp:HyperLink></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--button dat ngay-->
                            <div class="button button_color_1 trans_200" style="background-color: deepskyblue">
                                <asp:LinkButton runat="server" ID="lbtnDatTour" Text="Đặt tour" OnClick="lbtnDatTour_Click"></asp:LinkButton>
                            </div>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                    <!-- Loaders -->

                    <div class="buttons">
                        <div class="row">
                            <div class="col">
                                <div class="elements_title">Bạn cần hỗ trợ ?</div>
                                <div class="buttons_container">
                                    <div class="button button_color_2 trans_200"><a href="tel:+84-39-416-6076">Gọi miễn phí (qua internet)</a></div>
                                    <div class="button button_line_1 trans_200"><a href="mailto:thevan3105@gmail.com?Subject=Hello" class="trans_200">Gửi yêu cầu (Hỗ trợ ngay)</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script src="Template/js/jquery-3.2.1.min.js"></script>
    <script src="Template/styles/bootstrap4/popper.js"></script>
    <script src="Template/styles/bootstrap4/bootstrap.min.js"></script>
    <script src="Template/plugins/greensock/TweenMax.min.js"></script>
    <script src="Template/plugins/greensock/TimelineMax.min.js"></script>
    <script src="Template/plugins/scrollmagic/ScrollMagic.min.js"></script>
    <script src="Template/plugins/greensock/animation.gsap.min.js"></script>
    <script src="Template/plugins/greensock/ScrollToPlugin.min.js"></script>
    <script src="Template/plugins/progressbar/progressbar.min.js"></script>
    <script src="Template/plugins/jquery-circle-progress-1.2.2/circle-progress.js"></script>
    <script src="Template/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="Template/js/elements_custom.js"></script>
<%--  <script>

      let form = document.forms.calculator;

      form.sonl.oninput = calculate;
      form.gianl.onchange = calculate;
      form.sote.oninput = calculate;
      form.giate.oninput = calculate;

      function calculate() {
          let sonl = +form.sonl.value;
          if (!sonl) return;

          let gianl = +form.gianl.value;
          if (!gianl) return;

          let sote = +form.sote.value;
          if (!sote) return;

          let giate = +form.giate.value;
          if (!giate) return;

          let result = Math.round((sonl * gianl) + (sote * giate));
          document.getElementById('tongtien').innerHTML = result;
      }

      calculate();
</script>--%>

    <%--load datatable--%>

    <%--<script type="text/javascript" src="Template/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[id*=txtQuantity]").val("0");
        });
        $("body").on("change keyup", "[id*=txtQuantity]", function () {
            //Check whether Quantity value is valid Float number.
            var quantity = parseFloat($.trim($(this).val()));
            if (isNaN(quantity)) {
                quantity = 0;
            }
            //Update the Quantity TextBox.
            $(this).val(quantity);

            //Calculate and update Row Total.
            var row = $(this).closest("tr");
            $("[id*=lblTotal]", row).html(parseFloat($(".price", row).html()) * parseFloat($(this).val()));

            //Calculate and update Grand Total.
            var grandTotal = 0;

            $("[id*=lblTotal]").each(function () {
                grandTotal = grandTotal + parseFloat($(this).html());
            });
            $("[id*=lblGrandTotal]").html(grandTotal.toString());

        });
    </script>--%>

    <script type="text/javascript">
        function Calculate() {
            var SoNL = document.getElementById("<%=txtSoNL.ClientID%>").value;
            var SoTE = document.getElementById("<%=txtSoTE.ClientID%>").value;
            var GiaNL = document.getElementById("<%=txtGiaNL.ClientID%>").value;
            var GiaTE = document.getElementById("<%=txtGiaTE.ClientID%>").value;

            var GiaTour = document.getElementById("<%=txtGiaTour.ClientID%>").value;

            var sum = 0;
            if (/*!isNaN(bankcharge) /*&&*/ /*!isNaN(vat)*/ true) {
                //sum = parseFloat(bankcharge) + parseFloat(bankcharge * (vat / 100));
                sum = (parseFloat(SoNL) * parseFloat(GiaNL)) + (parseFloat(SoTE) * parseFloat(GiaTE));
                document.getElementById("<%=txtTotal.ClientID%>").value = sum;
            }
            var GiaTong = document.getElementById("<%=txtTotal.ClientID%>").value;
            var total = 0;
            totalall = parseFloat(GiaTour) + parseFloat(GiaTong);
            document.getElementById("<%=txtTongTien.ClientID%>").value = totalall;
        }
    </script>
    <%--<script>
        // update cart 
        function updatecart() {
            var total = "1000" /*getElementsByClassName("price1")*/
            var price_item = getElementsByClassName("cart-price ")[0]
            var quantity_item = getElementsByClassName("cart-quantity-input")[0]
            var price = parseFloat(price_item.innerText)
            var quantity = quantity_item.value
            total = total + (price * quantity)
            document.getElementsByClassName("cart-total-price")[0].innerText = total + 'VNĐ'
        }
        // thay đổi số lượng
        var quantity_input = document.getElementsByClassName("cart-quantity-input");
        for (var i = 0; i < quantity_input.length; i++) {
            var input = quantity_input[i];
            input.addEventListener("change", function (event) {
                var input = event.target
                if (isNaN(input.value) || input.value <= 0) {
                    input.value = 1;
                }
                updatecart()
            })
        }
    </script>--%>
</asp:Content>
