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
    using System.Collections.Generic;
    
    public partial class DanhGia
    {
        public int STT { get; set; }
        public string MaTour { get; set; }
        public string MaKH { get; set; }
        public Nullable<int> MaVe { get; set; }
        public Nullable<int> Diem { get; set; }
    
        public virtual Tour Tour { get; set; }
        public virtual Booking Booking { get; set; }
    }
}
