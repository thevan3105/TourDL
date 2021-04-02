using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour
{
    public partial class Demo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //form tim kiem
            if (!IsPostBack)
            {

            }
        }
        public string getAnhDaiDien(string MaTour)
        {
            TourDLEntities db = new TourDLEntities();
            QLTour.Tour obj = db.Tour.FirstOrDefault(x => x.MaTour == MaTour);
            if (obj.Media.Count(x => x.Main == true) > 0)
            {
                return obj.Media.First(x => x.Main == true).Url;
            }
            else
            {
                return "";
            }
        }

    }
}