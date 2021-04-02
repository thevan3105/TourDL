using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getSlide();
                getData();
            }

        }
        public void getData()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> lst = db.Tour.OrderByDescending(x => x.MaTour).Take(4).ToList();
            rpSanPhamHot.DataSource = lst;
            rpSanPhamHot.DataBind();
        }
        public void getSlide()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Slide> lst = db.Slide.OrderBy(x => x.ID_Slide).Take(3).ToList();
            rpSlide.DataSource = lst;
            rpSlide.DataBind();
        }
        void getTourHot()
        {

        }

        protected void lbtnBac_Click(object sender, EventArgs e)
        {
            Response.Redirect("Offers.aspx");
            
        }

        protected void lbtnTrung_Click(object sender, EventArgs e)
        {
            Response.Redirect("Offers.aspx");
        }

        protected void lbtnNam_Click(object sender, EventArgs e)
        {
            Response.Redirect("Offers.aspx");
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
    }
}