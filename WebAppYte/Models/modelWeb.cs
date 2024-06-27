namespace WebAppYte.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class modelWeb : DbContext
    {
        public modelWeb()
            : base("name=modelWeb")
        {
        }

        public virtual DbSet<BenhAn> BenhAns { get; set; }
        public virtual DbSet<GioiTinh> GioiTinhs { get; set; }
        public virtual DbSet<HoiDap> HoiDaps { get; set; }
        public virtual DbSet<FAQ> FAQs { get; set; }
        public virtual DbSet<Khoa> Khoas { get; set; }
        public virtual DbSet<LichKham> LichKhams { get; set; }
        public virtual DbSet<NguoiDung> NguoiDungs { get; set; }
        public virtual DbSet<QuanTri> QuanTris { get; set; }
        public virtual DbSet<Solieucovid> Solieucovids { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<TinhThanh> TinhThanhs { get; set; }
        public virtual DbSet<Tintuc> Tintucs { get; set; }
        public virtual DbSet<TrungTamGanNhat> TrungTamGanNhats { get; set; }
        public DbSet<LichLamViec> LichLamViecs { get; set; }
        public DbSet<HoSoSucKhoe> HoSoSucKhoes { get; set; }


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<LichKham>()
                .Property(e => e.ZoomInfo)
                .IsFixedLength();

            modelBuilder.Entity<LichKham>()
                .Property(e => e.KetQuaKham)
                .IsFixedLength();

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.Email)
                .IsFixedLength();

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.DienThoai)
                .IsFixedLength();

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.TaiKhoan)
                .IsFixedLength();

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.MatKhau)
                .IsFixedLength();

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.NhomMau)
                .IsFixedLength();

            modelBuilder.Entity<QuanTri>()
                .Property(e => e.TaiKhoan)
                .IsFixedLength();

            modelBuilder.Entity<QuanTri>()
                .Property(e => e.MatKhau)
                .IsFixedLength();

            modelBuilder.Entity<Solieucovid>()
                .Property(e => e.Ghichu)
                .IsFixedLength();

        }

        public System.Data.Entity.DbSet<WebAppYte.Models.DangNhap> DangNhaps { get; set; }
    }
}