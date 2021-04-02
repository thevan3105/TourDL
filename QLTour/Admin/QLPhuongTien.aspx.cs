using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class QLPhuongTien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcmbMaLPT();
                getcmbSoCho();
                // kiểm tra trường hợp sửa/thêm mới
                // nếu url có dạng ?masp=123 => sửa, ngược lại là thêm mới
                if (Request.QueryString["MaPT"] == null)
                {
                    // thêm mới
                    btnSave.Visible = false;
                    btnAdd.Visible = true;
                    txtMaPT.Text = Request.QueryString["MaPT"];
                    txtMaPT.Enabled = false;
                    txtMaPT.CssClass = txtMaPT.CssClass + " form-control";
                }
                else
                {
                    // Sửa
                    btnSave.Visible = true;
                    btnAdd.Visible = false;
                    txtMaPT.Text = Request.QueryString["MaPT"];
                    txtMaPT.Enabled = false;
                    txtMaPT.CssClass = txtMaPT.CssClass + " form-control";
                    // Query về db để lấy các thông tin còn lại
                    TourDLEntities db = new TourDLEntities();
                    QLTour.PhuongTien obj = db.PhuongTien.FirstOrDefault(x => x.MaPT == txtMaPT.Text);
                    if (obj == null)
                    {
                        Response.Redirect("PhuongTiens.aspx");
                    }
                    else
                    {
                        txtMaPT.Text = obj.MaPT;
                        txtTenPT.Text = obj.TenPT;
                        cmbMaLPT.SelectedValue = obj.MaLPT;
                        cmbSoCho.SelectedValue = obj.SoCho.ToString();
                    }
                }
            }
        }
        void getcmbMaLPT()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.LoaiPhuongTien> lst = db.LoaiPhuongTien.ToList();
            cmbMaLPT.DataSource = lst;
            cmbMaLPT.DataTextField = "TenLPT";
            cmbMaLPT.DataValueField = "MaLPT";
            cmbMaLPT.DataBind();
        }

        void getcmbSoCho()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.PhuongTien> lst = db.PhuongTien.ToList();
            cmbSoCho.DataSource = lst;
            cmbSoCho.DataTextField = "MaLPT";
            cmbSoCho.DataValueField = "SoCho";
            cmbSoCho.DataBind();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                // Sửa dữ liệu
                TourDLEntities db = new TourDLEntities();
                QLTour.PhuongTien obj = db.PhuongTien.FirstOrDefault(x => x.MaPT == txtMaPT.Text);
                if (obj == null)
                {
                    Response.Redirect("PhuongTiens.aspx");
                }
                else
                {

                    //obj.MaPT = txtMaPT.Text;
                    obj.TenPT = txtTenPT.Text;
                    obj.MaLPT = cmbMaLPT.SelectedValue;
                    obj.SoCho = Int32.Parse(cmbSoCho.SelectedValue);

                    db.SaveChanges();
                    Response.Redirect("PhuongTiens.aspx");
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
                QLTour.PhuongTien obj = db.PhuongTien.FirstOrDefault(x => x.MaPT == txtMaPT.Text);
                if (obj != null)
                {
                    // Cảnh báo mã sản phẩm đã tồn tại

                }
                else
                {
                    if (txtTenPT.Text == "")
                    {
                        lbErrordangky.Text = "Bạn chưa nhập đủ thông tin!!!";
                    }
                    else
                    {
                        obj = new QLTour.PhuongTien();
                        obj.MaPT = GetMaPT();
                        obj.TenPT = txtTenPT.Text;
                        obj.MaLPT = cmbMaLPT.SelectedValue;
                        obj.SoCho = Int32.Parse(cmbSoCho.SelectedValue);

                        db.PhuongTien.Add(obj);
                        db.SaveChanges();
                        Response.Redirect("PhuongTiens.aspx");
                    }
                }
            }
            catch
            {
                // Lỗi
                lbErrordangky.Text = "Lỗi không thể đăng ký!!!";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("PhuongTiens.aspx");
        }

        public string GetMaPT()
        {
            TourDLEntities db = new TourDLEntities();
            string maMax = db.PhuongTien.Max(x => x.MaPT);

            string ma;
            int a = int.Parse(maMax.Substring(2));
            a++;
            if (a < 10)
            {
                ma = "pt00" + a;
            }
            else
            {
                ma = "pt0" + a;
            }
            return ma;

        }
    }
}