using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class QLKhachHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // kiểm tra trường hợp sửa/thêm mới
                // nếu url có dạng ?masp=123 => sửa, ngược lại là thêm mới
                if (Request.QueryString["MaKH"] == null)
                {
                    // thêm mới
                    txtMaKH.Text = Request.QueryString["MaKH"];
                    txtMaKH.CssClass = txtMaKH.CssClass + " form-control";
                    txtMaKH.Enabled = false;
                    btnSave.Visible = false;
                    
                    //txtMaNV.Enabled = true;
                }
                else
                {
                    TourDLEntities db = new TourDLEntities();
                    // Sửa
                    btnSave.Visible = true;
                    

                    string q = Session["username"].ToString();

                    QLTour.NhanVien ob = db.NhanVien.FirstOrDefault(p => p.MaNV == q);
                    string quyen = ob.NghiepVu;
                    if (quyen == "Admin" || quyen == "Manager")
                    {
                        
                        txtMaKH.Text = Request.QueryString["MaKH"];
                        txtMaKH.Enabled = false;
                        txtMaKH.CssClass = txtMaKH.CssClass + " form-control";
                        

                        QLTour.KhachHang obj = db.KhachHang.FirstOrDefault(x => x.MaKH == txtMaKH.Text);
                        if (obj == null)
                        {
                            Response.Redirect("KhachHangs.aspx");
                        }
                        else
                        {
                            txtMaKH.Text = obj.MaKH.ToString();
                            txtTenKH.Text = obj.TenKH;
                            txtQuocTich.Text = obj.QuocTich;
                            txtCMND.Text = obj.CMND.ToString();
                            txtGioiTinh.Text = obj.GioiTinh;
                            txtDiaChi.Text = obj.DiaChi;
                            txtSDT.Text = obj.SDT.ToString();
                            txtTaiKhoan.Text = obj.TaiKhoan;
                            //txtMatKhau.Text = obj.Matkhau;
                        }
                    }
                    else
                    {
                        txtMaKH.Text = Request.QueryString["MaKH"];
                        txtMaKH.Enabled = false;
                        
                        txtMaKH.CssClass = txtMaKH.CssClass + " form-control";

                        // Query về db để lấy các thông tin còn lại

                        QLTour.KhachHang obj = db.KhachHang.FirstOrDefault(x => x.MaKH == txtMaKH.Text);
                        if (obj == null)
                        {
                            Response.Redirect("KhachHangs.aspx");
                        }
                        else
                        {
                            txtMaKH.Text = obj.MaKH.ToString();
                            txtTenKH.Text = obj.TenKH;
                            txtQuocTich.Text = obj.QuocTich;
                            txtCMND.Text = obj.CMND.ToString();
                            txtGioiTinh.Text = obj.GioiTinh;
                            txtDiaChi.Text = obj.DiaChi;
                            txtSDT.Text = obj.SDT.ToString();
                            txtTaiKhoan.Text = obj.TaiKhoan;
                            //txtMatKhau.Text = obj.Matkhau;
                        }
                    }

                }
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {

                
                // Sửa dữ liệu
                TourDLEntities db = new TourDLEntities();
                QLTour.KhachHang obj = db.KhachHang.FirstOrDefault(x => x.MaKH == txtMaKH.Text);
                if (obj == null)
                {
                    Response.Redirect("KhachHangs.aspx");
                }
                else
                {
                    if(txtTaiKhoan.Text=="" || txtTenKH.Text == ""|| txtCMND.Text == "")
                    {
                        lbErrordangky.Text = "Bạn chưa nhập đủ thông tin yêu cầu!";
                    }
                    else
                    {
                        obj.MaKH = txtMaKH.Text;
                        obj.TenKH = txtTenKH.Text;
                        obj.QuocTich = txtQuocTich.Text;
                        obj.CMND = txtCMND.Text;
                        obj.GioiTinh = txtGioiTinh.Text;
                        obj.DiaChi = txtDiaChi.Text;
                        obj.SDT = txtSDT.Text;
                        obj.TaiKhoan = txtTaiKhoan.Text;
                        

                        db.SaveChanges();
                        Response.Redirect("KhachHangs.aspx");
                    }
                }
            }
            catch
            {
                // Lỗi
                lbErrordangky.Text = "Lỗi không thể đăng ký!!!, Vui lòng kiểm tra lại";
            }
        }



        protected void btnCancel_Click1(object sender, EventArgs e)
        {
            Response.Redirect("KhachHangs.aspx");
        }
    }
}