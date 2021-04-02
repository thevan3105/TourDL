using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class UPLoadAnh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["MaTour"] == null)
                {
                    Response.Redirect("Tours.aspx");
                }
                else
                {
                    txtMaTour.Text = Request.QueryString["MaTour"];
                    getdata(Request.QueryString["MaTour"]);
                }
            }
        }

        void getdata(string MaTour)
        {
            TourDLEntities db = new TourDLEntities();
            if (db.Tour.FirstOrDefault(x => x.MaTour == MaTour) != null)
            {
                List<QLTour.Media> lst = db.Media.Where(x => x.MaTour == MaTour).ToList();
                dgvAnh.DataSource = lst;
                dgvAnh.DataBind();
            }
            else
            {
                Response.Redirect("Tours.aspx");
            }
        }

        protected void btnXoa_Command(object sender, CommandEventArgs e)
        {
            string MaTour = e.CommandArgument.ToString();
            TourDLEntities db = new TourDLEntities();
            QLTour.Media obj = db.Media.FirstOrDefault(x => x.MaTour == MaTour);
            if (obj != null)
            {
                db.Media.Remove(obj);
                db.SaveChanges();
                getdata(MaTour);
            }
            else
            {
                lbloi.Text = "lỗi";
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                // Sửa dữ liệu
                TourDLEntities db = new TourDLEntities();

                if (fuUrl.HasFile == true)
                {
                    // Tạo file name
                    string[] file = fuUrl.FileName.Split('.');
                    string file_ext = file[file.Length - 1];
                    string file_name = txtMaTour.Text + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff") + "." + file_ext;
                    string folder = Server.MapPath("../Images/");

                    fuUrl.SaveAs(folder + file_name);

                    QLTour.Media obj = new QLTour.Media();
                    //obj.IDMedia = AutoGetma();
                    obj.Url = file_name;
                    obj.Main = chkMain.Checked;
                    obj.MaTour = txtMaTour.Text;

                    db.Media.Add(obj);
                    db.SaveChanges();
                    getdata(txtMaTour.Text);
                    lbloi.Text = "UP ảnh thành công!";
                }

            }
            catch
            {
                lbloi.Text = "lỗi không thể thêm ảnh!";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tours.aspx");
        }
    }
}