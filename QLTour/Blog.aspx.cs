using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour
{
    public partial class Blog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();
            }
        }
        public void getData()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.News> lst = db.News.OrderByDescending(x => x.ID_News).Take(3).ToList();
            rpPost.DataSource = lst;
            rpPost.DataBind();
        }
        void Test()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.News> lst = db.News.OrderBy(x => x.ID_News).ToList();
            rpPost.DataSource = lst;
            rpPost.DataBind();
        }
    }
}