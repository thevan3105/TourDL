using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class BooKings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    TourDLEntities db = new TourDLEntities();
                    string manv = Session["username"].ToString();

                    QLTour.NhanVien obj = db.NhanVien.FirstOrDefault(p => p.MaNV == manv);
                    string quyen = obj.NghiepVu;
                    if (quyen == "CSKH")
                    {
                        hplBtnThem.Visible = false;
                        getDataCSKH();
                    }
                    else if (quyen == "SELL")
                    {
                        getDataSELL();
                    }
                    else
                    {
                        getData();
                    }
                }
                catch (Exception)
                {
                    Response.Redirect("Login.aspx");
                }
            }

        }
        public void getDataCSKH()
        {
            try
            {
                TourDLEntities db = new TourDLEntities();
                List<QLTour.Booking> lstBK = db.Booking.ToList();
                dgvbookingCSKH.DataSource = lstBK;
                dgvbookingCSKH.DataBind();
            }
            catch
            {
                // lỗi
            }

        }
        public void getDataSELL()
        {
            try
            {
                TourDLEntities db = new TourDLEntities();
                List<QLTour.Booking> lstBK = db.Booking.ToList();
                dgvbookingSELL.DataSource = lstBK;
                dgvbookingSELL.DataBind();
            }
            catch
            {
                // lỗi
            }

        }
        public void getData()
        {
            try
            {
                TourDLEntities db = new TourDLEntities();
                List<QLTour.Booking> lstBK = db.Booking.ToList();
                dgvbooking.DataSource = lstBK;
                dgvbooking.DataBind();
            }
            catch
            {
                // lỗi
            }

        }
        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int MaVe = Int32.Parse(e.CommandArgument.ToString());
                TourDLEntities db = new TourDLEntities();
                QLTour.Booking obj = db.Booking.FirstOrDefault(x => x.MaVe == MaVe);
                if (obj != null)
                {
                    db.Booking.Remove(obj);
                    db.SaveChanges();
                    getData();
                }
            }
            catch
            {
                //
            }
        }

        protected void dgvbooking_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvbooking.PageIndex = e.NewPageIndex;
            getData();
        }

        protected void dgvbookingCSKH_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvbookingCSKH.PageIndex = e.NewPageIndex;
            getDataCSKH();
        }

        protected void dgvbookingSELL_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvbookingSELL.PageIndex = e.NewPageIndex;
            getDataSELL();
        }
    }
}