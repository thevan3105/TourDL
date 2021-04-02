using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class ConTact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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

                        getDataCSKH();
                    }
                    else
                    {
                        getData();
                    }
                }
            }
        }

        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int id = Int32.Parse(e.CommandArgument.ToString());
                TourDLEntities db = new TourDLEntities();
                QLTour.Contact obj = db.Contact.FirstOrDefault(x => x.ID_Contact == id);
                if (obj != null)
                {
                    db.Contact.Remove(obj);
                    db.SaveChanges();
                    getData();
                }
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
                List<QLTour.Contact> lstSP = db.Contact.ToList();
                dgvConTact.DataSource = lstSP;
                dgvConTact.DataBind();
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
                List<QLTour.Contact> lstSP = db.Contact.ToList();
                dgvConTactCSKH.DataSource = lstSP;
                dgvConTactCSKH.DataBind();
            }
            catch
            {
                //
            }

        }
    }
}