using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class QLCTTour : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcmbmatour();
                getcmbtentour();
                getcmbmadddl();
                getcmbmaks();
                getcmbmalpt();
                // kiểm tra trường hợp sửa/thêm mới
                // nếu url có dạng ?masp=123 => sửa, ngược lại là thêm mới
                if (Request.QueryString["MaCTTour"] == null)
                {
                    // thêm mới
                    btnSave.Visible = false;
                    btnAdd.Visible = true;
                    txtMaCTTour.Text = Request.QueryString["MaCTTour"];
                    txtMaCTTour.Enabled = false;
                    txtMaCTTour.CssClass = txtMaCTTour.CssClass + " form-control";
                }
                else
                {
                    // Sửa
                    btnSave.Visible = true;
                    btnAdd.Visible = false;
                    txtMaCTTour.Text = Request.QueryString["MaCTTour"];
                    txtMaCTTour.Enabled = false;
                    txtMaCTTour.CssClass = txtMaCTTour.CssClass + " form-control";
                    // Query về db để lấy các thông tin còn lại
                    TourDLEntities db = new TourDLEntities();
                    QLTour.CTTour obj = db.CTTour.FirstOrDefault(x => x.MaCTTour == txtMaCTTour.Text);
                    if (obj == null)
                    {
                        Response.Redirect("CTTours.aspx");
                    }
                    else
                    {
                        cmbMaTour.SelectedValue = obj.MaTour;
                        //cmbTenTour.SelectedValue = obj.TenTour;?
                        txtMoTaCT.Text = obj.MoTaCT;
                        txtGiaVeNL.Text = obj.GiaveNL.ToString();
                        txtGiaVeTE.Text = obj.GiaVeTE.ToString();
                        cmbMaDDDL.SelectedValue = obj.MaDDDL;
                        cmbMaKS.SelectedValue = obj.MaKS;
                        cmbMaLPT.SelectedValue = obj.MaLPT;
                    }
                }
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
        void getcmbtentour()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> lst = db.Tour.ToList();
            cmbTenTour.DataSource = lst;
            //cmbTenTour.DataTextField = "TenTour";
            cmbTenTour.DataValueField = "TenTour";
            cmbTenTour.DataBind();
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
        void getcmbmaks()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.KhachSan> lst = db.KhachSan.ToList();
            cmbMaKS.DataSource = lst;
            cmbMaKS.DataTextField = "TenKS";
            cmbMaKS.DataValueField = "MaKS";
            cmbMaKS.DataBind();
        }
        void getcmbmalpt()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.LoaiPhuongTien> lst = db.LoaiPhuongTien.ToList();
            cmbMaLPT.DataSource = lst;
            cmbMaLPT.DataTextField = "TenLPT";
            cmbMaLPT.DataValueField = "MaLPT";
            cmbMaLPT.DataBind();
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("CTTours.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                // Sửa dữ liệu
                TourDLEntities db = new TourDLEntities();
                QLTour.CTTour obj = db.CTTour.FirstOrDefault(x => x.MaCTTour == txtMaCTTour.Text);
                if (obj == null)
                {
                    Response.Redirect("CTTours.aspx");
                }
                else
                {

                    obj.MaTour = cmbMaTour.SelectedValue;
                    //obj.TenTour = cmbTenTour.SelectedValue;?
                    obj.MoTaCT = txtMoTaCT.Text;
                    obj.GiaveNL = Int32.Parse(txtGiaVeNL.Text);
                    obj.GiaVeTE = Int32.Parse(txtGiaVeTE.Text);
                    obj.MaDDDL = cmbMaDDDL.SelectedValue;
                    obj.MaKS = cmbMaKS.SelectedValue;
                    obj.MaLPT = cmbMaLPT.SelectedValue;

                    db.SaveChanges();
                    Response.Redirect("CTTours.aspx");
                }
            }
            catch
            {
                // Lỗi 
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                TourDLEntities db = new TourDLEntities();
                QLTour.CTTour obj = db.CTTour.FirstOrDefault(x => x.MaCTTour == txtMaCTTour.Text);
                if (obj != null)
                {
                    // Cảnh báo mã sản phẩm đã tồn tại
                    lbthongbao.Text = "tài khoản đã tồn tại!";

                }
                else
                {

                    if (txtGiaVeNL.Text == "" || txtGiaVeTE.Text == "")
                    {
                        lbthongbao.Text = "Bạn chưa nhập giá vé!";
                    }
                    else
                    {
                        obj = new QLTour.CTTour();
                        obj.MaCTTour = getmacttour();
                        obj.MaTour = cmbMaTour.Text;
                        //obj.TenTour = cmbTenTour.SelectedValue;?
                        obj.MoTaCT = txtMoTaCT.Text;
                        obj.GiaveNL = Int32.Parse(txtGiaVeNL.Text);
                        obj.GiaVeTE = Int32.Parse(txtGiaVeTE.Text);
                        obj.MaDDDL = cmbMaDDDL.Text;
                        obj.MaKS = cmbMaKS.Text;
                        obj.MaLPT = cmbMaLPT.Text;

                        db.CTTour.Add(obj);
                        db.SaveChanges();
                        Response.Redirect("CTTours.aspx");
                    }
                }
            }
            catch
            {
                // Lỗi
                lbthongbao.Text = "Lỗi không thể thêm!";
            }
        }
        public string getmacttour()
        {
            TourDLEntities db = new TourDLEntities();
            string maMax = db.CTTour.Max(x => x.MaCTTour);

            string ma;
            int a = int.Parse(maMax.Substring(3));
            a++;
            if (a < 10)
            {
                ma = "CTT00" + a;
            }
            else
            {
                ma = "CTT0" + a;
            }
            return ma;

        }
    }
}