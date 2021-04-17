using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour
{
    public partial class EditInfo : System.Web.UI.Page
    {
        TourDLEntities db = new TourDLEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
                {
                    //Chưa đăng nhập
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    //Load dữ liệu
                    lbTaiKhoan.Text = Session["TaiKhoan"].ToString();
                    // Query về db để lấy các thông tin còn lại
                    QLTour.KhachHang obj = db.KhachHang.FirstOrDefault(x => x.TaiKhoan == lbTaiKhoan.Text);
                    if (obj == null)
                    {
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        txtName.Text = obj.TenKH;
                        cbGioiTinh.SelectedValue = obj.GioiTinh;
                        txtQuocTich.Text = obj.QuocTich;
                        txtCMND.Text = obj.CMND;
                        txtDiaChi.Text = obj.DiaChi;
                        txtSoDT.Text = obj.SDT;
                        string makh = obj.MaKH;
                        getdata(makh);
                        //tongtien(makh);
                        //conditions ranting

                    }
                }
                //getData();
            }
        }
        public bool getVisibleDG(string mave)
        {
            int abc = int.Parse(mave);
            QLTour.Booking obj = db.Booking.First(x =>x.MaVe == abc);
            if (obj.DanhGia.Count(x =>x.Diem != null) > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        public bool getVisibleDG1(string mave)
        {
            int abc = int.Parse(mave);
            QLTour.Booking obj = db.Booking.First(x => x.MaVe == abc);
            if (obj.DanhGia.Count(x => x.Diem != null) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public string getTrangThai(string trangthai)
        {
            if (trangthai == "0")
            {
                return "chờ duyệt";
            }
            else if (trangthai == "1")
            {
                return "đã duyệt";
            }
            else if (trangthai == "2")
            {
                return "Không được duyệt";
            }
            else
            {
                return "";
            }
        }

        void getdata(string makh)
        {
            try
            {
                if (db.Booking.FirstOrDefault(x => x.MaKH == makh) == null)
                {
                    lbError.Text = "bạn chưa có giao dịch";
                }
                else
                {
                    List<QLTour.Booking> lst = db.Booking.Where(x => x.MaKH == makh).ToList();
                    var listsort = lst.OrderByDescending(y => y.MaVe);
                    dgvLichSu.DataSource = listsort;
                    dgvLichSu.DataBind();
                }
            }
            catch (Exception)
            {

            }
        }
        public string getTenTour(string MaTour)
        {
            return db.Tour.First(x => x.MaTour == MaTour).TenTour;
        }

        public string getLichtrinhBD(string MaLT)
        {
            return db.LichTrinh.First(x => x.MaLT == MaLT).NgayBD.ToString();
        }
        public string getLichtrinhKT(string MaLT)
        {
            return db.LichTrinh.First(x => x.MaLT == MaLT).NgayKT.ToString();
        }
        public string getDiaDiem(string MaDDDL)
        {
            return db.DiaDiemDL.First(x => x.MaDDDL == MaDDDL).TenDDDL.ToString();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                // Sửa dữ liệu
                QLTour.KhachHang obj = db.KhachHang.FirstOrDefault(x => x.TaiKhoan == lbTaiKhoan.Text);
                if (obj == null)
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    obj.TenKH = txtName.Text;
                    obj.GioiTinh = cbGioiTinh.SelectedValue;
                    obj.QuocTich = txtQuocTich.Text;
                    obj.CMND = txtCMND.Text;
                    obj.DiaChi = txtDiaChi.Text;
                    obj.SDT = txtSoDT.Text;

                    db.SaveChanges();
                    Response.Redirect("Home.aspx");
                }
            }
            catch
            {
                // Lỗi 
            }
        }

        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {
            string mave = e.CommandArgument.ToString();
            int abc = Int32.Parse(mave);
            QLTour.Booking obj = db.Booking.FirstOrDefault(x => x.MaVe == abc);

            if (obj.TrangThai == 1)
            {
                Response.Redirect("Home.aspx");
                //Response.Write("<script>alert('Bạn không thể xóa khi admin đã xác nhận tour thành công!');</script>");
            }
            else if (obj != null)
            {
                db.Booking.Remove(obj);
                db.SaveChanges();
                Response.Redirect("EditInfo.aspx");
            }
            
        }

        protected void btnRating_Command(object sender, CommandEventArgs e)
        {
            string MaVe = e.CommandArgument.ToString();
            int mave = Int32.Parse(MaVe);
            QLTour.Booking obj = db.Booking.FirstOrDefault(x => x.MaVe == mave);
            string matour = obj.MaTour;
            string makh = obj.MaKH;

            Response.Redirect("Reviews.aspx?MaTour=" + matour + "&MaVe=" + MaVe + "&MaKH=" + makh);
        }
    }
}