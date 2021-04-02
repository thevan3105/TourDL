using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [Obsolete]
        public string mahoa(string pass)
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(pass.Trim(), "MD5");
        }

        [Obsolete]
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                TourDLEntities db = new TourDLEntities();
                string taikhoan = txtTaiKhoan.Text;
                int soluong = db.KhachHang.Count(x => x.TaiKhoan == taikhoan);
                if (soluong == 1)
                {
                    //Tài khoản đã tồn tại
                    lbError.Text = "tài khoản đã tồn tại!";
                }
                if (txtMatKhau.Text == txtXTMatKhau.Text && txtTaiKhoan.Text != null && txtXTMatKhau.Text != null)
                {
                    //check điều kiện
                    QLTour.KhachHang obj = db.KhachHang.FirstOrDefault(x => x.TaiKhoan == txtTaiKhoan.Text);
                    obj = new QLTour.KhachHang();
                    obj.MaKH = getmatour();
                    obj.TenKH = null;
                    obj.GioiTinh = null;
                    obj.QuocTich = null;
                    obj.CMND = null;
                    obj.DiaChi = null;
                    obj.SDT = null;
                    obj.TaiKhoan = txtTaiKhoan.Text;
                    obj.Matkhau = mahoa(txtMatKhau.Text);
                    db.KhachHang.Add(obj);
                    db.SaveChanges();
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    //lỗi
                    lbError.Text = "Thông tin không chính xác";
                }
            }
            catch (Exception)
            {
                lbError.Text = "Không thể tạo tài khoản!";
            }
        }
        public string getmatour()
        {
            TourDLEntities db = new TourDLEntities();
            string maMax = db.Tour.Max(x => x.MaTour);
            //
            string ma;
            int a = int.Parse(maMax.Substring(2));
            a++;
            if (a < 10)
            {
                ma = "kh00" + a;
            }
            else
            {
                ma = "kh0" + a;
            }
            return ma;

        }
    }
}