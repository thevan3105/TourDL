using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour
{
    public partial class DoiMK : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TaiKhoan"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    txtTaiKhoan.Text = Session["TaiKhoan"].ToString();
                }
            }
        }
        public string getMKMH(string mkinput)
        {

            byte[] hs = new byte[50];

            MD5 md5 = MD5.Create();
            byte[] inputByte = System.Text.Encoding.ASCII.GetBytes(mkinput);
            byte[] has = md5.ComputeHash(inputByte);

            StringBuilder sbb = new StringBuilder();
            for (int i = 0; i < has.Length; i++)
            {
                hs[i] = has[i];
                sbb.Append(hs[i].ToString("x2"));
            }
            string hash_pas = sbb.ToString();
            return hash_pas;
        }

        protected void btnDoiMK_Click(object sender, EventArgs e)
        {
            try
            {

                TourDLEntities db = new TourDLEntities();
                String id = txtTaiKhoan.Text.ToString();
                string oldpass = db.KhachHang.FirstOrDefault(x => x.TaiKhoan == id).Matkhau.ToString();
                if (oldpass == getMKMH(txtMatKhauCu.Text))
                {
                    if (txtMatKhauMoi.Text == txtXNMKMoi.Text)
                    {
                        QLTour.KhachHang obj = db.KhachHang.FirstOrDefault(x => x.TaiKhoan == id);
                        if (obj == null)
                        {
                            Response.Redirect("Login.aspx");
                        }
                        else
                        {
                            obj.Matkhau = getMKMH(txtMatKhauMoi.Text);
                            db.SaveChanges();
                            Response.Redirect("Login.aspx");
                        }
                    }
                }
                else
                {
                    lbError.Text = "lỗi";
                }


            }
            catch
            {
                lbError.Text = "Lỗi, không thể đổi mật khẩu!";
            }
        }
    }
}