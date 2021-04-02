using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class QLKhachSan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcmbdddl();
                // kiểm tra trường hợp sửa/thêm mới
                // nếu url có dạng ?masp=123 => sửa, ngược lại là thêm mới
                if (Request.QueryString["MaKS"] == null)
                {
                    // thêm mới

                    btnSave.Visible = false;
                    btnAdd.Visible = true;
                    txtMaKS.Enabled = false;
                    txtMaKS.CssClass = txtMaKS.CssClass + " form-control";
                }
                else
                {
                    // Sửa
                    btnSave.Visible = true;
                    btnAdd.Visible = false;
                    txtMaKS.Text = Request.QueryString["MaKS"];
                    txtMaKS.Enabled = false;
                    txtMaKS.CssClass = txtMaKS.CssClass + " form-control";
                    // Query về db để lấy các thông tin còn lại
                    TourDLEntities db = new TourDLEntities();
                    QLTour.KhachSan obj = db.KhachSan.FirstOrDefault(x => x.MaKS == txtMaKS.Text);
                    if (obj == null)
                    {
                        Response.Redirect("KhachSans.aspx");
                    }
                    else
                    {
                        txtMaKS.Text = obj.MaKS;
                        txtTenKS.Text = obj.TenKS;
                        txtSDT.Text = obj.SDT.ToString();
                        txtEmail.Text = obj.Email;
                        cmbdddl.SelectedValue = obj.MaDDDL;
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
                QLTour.KhachSan obj = db.KhachSan.FirstOrDefault(x => x.MaKS == txtMaKS.Text);
                if (obj == null)
                {
                    Response.Redirect("KhachSans.aspx");
                }
                else
                {
                    if (txtTenKS.Text == "" || txtSDT.Text == "" || txtEmail.Text == "")
                    {
                        lbErrordangky.Text = "Bạn chưa nhập đủ thông tin!!!";
                    }
                    else
                    {
                        //obj.MaKS = txtMaKS.Text;
                        obj.TenKS = txtTenKS.Text;
                        obj.SDT = Int32.Parse(txtSDT.Text);
                        obj.Email = txtEmail.Text;
                        obj.MaDDDL = cmbdddl.SelectedValue;

                        db.SaveChanges();
                        Response.Redirect("KhachSans.aspx");
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
                QLTour.KhachSan obj = db.KhachSan.FirstOrDefault(x => x.MaKS == txtMaKS.Text);
                if (obj != null)
                {
                    // Cảnh báo mã sản phẩm đã tồn tại

                }
                else
                {
                    if (txtTenKS.Text == "" || txtSDT.Text == "" || txtEmail.Text == "")
                    {
                        lbErrordangky.Text = "Bạn chưa nhập đủ thông tin!!!";
                    }
                    else
                    {
                        obj = new QLTour.KhachSan();
                        obj.MaKS = getmaks();
                        obj.TenKS = txtTenKS.Text;
                        obj.SDT = Int32.Parse(txtSDT.Text);
                        obj.Email = txtEmail.Text;
                        obj.MaDDDL = cmbdddl.SelectedValue;


                        db.KhachSan.Add(obj);
                        db.SaveChanges();
                        Response.Redirect("KhachSans.aspx");
                    }
                }
            }
            catch
            {
                // Lỗi
            }
        }
        void getcmbdddl()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.DiaDiemDL> lst = db.DiaDiemDL.ToList();
            cmbdddl.DataSource = lst;
            cmbdddl.DataTextField = "TenDDDL";
            cmbdddl.DataValueField = "MaDDDL";
            cmbdddl.DataBind();
        }
        public string getmaks()
        {
            TourDLEntities db = new TourDLEntities();
            string maMax = db.KhachSan.Max(x => x.MaKS);

            string ma;
            int a = int.Parse(maMax.Substring(2));
            a++;
            if (a < 10)
            {
                ma = "KS00" + a;
            }
            else
            {
                ma = "KS0" + a;
            }
            return ma;

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("KhachSans.aspx");
        }
    }
}