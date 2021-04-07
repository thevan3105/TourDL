using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getData();
            getDatabk();
        }
        void getData(/*string src*/)
        {
            try
            {
                TourDLEntities db = new TourDLEntities();

                List<QLTour.NhanVien> lstTour = db.NhanVien.ToList();
                List<string> lst = new List<string>();
                int c = 1;
                for (int i = 0; i < txtSearch.Text.Length; i++)
                {
                    if (txtSearch.Text[i] == ' ')
                    {
                        c++;
                    }
                }
                string[] tu = txtSearch.Text.Split(' ');
                for (int i = 0; i < c; i++)
                {
                    lst.Add(tu[i]);
                }
                string src = Request.QueryString["src"].ToString();
                List<QLTour.NhanVien> lstT = db.NhanVien.Where(x => lst.Any(k => x.TenNV.Contains(src)) || lst.Any(k => x.MaNV.Contains(src)) || lst.Any(k => x.NghiepVu.Contains(src))).ToList();
                int t1 = lstT.Count();
                for (int i = 0; i < t1; i++)
                {
                    NhanVien obj = lstT.ElementAt(i);
                }
                lbkeysearch.Text = src;
                //List<QLTour.Tour> lst = db.Tour.OrderBy(x => x.MaTour).Take(5).ToList();
                dgvNhanVien.DataSource = lstT;
                dgvNhanVien.DataBind();
                if (lstT == null || lstT.ToString() == "")
                {
                    lbNotFound.Text = "Không tìm thấy kết quả phù hợp";
                }
            }
            catch (Exception)
            {

                lbNotFound.Text = "Không tìm thấy kết quả phù hợp";
            }
        }
        void getDatabk()
        {
            try
            {
                TourDLEntities db = new TourDLEntities();

                List<QLTour.Booking> lstTour = db.Booking.ToList();
                List<string> lst = new List<string>();
                int c = 1;
                for (int i = 0; i < txtSearch.Text.Length; i++)
                {
                    if (txtSearch.Text[i] == ' ')
                    {
                        c++;
                    }
                }
                string[] tu = txtSearch.Text.Split(' ');
                for (int i = 0; i < c; i++)
                {
                    lst.Add(tu[i]);
                }
                string src = Request.QueryString["src"].ToString();
                List<QLTour.Booking> lstT = db.Booking.Where(x => lst.Any(k => x.MaKH.Contains(src)) || lst.Any(k => x.MaNV.Contains(src)) || lst.Any(k => x.MaTour.Contains(src)) || lst.Any(k => x.NgayBook.ToString().Contains(src))).ToList();
                int t1 = lstT.Count();
                for (int i = 0; i < t1; i++)
                {
                    Booking obj = lstT.ElementAt(i);
                }
                lbkeysearch.Text = src;
                //List<QLTour.Tour> lst = db.Tour.OrderBy(x => x.MaTour).Take(5).ToList();

                dgvbooking.DataSource = lstT;
                dgvbooking.DataBind();
                if (lstT == null || lstT.ToString() == "")
                {
                    lbNotFound.Text = "Không tìm thấy kết quả phù hợp";
                }
            }
            catch (Exception)
            {

                lbNotFound.Text = "Không tìm thấy kết quả phù hợp";
            }
        }
    }
}