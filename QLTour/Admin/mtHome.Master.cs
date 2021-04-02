using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class mtHome : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.QueryString["NghiepVu"] != "Quản trị viên")
            //{
            //    Response.Redirect("Login.aspx");
            //}
            TourDLEntities db = new TourDLEntities();

            //kiểm tra Session có đăng nhập chưa, nếu có thì pass,
            //nếu không có thì điều hướng về trang Login
            if (Session["username"] == null || Session["username"].ToString() == "")
            {
                // Chưa đăng nhập
                Response.Redirect("login.aspx");
            }
            else
            {
                string manv = Session["username"].ToString();

                QLTour.NhanVien obj = db.NhanVien.FirstOrDefault(p => p.MaNV == manv);
                string quyen = obj.NghiepVu;
                if (quyen == "SELL")
                {
                    lbnghiepvunv.Text = "Nghiệp vụ: " + obj.NghiepVu;
                    lbtenAcount.Text = obj.TenNV;
                    lblTaiKhoan.Text = "Xin chào " + obj.TenNV;
                    lbtlogout.Visible = true;
                    hplnhanvien.Visible = false;

                }
                else if (quyen == "Admin")
                {
                    lbnghiepvunv.Text = "Nghiệp vụ: " + obj.NghiepVu;
                    lbtenAcount.Text = obj.TenNV;
                    lblTaiKhoan.Text = "Xin chào " + obj.TenNV;
                    lbtlogout.Visible = true;

                }
                else if (quyen == "Manager")
                {
                    lbnghiepvunv.Text = "Nghiệp vụ: " + obj.NghiepVu;
                    lbtenAcount.Text = obj.TenNV;
                    lblTaiKhoan.Text = "Xin chào " + obj.TenNV;
                    lbtlogout.Visible = true;

                }
                else if (quyen == "CSKH")
                {
                    lbnghiepvunv.Text = "Nghiệp vụ: " + obj.NghiepVu;
                    lbtenAcount.Text = obj.TenNV;
                    lblTaiKhoan.Text = "Xin chào " + obj.TenNV;
                    lbtlogout.Visible = true;
                    hplnhanvien.Visible = false;


                }
                else if (quyen != "SELL" && quyen != "Admin" && quyen != "Manager" && quyen != "CSKH")
                {
                    string makh = Session["khachhang"].ToString();
                    int soluong = db.NhanVien.Count(x => x.MaNV == makh);
                    if (soluong == 1)
                    {
                        //Response.Redirect("Tour.aspx");
                    }
                    else
                    {
                        Session.Clear();
                        Response.Redirect("Login.aspx");
                    }
                }
                //else
                //{
                //    Response.Redirect("Login.aspx");
                //}
            }
        }

        protected void lbtlogout_Click(object sender, EventArgs e)
        {
            // xóa session
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void lbtLogOutLeft_Click(object sender, EventArgs e)
        {
            // xóa session
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}