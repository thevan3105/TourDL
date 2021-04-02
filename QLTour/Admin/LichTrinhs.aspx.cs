using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class LichTrinhs : System.Web.UI.Page
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
                    hplBtnThem.Visible = false;
                    getDataCSKH();
                }
                else
                {
                    getData();
                }
            }
        }
        public void getDataCSKH()
        {
            try
            {
                TourDLEntities db = new TourDLEntities();
                List<QLTour.LichTrinh> lstSP = db.LichTrinh.ToList();
                dgvLichTrinhCSKH.DataSource = lstSP;
                dgvLichTrinhCSKH.DataBind();
            }
            catch
            {
                //
            }

        }
        public void getData()
        {
            try
            {
                TourDLEntities db = new TourDLEntities();
                List<QLTour.LichTrinh> lstSP = db.LichTrinh.ToList();
                dgvLichTrinh.DataSource = lstSP;
                dgvLichTrinh.DataBind();
            }
            catch
            {
                //
            }

        }
        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {
            try
            {
                string MaLT = e.CommandArgument.ToString();
                TourDLEntities db = new TourDLEntities();
                QLTour.LichTrinh obj = db.LichTrinh.FirstOrDefault(x => x.MaLT == MaLT);
                if (obj != null)
                {
                    db.LichTrinh.Remove(obj);
                    db.SaveChanges();
                    getData();
                }
            }
            catch
            {
                //
            }
        }
    }
}