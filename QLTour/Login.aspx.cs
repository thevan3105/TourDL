using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace QLTour
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //Do MD5 Hashing...
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
            //string TenKhachHang;
            //

            TourDLEntities db = new TourDLEntities();
            int soluong = db.KhachHang.Count(x => x.TaiKhoan == taikhoan && x.Matkhau == hash_pass);
            if (soluong == 1)
            {
                // Dang nhap thanh cong, gán seesion
                Session["TaiKhoan"] = taikhoan;
                //QLTour.KhachHang obj = db.KhachHang.FirstOrDefault(x => x.TaiKhoan == taikhoan);
                //Session["MaKH"] = obj.MaKH;
                //
                Response.Redirect("Home.aspx");
            }
            else
            {
                lbError.Text = "Tài khoản hoặc mật khẩu không đúng!";
            }
        }
    }
}