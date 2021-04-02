using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class QLLoaiPhuongTien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                // kiểm tra trường hợp sửa/thêm mới
                // nếu url có dạng ?masp=123 => sửa, ngược lại là thêm mới
                if (Request.QueryString["MaLPT"] == null)
                {
                    // thêm mới
                    btnSave.Visible = false;
                    btnAdd.Visible = true;
                    txtMaLPT.Enabled = true;

                }
                else
                {
                    // Sửa
                    btnSave.Visible = true;
                    btnAdd.Visible = false;
                    txtMaLPT.Text = Request.QueryString["MaLPT"];
                    txtMaLPT.Enabled = false;
                    txtMaLPT.CssClass = txtMaLPT.CssClass + " form-control";
                    // Query về db để lấy các thông tin còn lại
                    TourDLEntities db = new TourDLEntities();
                    QLTour.LoaiPhuongTien obj = db.LoaiPhuongTien.FirstOrDefault(x => x.MaLPT == txtMaLPT.Text);
                    if (obj == null)
                    {
                        Response.Redirect("LoaiPhuongTiens.aspx");
                    }
                    else
                    {

                        txtMaLPT.Text = obj.MaLPT;
                        txtTenLPT.Text = obj.TenLPT;
                        //cmbSoCho.SelectedValue = obj.SoCho.ToString();
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
                QLTour.LoaiPhuongTien obj = db.LoaiPhuongTien.FirstOrDefault(x => x.MaLPT == txtMaLPT.Text);
                if (obj == null)
                {
                    //Response.Redirect("LoaiPhuongTien.aspx");
                }
                else
                {
                    obj.TenLPT = txtTenLPT.Text;
                    obj.MaLPT = txtMaLPT.Text;
                    //obj.SoCho = Int32.Parse(cmbSoCho.SelectedValue);

                    db.SaveChanges();
                    Response.Redirect("LoaiPhuongTiens.aspx");
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
                QLTour.LoaiPhuongTien obj = db.LoaiPhuongTien.FirstOrDefault(x => x.MaLPT == txtMaLPT.Text);
                if (obj != null)
                {
                    // Cảnh báo mã sản phẩm đã tồn tại

                }
                else
                {
                    if (txtTenLPT.Text == "" || txtMaLPT.Text == "")
                    {
                        lbErrordangky.Text = "Bạn chưa nhập đủ thông tin!!!";
                    }
                    else
                    {
                        obj = new QLTour.LoaiPhuongTien();
                        obj.TenLPT = txtTenLPT.Text;
                        obj.MaLPT = txtMaLPT.Text;

                        db.LoaiPhuongTien.Add(obj);
                        db.SaveChanges();
                        Response.Redirect("LoaiPhuongTiens.aspx");
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
            Response.Redirect("LoaiPhuongTiens.aspx");
        }

        //public string getmaloaiphuongtien()
        //{
        //    TDLEntities db = new TDLEntities();
        //    string maMax = db.LOAIPHUONGTIEN.Max(x => x.MaLPT);

        //    string ma;
        //    int a = int.Parse(maMax.Substring(2));
        //    a++;
        //    if (a < 10)
        //    {
        //        ma = "LPT00" + a;
        //    }
        //    else
        //    {
        //        ma = "LPT0" + a;
        //    }
        //    return ma;

        //}
        //public string AutoGetma()
        //{
        //    string malpt = getmaloaiphuongtien();
        //    int MLPT = int.Parse(malpt.Substring(3));
        //    MLPT++;
        //    if (MLPT < 10)
        //    {
        //        malpt = "LPT00" + MLPT;
        //    }
        //    else
        //    {
        //        malpt = "LPT0" + MLPT;
        //    }
        //    return malpt;
        //}
    }
}