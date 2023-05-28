namespace Ictshop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Sanpham")]
    public partial class Sanpham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Sanpham()
        {
            Chitietdonhang = new HashSet<Chitietdonhang>();
        }

        [Key]
        public int Masp { get; set; }

        [StringLength(50)]
        [Display(Name = "Mã sản phẩm")]

        public string Tensp { get; set; }
        [Display(Name = "Tên sản phẩm")]

        public decimal? Giatien { get; set; }
        [Display(Name = "Giá tiền")]

        public int? Soluong { get; set; }
        [Display(Name = "Số lượng")]

        [StringLength(500)]
        public string Mota { get; set; }
        [Display(Name = "Mô tả")]

        [StringLength(50)]
        public string Anhbia { get; set; }
        [Display(Name = "Ảnh bìa")]

        public int? Mahang { get; set; }
        [Display(Name = "Mã hãng sản xuất")]

        public int? Maltc { get; set; }
        [Display(Name = "Mã loại thú cưng")]

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Chitietdonhang> Chitietdonhang { get; set; }

        public virtual Hangsanxuat Hangsanxuat { get; set; }

        public virtual Loaithucung Loaithucung { get; set; }
    }
}
