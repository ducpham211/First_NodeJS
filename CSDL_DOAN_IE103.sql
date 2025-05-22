CREATE DATABASE DOAN_QLTT


CREATE TABLE Tai_khoan (
	ma_tai_khoan VARCHAR(20) PRIMARY KEY,
	ten_dang_nhap VARCHAR(50) NOT NULL,
	mat_khau VARCHAR(255) NOT NULL,
	loai_tai_khoan VARCHAR(2) NOT NULL CHECK (loai_tai_khoan IN ('KH', 'NV', 'QL'))
);

CREATE TABLE Khach_hang (
	ma_khach_hang VARCHAR(20) PRIMARY KEY ,
	ten_khach_hang VARCHAR(100) NOT NULL,
	dia_chi VARCHAR(255),
	so_dien_thoai VARCHAR(15),
	ngay_dang_ki DATETIME DEFAULT GETDATE(),
	ma_tai_khoan VARCHAR(20),
	FOREIGN KEY (ma_tai_khoan) REFERENCES Tai_khoan(ma_tai_khoan),
);

CREATE TABLE Loai_san_pham (
	ma_loai INT PRIMARY KEY ,
	ten_loai VARCHAR(100) NOT NULL
);

CREATE TABLE Nha_cung_cap (
	ma_nha_cung_cap VARCHAR(20) PRIMARY KEY,
	ten_nha_cung_cap VARCHAR(100) NOT NULL,
	dia_chi VARCHAR(255),
	so_dien_thoai VARCHAR(15)
);

CREATE TABLE San_pham (
	ma_san_pham INT PRIMARY KEY ,
	ten_san_pham VARCHAR(100) NOT NULL,
	gia DECIMAL(10, 2) NOT NULL,
	so_luong INT NOT NULL DEFAULT 0,
	ma_loai INT,
	tinh_nang_noi_bat VARCHAR(500),
	noi_bat BIT DEFAULT 0,
	hinh_anh VARCHAR(255),
	thuong_hieu VARCHAR(100),
	mo_ta VARCHAR(1000),
	cua_hang_co_san VARCHAR(255),
	FOREIGN KEY (ma_loai) REFERENCES Loai_san_pham(ma_loai),
);

CREATE TABLE Nguoi_quan_ly (
	ma_quan_ly VARCHAR(20) PRIMARY KEY,
	ten_quan_ly VARCHAR(100) NOT NULL,
	dia_chi VARCHAR(255),
	so_dien_thoai VARCHAR(15),
	ngay_vao_lam DATETIME DEFAULT GETDATE(),
	ma_tai_khoan VARCHAR(20),
	FOREIGN KEY (ma_tai_khoan) REFERENCES Tai_khoan(ma_tai_khoan)
);



CREATE TABLE Nhan_vien (
	ma_nhan_vien VARCHAR(20) PRIMARY KEY,
	ten_nhan_vien VARCHAR(100) NOT NULL,
	ngay_vao_lam DATETIME DEFAULT GETDATE(),
	dia_chi VARCHAR(255),
	so_dien_thoai VARCHAR(15),
	ma_tai_khoan VARCHAR(20),
	FOREIGN KEY (ma_tai_khoan) REFERENCES Tai_khoan(ma_tai_khoan),
);


CREATE TABLE Hoa_don (
	ma_hoa_don INT PRIMARY KEY ,
	ma_khach_hang VARCHAR(20),
	ma_nhan_vien VARCHAR(20),
	ngay_lap DATETIME DEFAULT GETDATE(),
	tong_tien DECIMAL(10, 2),
	FOREIGN KEY (ma_khach_hang) REFERENCES Khach_hang(ma_khach_hang),
	FOREIGN KEY (ma_nhan_vien) REFERENCES Nhan_vien(ma_nhan_vien),
);

CREATE TABLE Chi_tiet_hoa_don (
	ma_hoa_don INT,
	ma_san_pham INT,
	so_luong INT NOT NULL DEFAULT 1,
	don_gia DECIMAL(10, 2) NOT NULL,
	PRIMARY KEY (ma_hoa_don, ma_san_pham),
	FOREIGN KEY (ma_hoa_don) REFERENCES Hoa_don(ma_hoa_don),
	FOREIGN KEY (ma_san_pham) REFERENCES San_pham(ma_san_pham)
);

CREATE TABLE Gio_hang (
	ma_san_pham INT,
	ma_khach_hang VARCHAR(20),
	so_luong INT NOT NULL DEFAULT 1,
	PRIMARY KEY (ma_san_pham, ma_khach_hang),
	FOREIGN KEY (ma_san_pham) REFERENCES San_pham(ma_san_pham),
	FOREIGN KEY (ma_khach_hang) REFERENCES Khach_hang(ma_khach_hang)
);
CREATE TABLE Thong_tin_danh_gia (
	ma_san_pham INT,
	ten_nguoi_gui VARCHAR(100),
	email  VARCHAR(255),
	noi_dung VARCHAR(1000),
	ngay_danh_gia DATETIME DEFAULT GETDATE(),
	so_sao INT CHECK (so_sao BETWEEN 1 AND 5),
	PRIMARY KEY (ma_san_pham, email),
	FOREIGN KEY (ma_san_pham) REFERENCES San_pham(ma_san_pham)
);

CREATE TABLE Nguon_cung_cap (
	ma_nha_cung_cap VARCHAR(20),
	ma_san_pham INT,
	FOREIGN KEY (ma_san_pham) REFERENCES San_pham(ma_san_pham),
	FOREIGN KEY (ma_nha_cung_cap) REFERENCES Nha_cung_cap(ma_nha_cung_cap)
)


INSERT INTO tai_khoan (ma_tai_khoan, ten_dang_nhap, mat_khau, loai_tai_khoan) VALUES
('QL009','QL1','pass123','QL'),
('QL010','QL3','pass123567','QL'),
('QL011','QL4','pass1230','QL'),
('NV009','nv1','pass123','NV'),
('NV010','nv2','pass123','NV'),
('NV008','nv3','pass123','NV'),
('KH007','kh1','mk123','KH'),
('KH008','kh1','mk123','KH'),
('KH005', 'user3', 'pass789', 'KH'),
('KH006', 'user4', 'pass101', 'KH'),
('NV007', 'nv2', 'nv456', 'NV'),
('QL008', 'ql2', 'ql789', 'QL')


INSERT INTO Khach_hang (ma_khach_hang, ten_khach_hang, dia_chi, so_dien_thoai, ngay_dang_ki, ma_tai_khoan) VALUES
('KH3', 'Phạm Thị C', '789 Trần Hưng Đạo, Đà Nẵng', '0923456789', '2023-04-10', 'KH005'),
('KH4', 'Hoàng Văn D', '101 Lê Lợi, Huế', '0934567890', '2023-05-15', 'KH006'),
('KH5', 'Lê Thị E', '234 Phạm Văn Đồng, Hà Nội', '0945678901', '2023-06-20', 'KH007'),
('KH6', 'Ngô Văn F', '567 Nguyễn Huệ, TP.HCM', '0956789012', '2023-07-25', 'KH008');

INSERT INTO Loai_san_pham (ma_loai, ten_loai) VALUES
(5, 'Tai nghe'),
(6, 'Máy ảnh'),
(7, 'Đồng hồ thông minh'),
(8, 'Loa Bluetooth');

INSERT INTO Nha_cung_cap (ma_nha_cung_cap, ten_nha_cung_cap, dia_chi, so_dien_thoai) VALUES
(3, 'Sony Vietnam', '123 Lê Lợi, TP.HCM', '0967890123'),
(4, 'Xiaomi Vietnam', '456 Trần Phú, Hà Nội', '0978901234'),
(5, 'JBL Vietnam', '789 Nguyễn Huệ, Đà Nẵng', '0989012345'),
(6, 'Canon Vietnam', '101 Phạm Văn Đồng, Huế', '0990123456');

INSERT INTO San_pham (ma_san_pham, ten_san_pham, gia, so_luong, ma_loai, tinh_nang_noi_bat, noi_bat, hinh_anh, thuong_hieu, mo_ta, cua_hang_co_san) VALUES
(404, 'Sony WH-1000XM5', 8490000.00, 25, 5, 'Chống ồn chủ động, âm thanh Hi-Res', 1, '/pics/headphone-1.jpg', 'Sony', 'Tai nghe Sony WH-1000XM5', 'Đà Nẵng' ),
(405, 'Xiaomi 13 Pro', 19990000.00, 30, 7, 'Snapdragon 8 Gen 2, camera Leica', 1, '/pics/phone-2.jpg', 'Xiaomi', 'Xiaomi 13 Pro 5G', 'Huế'),
(406, 'JBL Charge 5', 4990000.00, 20, 8, 'Âm thanh mạnh mẽ, chống nước IP67', 0, '/pics/speaker-1.jpg', 'JBL', 'Loa Bluetooth JBL Charge 5', 'Hải Phòng'),
(407, 'Canon EOS R50', 18990000.00, 10, 6, 'Cảm biến APS-C, quay video 4K', 1, '/pics/camera-1.jpg', 'Canon', 'Máy ảnh Canon EOS R50', 'Cần Thơ');

INSERT INTO Nhan_vien (ma_nhan_vien, ten_nhan_vien, ngay_vao_lam, ma_tai_khoan, dia_chi, so_dien_thoai) VALUES
('NV1', 'Trần Văn G', '2022-07-01', 'NV007', '123 Trần Phú, Hà Nội', '0961234567'),
('NV2', 'Nguyễn Thị H', '2022-08-15', 'NV008', '456 Lê Lợi, TP.HCM', '0972345678'),
('NV3', 'Phạm Văn I', '2022-09-20', 'NV009', '789 Nguyễn Huệ, Đà Nẵng', '0983456789'),
('NV4', 'Lê Văn J', '2022-10-25', 'NV010', '101 Phạm Văn Đồng, Huế', '0994567890');

INSERT INTO Nguoi_quan_ly (ma_quan_ly, ten_quan_ly, dia_chi, so_dien_thoai,ngay_vao_lam, ma_tai_khoan) VALUES
('QL1', 'Nguyễn Văn K', '234 Trần Hưng Đạo, Hà Nội', '0915678901','2020-07-01', 'QL008'),
('QL2', 'Trần Thị L', '567 Lê Lợi, TP.HCM', '0926789012','2021-01-02', 'QL009'),
('QL3', 'Phạm Văn M', '789 Nguyễn Huệ, Đà Nẵng', '0937890123','2025-04-20', 'QL010'),
('QL4', 'Lê Thị N', '101 Phạm Văn Đồng, Huế', '0948901234','2022-03-21', 'QL011');

INSERT INTO Hoa_don (ma_hoa_don, ma_khach_hang, ma_nhan_vien, ngay_lap, tong_tien) VALUES
(3, 'KH3', 'NV1', '2023-08-01', 16980000),
(4, 'KH4', 'NV2', '2023-08-02', 19990000),
(5, 'KH5', 'NV3', '2023-08-03', 9980000),
(6, 'KH6', 'NV4', '2023-08-04', 18990000);

INSERT INTO Chi_tiet_hoa_don (ma_hoa_don, ma_san_pham, so_luong, don_gia) VALUES
(3, 404, 2, 8490000),
(4, 405, 1, 19990000),
(5, 406, 2, 4990000),
(6, 407, 1, 18990000);

INSERT INTO Thong_tin_danh_gia(ten_nguoi_gui, email, noi_dung, ngay_danh_gia, so_sao, ma_san_pham) VALUES
('Trần Văn H', 'h.tran@gmail.com', 'Sản phẩm rất tốt, giao hàng nhanh!', '2024-06-01 00:00:00', 5, 405),
('Nguyễn Thị I', 'i.nguyen@gmail.com', 'Máy đẹp, pin lâu, rất hài lòng.', '2024-06-02 00:00:00', 4, 406),
('Lê Văn K', 'k.le@gmail.com', 'Tai nghe âm thanh tốt, nhưng giá hơi cao.', '2024-06-03 00:00:00', 4, 404),
('Phạm Thị L', 'l.pham@gmail.com', 'Máy ảnh chụp nét, dễ sử dụng.', '2024-06-04 00:00:00', 5, 407);

INSERT INTO Gio_hang (ma_khach_hang,ma_san_pham, so_luong) VALUES
('KH3',404, 3),
('KH4',405, 2),
('KH5',406, 4),
('KH6',407, 2);

INSERT INTO Nguon_cung_cap(ma_san_pham,ma_nha_cung_cap) VALUES
(404,3),
(405,4),
(406,5),
(407,6)