using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class QLDDDL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //getcmbTenLoaitour();
            if (!IsPostBack)
            {
                // kiểm tra trường hợp sửa/thêm mới
                // nếu url có dạng ?masp=123 => sửa, ngược lại là thêm mới
                if (Request.QueryString["MaDDDL"] == null)
                {
                    // thêm mới
                    btnSave.Visible = false;
                    btnAdd.Visible = true;
                    //txtMaDDDL.Text = Request.QueryString["MaDDDL"];
                    txtMaDDDL.Enabled = false;
                    txtMaDDDL.CssClass = txtMaDDDL.CssClass + " form-control";
                }
                else
                {
                    // Sửa
                    btnSave.Visible = true;
                    btnAdd.Visible = false;
                    txtMaDDDL.Text = Request.QueryString["MaDDDL"];
                    txtMaDDDL.Enabled = false;
                    txtMaDDDL.CssClass = txtMaDDDL.CssClass + " form-control";
                    // Query về db để lấy các thông tin còn lại
                    TourDLEntities db = new TourDLEntities();
                    QLTour.DiaDiemDL obj = db.DiaDiemDL.FirstOrDefault(x => x.MaDDDL == txtMaDDDL.Text);
                    if (obj == null)
                    {
                        Response.Redirect("DiaDiemDLs.aspx");
                    }
                    else
                    {
                        txtMaDDDL.Text = obj.MaDDDL;
                        txtTenDDDL.Text = obj.TenDDDL;
                        txtDiaChi.Text = obj.DiaChi;
                    }
                }
            }
        }
        public string getmadl()
        {
            TourDLEntities db = new TourDLEntities();
            string maMax = db.DiaDiemDL.Max(x => x.MaDDDL);

            string ma;
            int a = int.Parse(maMax.Substring(4));
            a++;
            if (a < 10)
            {
                ma = "DDDL00" + a;
            }
            else
            {
                ma = "DDDL0" + a;
            }
            return ma;

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                // Sửa dữ liệu
                TourDLEntities db = new TourDLEntities();
                QLTour.DiaDiemDL obj = db.DiaDiemDL.FirstOrDefault(x => x.MaDDDL == txtMaDDDL.Text);
                if (obj == null)
                {
                    Response.Redirect("KhachHangs.aspx");
                }
                else
                {
                    if (txtTenDDDL.Text == "" || txtDiaChi.Text == "")
                    {
                        lbErrordangky.Text = "Bạn chưa nhập đủ thông tin!!!";
                    }
                    else
                    {
                        //obj.MaDDDL = txtMaDDDL.Text;
                        obj.TenDDDL = txtTenDDDL.Text;
                        obj.DiaChi = txtDiaChi.Text;

                        db.SaveChanges();
                        Response.Redirect("DiaDiemDLs.aspx");
                    }
                }
            }
            catch
            {
                // Lỗi
                lbErrordangky.Text = "Lỗi không thể lưu!!!, Vui lòng kiểm tra lại";
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                TourDLEntities db = new TourDLEntities();
                QLTour.DiaDiemDL obj = db.DiaDiemDL.FirstOrDefault(x => x.MaDDDL == txtMaDDDL.Text);
                if (obj != null)
                {
                    // Cảnh báo mã sản phẩm đã tồn tại

                }
                else
                {
                    if (txtTenDDDL.Text == "" || txtDiaChi.Text == "")
                    {
                        lbErrordangky.Text = "Bạn chưa nhập đủ thông tin!!!";
                    }
                    else
                    {
                        obj = new QLTour.DiaDiemDL();
                        obj.MaDDDL = getmadl();
                        obj.TenDDDL = txtTenDDDL.Text;
                        obj.DiaChi = txtDiaChi.Text;


                        db.DiaDiemDL.Add(obj);
                        db.SaveChanges();
                        Response.Redirect("DiaDiemDLs.aspx");
                    }
                }
            }
            catch
            {
                // Lỗi
                lbErrordangky.Text = "Lỗi không thể thêm!!!, Vui lòng kiểm tra lại";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("DiaDiemDLs.aspx");
        }
    }
}