using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour
{
    public partial class SiteCustomer : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //// kiểm tra Session có đăng nhập chưa, nếu có thì pass,
            //// nếu không có thì điều hướng về trang Login
            //if (Session["username"] == null || Session["username"].ToString() == "")
            //{
            //    // Chưa đăng nhập
            //    Response.Redirect("Login.aspx");
            //}
            //else
            //{
            //    // Load dữ liệu
            //}

            //check session
            if (!IsPostBack)
            {
                if (Session["TaiKhoan"] != null /*&& Session["TaiKhoan"].ToString() == "1"*/)
                {
                    // Đã đăng nhập
                    phDaDangNhap.Visible = true;
                    phChuaDangNhap.Visible = false;

                    if (Session["TaiKhoan"] != null)
                    {
                        lbTenKhachHang.Text = Session["TaiKhoan"].ToString();
                    }
                }
                else
                {
                    // Load dữ liệu
                    //Response.Write("<script>alert('Chưa lấy đc session!');</script>");
                }
            }
        }

        protected void lbtnDangXuat_Click(object sender, EventArgs e)
        {
            //Xóa các seesion
            //Seesion["DangNhap"] = null;
            Session["TaiKhoan"] = null;
            Session["MaKH"] = null;//test

            //Đẩy về trang home
            Response.Redirect("Home.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string src = txtSearch.Text.ToString();
            Response.Redirect("Search.aspx?src=" + src + "");
        }
    }
}