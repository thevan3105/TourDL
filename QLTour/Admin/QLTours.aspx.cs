using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class QLTours : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //getcmbLoaitour();
                // kiểm tra trường hợp sửa/thêm mới
                // nếu url có dạng ?masp=123 => sửa, ngược lại là thêm mới
                if (Request.QueryString["Matour"] == null)
                {
                    // thêm mới
                    btnSave.Visible = false;
                    btnAdd.Visible = true;
                    txtMaTour.Enabled = true;
                    //txtMaTour.Text = Request.QueryString["MaTour"];
                    txtMaTour.Enabled = false;
                    txtMaTour.CssClass = txtMaTour.CssClass + " form-control";
                }
                else
                {
                    // Sửa
                    btnSave.Visible = true;
                    btnAdd.Visible = false;
                    txtMaTour.Text = Request.QueryString["MaTour"];
                    txtMaTour.Enabled = false;
                    txtMaTour.CssClass = txtMaTour.CssClass + " form-control";
                    // Query về db để lấy các thông tin còn lại
                    TourDLEntities db = new TourDLEntities();
                    string manv = Session["username"].ToString();
                    QLTour.Tour obj = db.Tour.FirstOrDefault(x => x.MaTour == txtMaTour.Text);
                    if (obj == null)
                    {
                        Response.Redirect("QLTours.aspx");
                    }
                    else
                    {
                        QLTour.NhanVien ob = db.NhanVien.FirstOrDefault(p => p.MaNV == manv);
                        string quyen = ob.NghiepVu;
                        if (quyen == "CSKH" || quyen=="SELL")
                        {
                            btnSave.Visible = false;
                            txtTenTour.Text = obj.TenTour;
                            txtGiaTour.Text = obj.GiaTien.ToString();
                            cmbMaLoaiTour.SelectedValue = obj.MaTour;
                            txtMaxUser.Text = obj.Maxuser.ToString();
                            txtMinUser.Text = obj.Minuser.ToString();
                            txtMieuTaNgan.Text = obj.MoTa;
                        }
                        else
                        {
                            txtTenTour.Text = obj.TenTour;
                            txtGiaTour.Text = obj.GiaTien.ToString();
                            cmbMaLoaiTour.SelectedValue = obj.MaTour;
                            txtMaxUser.Text = obj.Maxuser.ToString();
                            txtMinUser.Text = obj.Minuser.ToString();
                            txtMieuTaNgan.Text = obj.MoTa;
                        }
                    }

                }
            }
        }
        //void getcmbLoaitour()
        //{
        //    TourDLEntities db = new TourDLEntities();
        //    List<QLTour.LoaiTour> lst = db.LoaiTour.ToList();
        //    cmbMaLoaiTour.DataSource = lst;
        //    cmbMaLoaiTour.DataTextField = "TenLoaiTour";
        //    cmbMaLoaiTour.DataValueField = "MaLoaiTour";
        //    cmbMaLoaiTour.DataBind();
        //}
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                // Sửa dữ liệu
                TourDLEntities db = new TourDLEntities();
                QLTour.Tour obj = db.Tour.FirstOrDefault(x => x.MaTour == txtMaTour.Text);
                if (obj == null)
                {
                    Response.Redirect("Tours.aspx");
                }
                else
                {

                    //obj.MaTour = txtMaTour.Text;
                    obj.TenTour = txtTenTour.Text;
                    obj.MaLoaiTour = cmbMaLoaiTour.SelectedValue;
                    obj.GiaTien = Int32.Parse(txtGiaTour.Text);
                    obj.Maxuser = Int32.Parse(txtMaxUser.Text);
                    obj.Minuser = Int32.Parse(txtMinUser.Text);
                    obj.MoTa = txtMieuTaNgan.Text;

                    db.SaveChanges();
                    Response.Redirect("Tours.aspx");
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
                QLTour.Tour obj = db.Tour.FirstOrDefault(x => x.MaTour == txtMaTour.Text);
                if (obj != null)
                {
                    // Cảnh báo mã sản phẩm đã tồn tại

                }
                else
                {
                    if (txtTenTour.Text == "" || txtGiaTour.Text == "")
                    {
                        lbloi.Text = "bạn chưa nhập đủ thông tin!";
                    }
                    else
                    {
                        obj = new QLTour.Tour();
                        obj.MaTour = getmatour();
                        obj.TenTour = txtTenTour.Text;
                        obj.MaLoaiTour = cmbMaLoaiTour.SelectedValue;
                        obj.GiaTien = Int32.Parse(txtGiaTour.Text);
                        obj.Maxuser = Int32.Parse(txtMaxUser.Text);
                        obj.Minuser = Int32.Parse(txtMinUser.Text);
                        obj.MoTa = txtMieuTaNgan.Text;


                        db.Tour.Add(obj);
                        db.SaveChanges();
                        Response.Redirect("Tours.aspx");
                    }
                    
                }
            }
            catch
            {
                // Lỗi
            }
        }
        public string getmatour()
        {
            TourDLEntities db = new TourDLEntities();
            string maMax = db.Tour.Max(x => x.MaTour);

            string ma;
            int a = int.Parse(maMax.Substring(2));
            a++;
            if (a < 10)
            {
                ma = "t00" + a;
            }
            else
            {
                ma = "t0" + a;
            }
            return ma;

        }
        
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tours.aspx");
        }
    }
}