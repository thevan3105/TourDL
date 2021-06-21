using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour
{
    public partial class Reviews : System.Web.UI.Page
    {
        TourDLEntities db = new TourDLEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            //check condition
            // ma khach hang da dat
            if (!IsPostBack)
            {
                //if (Request.QueryString["MaTour"] == null)
                //{
                //    Response.Redirect("Home.aspx");
                //}
                //else
                //{
                //    getTenTour(Request.QueryString["MaTour"]);
                //    getGiaTour(Request.QueryString["MaTour"]);
                //}
            }
        }
        public void getTenTour(string MaTour)
        {
            lbTenTour.Text = db.Tour.First(x => x.MaTour == MaTour).TenTour;
        }
        public void getGiaTour(string MaTour)
        {
            lbGiaTour.Text = db.Tour.First(x => x.MaTour == MaTour).GiaTien.ToString();
        }

        protected void btnDanhGia_Click(object sender, EventArgs e)
        {
            QLTour.DanhGia obj = new QLTour.DanhGia();
            obj.MaTour = Request.QueryString["MaTour"];
            obj.MaKH = Request.QueryString["MaKH"];
            obj.MaVe = Int32.Parse(Request.QueryString["MaVe"]);
            obj.Diem = Int32.Parse(Request.Form["rating"].ToString());
            db.DanhGia.Add(obj);
            db.SaveChanges();
            Response.Write("<script>alert('Cảm ơn bạn đã đánh giá');</script>");
            Response.Redirect("EditInfo.aspx");
        }
    }
}