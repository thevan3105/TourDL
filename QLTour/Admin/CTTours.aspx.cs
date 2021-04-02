using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class CTTours : System.Web.UI.Page
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

                    NhanVien obj = db.NhanVien.FirstOrDefault(p => p.MaNV == manv);
                    string quyen = obj.NghiepVu;
                    if (quyen == "CSKH" || quyen == "SELL")
                    {
                        hplBtnThem.Visible = false;
                        getDataCskh();
                    }
                    else
                    {
                        getData();
                    }
                }
            }
        }
        public void getDataCskh()
        {
            try
            {
                TourDLEntities db = new TourDLEntities();
                List<QLTour.CTTour> lstSP = db.CTTour.ToList();
                dgvCTTourCskh.DataSource = lstSP;
                dgvCTTourCskh.DataBind();
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
                List<QLTour.CTTour> lstSP = db.CTTour.ToList();
                dgvCTTOUR.DataSource = lstSP;
                dgvCTTOUR.DataBind();
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
                string MaCTTour = e.CommandArgument.ToString();
                TourDLEntities db = new TourDLEntities();
                QLTour.CTTour obj = db.CTTour.FirstOrDefault(x => x.MaCTTour == MaCTTour);
                if (obj != null)
                {
                    db.CTTour.Remove(obj);
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