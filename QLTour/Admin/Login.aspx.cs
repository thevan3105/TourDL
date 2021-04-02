using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace QLTour.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                byte[] hs = new byte[50];
                string pass = txtMatKhau.Text;
                MD5 md5 = MD5.Create();
                byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(pass);
                byte[] hash = md5.ComputeHash(inputBytes);
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hash.Length; i++)
                {
                    hs[i] = hash[i];
                    sb.Append(hs[i].ToString("x2"));
                }
                var hash_pass = sb.ToString();


                string taikhoan = txtTaiKhoan.Text;
                //string matkhau = txtMatKhau.Text;

                TourDLEntities db = new TourDLEntities();
                //int soluong = db.NHANVIEN.Count(x => x.TaiKhoan == taikhoan && x.MatKhau == hash_pass);
                QLTour.NhanVien obj = db.NhanVien.FirstOrDefault(x => x.TaiKhoan == taikhoan && x.PassWord == hash_pass);
                if (obj != null)
                {
                    // Dang nhap thanh cong
                    Session["username"] = obj.MaNV;
                    //Session["TaiKhoan"] = obj.TaiKhoan; 
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    lbError.Text = "Tài khoản hoặc mật khẩu không đúng!";
                }
            }
            catch
            {
                //
            }
        }
    }
}