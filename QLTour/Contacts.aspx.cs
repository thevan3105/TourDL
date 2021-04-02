using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour
{
    public partial class Contacts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                TourDLEntities db = new TourDLEntities();
                
                QLTour.Contact obj = new QLTour.Contact();
                obj.Name = txtName.Text;
                obj.Email = txtEmail.Text;
                obj.Subject = txtSubject.Text;
                obj.Message = txtMessage.Text;

                db.Contact.Add(obj);
                db.SaveChanges();
                //Response.Write("<script>alert('Gửi thành công!');</script>");
                Response.Redirect("Contacts.aspx");
            }
            catch (Exception)
            {
                // Lỗi
                Response.Write("<script>alert('Gửi thất bại!');</script>");
            }
        }
    }
}