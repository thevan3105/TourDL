using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class QLLichTrinh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getPhut();
                getgio();
                getngay();
                getthang();
                getnam();
                getcmbmatour();
                getcmbmapt();
                getgiobd();
                getPhutbd();
                getngaybd();
                getthangbd();
                getnambd();
                getcmbmatour();
                getcmbmapt();
                // kiểm tra trường hợp sửa/thêm mới
                // nếu url có dạng ?masp=123 => sửa, ngược lại là thêm mới
                if (Request.QueryString["MaLT"] == null)
                {
                    // thêm mới
                    btnSave.Visible = false;
                    btnAdd.Visible = true;
                    txtMaLT.Enabled = false;
                    txtMaLT.CssClass = txtMaLT.CssClass + " form-control";
                }
                else
                {
                    // Sửa
                    btnSave.Visible = true;
                    btnAdd.Visible = false;
                    txtMaLT.Text = Request.QueryString["MaLT"];
                    txtMaLT.Enabled = false;
                    txtMaLT.CssClass = txtMaLT.CssClass + " form-control";
                    // Query về db để lấy các thông tin còn lại
                    TourDLEntities db = new TourDLEntities();
                    QLTour.LichTrinh obj = db.LichTrinh.FirstOrDefault(x => x.MaLT == txtMaLT.Text);
                    if (obj == null)
                    {
                        Response.Redirect("QLTours.aspx");
                    }
                    else
                    {
                        cmbNam.SelectedValue = obj.NgayKT.Value.Year.ToString();
                        cmbThang.SelectedValue = obj.NgayKT.Value.Month.ToString();
                        cmbNgay.SelectedValue = obj.NgayKT.Value.Day.ToString();
                        cmbNambd.SelectedValue = obj.NgayBD.Value.Year.ToString();
                        cmbThangbd.SelectedValue = obj.NgayBD.Value.Month.ToString();
                        cmbNgaybd.SelectedValue = obj.NgayBD.Value.Day.ToString();
                        cmbGiobd.Text = obj.NgayBD.Value.Hour.ToString();
                        //cmbPhutbd = obj.NgayBD.Value.Minute.ToString();
                        //txtChiPhi.Text = obj.ChiPhi.ToString();?
                        cmbMaTour.Text = obj.MaTour;
                        cmbMaPT.Text = obj.MaPT;
                    }
                }
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("LichTrinhs.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                // Sửa dữ liệu
                TourDLEntities db = new TourDLEntities();
                QLTour.LichTrinh obj = db.LichTrinh.FirstOrDefault(x => x.MaLT == txtMaLT.Text);
                if (obj == null)
                {
                    Response.Redirect("LichTrinhs.aspx");
                }
                else
                {
                    //obj.MaLT = txtMaLT.Text;
                    string ngaybd = cmbThangbd.SelectedValue + "/" + cmbNgaybd.SelectedValue + "/" + cmbNambd.SelectedValue;
                    string ngaykt = cmbThang.SelectedValue + "/" + cmbNgay.SelectedValue + "/" + cmbNam.SelectedValue;
                    string giobd = cmbGiobd.SelectedValue + ":" + cmbPhutbd.SelectedValue + ":00";
                    obj.NgayBD = Convert.ToDateTime(ngaybd + " " + giobd);
                    string giokt = cmbGio.SelectedValue + ":" + cmbPhut.SelectedValue + ":00";
                    obj.NgayKT = Convert.ToDateTime(ngaykt + " " + giokt);
                    //obj.ChiPhi = Int32.Parse(txtChiPhi.Text);?
                    obj.MaTour = cmbMaTour.SelectedValue;
                    obj.MaPT = cmbMaPT.SelectedValue;
                    obj.Slot = Int32.Parse(txtSlot.Text);

                    db.SaveChanges();
                    Response.Redirect("LichTrinhs.aspx");
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
        void getcmbmapt()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.PhuongTien> lt = db.PhuongTien.ToList();
            cmbMaPT.DataSource = lt;
            cmbMaPT.DataTextField = "TenPT";
            cmbMaPT.DataValueField = "MaPT";
            cmbMaPT.DataBind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                TourDLEntities db = new TourDLEntities();
                QLTour.LichTrinh obj = db.LichTrinh.FirstOrDefault(x => x.MaLT == txtMaLT.Text);
                if (obj != null)
                {
                    // Cảnh báo mã sản phẩm đã tồn tại

                }
                else
                {
                    obj = new QLTour.LichTrinh();
                    obj.MaLT = GetMaLTr();
                    string ngaybd = cmbThangbd.SelectedValue + "/" + cmbNgaybd.SelectedValue + "/" + cmbNambd.SelectedValue;
                    string ngaykt = cmbThang.SelectedValue + "/" + cmbNgay.SelectedValue + "/" + cmbNam.SelectedValue;
                    string giobd = cmbGiobd.SelectedValue + ":" + cmbPhutbd.SelectedValue + ":00";
                    obj.NgayBD = Convert.ToDateTime(ngaybd + " " + giobd);
                    string giokt = cmbGio.SelectedValue + ":" + cmbPhut.SelectedValue + ":00";
                    obj.NgayKT = Convert.ToDateTime(ngaykt + " " + giokt);
                    //obj.ChiPhi = Int32.Parse(txtChiPhi.Text);?
                    obj.MaTour = cmbMaTour.SelectedValue;
                    obj.MaPT = cmbMaPT.SelectedValue;
                    obj.Slot = Int32.Parse(txtSlot.Text);

                    db.LichTrinh.Add(obj);
                    db.SaveChanges();
                    Response.Redirect("LichTrinhs.aspx");
                }
            }
            catch
            {
                // Lỗi
            }
        }
        // kết thúc
        public void getngay()
        {
            List<int> lst = new List<int>();
            for (int i = 1; i < 32; i++)
            {
                lst.Add(i);
            }
            cmbNgay.DataSource = lst;
            cmbNgay.DataBind();
        }
        public void getthang()
        {
            List<int> lst = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                lst.Add(i);
            }
            cmbThang.DataSource = lst;
            cmbThang.DataBind();
        }
        public void getnam()
        {
            List<int> lst = new List<int>();
            for (int i = 2015; i < 2030; i++)
            {
                lst.Add(i);
            }
            cmbNam.DataSource = lst;
            cmbNam.DataBind();
        }
        public void getgio()
        {
            List<int> lst = new List<int>();
            for (int i = 0; i < 25; i++)
            {
                lst.Add(i);
            }
            cmbGio.DataSource = lst;
            cmbGio.DataBind();
        }
        public void getPhut()
        {
            List<int> lst = new List<int>();
            for (int i = 0; i < 61; i++)
            {
                lst.Add(i);
            }
            cmbPhut.DataSource = lst;
            cmbPhut.DataBind();
        }

        //----------------  getNgay bắt đầu
        public void getngaybd()
        {
            List<int> lst = new List<int>();
            for (int i = 1; i < 32; i++)
            {
                lst.Add(i);
            }
            cmbNgaybd.DataSource = lst;
            cmbNgaybd.DataBind();
        }
        public void getthangbd()
        {
            List<int> lst = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                lst.Add(i);
            }
            cmbThangbd.DataSource = lst;
            cmbThangbd.DataBind();
        }
        public void getnambd()
        {
            List<int> lst = new List<int>();
            for (int i = 2015; i < 2030; i++)
            {
                lst.Add(i);
            }
            cmbNambd.DataSource = lst;
            cmbNambd.DataBind();
        }

        public void getgiobd()
        {
            List<int> lst = new List<int>();
            for (int i = 0; i < 25; i++)
            {
                lst.Add(i);
            }
            cmbGiobd.DataSource = lst;
            cmbGiobd.DataBind();
        }
        public void getPhutbd()
        {
            List<int> lst = new List<int>();
            for (int i = 0; i < 61; i++)
            {
                lst.Add(i);
            }
            cmbPhutbd.DataSource = lst;
            cmbPhutbd.DataBind();
        }

        public string GetMaLTr()
        {
            TourDLEntities db = new TourDLEntities();
            string maMax = db.LichTrinh.Max(x => x.MaLT);

            string ma;
            int a = int.Parse(maMax.Substring(3));
            a++;
            if (a < 10)
            {
                ma = "l00" + a;
            }
            else
            {
                ma = "l0" + a;
            }
            return ma;

        }

    }
}