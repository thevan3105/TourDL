using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class SiteAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // kiểm tra Session có đăng nhập chưa, nếu có thì pass,
            // nếu không có thì điều hướng về trang Login
            if (Session["username"] == null || Session["username"].ToString() == "")
            {
                // Chưa đăng nhập
                Response.Redirect("Login.aspx");
            }
            else
            {
                // Load dữ liệu
            }
        }
    }
}