using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class KhachHangs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["username"].ToString() == "")
            {
                // Chưa đăng nhập
                Response.Redirect("login.aspx");
            }
            else
            {

                TourDLEntities db = new TourDLEntities();
                string manv = Session["username"].ToString();

                QLTour.NhanVien obj = db.NhanVien.FirstOrDefault(p => p.MaNV == manv);
                string quyen = obj.NghiepVu;
                if (quyen == "CSKH" || quyen == "SELL")
                {

                    getDataCSKH();
                }
                else
                {
                    getData();
                }
            }
        }
        public void getData()
        {
            try
            {
                TourDLEntities db = new TourDLEntities();
                List<QLTour.KhachHang> lstSP = db.KhachHang.ToList();
                dgvKhachHang.DataSource = lstSP;
                dgvKhachHang.DataBind();
            }
            catch
            {
                //
            }

        }
        public void getDataCSKH()
        {
            try
            {
                TourDLEntities db = new TourDLEntities();
                List<QLTour.KhachHang> lstSP = db.KhachHang.ToList();
                dgvKhachHangCSKH.DataSource = lstSP;
                dgvKhachHangCSKH.DataBind();
            }
            catch
            {
                //
            }

        }
        
    }
}