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
    
    public partial class CTTour
    {
        public string MaCTTour { get; set; }
        public string MaTour { get; set; }
        public string MaDDDL { get; set; }
        public string MaKS { get; set; }
        public string MoTaCT { get; set; }
        public Nullable<int> GiaveNL { get; set; }
        public Nullable<int> GiaVeTE { get; set; }
        public string MaLPT { get; set; }
    
        public virtual DiaDiemDL DiaDiemDL { get; set; }
        public virtual LoaiPhuongTien LoaiPhuongTien { get; set; }
        public virtual Tour Tour { get; set; }
    }
}
