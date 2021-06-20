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
    public partial class BC_THongKE : System.Web.UI.Page
    {
        protected DataTable myDT;
        protected void Page_Load(object sender, EventArgs e)
        {

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
            //sumtongdoanhthu();
        }

        //public void getngaybk()
        //{
        //    List<int> lst = new List<int>();
        //    for (int i = 1; i < 32; i++)
        //    {
        //        lst.Add(i);
        //    }
        //    cmbNgaybd.DataSource = lst;
        //    cmbNgaybd.DataBind();
        //}
        //public void getthangbk()
        //{
        //    List<int> lst = new List<int>();
        //    for (int i = 1; i < 13; i++)
        //    {
        //        lst.Add(i);
        //    }
        //    cmbThangbd.DataSource = lst;
        //    cmbThangbd.DataBind();
        //}
        //public void getnambk()
        //{
        //    List<int> lst = new List<int>();
        //    for (int i = 2015; i < 2030; i++)
        //    {
        //        lst.Add(i);
        //    }
        //    cmbNambd.DataSource = lst;
        //    cmbNambd.DataBind();
        //}
        //public void getngaykt()
        //{
        //    List<int> lst = new List<int>();
        //    for (int i = 1; i < 32; i++)
        //    {
        //        lst.Add(i);
        //    }
        //    cmbNgaykt.DataSource = lst;
        //    cmbNgaykt.DataBind();
        //}
        //public void getthangkt()
        //{
        //    List<int> lst = new List<int>();
        //    for (int i = 1; i < 13; i++)
        //    {
        //        lst.Add(i);
        //    }
        //    cmbThangkt.DataSource = lst;
        //    cmbThangkt.DataBind();
        //}
        //public void getnamkt()
        //{
        //    List<int> lst = new List<int>();
        //    for (int i = 2015; i < 2030; i++)
        //    {
        //        lst.Add(i);
        //    }
        //    cmbNamkt.DataSource = lst;
        //    cmbNamkt.DataBind();
        //}

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
        SqlCommand cmd;
        //SqlDataReader da;
        //DataSet ds;
        string connectionstring = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["TourDLEntities"].ConnectionString;
        SqlConnection con;
        //public void seletongdanhthu()
        //{

        //    //TourDLEntities db = new TourDLEntities();

        //    //DateTime bd = DateTime.Parse(txttimngaybd.Text);
        //    //DateTime kt = DateTime.Parse(txttimngaykt.Text);
        //    //string lastmonth = db.Booking.Where(x => x.NgayBook.Value >= bd && x.NgayBook.Value <= kt).OrderByDescending(x => x.GiaTien).Sum(y => y.GiaTien).ToString();
        //    //return int.Parse(lastmonth);
        //    SqlConnection cnn = new SqlConnection(@"Data Source=DESKTOP-AUOQ6RH;Initial Catalog=Van;Integrated Security=True");

        //    con = new SqlConnection(@"Data Source=DESKTOP-AUOQ6RH;Initial Catalog=Van;Integrated Security=True");
        //    try
        //    {
        //        cmd = new SqlCommand();
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.CommandText = "dbo.sumtongdt";
        //        cmd.Parameters.AddWithValue("@bd", txttimngaybd.Text.Trim());
        //        cmd.Parameters.AddWithValue("@kt", txttimngaykt.Text.Trim());
        //        cmd.Connection = con;
        //        con.Open();
        //        var reder = cmd.ExecuteReader();
        //        dgvtongdoanhthu.DataSource = reder;
        //        dgvtongdoanhthu.DataBind();
        //        cmd.Dispose();
        //        con.Close();
        //    }
        //    catch(Exception ex)
        //    {
        //        Response.Write(ex.Message);
        //    }
        //    con.Close();
        //}
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
            string sql = "select top 3  Tour.TenTour, Tour.MaTour, tour.MaLoaiTour, COUNT(1) as SoLuong from Tour, Booking where Tour.MaTour = Booking.MaTour and NgayBook between '01/01/2020' and '01/01/2021'  group by Booking.MaTour, Tour.TenTour, Tour.MaTour,tour.MaLoaiTour order by COUNT(1) desc";
            SqlCommand com = new SqlCommand(sql, cnn); //bat dau truy van
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com); //chuyen du lieu ve
            DataTable dt = new DataTable(); //tạo một kho ảo để lưu trữ dữ liệu
            da.Fill(dt);  // đổ dữ liệu vào kho
            cnn.Close();  // đóng kết nối

            //dgvtourdatmax.DataSource = dt;
            //dgvtourdatmax.DataBind();

        }

        // lấy ra booking theo tên nv và trong khoảng thời gian 01/01/2020 - 10/10/2021
        public void selecbooktheoten()
        {
            SqlConnection cnn = new SqlConnection(@"Data Source=DESKTOP-AUOQ6RH;Initial Catalog=Van;Integrated Security=True");

            con = new SqlConnection(@"Data Source=DESKTOP-AUOQ6RH;Initial Catalog=Van;Integrated Security=True");
            try
            {
                cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.timbooktheotentime";
                cmd.Parameters.AddWithValue("@timkiem", txttimkiem.Text.Trim());
                cmd.Parameters.AddWithValue("@bd", txttimngaybd.Text.Trim());
                cmd.Parameters.AddWithValue("@kt", txttimngaykt.Text.Trim());
                cmd.Connection = con;
                con.Open();
                var reder = cmd.ExecuteReader();
                dgvtimbooktheoten.DataSource = reder;
                dgvtimbooktheoten.DataBind();
                cmd.Dispose();
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        public DataTable gettheoten()
        {
            try
            {
                DataTable dt = new DataTable();
                con = new SqlConnection(@"Data Source=DESKTOP-AUOQ6RH;Initial Catalog=Van;Integrated Security=True");
                cmd = new SqlCommand("timbooktheotentime", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@timkiem", txttimkiem.Text.Trim());
                cmd.Parameters.AddWithValue("@bd", txttimngaybd.Text.Trim());
                cmd.Parameters.AddWithValue("@kt", txttimngaykt.Text.Trim());
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(dt);
                dgvtimbooktheoten.DataSource = dt;
                dgvtimbooktheoten.DataBind();
                myDT = new DataTable();
                myDT = dt;
                cmd.Dispose();
                con.Close();
            }
            catch (Exception)
            {
                Response.Write("<script>alert('không thể load dữ liệu, kiểm tra lại thông tin tìm kiếm');</script>");
            }
            return myDT;
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
            Response.Redirect("BC_THongKE2.aspx");
        }

        protected void lbttimbooktheoten_Click(object sender, EventArgs e)
        {
            //selecbooktheoten();
            gettheoten();
        }


        protected void lbtongdoanhthu_Click(object sender, EventArgs e)
        {
            Response.Redirect("BC_THongKE2.aspx");
        }

        protected void btnxuatex_Click(object sender, EventArgs e)
        {
            try
            {
                Microsoft.Office.Interop.Excel._Application app = new Microsoft.Office.Interop.Excel.Application();
                Microsoft.Office.Interop.Excel._Workbook workbook = app.Workbooks.Add(Type.Missing);
                Microsoft.Office.Interop.Excel._Worksheet worksheet = null;
                worksheet = workbook.Sheets["Sheet1"];
                worksheet = workbook.ActiveSheet;
                app.Visible = true;
                ///đổ dữ liệu vào sheet
                worksheet.Cells[1, 7] = "DANH SÁCH BOOKING THEO TÊN NHÂN VIÊN";
                worksheet.Cells[2, 2] = "E-TOUR";
                worksheet.Cells[2, 10] = "Địa chỉ: Tòa nhà FPTS 52 Lạc Long Quân, Tây Hồ, Hà Nội";
                worksheet.Cells[3, 2] = "Ngày:" + txttimngaybd.Text + "-" + txttimngaykt.Text;
                worksheet.Cells[5, 1] = "STT";
                worksheet.Cells[5, 2] = "Mã vé";
                worksheet.Cells[5, 3] = "Mã Tour";
                worksheet.Cells[5, 4] = "Mã Lịch Trình";
                worksheet.Cells[5, 5] = "Mã Khách hàng";
                worksheet.Cells[5, 6] = "Mã Nhân Viên";
                worksheet.Cells[5, 7] = "Ngày book";
                worksheet.Cells[5, 8] = "Giá Tiền";
                worksheet.Cells[5, 9] = "Tên Nhân viên";
                worksheet.Cells[5, 10] = "Mã Nhân viên";
                worksheet.Cells[5, 11] = "Nghiệp vụ";
                worksheet.Cells[5, 12] = "Giới tính";
                worksheet.Cells[5, 13] = "Địa chỉ";
                worksheet.Cells[5, 14] = "Số điện thoại";
                worksheet.Cells[5, 15] = "ngày sinh";


                //int n = myDT.Rows.Count;

                for (int i = 0; i < dgvtimbooktheoten.Rows.Count; i++)
                {
                    for (int j = 0; j < 14; j++)
                    {
                        worksheet.Cells[i + 9, 1] = i + 1;
                        worksheet.Cells[i + 9, j + 2] = dgvtimbooktheoten.Rows[i].Cells[j].Text.ToString();  /*myDT.Rows[i][j].ToString();*///dgvtimbooktheoten.Rows[i].Cells[j].Text.ToString();

                    }
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('không thể xuất fiel excel, kiểm tra lại');</script>");
            }
        }

        protected void btntimkiem_Click(object sender, EventArgs e)
        {

            try
            {
                //selecbooktheoten();
                gettheoten();
            }
            catch (Exception)
            {
                Response.Write("<script>alert('thông tin tìm kiếm không hợp lệ!');</script>");
            }
        }

    }
}