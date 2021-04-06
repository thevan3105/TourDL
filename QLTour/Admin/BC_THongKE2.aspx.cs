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
    public partial class BC_THongKE2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            selectourdatmax();
            //getngaybk();
            //getthangbk();
            //getnambk();
            //getngaykt();
            //getthangkt();
            //getnamkt();
            //lbtongdoanhthu.Text = tongdanhthu();
            getgiatourmax();
            countmax();
            countmin();
            //selectourdatmax();
            //lbmax.Text = selectourdatmax();
            sumtongdoanhthu();
        }
        public string gettennv(string TenNV)
        {
            TourDLEntities db = new TourDLEntities();
            QLTour.NhanVien ten = db.NhanVien.FirstOrDefault(x => x.TenNV == TenNV);
            return ten.TenNV;
        }

        //public string tongdanhthu()
        //{

        //    TourDLEntities db = new TourDLEntities();
        //    string nbd = cmbThangbd.SelectedValue + "/" + cmbNgaybd.SelectedValue + "/" + cmbNambd.SelectedValue;
        //    //string ngaykt = cmbThangkt.SelectedValue + "/" + cmbNgaykt.SelectedValue + "/" + cmbNamkt.SelectedValue;
        //    //obj.NgayBook = Convert.ToDateTime(ngaykt);
        //    //string lastyear = db.Booking.Where(x => x.NgayBook.Value.Month >= bd.Month).OrderByDescending(x => x.GiaTien).Sum(y => y.GiaTien).ToString();
        //    //return int.Parse(lastyear);
        //    return nbd;
        //}
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
        // lấy ra tổng doanh thu từ ngày 01/01/2020 - 10/10/2021
        public int seletongdanhthu()
        {

            TourDLEntities db = new TourDLEntities();
            string tgbd = txttimkiem.Text;
            string tgkt = txttimkiemngaykt.Text;
            DateTime bd = DateTime.Parse(tgbd);
            DateTime kt = DateTime.Parse(tgkt);
            string lastmonth = db.Booking.Where(x => x.NgayBook.Value >= bd && x.NgayBook.Value <= kt).OrderByDescending(x => x.GiaTien).Sum(y => y.GiaTien).ToString();
            return int.Parse(lastmonth);
            //dgvkhdatmax.DataSource = dt;
            //dgvkhdatmax.DataBind();

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

            //dgvkhdatmin.DataSource = dt;
            //dgvkhdatmin.DataBind();

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
            string sql = "select top 3  Tour.TenTour, Tour.MaTour, tour.MaLoaiTour, COUNT(1) as SoLuong from Tour, Booking where Tour.MaTour = Booking.MaTour and NgayBook between '" + txttimkiem.Text + "' and '" + txttimkiemngaykt.Text + "'  group by Booking.MaTour, Tour.TenTour, Tour.MaTour,tour.MaLoaiTour order by COUNT(1) desc";
            SqlCommand com = new SqlCommand(sql, cnn); //bat dau truy van
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com); //chuyen du lieu ve
            DataTable dt = new DataTable(); //tạo một kho ảo để lưu trữ dữ liệu
            da.Fill(dt);  // đổ dữ liệu vào kho
            cnn.Close();  // đóng kết nối

            dgvtourdatmax.DataSource = dt;
            dgvtourdatmax.DataBind();

        }

        // lấy ra booking theo tên nv và trong khoảng thời gian 01/01/2020 - 10/10/2021
        public void selecbooktheoten()
        {
            TourDLEntities db = new TourDLEntities();
            SqlConnection cnn = new SqlConnection(@"Data Source=DESKTOP-AUOQ6RH;Initial Catalog=Van;Integrated Security=True");

            cnn.Open();
            string sql = "select Booking.MaVe, Booking.MaTour, Booking.MaLT, Booking.MaKH, Booking.MaNV, Booking.NgayBook, Booking.GiaTien, NhanVien.TenNV as TenNV from Booking, NhanVien where Booking.MaNV = NhanVien.MaNV and NhanVien.TenNV like N'%thủy%' and  NgayBook between '01/01/2020' and '10/10/2021'";
            SqlCommand com = new SqlCommand(sql, cnn); //bat dau truy van
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com); //chuyen du lieu ve
            DataTable dt = new DataTable(); //tạo một kho ảo để lưu trữ dữ liệu
            da.Fill(dt);  // đổ dữ liệu vào kho
            cnn.Close();  // đóng kết nối

            //dgvtimbooktheoten.DataSource = dt;
            //dgvtimbooktheoten.DataBind();

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

            //dgvnhanvienbanmin.DataSource = dt;
            //dgvnhanvienbanmin.DataBind();

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

            //dgvtourdatmin.DataSource = dt;
            //dgvtourdatmin.DataBind();
        }
        public string soluongdattourmin()
        {
            TourDLEntities db = new TourDLEntities();
            SqlConnection cnn = new SqlConnection(@"Data Source=DESKTOP-AUOQ6RH;Initial Catalog=Van;Integrated Security=True");

            cnn.Open();
            string sl = "select top 1  count(1) from Tour, Booking where Tour.MaTour = Booking.MaTour group by Booking.MaTour, Tour.TenTour order by COUNT(1)";
            SqlCommand com = new SqlCommand(sl, cnn); //bat dau truy van
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com); //chuyen du lieu ve
            DataTable dt = new DataTable(); //tạo một kho ảo để lưu trữ dữ liệu
            da.Fill(dt);  // đổ dữ liệu vào kho
            cnn.Close();  // đóng kết nối

            return dt.ToString();
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



        protected void lbtnkhbookmin_Click(object sender, EventArgs e)
        {
            seleckhdatmin();
        }


        protected void lbtnnhanvienbanmin_Click(object sender, EventArgs e)
        {
            selecnhanvienbanmin();
        }

        protected void btntest_Click(object sender, EventArgs e)
        {


        }

        protected void lbtntourdatmax_Click(object sender, EventArgs e)
        {
            selectourdatmax();
        }

        protected void lbttimbooktheoten_Click(object sender, EventArgs e)
        {
            Response.Redirect("BC_THongKE.aspx");
        }


        protected void lbtongdoanhthu_Click(object sender, EventArgs e)
        {
            Response.Redirect("BC_THongKE2.aspx");
        }

        protected void btnxuatex_Click(object sender, EventArgs e)
        {
            Microsoft.Office.Interop.Excel._Application app = new Microsoft.Office.Interop.Excel.Application();
            Microsoft.Office.Interop.Excel._Workbook workbook = app.Workbooks.Add(Type.Missing);
            Microsoft.Office.Interop.Excel._Worksheet worksheet = null;
            worksheet = workbook.Sheets["Sheet1"];
            worksheet = workbook.ActiveSheet;
            app.Visible = true;
            ///đổ dữ liệu vào sheet
            worksheet.Cells[3, 3] = "DANH SÁCH TOP 3 TOUR DƯỢC BOOK NHIỀU THẤT";
            worksheet.Cells[5, 2] = "E-TOUR";
            worksheet.Cells[6, 2] = "Địa chỉ: Tòa nhà FPTS 52 Lạc Long Quân, Tây Hồ, Hà Nội";
            worksheet.Cells[7, 2] = "Ngày: 01/01/2020 - 10/10/2021";
            worksheet.Cells[7, 4] = "Tổng doanh thu: " + lbtongdoanhthu.Text;
            worksheet.Cells[8, 1] = "STT";
            worksheet.Cells[8, 2] = "Mã Tour";
            worksheet.Cells[8, 3] = "Tên Tour";
            worksheet.Cells[8, 4] = "Mã loại tour";
            worksheet.Cells[8, 5] = "Số Lượng đặt";
            for (int i = 0; i < dgvtourdatmax.Rows.Count; i++)
            {
                for (int j = 0; j < 4; j++)
                {
                    worksheet.Cells[i + 9, 1] = i + 1;
                    worksheet.Cells[i + 9, j + 2] = dgvtourdatmax.Rows[i].Cells[j].Text;
                }
            }
        }

        protected void btntimkiemtourmax_Click(object sender, EventArgs e)
        {
            selectourdatmax();
            lbtongdt.Text = seletongdanhthu().ToString("N0");
        }
    }
}