using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour
{
    public partial class Single_listing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["MaTour"] == null)
                {
                    Response.Redirect("Offers.aspx");
                }
                else
                {
                    //txtMaTour.Text = Request.QueryString["MaTour"];
                    getMoTa(Request.QueryString["MaTour"]);
                    getName(Request.QueryString["MaTour"]);
                    getGiaVe(Request.QueryString["MaTour"]);
                    getLichTrinh(Request.QueryString["MaTour"]);
                    //getLoaiTour(Request.QueryString["MaTour"]);
                    //getMaxUser();
                    getMoTaCT(Request.QueryString["MaTour"]);
                    getReview(Request.QueryString["MaTour"]);
                }
            }
        }
        void getReview(string MaTour)
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Comment> lst = db.Comment.Where(x => x.MaTour == MaTour).Take(10).ToList();
            var newList = lst.OrderByDescending(y => y.Date_seen).ToList();
            rpReview.DataSource = newList;
            rpReview.DataBind();
            if (lst.Count == 0)
            {
                lbText.Text = "Khong co nhan xet";
            }
        }
        void getMoTaCT(string MaTour)
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.CTTour> lst = db.CTTour.Where(x => x.MaTour == MaTour).ToList();
            rpMoTaCT.DataSource = lst;
            rpMoTaCT.DataBind();
        }
        //public void getData()
        //{
        //    TourDLEntities db = new TourDLEntities();
        //    List<QLTour.Tour> lstSP = db.Tour.Take(1).ToList();
        //    rpAnhDaiDien.DataSource = lstSP;
        //    rpAnhDaiDien.DataBind();
        //}
        void getMoTa(string MaTour)
        {
            TourDLEntities db = new TourDLEntities();
            QLTour.Tour obj = db.Tour.First(x => x.MaTour == MaTour);
            if (db.Tour.FirstOrDefault(x => x.MaTour == MaTour) != null)
            {
                //Load anh Dai dien
                List<QLTour.Media> lst = db.Media.Where(x => x.MaTour == MaTour).Take(1).ToList();
                rpAnhDaiDien.DataSource = lst;
                rpAnhDaiDien.DataBind();

                //Load Mo Ta
                List<QLTour.Tour> mt = db.Tour.Where(x => x.MaTour == MaTour).ToList();
                rpMoTa.DataSource = mt;
                rpMoTa.DataBind();

                //Load Anh Tour
                List<QLTour.Media> lst1 = db.Media.Where(x => x.MaTour == MaTour).ToList();
                rpAnhTour.DataSource = lst1;
                rpAnhTour.DataBind();

                ////Load  Max user
                //List<QLTour.Tour> max = db.Tour.Where(x => x.MaTour == MaTour).ToList();
                //rpLichTrinh.DataSource = max;
                //rpLichTrinh.DataBind();
            }
            else
            {
                Response.Redirect("Offers.aspx");
            }
        }
        void getName(string MaTour)
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> lst = db.Tour.Where(x => x.MaTour == MaTour).ToList();
            rpName.DataSource = lst;
            rpName.DataBind();
        }
        void getGiaVe(string MaTour)
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.CTTour> lst = db.CTTour.Where(x => x.MaTour == MaTour).ToList();
            rpGiaVe.DataSource = lst;
            rpGiaVe.DataBind();
        }
        public string getAnhDaiDien(string MaTour)
        {
            TourDLEntities db = new TourDLEntities();
            QLTour.Tour obj = db.Tour.First(x => x.MaTour == MaTour);
            if (obj.Media.Count(x => x.Main == true) >= 0)
            {
                return obj.Media.First(x => x.Main == true).Url;
            }
            else
            {
                return "";
            }
        }
        void getLichTrinh(string MaTour)
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.LichTrinh> lst = db.LichTrinh.Where(x => x.MaTour == MaTour).ToList();
            rpLichTrinh.DataSource = lst;
            rpLichTrinh.DataBind();
            //check ngay
        //    if (db.LichTrinh.First().NgayBD < DateTime.Now)
        //    {
        //        lbHetHan.Text = "Lịch trình đã hết hạn";
        //    }
        }
        public string getLoaiTour(string MaLoaiTour)
        {
            TourDLEntities db = new TourDLEntities();
            return db.LoaiTour.First(x => x.MaLoaiTour == MaLoaiTour).TenLoaiTour;
        }
        //public void getLoaiTour(string MaTour)
        //{
        //    TourDLEntities db = new TourDLEntities();
        //    int soluong = db.Tour.Count(x => x.MaLoaiTour.ToString() == "lt001");
        //    if (soluong == 1)
        //    {
        //        lbLoaiTour.Text = "Tour trong nước";
        //    }
        //    else
        //    {
        //        lbLoaiTour.Text = "Tour ngoài nước hay còn gọi là tour nước ngoài";
        //    }
        //}
        //public void getMaxUser(string MaTour)
        //{
        //    //Load  Max user
        //    TourDLEntities db = new TourDLEntities();
        //    List<QLTour.Tour> max = db.Tour.Where(x => x.MaTour == MaTour).ToList();
        //    rpLichTrinh.DataSource = max;
        //    rpLichTrinh.DataBind();
        //}
        public string getLoaiPT(string MaPT)
        {
            TourDLEntities db = new TourDLEntities();
            return db.PhuongTien.First(x => x.MaPT == MaPT).TenPT;
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                TourDLEntities db = new TourDLEntities();

                string name = "Nguoi dung an danh";
                if (Session["TaiKhoan"] != null)
                {
                    string taikhoan = Session["TaiKhoan"].ToString();
                    name = db.KhachHang.First(x => x.TaiKhoan == taikhoan).TenKH.ToString();
                }

                QLTour.Comment obj = new QLTour.Comment();
                obj.MaTour = Request.QueryString["MaTour"].ToString();
                obj.Contents = txtComments.Text;
                obj.Name = name;
                obj.Date_seen = DateTime.Now;

                db.Comment.Add(obj);
                db.SaveChanges();
                Response.Redirect("Single_listing.aspx?MaTour="+ Request.QueryString["MaTour"]);
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Gửi thất bại!');</script>");
                throw;
            }
        }
        //public void getHetHan(string ngay)
        //{
        //    TourDLEntities db = new TourDLEntities();

        //    string ngay1 = db.LichTrinh.First().NgayBD.ToString();
        //    if (ngay1 > DateTime.Now)
        //    {
        //        lbngay.Text = "Tour trong nước";
        //    }
        //    else
        //    {
        //        lbLoaiTour.Text = "Tour ngoài nước hay còn gọi là tour nước ngoài";
        //    }
        //}
    }
}