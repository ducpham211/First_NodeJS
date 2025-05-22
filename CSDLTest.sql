
-- Tạo bảng Khách hàng
CREATE TABLE Khach_hang (
    Ma_khach_hang INT,
    Ten_khach_hang NVARCHAR(100),
    Dia_chi NVARCHAR(200),
    So_dien_thoai NVARCHAR(15),
	Ngay_dang_ki SMALLDATETIME
);

-- Tạo bảng Sản phẩm
CREATE TABLE San_pham (
	Ma_kho INT, -- references to Ma_kho ( Kho_hang )
    Ma_san_pham INT,
    Ten_san_pham NVARCHAR(100),
    Gia DECIMAL(18, 2),
    So_luong INT,
	Ma_nha_cung_cap INT, -- references to Ma_nha_cung_cap ( Nha_cung_cap )
	Ma_loai INT -- references to Ma_loai (Loai_san_pham)
);


-- Tạo bảng Loại sản phẩm
CREATE TABLE Loai_san_pham (
    Ma_loai INT,
    Ten_loai NVARCHAR(100)
);

-- Tạo bảng Hóa đơn
CREATE TABLE Hoa_don (
	Ma_khach_hang INT, -- references to Ma_khach_hang( Khach_hang )
	Ma_nhan_vien INT, -- references to Ma_nhan_vien ( Nhan_vien )
    Ma_hoa_don INT,
    Ngay_lap DATE,
    Tong_tien DECIMAL(18, 2),
);

-- Tạo bảng Chi tiết hóa đơn
CREATE TABLE Chi_tiet_hoa_don (
    Ma_san_pham INT, -- references to Ma_san_pham (San_pham)
	Ma_hoa_don INT, -- references to Ma_hoa_don ( Hoa_don )
	So_luong INT,
    Don_gia DECIMAL(18, 2)
);

-- Tạo bảng Nhà cung cấp
CREATE TABLE Nha_cung_cap (
    Ma_nha_cung_cap INT,
    Ten_nha_cung_cap NVARCHAR(100),
    Dia_chi NVARCHAR(200),
    So_dien_thoai NVARCHAR(15)
);

-- Tạo bảng Nhân viên
CREATE TABLE Nhan_vien (
    Ma_nhan_vien INT,
    Ten_nhan_vien NVARCHAR(100),
    Chuc_vu NVARCHAR(50),
    Luong DECIMAL(18, 2),
	Ngay_vao_lam SMALLDATETIME,
);

-- Tạo bảng Kho hàng
CREATE TABLE Kho_hang (
    Ma_kho INT,
    Ten_kho NVARCHAR(100),
    Dia_chi NVARCHAR(200)
);

-- Tạo bảng Tài khoản
CREATE TABLE Tai_khoan (
    Ten_dang_nhap NVARCHAR(50),
    Mat_khau NVARCHAR(50),
	Loai_tai_khoan NVARCHAR(10), 
);