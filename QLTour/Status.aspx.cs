using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour
{
    public partial class Status : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["MaLT"] == null /*&& Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == ""*/)
                {
                    Response.Redirect("Offers.aspx");
                }
                else
                {
                    getMaTour(Request.QueryString["MaLT"]);
                    getTenTour(lbMaTour.Text.ToString());
                    getGiaVe(lbMaTour.Text.ToString());
                    getGiaTien(lbMaTour.Text.ToString());
                    //lbTongTien.Text = lbGiaTour.Text;
                    getLichTrinh(Request.QueryString["MaLT"]);
                    getInfoKH();
                    getPhuongTien(Request.QueryString["MaLT"]);
                    //getGridview(lbMaTour.Text.ToString());
                    getdata(lbMaTour.Text.ToString());
                    getDDDL(lbMaTour.Text.ToString());
                    getKhachSan(lbMaTour.Text.ToString());
                    //txtTongTien.Text = txtGiaTour.Text;
                }
            }
        }

        public void getDDDL(string MaTour)
        {
            TourDLEntities db = new TourDLEntities();
            QLTour.CTTour obj = db.CTTour.FirstOrDefault(x => x.MaTour == MaTour);
            string MaDDDL = obj.MaDDDL.ToString();
            lbDDDL.Text = db.DiaDiemDL.First(x => x.MaDDDL == MaDDDL).TenDDDL;
        }

        public void getKhachSan(string MaTour)
        {
            TourDLEntities db = new TourDLEntities();
            QLTour.CTTour obj = db.CTTour.FirstOrDefault(x => x.MaTour == MaTour);
            string MaDDDL = obj.MaDDDL.ToString();

            string MaKS = db.KhachSan.First(x => x.MaDDDL == MaDDDL).MaKS;
            lbKhachSan.Text = db.KhachSan.First(x => x.MaKS == MaKS).TenKS;

            //QLTour.DiaDiemDL obj1 = db.DiaDiemDL.FirstOrDefault(x => x.MaDDDL == MaDDDL);
            //string MaKS = obj1.Ma.ToString();
            //lbKhachSan.Text = db.KhachSan.First(x => x.MaKS == MaKS).TenKS;
        }

        //void getData(string MaTour)
        //{
        //    TourDLEntities db = new TourDLEntities();
        //    QLTour.CTTour obj = db.CTTour.FirstOrDefault(x => x.MaTour == MaTour);
        //    string gianl = obj.GiaveNL.ToString();
        //    string giate = obj.GiaVeTE.ToString();

        //    DataTable dt = new DataTable();
        //    dt.Columns.AddRange(new DataColumn[2] { new DataColumn("Item"), new DataColumn("Price") });
        //    dt.Rows.Add("Người lớn", gianl);
        //    dt.Rows.Add("Trẻ em", giate);
        //    GridView1.DataSource = dt;
        //    GridView1.DataBind();
        //    txtGiaNL.Text = obj.GiaveNL.ToString();
        //    txtGiaTE.Text = obj.GiaVeTE.ToString();
        //}

        //
        void getdata(string MaTour)
        {
            TourDLEntities db = new TourDLEntities();
            QLTour.CTTour obj = db.CTTour.FirstOrDefault(x => x.MaTour == MaTour);
            List<QLTour.CTTour> lst = db.CTTour.Where(x => x.MaTour == MaTour).ToList();
            //dgvCTTour.DataSource = lst;
            //dgvCTTour.DataBind();
            txtGiaNL.Text = obj.GiaveNL.ToString();
            txtGiaTE.Text = obj.GiaVeTE.ToString();
        }
        public void getMaTour(string MaLT)
        {
            TourDLEntities db = new TourDLEntities();
            lbMaTour.Text = db.LichTrinh.First(x => x.MaLT == MaLT).MaTour;
        }
        public void getTenTour(string MaTour)
        {
            TourDLEntities db = new TourDLEntities();
            lbTenTour.Text = db.Tour.First(x => x.MaTour == MaTour).TenTour;
        }
        public void getPhuongTien(string MaLT)
        {
            TourDLEntities db = new TourDLEntities();
            QLTour.LichTrinh obj = db.LichTrinh.FirstOrDefault(x => x.MaLT == MaLT);
            lbPhuongTien.Text = db.PhuongTien.First(x => x.MaPT == obj.MaPT).TenPT;
        }
        public void getGiaVe(string MaTour)
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.CTTour> lst = db.CTTour.Where(x => x.MaTour == MaTour).ToList();
            rpGiaVe.DataSource = lst;
            rpGiaVe.DataBind();
        }
        public void getGiaTien(string MaTour)
        {
            TourDLEntities db = new TourDLEntities();
            lbGiaTour.Text = db.Tour.First(x => x.MaTour == MaTour).GiaTien.ToString();
            txtGiaTour.Text = db.Tour.First(x => x.MaTour == MaTour).GiaTien.ToString();
            lbmaxNguoi.Text = db.Tour.First(x => x.MaTour == MaTour).Maxuser.ToString();
        }
        public void getLichTrinh(string MaLT)
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.LichTrinh> ls = db.LichTrinh.Where(x => x.MaLT == MaLT).ToList();
            rpLichTinhTour.DataSource = ls;
            rpLichTinhTour.DataBind();
        }
        public void getInfoKH()
        {
            try
            {
                //Load dữ liệu
                string abc = Session["TaiKhoan"].ToString();
                // Query về db để lấy các thông tin còn lại
                TourDLEntities db = new TourDLEntities();
                QLTour.KhachHang obj = db.KhachHang.FirstOrDefault(x => x.TaiKhoan == abc);
                lbTenKH.Text = obj.TenKH;
                lbDiaChi.Text = obj.DiaChi;
                lbSoDT.Text = obj.SDT;
                string makh = obj.MaKH;
            }
            catch (Exception)
            {
                Response.Redirect("Login.aspx");
            }
        }
        //-------------------------------------------
        //public string getIDBooking()
        //{
        //    TourDLEntities db = new TourDLEntities();
        //    string maMax = db.Booking.Max(x => x.MaVe);
        //    //
        //    string ma;
        //    int a = int.Parse(maMax.Substring(2));
        //    a++;
        //    if (a < 10)
        //    {
        //        ma = "v00" + a;
        //    }
        //    else
        //    {
        //        ma = "v0" + a;
        //    }
        //    return ma;
        //    //TourDLEntities db = new TourDLEntities();
        //    //string maMax = db.Booking.Max(x => x.MaVe);
        //    ////
        //    //string ma;
        //    //int a = int.Parse(maMax.Substring(2));
        //    //a++;
        //    //if (a < 10)
        //    //{
        //    //    ma = "v00" + a;
        //    //}
        //    //else
        //    //{
        //    //    ma = "v0" + a;
        //    //}
        //    //return ma;

        //}
        //public string AutoGetma()
        //{
        //    string matour = getIDBooking();
        //    int MTour = int.Parse(matour.Substring(3));
        //    MTour++;
        //    if (MTour < 10)
        //    {
        //        matour = "v00" + MTour;
        //    }
        //    else
        //    {
        //        matour = "v0" + MTour;
        //    }
        //    return matour;

        //}

        protected void lbtnDatTour_Click(object sender, EventArgs e)
        {
            try
            {
                TourDLEntities db = new TourDLEntities();

                string matour = lbMaTour.Text.ToString();
                //không cần check điều kiện
                //get makh
                string abc = Session["TaiKhoan"].ToString();
                QLTour.KhachHang obj1 = db.KhachHang.FirstOrDefault(x => x.TaiKhoan == abc);
                string makh = obj1.MaKH;
                //get madddl
                QLTour.CTTour obj2 = db.CTTour.FirstOrDefault(x => x.MaTour == matour);
                string madddl = obj2.MaDDDL.ToString();
                //get gia tour
                QLTour.CTTour obj3 = db.CTTour.FirstOrDefault(x => x.MaTour == matour);
                //dgvCTTour.DataSource = lst;
                //dgvCTTour.DataBind();
                int GiaNL = Int32.Parse(obj3.GiaveNL.ToString());
                int GiaTE = Int32.Parse(obj3.GiaVeTE.ToString());
                int SoNL = Int32.Parse(txtSoNL.Text);
                int SoTE = Int32.Parse(txtSoTE.Text);
                int GiaTour = Int32.Parse(txtGiaTour.Text);
                int abcd = 0;

                abcd = abcd + (GiaNL * SoNL) + (GiaTE * SoTE) + GiaTour;

                QLTour.Booking obj = db.Booking.FirstOrDefault();//?
                    obj = new QLTour.Booking();
                    //obj.MaVe = AutoGetma();
                    obj.MaTour = lbMaTour.Text.ToString();
                    obj.SLNguoiLon = Int32.Parse(txtSoNL.Text);
                    obj.SLTreEm = Int32.Parse(txtSoTE.Text);
                    obj.MaLT = Request.QueryString["MaLT"].ToString();
                    obj.MaKH = makh;
                    obj.MaDDDL = madddl;
                    obj.MaNV = null;
                    obj.TrangThai = Int32.Parse("0");
                    obj.GiaTien = abcd;
                    //
                    db.Booking.Add(obj);
                    db.SaveChanges();
                //Response.Write("<script>alert('đặt tour thành công. chúng tôi sẽ liên hệ với bạn sớm!');</script>");
                Response.Redirect("Home.aspx");
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Không thể đặt tour lúc này. vui lòng thử lại!');</script>");
            }
        }
        //
    }
}