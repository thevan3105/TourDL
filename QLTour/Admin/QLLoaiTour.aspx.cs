using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class QLLoaiTour : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                // kiểm tra trường hợp sửa/thêm mới
                // nếu url có dạng ?masp=123 => sửa, ngược lại là thêm mới
                if (Request.QueryString["MaLoaiTour"] == null)
                {
                    // thêm mới
                    btnSave.Visible = false;
                    btnAdd.Visible = true;
                    txtMaLoaiTour.Text = Request.QueryString["MaLoaiTour"];
                    txtMaLoaiTour.Enabled = false;
                    txtMaLoaiTour.CssClass = txtMaLoaiTour.CssClass + " form-control";
                }
                else
                {
                    // Sửa
                    btnSave.Visible = true;
                    btnAdd.Visible = false;
                    txtMaLoaiTour.Text = Request.QueryString["MaLoaiTour"];
                    txtMaLoaiTour.Enabled = false;
                    txtMaLoaiTour.CssClass = txtMaLoaiTour.CssClass + " form-control";
                    // Query về db để lấy các thông tin còn lại
                    TourDLEntities db = new TourDLEntities();
                    QLTour.LoaiTour obj = db.LoaiTour.FirstOrDefault(x => x.MaLoaiTour == txtMaLoaiTour.Text);
                    if (obj == null)
                    {
                        Response.Redirect("LoaiTours.aspx");
                    }
                    else
                    {
                        txtMaLoaiTour.Text = obj.MaLoaiTour;
                        txtTenLoaiTou.Text = obj.TenLoaiTour;
                    }
                }
            }
        }
        
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                // Sửa dữ liệu
                TourDLEntities db = new TourDLEntities();
                QLTour.LoaiTour obj = db.LoaiTour.FirstOrDefault(x => x.MaLoaiTour == txtMaLoaiTour.Text);
                if (obj == null)
                {
                    Response.Redirect("LoaiTours.aspx");
                }
                else
                {
                    if (txtTenLoaiTou.Text == "")
                    {
                        lbErrordangky.Text = "Bạn chưa nhập tên loại tour!";
                    }
                    else
                    {
                        obj.MaLoaiTour = txtMaLoaiTour.Text;
                        obj.TenLoaiTour = txtTenLoaiTou.Text;

                        db.SaveChanges();
                        Response.Redirect("LoaiTours.aspx");
                    }
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
                QLTour.LoaiTour obj = db.LoaiTour.FirstOrDefault(x => x.MaLoaiTour == txtMaLoaiTour.Text);
                if (obj != null)
                {
                    // Cảnh báo mã sản phẩm đã tồn tại

                }
                else
                {
                    if(txtTenLoaiTou.Text=="")
                    {
                        lbErrordangky.Text = "Bạn chưa nhập tên loại tour!";
                    }
                    else
                    {
                        obj = new QLTour.LoaiTour();
                        obj.MaLoaiTour = GetMatour();
                        obj.TenLoaiTour = txtTenLoaiTou.Text;

                        db.LoaiTour.Add(obj);
                        db.SaveChanges();
                        Response.Redirect("LoaiTours.aspx");
                    }
                }
            }
            catch
            {
                // Lỗi
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoaiTours.aspx");
        }

        public string GetMatour()
        {
            TourDLEntities db = new TourDLEntities();
            string maMax = db.LoaiTour.Max(x => x.MaLoaiTour);

            string ma;
            int a = int.Parse(maMax.Substring(2));
            a++;
            if (a < 10)
            {
                ma = "LT00" + a;
            }
            else
            {
                ma = "LT0" + a;
            }
            return ma;

        }

    }
}