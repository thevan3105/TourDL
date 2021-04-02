using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class LoaiPhuongTiens : System.Web.UI.Page
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
                List<QLTour.LoaiPhuongTien> lstSP = db.LoaiPhuongTien.ToList();
                dgvLoaiPhuongTienCSKH.DataSource = lstSP;
                dgvLoaiPhuongTienCSKH.DataBind();
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
                List<QLTour.LoaiPhuongTien> lstSP = db.LoaiPhuongTien.ToList();
                dgvLoaiPhuongTien.DataSource = lstSP;
                dgvLoaiPhuongTien.DataBind();
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
                string MaLPT = e.CommandArgument.ToString();
                TourDLEntities db = new TourDLEntities();
                QLTour.LoaiPhuongTien obj = db.LoaiPhuongTien.FirstOrDefault(x => x.MaLPT == MaLPT);
                if (obj != null)
                {
                    db.LoaiPhuongTien.Remove(obj);
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