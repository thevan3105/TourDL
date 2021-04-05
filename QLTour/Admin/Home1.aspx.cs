using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTour.Admin
{
    public partial class Home1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbupdatetimechart.Text = getdateupdatechart();
            getgiatourmax();
            countmax();
            countmin();
            sumtongdoanhthu();
            txtLineChart2.Text = getDataLineChart2();
            txtLineChart.Text = getDataLineChart();
            lbdoanhthuthangtruoc.Text = sumtongdoanhthu().ToString("N0");
            lbdoanhthuthanghientai.Text = sumtongdoanhthuthangnay().ToString("N0");
            lbtongdanhthulastyear.Text = doanhthuquy().ToString("N0");
        }
        public string getdateupdatechart()
        {
            DateTime updatechart = new DateTime();
            updatechart = DateTime.Now;
            return updatechart.ToString("dd/MM/yyyy hh:mm");
        }
        string getDataLineChart()
        {
            TourDLEntities db = new TourDLEntities();

            List<string> arrData = new List<string>();
            DateTime today = DateTime.Now;
            for (int i = 1; i <= 12; i++)
            {
                Booking obj = db.Booking.FirstOrDefault(x => x.NgayBook.Value.Month == i && x.NgayBook.Value.Year == today.Year);
                if (obj != null)
                {
                    string a = db.Booking.Where(x => x.NgayBook.Value.Month == i && x.NgayBook.Value.Year == today.Year).Sum(gr => gr.GiaTien).ToString();
                    arrData.Add(a);
                }
                else
                {
                    arrData.Add("0");
                }
            }
            string str = "";
            for (int i = 0; i < arrData.Count; i++)
            {
                str += arrData[i] + " ";
            }
            str = str.Substring(0, str.Length - 1);
            return str;
        }
        string getDataLineChart2()
        {
            TourDLEntities db = new TourDLEntities();

            List<string> arrData = new List<string>();
            DateTime today = DateTime.Now;
            for (int i = 1; i <= 12; i++)
            {
                Booking obj = db.Booking.FirstOrDefault(x => x.NgayBook.Value.Month == i && x.NgayBook.Value.Year == today.Year);
                if (obj != null)
                {
                    string a = db.Booking.Where(x => x.NgayBook.Value.Month == i && x.NgayBook.Value.Year == today.Year - 1).Sum(gr => gr.GiaTien).ToString();
                    arrData.Add(a);
                }
                else
                {
                    arrData.Add("0");
                }
            }
            string str = "";
            for (int i = 0; i < arrData.Count; i++)
            {
                str += arrData[i] + " ";
            }
            str = str.Substring(0, str.Length - 1);
            return str;
        }
        // LẤY 5 TOUR CÓ GIÁ TIỀN CAO NHẤT TỪ CAO ĐỀN THẤP
        public void getgiatourmax()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> lst = db.Tour.OrderByDescending(x => x.GiaTien).Take(5).ToList();
            //rptoursx.DataSource = lst;
            //rptoursx.DataBind();
        }

        public void countmax()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> laymaxgia = db.Tour.OrderByDescending(x => x.GiaTien).Take(1).ToList();
            //rptourmax.DataSource = laymaxgia;
            //rptourmax.DataBind();
        }
        public void countmin()
        {
            TourDLEntities db = new TourDLEntities();
            List<QLTour.Tour> laymingia = db.Tour.OrderBy(x => x.GiaTien).Take(1).ToList();
            //rptourmin.DataSource = laymingia;
            //rptourmin.DataBind();
        }
        // LẤY RA TÊN TÊN KHÁCH HÀNG ĐẶT NHIỀU TOUR NHẤT
        public void seleckhdatmax()
        {

            TourDLEntities db = new TourDLEntities();
            SqlConnection cnn = new SqlConnection(@"Data Source=DESKTOP-AUOQ6RH;Initial Catalog=Van;Integrated Security=True");

            cnn.Open();
            string sql = "select  top 1  KhachHang.TenKH from KhachHang, Booking where KhachHang.MaKH = Booking.MaKH group by Booking.MaKH, KhachHang.TenKH order by COUNT(1) desc";
            SqlCommand com = new SqlCommand(sql, cnn); //bat dau truy van
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com); //chuyen du lieu ve
            DataTable dt = new DataTable(); //tạo một kho ảo để lưu trữ dữ liệu
            da.Fill(dt);  // đổ dữ liệu vào kho
            cnn.Close();  // đóng kết nối

            //dgvtourdatmin.DataSource = dt;
            //dgvtourdatmin.DataBind();

        }
        // LẤY RA TÊN TÊN KHÁCH HÀNG ĐẶT ít TOUR NHẤT
        public void seleckhdatmin()
        {

            TourDLEntities db = new TourDLEntities();
            SqlConnection cnn = new SqlConnection(@"Data Source=DESKTOP-AUOQ6RH;Initial Catalog=Van;Integrated Security=True");

            cnn.Open();
            string sql = "select  top 1  KhachHang.TenKH  from KhachHang, Booking where KhachHang.MaKH = Booking.MaKH group by Booking.MaKH, KhachHang.TenKH order by COUNT(1)";
            SqlCommand com = new SqlCommand(sql, cnn); //bat dau truy van
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com); //chuyen du lieu ve
            DataTable dt = new DataTable(); //tạo một kho ảo để lưu trữ dữ liệu
            da.Fill(dt);  // đổ dữ liệu vào kho
            cnn.Close();  // đóng kết nối

            //dgvtourdatmin.DataSource = dt;
            //dgvtourdatmin.DataBind();

        }
        // LẤY RA TÊN TOUR ĐẶT NHIỀU NHẤT
        public void selectourdatmax()
        {
            //TourDLEntities db = new TourDLEntities();
            //var obj = db.Booking.GroupBy(x => x.MaTour).OrderByDescending(y => y.Count()).Take(1);
            //return obj.ToString();
            TourDLEntities db = new TourDLEntities();
            SqlConnection cnn = new SqlConnection(@"Data Source=DESKTOP-AUOQ6RH;Initial Catalog=Van;Integrated Security=True");

            cnn.Open();
            string sql = "select top 1  Tour.TenTour from Tour, Booking where Tour.MaTour = Booking.MaTour group by Booking.MaTour, Tour.TenTour order by COUNT(1) desc";
            SqlCommand com = new SqlCommand(sql, cnn); //bat dau truy van
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com); //chuyen du lieu ve
            DataTable dt = new DataTable(); //tạo một kho ảo để lưu trữ dữ liệu
            da.Fill(dt);  // đổ dữ liệu vào kho
            cnn.Close();  // đóng kết nối

            //dgvtourdatmax.DataSource = dt;
            //dgvtourdatmax.DataBind();

        }

        // LẤY RA TÊN NHÂN VIÊN BÁN TOUR NHIỀU NHẤT
        public void selecnhanvienbanmax()
        {
            TourDLEntities db = new TourDLEntities();
            SqlConnection cnn = new SqlConnection(@"Data Source=DESKTOP-AUOQ6RH;Initial Catalog=Van;Integrated Security=True");

            cnn.Open();
            string sql = "select  top 1  NhanVien.TenNV from NhanVien, Booking where NhanVien.MaNV = Booking.MaNV group by Booking.MaNV, NhanVien.TenNV order by COUNT(1) desc";
            SqlCommand com = new SqlCommand(sql, cnn); //bat dau truy van
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com); //chuyen du lieu ve
            DataTable dt = new DataTable(); //tạo một kho ảo để lưu trữ dữ liệu
            da.Fill(dt);  // đổ dữ liệu vào kho
            cnn.Close();  // đóng kết nối

            //dgvnhanvienbanmax.DataSource = dt;
            //dgvnhanvienbanmax.DataBind();

        }
        // LẤY RA TÊN NHÂN VIÊN BÁN TOUR ít NHẤT
        public void selecnhanvienbanmin()
        {
            TourDLEntities db = new TourDLEntities();
            SqlConnection cnn = new SqlConnection(@"Data Source=DESKTOP-AUOQ6RH;Initial Catalog=Van;Integrated Security=True");

            cnn.Open();
            string sql = "select  top 1  NhanVien.TenNV from NhanVien, Booking where NhanVien.MaNV = Booking.MaNV group by Booking.MaNV, NhanVien.TenNV order by COUNT(1)";
            SqlCommand com = new SqlCommand(sql, cnn); //bat dau truy van
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com); //chuyen du lieu ve
            DataTable dt = new DataTable(); //tạo một kho ảo để lưu trữ dữ liệu
            da.Fill(dt);  // đổ dữ liệu vào kho
            cnn.Close();  // đóng kết nối

            //dgvnhanvienbanmax.DataSource = dt;
            //dgvnhanvienbanmax.DataBind();

        }
        // LẤY RA TÊN TOUR ĐẶT ÍT NHẤT
        public void selectourdatmin()
        {
            TourDLEntities db = new TourDLEntities();
            SqlConnection cnn = new SqlConnection(@"Data Source=DESKTOP-AUOQ6RH;Initial Catalog=Van;Integrated Security=True");

            cnn.Open();
            string sql = "select top 1  Tour.TenTour from Tour, Booking where Tour.MaTour = Booking.MaTour group by Booking.MaTour, Tour.TenTour order by COUNT(1)";
            SqlCommand com = new SqlCommand(sql, cnn); //bat dau truy van
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com); //chuyen du lieu ve
            DataTable dt = new DataTable(); //tạo một kho ảo để lưu trữ dữ liệu
            da.Fill(dt);  // đổ dữ liệu vào kho
            cnn.Close();  // đóng kết nối

            //dgvtourdatmax.DataSource = dt;
            //dgvtourdatmax.DataBind();
        }
        // LẤY RA TOUR CÓ SỐ LƯỢNG ĐẶT NHIỀU NHẤT
        public string getTenTourmax()
        {
            TourDLEntities db = new TourDLEntities();
            string matour = db.Booking.GroupBy(x => x.MaTour).OrderByDescending(y => y.Count()).Take(1).ToString();
            return matour;
        }

        // TỔNG DOANH THU BOOKING THÁNG TRƯỚC
        public int sumtongdoanhthu()
        {
            TourDLEntities db = new TourDLEntities();
            DateTime today = DateTime.Now;
            string lastmonth = db.Booking.Where(x => x.NgayBook.Value.Month == today.Month - 1).OrderByDescending(x => x.GiaTien).Sum(y => y.GiaTien).ToString();
            return int.Parse(lastmonth);
        }
        // TỔNG DANH THU BOOKING NĂM TRƯỚC
        public int sumtongdoanhthulastyear()
        {
            TourDLEntities db = new TourDLEntities();
            DateTime today = DateTime.Now;
            string lastyear = db.Booking.Where(x => x.NgayBook.Value.Month == today.Month).OrderByDescending(x => x.GiaTien).Sum(y => y.GiaTien).ToString();
            return int.Parse(lastyear);
        }
        // TỔNG DANH THU BOOKING THÁNG HIỆN TẠI
        public int sumtongdoanhthuthangnay()
        {
            TourDLEntities db = new TourDLEntities();
            DateTime today = DateTime.Now;
            string ten = db.Booking.Where(x => x.NgayBook.Value.Month == today.Month).OrderByDescending(x => x.GiaTien).Sum(y => y.GiaTien).ToString();
            return int.Parse(ten);
        }

        //SỰ KIỆN ONCLICK LẤY LẤY TẤT CẢ CÁC ĐỐI TƯỢNG TRONG BOOKING
        protected void lbtnALL_Click(object sender, EventArgs e)
        {
            getDataAll();
        }
        // REPEATER LẤY RA TẤT CẢ BOOKING THEO ORDER BY
        public void getDataAll()
        {

            TourDLEntities db = new TourDLEntities();
            DateTime today = DateTime.Now;
            List<QLTour.Booking> lst = db.Booking.Where(x => x.NgayBook.Value.Month == today.Month - 1).ToList();
            //dgvalltour.DataSource = lst;
            //dgvalltour.DataBind();
        }

        // LẤY RA DOANH THU QUÝ TRƯỚC
        public int doanhthuquy()
        {
            //TourDLEntities db = new TourDLEntities();
            //SqlConnection cnn = new SqlConnection(@"Data Source=DESKTOP-AUOQ6RH;Initial Catalog=Van;Integrated Security=True");

            //cnn.Open();
            //string sql = "select top 1  Tour.TenTour from Tour, Booking where Tour.MaTour = Booking.MaTour and group by Booking.MaTour, Tour.TenTour order by COUNT(1)";
            //SqlCommand com = new SqlCommand(sql, cnn); //bat dau truy van
            //com.CommandType = CommandType.Text;
            //SqlDataAdapter da = new SqlDataAdapter(com); //chuyen du lieu ve
            //DataTable dt = new DataTable(); //tạo một kho ảo để lưu trữ dữ liệu
            //da.Fill(dt);  // đổ dữ liệu vào kho
            //cnn.Close();  // đóng kết nối

            int t1 = sumtongdoanhthu();
            int t2 = sumtongdoanhthu() - 1;
            int t3 = sumtongdoanhthu() - 2;
            int tongquy = t1 + t2 + t3;
            return tongquy;

        }

        protected void lbtntourdatmax_Click1(object sender, EventArgs e)
        {
            selectourdatmax();
        }

        protected void lbtntourdatmin_Click(object sender, EventArgs e)
        {
            selectourdatmin();
        }

        protected void lbtnkhbookmax_Click(object sender, EventArgs e)
        {
            seleckhdatmax();
        }

        protected void lbtnkhbookmin_Click(object sender, EventArgs e)
        {
            seleckhdatmin();
        }

        protected void lbtnnhnvienbanmax_Click(object sender, EventArgs e)
        {
            selecnhanvienbanmax();
        }

        protected void lbtnnhanvienbanmin_Click(object sender, EventArgs e)
        {
            selecnhanvienbanmin();
        }
    }
}