//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PharmacyManagement
{
    using System;
    using System.Collections.Generic;
    
    public partial class sale
    {
        public Nullable<int> Product_id { get; set; }
        public Nullable<int> User_id { get; set; }
        public decimal Qty { get; set; }
        public decimal price { get; set; }
        public Nullable<decimal> Total_Price { get; set; }
        public Nullable<System.DateTime> sales_date { get; set; }
    
        public virtual Product Product { get; set; }
        public virtual User User { get; set; }
    }
}
