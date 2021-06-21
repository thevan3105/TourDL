using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class QLBooKing : System.Web.UI.Page
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
                    getnambk();
                    getngaybk();
                    getthangbk();
                    getSLTE();
                    getSLNL();
                    getcmbmatour();
                    getcmbmalt();
                    //getcmbmanv();
                    //gettrangthai();
                    getcmbmadddl();
                    getcmbmakh();
                    // kiểm tra trường hợp sửa/thêm mới
                    // nếu url có dạng ?masp=123 => sửa, ngược lại là thêm mới
                    if (Request.QueryString["MaVe"] == null)
                    {
                        // thêm mới
                        txtMaVe.Text = Request.QueryString["MaVe"];
                        txtMaVe.Enabled = false;
                        btnSave.Visible = false;
                        btnAdd.Visible = true;
                        //txtMaVe.Enabled = true;
                    }
                    else
                    {
                        // Sửa
                        TourDLEntities db = new TourDLEntities();
                        btnSave.Visible = true;
                        btnAdd.Visible = false;
                        string q = Session["username"].ToString();

                        QLTour.NhanVien ob = db.NhanVien.FirstOrDefault(p => p.MaNV == q);
                        string quyen = ob.NghiepVu;
                        if (quyen == "SELL")
                        {
                            txtMaVe.Text = Request.QueryString["MaVe"];
                            txtMaVe.Enabled = false;
                            txtMaVe.CssClass = txtMaVe.CssClass + " form-control";
                            cmbMaTour.SelectedValue = Request.QueryString["MaTour"];
                            cmbMaTour.Enabled = false;
                            cmbMaTour.CssClass = cmbMaTour.CssClass + " form-control";
                            cmbMaLT.SelectedValue = Request.QueryString["MaLT"];
                            cmbMaLT.Enabled = false;
                            cmbMaLT.CssClass = cmbMaLT.CssClass + " form-control";
                            cmbMaKH.SelectedValue = Request.QueryString["MaKH"];
                            cmbMaKH.Enabled = false;
                            cmbMaKH.CssClass = cmbMaKH.CssClass + " form-control";
                            //--
                            cmbMaDDDL.SelectedValue = Request.QueryString["MaDDDL"];
                            cmbMaDDDL.Enabled = false;
                            cmbMaDDDL.CssClass = cmbMaDDDL.CssClass + " form-control";
                            //--
                            txtMaNV.Text = Request.QueryString["MaNV"];
                            txtMaNV.Enabled = false;
                            txtMaNV.CssClass = txtMaNV.CssClass + " form-control";

                            txtGiaTien.Text = Request.QueryString["GiaTien"];
                            txtGiaTien.Enabled = false;
                            txtGiaTien.CssClass = txtGiaTien.CssClass + " form-control";

                            cmbSLNL.SelectedValue = Request.QueryString["SLNguoiLon"];
                            cmbSLNL.Enabled = false;
                            cmbSLNL.CssClass = cmbSLNL.CssClass + " form-control";

                            cmbSLTE.SelectedValue = Request.QueryString["SLTreEm"];
                            cmbSLTE.Enabled = false;
                            cmbSLTE.CssClass = cmbSLNL.CssClass + " form-control";
                            // Query về db để lấy các thông tin còn lại
                            int mv = Int32.Parse(txtMaVe.Text);
                            QLTour.Booking obj = db.Booking.FirstOrDefault(x => x.MaVe == mv);
                            if (obj == null)
                            {
                                Response.Redirect("QLBooking.aspx");
                            }
                            else
                            {


                                cmbMaLT.Text = obj.MaLT;
                                cmbMaTour.Text = obj.MaTour;
                                txtGiaTien.Text = obj.GiaTien.ToString();
                                txtMaNV.Text = obj.MaNV;
                                cmbMaKH.SelectedValue = obj.MaKH.ToString();
                                cmbMaDDDL.Text = obj.MaDDDL;
                                cmbSLNL.SelectedValue = obj.SLNguoiLon.ToString();
                                cmbSLTE.SelectedValue = obj.SLTreEm.ToString();
                                cmbTrangThai.Text = obj.TrangThai.ToString();
                                cmbNambk.SelectedValue = obj.NgayBook.Value.Year.ToString();
                                cmbThangbk.SelectedValue = obj.NgayBook.Value.Month.ToString();
                                cmbNgaybk.SelectedValue = obj.NgayBook.Value.Day.ToString();
                            }
                        }
                        else
                        {
                            txtMaVe.Text = Request.QueryString["MaVe"];
                            txtMaVe.Enabled = false;
                            txtMaVe.CssClass = txtMaVe.CssClass + " form-control";
                            cmbMaTour.SelectedValue = Request.QueryString["MaTour"];
                            cmbMaTour.Enabled = false;
                            cmbMaTour.CssClass = cmbMaTour.CssClass + " form-control";
                            cmbMaLT.SelectedValue = Request.QueryString["MaLT"];
                            cmbMaLT.Enabled = false;
                            cmbMaLT.CssClass = cmbMaLT.CssClass + " form-control";
                            cmbMaKH.SelectedValue = Request.QueryString["MaKH"];
                            cmbMaKH.Enabled = false;
                            cmbMaKH.CssClass = cmbMaKH.CssClass + " form-control";
                            //--
                            cmbMaDDDL.SelectedValue = Request.QueryString["MaDDDL"];
                            cmbMaDDDL.Enabled = false;
                            cmbMaDDDL.CssClass = cmbMaDDDL.CssClass + " form-control";
                            //--
                            txtMaNV.Text = Request.QueryString["MaNV"];
                            txtMaNV.Enabled = false;
                            txtMaNV.CssClass = txtMaNV.CssClass + " form-control";

                            txtGiaTien.Text = Request.QueryString["GiaTien"];
                            txtGiaTien.Enabled = false;
                            txtGiaTien.CssClass = txtGiaTien.CssClass + " form-control";

                            cmbSLNL.SelectedValue = Request.QueryString["SLNguoiLon"];
                            cmbSLNL.Enabled = false;
                            cmbSLNL.CssClass = cmbSLNL.CssClass + " form-control";

                            cmbSLTE.SelectedValue = Request.QueryString["SLTreEm"];
                            cmbSLTE.Enabled = false;
                            cmbSLTE.CssClass = cmbSLNL.CssClass + " form-control";

                            txtMaNV.Text = Request.QueryString["MaNV"];
                            txtMaNV.Enabled = false;
                            txtMaNV.CssClass = txtMaNV.CssClass + " form-control";

                            cmbTrangThai.SelectedValue = Request.QueryString["TrangThai"];
                            cmbTrangThai.Enabled = false;
                            cmbTrangThai.CssClass = cmbTrangThai.CssClass + " form-control";

                            cmbNambk.SelectedValue = Request.QueryString["NgayBook"];
                            cmbNambk.Enabled = false;
                            cmbNambk.CssClass = cmbNambk.CssClass + " form-control";

                            cmbNgaybk.SelectedValue = Request.QueryString["NgayBook"];
                            cmbNgaybk.Enabled = false;
                            cmbNgaybk.CssClass = cmbNgaybk.CssClass + " form-control";

                            cmbThangbk.SelectedValue = Request.QueryString["NgayBook"];
                            cmbThangbk.Enabled = false;
                            cmbThangbk.CssClass = cmbThangbk.CssClass + " form-control";

                            // Query về db để lấy các thông tin còn lại
                            int mv = Int32.Parse(txtMaVe.Text);
                            QLTour.Booking obj = db.Booking.FirstOrDefault(x => x.MaVe == mv);
                            if (obj == null)
                            {
                                Response.Redirect("QLBooking.aspx");
                            }
                            else
                            {
                                txtMaVe.Text = obj.MaVe.ToString();
                                cmbMaLT.Text = obj.MaLT;
                                cmbMaTour.Text = obj.MaTour;
                                txtGiaTien.Text = obj.GiaTien.ToString();
                                txtMaNV.Text = obj.MaNV;
                                cmbMaKH.SelectedValue = obj.MaKH;
                                cmbMaDDDL.Text = obj.MaDDDL;
                                cmbSLNL.SelectedValue = obj.SLNguoiLon.ToString();
                                cmbSLTE.SelectedValue = obj.SLTreEm.ToString();
                                cmbTrangThai.Text = obj.TrangThai.ToString();
                                cmbNambk.SelectedValue = obj.NgayBook.Value.Year.ToString();
                                cmbThangbk.SelectedValue = obj.NgayBook.Value.Month.ToString();
                                cmbNgaybk.SelectedValue = obj.NgayBook.Value.Day.ToString();
                            }
                        }
                    }
                }
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("BooKings.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                // Sửa dữ liệu
                int mv = Int32.Parse(txtMaVe.Text);
                TourDLEntities db = new TourDLEntities();
                string q = Session["username"].ToString();
                QLTour.Booking obj = db.Booking.FirstOrDefault(x => x.MaVe == mv);
                if (obj == null)
                {
                    Response.Redirect("Bookings.aspx");
                }
                else
                {
                    if (txtGiaTien.Text == "")
                    {
                        lbErrordangky.Text = "Bạn chưa nhập đủ thông tin!!!";
                    }
                    else
                    {
                        if (txtMaNV.Text == "" || q == txtMaNV.Text)
                        {
                            //obj.MaVe = txtMaVe.Text;
                            obj.MaVe = int.Parse(txtMaVe.Text);
                            obj.MaLT = cmbMaLT.SelectedValue;
                            obj.MaTour = cmbMaTour.SelectedValue;
                            obj.GiaTien = Int32.Parse(txtGiaTien.Text);
                            obj.MaNV = q;
                            obj.MaKH = cmbMaKH.SelectedValue;
                            obj.MaDDDL = cmbMaDDDL.SelectedValue;
                            obj.SLNguoiLon = Int32.Parse(cmbSLNL.SelectedValue);
                            obj.SLTreEm = Int32.Parse(cmbSLTE.SelectedValue);
                            obj.TrangThai = Int32.Parse(cmbTrangThai.SelectedValue);
                            string ngaybk = cmbThangbk.SelectedValue + "/" + cmbNgaybk.SelectedValue + "/" + cmbNambk.SelectedValue;
                            obj.NgayBook = Convert.ToDateTime(ngaybk);


                            db.SaveChanges();
                            Response.Redirect("Bookings.aspx");
                        }
                        else
                        {
                            lbErrordangky.Text = "Nhân viên bán tour mới có quyền sửa, Mã nhân viên: " + txtMaNV.Text;
                        }

                    }
                }
            }
            catch
            {
                // Lỗi 
            }
        }

        void getcmbmatour()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> lst = db.Tour.ToList();
            cmbMaTour.DataSource = lst;
            cmbMaTour.DataTextField = "TenTour";
            cmbMaTour.DataValueField = "MaTour";
            cmbMaTour.DataBind();
        }
        void getcmbmalt()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.LichTrinh> lst = db.LichTrinh.ToList();
            cmbMaLT.DataSource = lst;
            cmbMaLT.DataTextField = "MaLT";
            cmbMaLT.DataValueField = "MaLT";
            cmbMaLT.DataBind();
        }
        //void getcmbmanv()
        //{
        //    TourDLEntities db = new TourDLEntities();
        //    List<QLTour.NhanVien> lst = db.NhanVien.ToList();
        //    cmbMaNV.DataSource = lst;
        //    cmbMaNV.DataTextField = "TenNV";
        //    cmbMaNV.DataValueField = "MaNV";
        //    cmbMaNV.DataBind();
        //}
        public void gettrangthai()
        {

            List<string> lst = new List<string>();
            lst.Add("Chờ duyệt");
            lst.Add("Không được duyệt");
            lst.Add("Đã duyệt");
            lst.Add("Bảo lưu");

            cmbTrangThai.DataSource = lst;
            cmbTrangThai.DataBind();
        }
        void getcmbmadddl()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.DiaDiemDL> lst = db.DiaDiemDL.ToList();
            cmbMaDDDL.DataSource = lst;
            cmbMaDDDL.DataTextField = "TenDDDL";
            cmbMaDDDL.DataValueField = "MaDDDL";
            cmbMaDDDL.DataBind();
        }
        void getcmbmakh()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.KhachHang> lst = db.KhachHang.ToList();
            cmbMaKH.DataSource = lst;
            cmbMaKH.DataTextField = "TenKH";
            cmbMaKH.DataValueField = "MaKH";
            cmbMaKH.DataBind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {

            TourDLEntities db = new TourDLEntities();
            QLTour.Booking obj = new Booking();

            if (txtGiaTien.Text == "")
            {
                lbErrordangky.Text = "Bạn chưa nhập đủ thông tin!!!";
            }
            else
            {
                obj = new QLTour.Booking();
                //obj.MaVe = getmave();
                //obj.MaVe = int.Parse(txtMaVe.Text);
                obj.MaLT = cmbMaLT.SelectedValue;
                obj.MaTour = cmbMaTour.SelectedValue;
                obj.GiaTien = Int32.Parse(txtGiaTien.Text);
                obj.MaNV = txtMaNV.Text;
                obj.MaKH = cmbMaKH.SelectedValue;
                obj.MaDDDL = cmbMaDDDL.SelectedValue;
                obj.SLNguoiLon = Int32.Parse(cmbSLNL.SelectedValue);
                obj.SLTreEm = Int32.Parse(cmbSLTE.SelectedValue);
                obj.TrangThai = Int32.Parse(cmbTrangThai.SelectedValue);
                string ngaybk = cmbThangbk.SelectedValue + "/" + cmbNgaybk.SelectedValue + "/" + cmbNambk.SelectedValue;
                obj.NgayBook = Convert.ToDateTime(ngaybk);

                db.Booking.Add(obj);
                db.SaveChanges();
                Response.Redirect("BooKings.aspx");
            }

        }



        //public string getmave()
        //{
        //    TourDLEntities db = new TourDLEntities();
        //    string maMax = db.Booking.Max(x => x.MaVe);

        //    string ma;
        //    int a = int.Parse(maMax.Substring(2));
        //    a++;
        //    if (a < 10)
        //    {
        //        ma = "V00" + a;
        //    }
        //    else
        //    {
        //        ma = "V0" + a;
        //    }
        //    return ma;

        //}


        // SL người lớn và trẻ em
        public void getSLNL()
        {
            List<int> lst = new List<int>();
            for (int i = 1; i < 200; i++)
            {
                lst.Add(i);
            }
            cmbSLNL.DataSource = lst;
            cmbSLNL.DataBind();
        }

        public void getSLTE()
        {
            List<int> lst = new List<int>();
            for (int i = 0; i < 200; i++)
            {
                lst.Add(i);
            }
            cmbSLTE.DataSource = lst;
            cmbSLTE.DataBind();
        }

        public void getngaybk()
        {
            List<int> lst = new List<int>();
            for (int i = 1; i < 32; i++)
            {
                lst.Add(i);
            }
            cmbNgaybk.DataSource = lst;
            cmbNgaybk.DataBind();
        }
        public void getthangbk()
        {
            List<int> lst = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                lst.Add(i);
            }
            cmbThangbk.DataSource = lst;
            cmbThangbk.DataBind();
        }
        public void getnambk()
        {
            List<int> lst = new List<int>();
            for (int i = 2015; i < 2030; i++)
            {
                lst.Add(i);
            }
            cmbNambk.DataSource = lst;
            cmbNambk.DataBind();
        }
    }
}