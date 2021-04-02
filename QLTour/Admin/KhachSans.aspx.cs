using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class KhachSans : System.Web.UI.Page
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
        public void getData()
        {
            try
            {
                TourDLEntities db = new TourDLEntities();
                List<QLTour.KhachSan> lstSP = db.KhachSan.ToList();
                dgvKhachSan.DataSource = lstSP;
                dgvKhachSan.DataBind();
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
                List<QLTour.KhachSan> lstSP = db.KhachSan.ToList();
                dgvKhachSanCSKH.DataSource = lstSP;
                dgvKhachSanCSKH.DataBind();
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
                string MaKS = e.CommandArgument.ToString();
                TourDLEntities db = new TourDLEntities();
                QLTour.KhachSan obj = db.KhachSan.FirstOrDefault(x => x.MaKS == MaKS);
                if (obj != null)
                {
                    db.KhachSan.Remove(obj);
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