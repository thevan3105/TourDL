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
    public partial class QLNhanVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getthang();
                getnam();
                getngay();
                // kiểm tra trường hợp sửa/thêm mới
                // nếu url có dạng ?masp=123 => sửa, ngược lại là thêm mới
                if (Request.QueryString["MaNV"] == null)
                {
                    // thêm mới
                    txtMaNV.Text = Request.QueryString["MaNV"];
                    txtMaNV.CssClass = txtMaNV.CssClass + " form-control";
                    txtMaNV.Enabled = false;
                    btnSave.Visible = false;
                    btnAdd.Visible = true;
                    //txtMaNV.Enabled = true;
                }
                else
                {

                    // Sửa
                    btnSave.Visible = true;
                    btnAdd.Visible = false;
                    txtMaNV.Text = Request.QueryString["MaNV"];
                    txtMaNV.Enabled = false;

                    txtMaNV.CssClass = txtMaNV.CssClass + " form-control";
                    txtMatKhau.Text = Request.QueryString["MatKhau"];
                    txtMatKhau2.Text = Request.QueryString["MatKhau"];
                    //txtMatKhau.Enabled = false;
                    //txtMatKhau.CssClass = txtMatKhau.CssClass + " form-control";
                    //txtMatKhau2.Enabled = false;
                    //txtMatKhau2.CssClass = txtMatKhau2.CssClass + " form-control";
                    // Query về db để lấy các thông tin còn lại
                    TourDLEntities db = new TourDLEntities();
                    QLTour.NhanVien obj = db.NhanVien.FirstOrDefault(x => x.MaNV == txtMaNV.Text);
                    if (obj == null)
                    {
                        Response.Redirect("NhanViens.aspx");
                    }
                    else
                    {

                        txtMaNV.Text = obj.MaNV.ToString();
                        txtTenNV.Text = obj.TenNV;
                        cmbnghiepvu.SelectedValue = obj.NghiepVu;
                        cmbThang.SelectedValue = obj.NgaySinh.Value.Month.ToString();
                        cmbNgay.SelectedValue = obj.NgaySinh.Value.Day.ToString();
                        cmbNam.SelectedValue = obj.NgaySinh.Value.Year.ToString();
                        cmbgoitinh.SelectedValue = obj.GioiTinh;
                        txtDiaChi.Text = obj.DiaChi;
                        txtSDT.Text = obj.SDT.ToString();
                        txtTaiKhoan.Text = obj.TaiKhoan;
                        //txtMatKhau.Text = obj.PassWord;
                    }
                }
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("NhanViens.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {

                byte[] hs = new byte[50];
                string passw = txtMatKhau.Text;
                MD5 md5 = MD5.Create();
                byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(passw);
                byte[] hash = md5.ComputeHash(inputBytes);
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hash.Length; i++)
                {
                    hs[i] = hash[i];
                    sb.Append(hs[i].ToString("x2"));
                }
                var hash_pass = sb.ToString();
                // Sửa dữ liệu
                TourDLEntities db = new TourDLEntities();
                QLTour.NhanVien obj = db.NhanVien.FirstOrDefault(x => x.MaNV == txtMaNV.Text);
                if (obj == null)
                {
                    Response.Redirect("NhanViens.aspx");
                }
                else
                {
                    if (txtMatKhau.Text == "" || txtTaiKhoan.Text == "" || txtTenNV.Text == "")
                    {
                        lbErrordangky.Text = "Bạn chưa nhập đủ thông tin!!!";
                    }
                    else if (txtMatKhau.Text != txtMatKhau2.Text)
                    {
                        lbmatkhaukhongkhop.Text = "Mât khẩu không khớp!";
                    }
                    else
                    {
                        //obj.MaNV = AutoGetma();
                        obj.TenNV = txtTenNV.Text;
                        obj.NghiepVu = cmbnghiepvu.SelectedValue;
                        string ngaysinh = cmbThang.SelectedValue + "/" + cmbNgay.SelectedValue + "/" + cmbNam.SelectedValue;
                        obj.NgaySinh = Convert.ToDateTime(ngaysinh);
                        obj.GioiTinh = cmbgoitinh.SelectedValue;
                        obj.DiaChi = txtDiaChi.Text;
                        obj.SDT = Int32.Parse(txtSDT.Text) ;
                        obj.TaiKhoan = txtTaiKhoan.Text;
                        obj.PassWord = hash_pass;

                        db.SaveChanges();
                        Response.Redirect("NhanViens.aspx");
                    }
                }
            }
            catch
            {
                lbErrordangky.Text = "lỗi!!!, không thể thêm tài khoản!";
            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                byte[] hs = new byte[50];
                string passw = txtMatKhau.Text;
                MD5 md5 = MD5.Create();
                byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(passw);
                byte[] hash = md5.ComputeHash(inputBytes);
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hash.Length; i++)
                {
                    hs[i] = hash[i];
                    sb.Append(hs[i].ToString("x2"));
                }
                var hash_pass = sb.ToString();

                string name = txtTenNV.Text;
                string taikhoan = txtTaiKhoan.Text;

                TourDLEntities db = new TourDLEntities();
                int soluong = db.NhanVien.Count(x => x.TaiKhoan == taikhoan);
                if (soluong == 1)
                {
                    lbdatontai.Text = "tài khoản đã tồn tại!";
                }
                else
                {
                    if (txtMatKhau.Text == "" || txtTaiKhoan.Text == "" || txtTenNV.Text == "")
                    {
                        lbErrordangky.Text = "Bạn chưa nhập đủ thông tin!!!";
                    }
                    else if (txtMatKhau.Text != txtMatKhau2.Text)
                    {
                        lbmatkhaukhongkhop.Text = "Mât khẩu không khớp!";
                    }
                    else
                    {
                        QLTour.NhanVien obj = new QLTour.NhanVien();
                        obj.MaNV = getmanv();
                        obj.TenNV = txtTenNV.Text;
                        obj.TaiKhoan = txtTaiKhoan.Text;
                        obj.PassWord = hash_pass;
                        obj.NghiepVu = cmbnghiepvu.SelectedValue;
                        string ngaysinh = cmbThang.SelectedValue + "/" + cmbNgay.SelectedValue + "/" + cmbNam.SelectedValue;
                        obj.NgaySinh = Convert.ToDateTime(ngaysinh);
                        obj.GioiTinh = cmbgoitinh.SelectedValue;
                        obj.DiaChi = txtDiaChi.Text;
                        obj.SDT = Int32.Parse(txtSDT.Text);

                        db.NhanVien.Add(obj);
                        db.SaveChanges();
                        //lbdone.Text = "Đăng ký thành công";
                        Response.Redirect("NhanViens.aspx");
                    }
                }

            }
            catch
            {
                lbErrordangky.Text = "Tài khoản không hợp lệ, chưa được đăng ký!";
            }
        }
        public void getngay()
        {
            List<int> lst = new List<int>();
            for (int i = 1; i < 32; i++)
            {
                lst.Add(i);
            }
            cmbNgay.DataSource = lst;
            cmbNgay.DataBind();
        }
        public void getthang()
        {
            List<int> lst = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                lst.Add(i);
            }
            cmbThang.DataSource = lst;
            cmbThang.DataBind();
        }
        public void getnam()
        {
            List<int> lst = new List<int>();
            for (int i = 1970; i < 2023; i++)
            {
                lst.Add(i);
            }
            cmbNam.DataSource = lst;
            cmbNam.DataBind();
        }
        public string getmanv()
        {
            TourDLEntities db = new TourDLEntities();
            string maMax = db.NhanVien.Max(x => x.MaNV);

            string ma;
            int a = int.Parse(maMax.Substring(2));
            a++;
            if (a < 10)
            {
                ma = "NV00" + a;
            }
            else
            {
                ma = "NV0" + a;
            }
            return ma;

        }
    }
}