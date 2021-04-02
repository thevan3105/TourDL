using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class LoaiTours : System.Web.UI.Page
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
                List<QLTour.LoaiTour> lstSP = db.LoaiTour.ToList();
                dgvLoaiTourCSKH.DataSource = lstSP;
                dgvLoaiTourCSKH.DataBind();
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
                List<QLTour.LoaiTour> lstSP = db.LoaiTour.ToList();
                dgvLoaiTour.DataSource = lstSP;
                dgvLoaiTour.DataBind();
            }
            catch
            {
                //
            }

        }


        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {
            //
        }

        protected void btnXoa_Command1(object sender, CommandEventArgs e)
        {
            try
            {
                string Mt = e.CommandArgument.ToString();
                TourDLEntities db = new TourDLEntities();
                QLTour.LoaiTour obj = db.LoaiTour.FirstOrDefault(x => x.MaLoaiTour == Mt);
                if (obj != null)
                {
                    db.LoaiTour.Remove(obj);
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