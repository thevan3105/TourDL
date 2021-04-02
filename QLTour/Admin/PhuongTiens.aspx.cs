using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class PhuongTiens : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
        }
        public void getDataCSKH()
        {
            try
            {
                TourDLEntities db = new TourDLEntities();
                List<QLTour.PhuongTien> lstSP = db.PhuongTien.ToList();
                dgvPhuongTienCSKH.DataSource = lstSP;
                dgvPhuongTienCSKH.DataBind();
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
                List<QLTour.PhuongTien> lstSP = db.PhuongTien.ToList();
                dgvPhuongTien.DataSource = lstSP;
                dgvPhuongTien.DataBind();
            }
            catch
            {
                //
            }
        }
        protected void btnXoa_Command1(object sender, CommandEventArgs e)
        {
            string MaPT = e.CommandArgument.ToString();
            TourDLEntities db = new TourDLEntities();
            QLTour.PhuongTien obj = db.PhuongTien.FirstOrDefault(x => x.MaPT == MaPT);
            if (obj != null)
            {
                db.PhuongTien.Remove(obj);
                db.SaveChanges();
                getData();
            }
        }
    }
}