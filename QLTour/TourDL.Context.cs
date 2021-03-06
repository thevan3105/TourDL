//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QLTour
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class TourDLEntities : DbContext
    {
        public TourDLEntities()
            : base("name=TourDLEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Booking> Booking { get; set; }
        public virtual DbSet<Comment> Comment { get; set; }
        public virtual DbSet<Contact> Contact { get; set; }
        public virtual DbSet<CTTour> CTTour { get; set; }
        public virtual DbSet<DanhGia> DanhGia { get; set; }
        public virtual DbSet<DiaDiemDL> DiaDiemDL { get; set; }
        public virtual DbSet<KhachHang> KhachHang { get; set; }
        public virtual DbSet<KhachSan> KhachSan { get; set; }
        public virtual DbSet<LichTrinh> LichTrinh { get; set; }
        public virtual DbSet<LoaiPhuongTien> LoaiPhuongTien { get; set; }
        public virtual DbSet<LoaiTour> LoaiTour { get; set; }
        public virtual DbSet<Media> Media { get; set; }
        public virtual DbSet<News> News { get; set; }
        public virtual DbSet<NhanVien> NhanVien { get; set; }
        public virtual DbSet<PhuongTien> PhuongTien { get; set; }
        public virtual DbSet<Slide> Slide { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Tour> Tour { get; set; }
    
        public virtual ObjectResult<Nullable<bool>> acount(string tk, string mk)
        {
            var tkParameter = tk != null ?
                new ObjectParameter("tk", tk) :
                new ObjectParameter("tk", typeof(string));
    
            var mkParameter = mk != null ?
                new ObjectParameter("mk", mk) :
                new ObjectParameter("mk", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<bool>>("acount", tkParameter, mkParameter);
        }
    
        public virtual ObjectResult<childtk_Result> childtk(string bd, string kt, string timkiem)
        {
            var bdParameter = bd != null ?
                new ObjectParameter("bd", bd) :
                new ObjectParameter("bd", typeof(string));
    
            var ktParameter = kt != null ?
                new ObjectParameter("kt", kt) :
                new ObjectParameter("kt", typeof(string));
    
            var timkiemParameter = timkiem != null ?
                new ObjectParameter("timkiem", timkiem) :
                new ObjectParameter("timkiem", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<childtk_Result>("childtk", bdParameter, ktParameter, timkiemParameter);
        }
    
        public virtual ObjectResult<getbooking_Result> getbooking()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<getbooking_Result>("getbooking");
        }
    
        public virtual ObjectResult<getnhanvien_Result> getnhanvien()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<getnhanvien_Result>("getnhanvien");
        }
    
        public virtual ObjectResult<gettour_Result> gettour()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<gettour_Result>("gettour");
        }
    
        public virtual int pr_addnhanvien(string maNV, string tenNV, string gioiTinh, string nghiepVu, Nullable<System.DateTime> ngaySinh, string diaCHi, string sDT, string taiKhoan, string matKhau)
        {
            var maNVParameter = maNV != null ?
                new ObjectParameter("MaNV", maNV) :
                new ObjectParameter("MaNV", typeof(string));
    
            var tenNVParameter = tenNV != null ?
                new ObjectParameter("TenNV", tenNV) :
                new ObjectParameter("TenNV", typeof(string));
    
            var gioiTinhParameter = gioiTinh != null ?
                new ObjectParameter("GioiTinh", gioiTinh) :
                new ObjectParameter("GioiTinh", typeof(string));
    
            var nghiepVuParameter = nghiepVu != null ?
                new ObjectParameter("NghiepVu", nghiepVu) :
                new ObjectParameter("NghiepVu", typeof(string));
    
            var ngaySinhParameter = ngaySinh.HasValue ?
                new ObjectParameter("NgaySinh", ngaySinh) :
                new ObjectParameter("NgaySinh", typeof(System.DateTime));
    
            var diaCHiParameter = diaCHi != null ?
                new ObjectParameter("DiaCHi", diaCHi) :
                new ObjectParameter("DiaCHi", typeof(string));
    
            var sDTParameter = sDT != null ?
                new ObjectParameter("SDT", sDT) :
                new ObjectParameter("SDT", typeof(string));
    
            var taiKhoanParameter = taiKhoan != null ?
                new ObjectParameter("TaiKhoan", taiKhoan) :
                new ObjectParameter("TaiKhoan", typeof(string));
    
            var matKhauParameter = matKhau != null ?
                new ObjectParameter("MatKhau", matKhau) :
                new ObjectParameter("MatKhau", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("pr_addnhanvien", maNVParameter, tenNVParameter, gioiTinhParameter, nghiepVuParameter, ngaySinhParameter, diaCHiParameter, sDTParameter, taiKhoanParameter, matKhauParameter);
        }
    
        public virtual int pr_chagepassNV(string maNV, string matKhau)
        {
            var maNVParameter = maNV != null ?
                new ObjectParameter("MaNV", maNV) :
                new ObjectParameter("MaNV", typeof(string));
    
            var matKhauParameter = matKhau != null ?
                new ObjectParameter("MatKhau", matKhau) :
                new ObjectParameter("MatKhau", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("pr_chagepassNV", maNVParameter, matKhauParameter);
        }
    
        public virtual int pr_deletbooking(string maVe)
        {
            var maVeParameter = maVe != null ?
                new ObjectParameter("MaVe", maVe) :
                new ObjectParameter("MaVe", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("pr_deletbooking", maVeParameter);
        }
    
        public virtual int pr_deletenhanvien(string maNV)
        {
            var maNVParameter = maNV != null ?
                new ObjectParameter("MaNV", maNV) :
                new ObjectParameter("MaNV", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("pr_deletenhanvien", maNVParameter);
        }
    
        public virtual int pr_deletetour(string maTour)
        {
            var maTourParameter = maTour != null ?
                new ObjectParameter("MaTour", maTour) :
                new ObjectParameter("MaTour", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("pr_deletetour", maTourParameter);
        }
    
        public virtual int pr_editnhanvien(string maNV, string tenNV, string gioiTinh, string nghiepVu, Nullable<System.DateTime> ngaySinh, string diaCHi, string sDT, string taiKhoan, string matKhau)
        {
            var maNVParameter = maNV != null ?
                new ObjectParameter("MaNV", maNV) :
                new ObjectParameter("MaNV", typeof(string));
    
            var tenNVParameter = tenNV != null ?
                new ObjectParameter("TenNV", tenNV) :
                new ObjectParameter("TenNV", typeof(string));
    
            var gioiTinhParameter = gioiTinh != null ?
                new ObjectParameter("GioiTinh", gioiTinh) :
                new ObjectParameter("GioiTinh", typeof(string));
    
            var nghiepVuParameter = nghiepVu != null ?
                new ObjectParameter("NghiepVu", nghiepVu) :
                new ObjectParameter("NghiepVu", typeof(string));
    
            var ngaySinhParameter = ngaySinh.HasValue ?
                new ObjectParameter("NgaySinh", ngaySinh) :
                new ObjectParameter("NgaySinh", typeof(System.DateTime));
    
            var diaCHiParameter = diaCHi != null ?
                new ObjectParameter("DiaCHi", diaCHi) :
                new ObjectParameter("DiaCHi", typeof(string));
    
            var sDTParameter = sDT != null ?
                new ObjectParameter("SDT", sDT) :
                new ObjectParameter("SDT", typeof(string));
    
            var taiKhoanParameter = taiKhoan != null ?
                new ObjectParameter("TaiKhoan", taiKhoan) :
                new ObjectParameter("TaiKhoan", typeof(string));
    
            var matKhauParameter = matKhau != null ?
                new ObjectParameter("MatKhau", matKhau) :
                new ObjectParameter("MatKhau", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("pr_editnhanvien", maNVParameter, tenNVParameter, gioiTinhParameter, nghiepVuParameter, ngaySinhParameter, diaCHiParameter, sDTParameter, taiKhoanParameter, matKhauParameter);
        }
    
        public virtual int pr_ThemBooking(string maTour, Nullable<int> sLNguoiLon, Nullable<int> sLTreEm, string maLT, string maKH, string maDDDL, string maNV, string trangThai, Nullable<long> giaTien, Nullable<System.DateTime> ngayBook)
        {
            var maTourParameter = maTour != null ?
                new ObjectParameter("MaTour", maTour) :
                new ObjectParameter("MaTour", typeof(string));
    
            var sLNguoiLonParameter = sLNguoiLon.HasValue ?
                new ObjectParameter("SLNguoiLon", sLNguoiLon) :
                new ObjectParameter("SLNguoiLon", typeof(int));
    
            var sLTreEmParameter = sLTreEm.HasValue ?
                new ObjectParameter("SLTreEm", sLTreEm) :
                new ObjectParameter("SLTreEm", typeof(int));
    
            var maLTParameter = maLT != null ?
                new ObjectParameter("MaLT", maLT) :
                new ObjectParameter("MaLT", typeof(string));
    
            var maKHParameter = maKH != null ?
                new ObjectParameter("MaKH", maKH) :
                new ObjectParameter("MaKH", typeof(string));
    
            var maDDDLParameter = maDDDL != null ?
                new ObjectParameter("MaDDDL", maDDDL) :
                new ObjectParameter("MaDDDL", typeof(string));
    
            var maNVParameter = maNV != null ?
                new ObjectParameter("MaNV", maNV) :
                new ObjectParameter("MaNV", typeof(string));
    
            var trangThaiParameter = trangThai != null ?
                new ObjectParameter("TrangThai", trangThai) :
                new ObjectParameter("TrangThai", typeof(string));
    
            var giaTienParameter = giaTien.HasValue ?
                new ObjectParameter("GiaTien", giaTien) :
                new ObjectParameter("GiaTien", typeof(long));
    
            var ngayBookParameter = ngayBook.HasValue ?
                new ObjectParameter("NgayBook", ngayBook) :
                new ObjectParameter("NgayBook", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("pr_ThemBooking", maTourParameter, sLNguoiLonParameter, sLTreEmParameter, maLTParameter, maKHParameter, maDDDLParameter, maNVParameter, trangThaiParameter, giaTienParameter, ngayBookParameter);
        }
    
        public virtual int pr_themtour(string maTour, string tenTour, string maLoaiTour, Nullable<int> giaTien, Nullable<int> minuser, Nullable<int> maxuser, string moTa)
        {
            var maTourParameter = maTour != null ?
                new ObjectParameter("MaTour", maTour) :
                new ObjectParameter("MaTour", typeof(string));
    
            var tenTourParameter = tenTour != null ?
                new ObjectParameter("TenTour", tenTour) :
                new ObjectParameter("TenTour", typeof(string));
    
            var maLoaiTourParameter = maLoaiTour != null ?
                new ObjectParameter("MaLoaiTour", maLoaiTour) :
                new ObjectParameter("MaLoaiTour", typeof(string));
    
            var giaTienParameter = giaTien.HasValue ?
                new ObjectParameter("GiaTien", giaTien) :
                new ObjectParameter("GiaTien", typeof(int));
    
            var minuserParameter = minuser.HasValue ?
                new ObjectParameter("Minuser", minuser) :
                new ObjectParameter("Minuser", typeof(int));
    
            var maxuserParameter = maxuser.HasValue ?
                new ObjectParameter("Maxuser", maxuser) :
                new ObjectParameter("Maxuser", typeof(int));
    
            var moTaParameter = moTa != null ?
                new ObjectParameter("MoTa", moTa) :
                new ObjectParameter("MoTa", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("pr_themtour", maTourParameter, tenTourParameter, maLoaiTourParameter, giaTienParameter, minuserParameter, maxuserParameter, moTaParameter);
        }
    
        public virtual ObjectResult<pr_timbooktheotennv_Result> pr_timbooktheotennv(string timkiem)
        {
            var timkiemParameter = timkiem != null ?
                new ObjectParameter("timkiem", timkiem) :
                new ObjectParameter("timkiem", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<pr_timbooktheotennv_Result>("pr_timbooktheotennv", timkiemParameter);
        }
    
        public virtual int pr_UpdateBooking(string maVe, string maTour, Nullable<int> sLNguoiLon, Nullable<int> sLTreEm, string maLT, string maKH, string maDDDL, string maNV, string trangThai, Nullable<long> giaTien, Nullable<System.DateTime> ngayBook)
        {
            var maVeParameter = maVe != null ?
                new ObjectParameter("MaVe", maVe) :
                new ObjectParameter("MaVe", typeof(string));
    
            var maTourParameter = maTour != null ?
                new ObjectParameter("MaTour", maTour) :
                new ObjectParameter("MaTour", typeof(string));
    
            var sLNguoiLonParameter = sLNguoiLon.HasValue ?
                new ObjectParameter("SLNguoiLon", sLNguoiLon) :
                new ObjectParameter("SLNguoiLon", typeof(int));
    
            var sLTreEmParameter = sLTreEm.HasValue ?
                new ObjectParameter("SLTreEm", sLTreEm) :
                new ObjectParameter("SLTreEm", typeof(int));
    
            var maLTParameter = maLT != null ?
                new ObjectParameter("MaLT", maLT) :
                new ObjectParameter("MaLT", typeof(string));
    
            var maKHParameter = maKH != null ?
                new ObjectParameter("MaKH", maKH) :
                new ObjectParameter("MaKH", typeof(string));
    
            var maDDDLParameter = maDDDL != null ?
                new ObjectParameter("MaDDDL", maDDDL) :
                new ObjectParameter("MaDDDL", typeof(string));
    
            var maNVParameter = maNV != null ?
                new ObjectParameter("MaNV", maNV) :
                new ObjectParameter("MaNV", typeof(string));
    
            var trangThaiParameter = trangThai != null ?
                new ObjectParameter("TrangThai", trangThai) :
                new ObjectParameter("TrangThai", typeof(string));
    
            var giaTienParameter = giaTien.HasValue ?
                new ObjectParameter("GiaTien", giaTien) :
                new ObjectParameter("GiaTien", typeof(long));
    
            var ngayBookParameter = ngayBook.HasValue ?
                new ObjectParameter("NgayBook", ngayBook) :
                new ObjectParameter("NgayBook", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("pr_UpdateBooking", maVeParameter, maTourParameter, sLNguoiLonParameter, sLTreEmParameter, maLTParameter, maKHParameter, maDDDLParameter, maNVParameter, trangThaiParameter, giaTienParameter, ngayBookParameter);
        }
    
        public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagramdefinition_Result> sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition_Result>("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagrams_Result> sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams_Result>("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    
        public virtual int SP_updatetour(string maTour, string tenTour, string maLoaiTour, Nullable<int> giaTien, Nullable<int> minuser, Nullable<int> maxuser, string moTa)
        {
            var maTourParameter = maTour != null ?
                new ObjectParameter("MaTour", maTour) :
                new ObjectParameter("MaTour", typeof(string));
    
            var tenTourParameter = tenTour != null ?
                new ObjectParameter("TenTour", tenTour) :
                new ObjectParameter("TenTour", typeof(string));
    
            var maLoaiTourParameter = maLoaiTour != null ?
                new ObjectParameter("MaLoaiTour", maLoaiTour) :
                new ObjectParameter("MaLoaiTour", typeof(string));
    
            var giaTienParameter = giaTien.HasValue ?
                new ObjectParameter("GiaTien", giaTien) :
                new ObjectParameter("GiaTien", typeof(int));
    
            var minuserParameter = minuser.HasValue ?
                new ObjectParameter("Minuser", minuser) :
                new ObjectParameter("Minuser", typeof(int));
    
            var maxuserParameter = maxuser.HasValue ?
                new ObjectParameter("Maxuser", maxuser) :
                new ObjectParameter("Maxuser", typeof(int));
    
            var moTaParameter = moTa != null ?
                new ObjectParameter("MoTa", moTa) :
                new ObjectParameter("MoTa", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_updatetour", maTourParameter, tenTourParameter, maLoaiTourParameter, giaTienParameter, minuserParameter, maxuserParameter, moTaParameter);
        }
    
        public virtual int sp_upgraddiagrams()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams");
        }
    
        public virtual ObjectResult<Nullable<int>> sumtongdt(string bd, string kt)
        {
            var bdParameter = bd != null ?
                new ObjectParameter("bd", bd) :
                new ObjectParameter("bd", typeof(string));
    
            var ktParameter = kt != null ?
                new ObjectParameter("kt", kt) :
                new ObjectParameter("kt", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("sumtongdt", bdParameter, ktParameter);
        }
    
        public virtual ObjectResult<timbooktheotentime_Result> timbooktheotentime(string bd, string kt, string timkiem)
        {
            var bdParameter = bd != null ?
                new ObjectParameter("bd", bd) :
                new ObjectParameter("bd", typeof(string));
    
            var ktParameter = kt != null ?
                new ObjectParameter("kt", kt) :
                new ObjectParameter("kt", typeof(string));
    
            var timkiemParameter = timkiem != null ?
                new ObjectParameter("timkiem", timkiem) :
                new ObjectParameter("timkiem", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<timbooktheotentime_Result>("timbooktheotentime", bdParameter, ktParameter, timkiemParameter);
        }
    
        public virtual ObjectResult<toptourdatmax_Result> toptourdatmax(string bd, string kt)
        {
            var bdParameter = bd != null ?
                new ObjectParameter("bd", bd) :
                new ObjectParameter("bd", typeof(string));
    
            var ktParameter = kt != null ?
                new ObjectParameter("kt", kt) :
                new ObjectParameter("kt", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<toptourdatmax_Result>("toptourdatmax", bdParameter, ktParameter);
        }
    }
}
