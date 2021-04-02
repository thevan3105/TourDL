using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class Tours : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["username"].ToString() == "")
            {
                // Chưa đăng nhập
                Response.Redirect("login.aspx");
            }
            else
            {

                TourDLEntities db = new TourDLEntities();
                string manv = Session["username"].ToString();

                QLTour.NhanVien obj = db.NhanVien.FirstOrDefault(p => p.MaNV == manv);
                string quyen = obj.NghiepVu;
                if (quyen == "CSKH" || quyen == "SELL")
                {
                    hplBtnThem.Visible = false;
                    getDatacskh();

                }
                else
                {
                    getData();
                }
            }
        }
        public void getDatacskh()
        {

            try
            {
                TourDLEntities db = new TourDLEntities();
                List<QLTour.Tour> lstSP = db.Tour
                    .ToList();
                dgvtourcskh.DataSource = lstSP;
                dgvtourcskh.DataBind();
            }
            catch
            {
                //
            }

        }
        public void getData()
        {

            try
            {
                TourDLEntities db = new TourDLEntities();
                List<QLTour.Tour> lstSP = db.Tour.ToList();
                dgvTour.DataSource = lstSP;
                dgvTour.DataBind();
            }
            catch
            {
                //
            }

        }
        public string getAnhDaiDien(string Matour)
        {
            TourDLEntities db = new TourDLEntities();
            QLTour.Tour obj = db.Tour.First(x => x.MaTour == Matour);
            //var idanh = obj.Media.Where(p => p.MaTour == Matour && p.Main == true).Max(p => p.IDMedia);
            if (obj != null)
            {
                if (obj.Media.Count(x => x.Main == true) > 0)
                {

                    return obj.Media.First(x => x.Main == true).Url;
                    //return idanh;
                }
                else
                {

                    return "";
                }
            }
            else
            {
                return "";
            }
        }

        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {
            try
            {
                string MaTour = e.CommandArgument.ToString();
                TourDLEntities db = new TourDLEntities();
                QLTour.Tour obj = db.Tour.FirstOrDefault(x => x.MaTour == MaTour);
                if (obj != null)
                {
                    db.Tour.Remove(obj);
                    db.SaveChanges();
                    getData();
                }
            }
            catch
            {
                // lỗi
                lbErrorxoa.Text = "Bạn không thể xóa khi chưa xóa ảnh!";
            }
            
        }
    }
}