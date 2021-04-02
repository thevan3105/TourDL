using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour
{
    public partial class Offers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();
            }
        }
        public void getData()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> lst = db.Tour.OrderBy(x => x.MaTour).Take(5).ToList();
            rpSanPhamHot.DataSource = lst;
            rpSanPhamHot.DataBind();
        }

        public string getAnhDaiDien(string MaTour)
        {
            TourDLEntities db = new TourDLEntities();
            QLTour.Tour obj = db.Tour.FirstOrDefault(x => x.MaTour == MaTour);
            if (obj.Media.Count(x => x.Main == true) > 0)
            {
                return obj.Media.First(x => x.Main == true).Url;
            }
            else
            {
                return "";
            }
        }

        protected void lbtnThap_Click(object sender, EventArgs e)
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> lst = db.Tour.OrderBy(x => x.GiaTien).Take(5).ToList();
            rpSanPhamHot.DataSource = lst;
            rpSanPhamHot.DataBind();
        }

        protected void lbtnsortAZ_Click(object sender, EventArgs e)
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> lst = db.Tour.OrderBy(x => x.TenTour).Take(5).ToList();
            rpSanPhamHot.DataSource = lst;
            rpSanPhamHot.DataBind();
        }

        protected void lbtnsortZA_Click(object sender, EventArgs e)
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> lst = db.Tour.OrderByDescending(x => x.TenTour).Take(5).ToList();
            rpSanPhamHot.DataSource = lst;
            rpSanPhamHot.DataBind();
        }

        protected void lbtnCao_Click(object sender, EventArgs e)
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> lst = db.Tour.OrderByDescending(x => x.GiaTien).Take(5).ToList();
            rpSanPhamHot.DataSource = lst;
            rpSanPhamHot.DataBind();
        }

        protected void lbtnALL_Click(object sender, EventArgs e)
        {
            getData();
        }

        protected void lbtnBac_Click(object sender, EventArgs e)
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> lst = db.Tour.Where(x => x.MaLoaiTour == "lt001").Take(5).ToList();
            rpSanPhamHot.DataSource = lst;
            rpSanPhamHot.DataBind();
        }

        protected void lbtnTrung_Click(object sender, EventArgs e)
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> lst = db.Tour.Where(x => x.MaLoaiTour == "lt002").Take(5).ToList();
            rpSanPhamHot.DataSource = lst;
            rpSanPhamHot.DataBind();
        }

        protected void lbtnNam_Click(object sender, EventArgs e)
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> lst = db.Tour.Where(x => x.MaLoaiTour == "lt003").Take(5).ToList();
            rpSanPhamHot.DataSource = lst;
            rpSanPhamHot.DataBind();
        }

        protected void lbtnDuoi1T_Click(object sender, EventArgs e)
        {
            //true
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> lst = db.Tour.Where(x =>x.GiaTien <= 1000000).Take(5).ToList();
            rpSanPhamHot.DataSource = lst;
            rpSanPhamHot.DataBind();
        }

        protected void lbtnBW1T2T_Click(object sender, EventArgs e)
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> lst = db.Tour.Where(x =>x.GiaTien >1000000 && x.GiaTien <= 2000000).Take(5).ToList();
            rpSanPhamHot.DataSource = lst;
            rpSanPhamHot.DataBind();
        }

        protected void lbtnBW2T5T_Click(object sender, EventArgs e)
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> lst = db.Tour.Where(x => x.GiaTien > 2000000 && x.GiaTien <= 5000000).Take(5).ToList();
            rpSanPhamHot.DataSource = lst;
            rpSanPhamHot.DataBind();
        }

        protected void lbtnTren5T_Click(object sender, EventArgs e)
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> lst = db.Tour.Where(x => x.GiaTien > 5000000).Take(5).ToList();
            rpSanPhamHot.DataSource = lst;
            rpSanPhamHot.DataBind();
        }
    }
}