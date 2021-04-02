using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class NhanViens : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TourDLEntities db = new TourDLEntities();
                string q = Session["username"].ToString();

                QLTour.NhanVien obj = db.NhanVien.FirstOrDefault(p => p.MaNV == q);
                string quyen = obj.NghiepVu;
                if (quyen == "Admin")
                {

                    getData();

                }
                else if (quyen == "Manager")
                {
                    getDataCSKH();
                }
                else
                {
                    Session.Clear();
                    //Response.Redirect("Home.aspx");
                }

            }
        }
        public void getData()
        {
            try
            {
                TourDLEntities db = new TourDLEntities();
                List<QLTour.NhanVien> lstSP = db.NhanVien.ToList();
                dgvNhanVien.DataSource = lstSP;
                dgvNhanVien.DataBind();
            }
            catch
            {
                //
            }

        }
        public void getDataCSKH()
        {
            try
            {
                TourDLEntities db = new TourDLEntities();
                List<QLTour.NhanVien> lstSP = db.NhanVien.ToList();
                dgvNhanVienCSKH.DataSource = lstSP;
                dgvNhanVienCSKH.DataBind();
            }
            catch
            {
                //
            }

        }
        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {
            try
            {
                string MaNV = e.CommandArgument.ToString();
                TourDLEntities db = new TourDLEntities();
                QLTour.NhanVien obj = db.NhanVien.FirstOrDefault(x => x.MaNV == MaNV);
                if (obj != null)
                {
                    db.NhanVien.Remove(obj);
                    db.SaveChanges();
                    getData();
                }
            }
            catch
            {
                hplloi.Text = "Lỗi không thể xóa! có thể đối tượng đang ở một bảng khác!";
                
            }

        }
    }
}