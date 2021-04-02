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
    public partial class DoiMK : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {

                TourDLEntities db = new TourDLEntities();
                String id = Session["username"].ToString();
                string oldpass = db.NhanVien.FirstOrDefault(x => x.MaNV == id).PassWord.ToString();
                if (oldpass == getMKMH(txtMatKhauCu.Text))
                {
                    if (txtMatKhauMoi.Text == txtMatKhauMoi2.Text)
                    {
                        QLTour.NhanVien obj = db.NhanVien.FirstOrDefault(x => x.MaNV == id);
                        if (obj == null)
                        {
                            Response.Redirect("Login.aspx");
                        }
                        else
                        {
                            obj.PassWord = getMKMH(txtMatKhauMoi.Text);
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