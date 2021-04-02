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
    public partial class DangKy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtNgaySinh.Enabled = false;
                txtNgaySinh.CssClass = txtNgaySinh.CssClass + " form-control";
                txtMaNV.Enabled = false;
                txtMaNV.CssClass = txtMaNV.CssClass + " form-control";
                getngay();
                getthang();
                getnam();
            }
        }
        protected void btndangky_Click(object sender, EventArgs e)
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

                string name = txtName.Text;
                string taikhoan = txtTaiKhoan.Text;
                string nghiepvu = cmbnghiepvu.SelectedValue;

                TourDLEntities db = new TourDLEntities();



                int soluong = db.NhanVien.Count(x => x.TaiKhoan == taikhoan);
                if (soluong == 1 || nghiepvu == "Admin")
                {
                    lbdatontai.Text = "tài khoản đã tồn tại!, bạn không có quyền tạo tài khoản Admin";
                }
                else
                {
                    if (txtMatKhau.Text != txtMatKhau2.Text)
                    {
                        lbmatkhaukhongkhop.Text = "Mật khẩu không khớp!";
                    }
                    else
                    {
                        QLTour.NhanVien obj = new QLTour.NhanVien();
                        obj.MaNV = AutoGetma();
                        obj.TenNV = txtName.Text;
                        obj.TaiKhoan = txtTaiKhoan.Text;
                        obj.PassWord = hash_pass;
                        obj.NghiepVu = cmbnghiepvu.SelectedValue;
                        string ngaysinh = cmbThang.SelectedValue + "/" + cmbNgay.SelectedValue + "/" + cmbNam.SelectedValue;
                        obj.NgaySinh = Convert.ToDateTime(ngaysinh);
                        obj.GioiTinh = txtGioiTinh.Text;
                        obj.DiaChi = txtDiaChi.Text;
                        obj.SDT = Int32.Parse(txtSDT.Text);

                        db.NhanVien.Add(obj);
                        db.SaveChanges();
                        lbdone.Text = "Đăng ký thành công";
                        Response.Redirect("Login.aspx");
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
            for (int i = 1888; i < 2022; i++)
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
        public string AutoGetma()
        {
            string manv = getmanv();
            int MNv = int.Parse(manv.Substring(3));
            MNv++;
            if (MNv < 10)
            {
                manv = "NV00" + MNv;
            }
            else
            {
                manv = "NV0" + MNv;
            }
            return manv;
        }
    }
}