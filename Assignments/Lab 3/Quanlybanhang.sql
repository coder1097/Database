CREATE DATABASE Quanlybanhang
USE Quanlybanhang

--Q1
CREATE TABLE KHACHHANG(
	MAKHACHHANG varchar(20),
	TENCONGTY nvarchar(50),
	TENGIAODICH varchar(50),
	DIACHI nvarchar(50),
	EMAIL varchar(50),
	DIENTHOAI varchar(20),
	FAX varchar(20)

	PRIMARY KEY(MAKHACHHANG)
)

CREATE TABLE NHANVIEN(
	MANHANVIEN varchar(20),
	HO nvarchar(30),
	TEN nvarchar(30),
	NGAYSINH date,
	NGAYLAMVIEC date,
	DIACHI nvarchar(50),
	DIENTHOAI varchar(20),
	LUONGCOBAN varchar(10),
	PHUCAP varchar(10),

	PRIMARY KEY(MANHANVIEN)
)

CREATE TABLE LOAIHANG(
	MALOAIHANG varchar(20),
	TENLOAIHANG nvarchar(50),

	PRIMARY KEY(MALOAIHANG)
)

CREATE TABLE NHACUNGCAP(
	MACONGTY varchar(20),
	TENCONGTY nvarchar(50),
	TENGIAODICH varchar(20),
	DIACHI nvarchar(50),
	DIENTHOAI varchar(20),
	FAX varchar(20),
	EMAIL varchar(50),

	PRIMARY KEY(MACONGTY)
)

CREATE TABLE DONDATHANG(
	SOHOADON varchar(20),
	MAKHACHHANG varchar(20),
	MANHANVIEN varchar(20),
	NGAYDATHANG date,
	NGAYGIAOHANG date,
	NGAYCHUYENHANG date,
	NOIGIAOHANG nvarchar(50),

	PRIMARY KEY(SOHOADON),
	CONSTRAINT FK_DONDATHANG_MAKHACHHANG_KHACHHANG FOREIGN KEY(MAKHACHHANG) REFERENCES KHACHHANG(MAKHACHHANG) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_DONDATHANG_MANHANVIEN_NHANVIEN FOREIGN KEY(MANHANVIEN) REFERENCES NHANVIEN(MANHANVIEN) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE MATHANG(
	MAHANG varchar(20),
	TENHANG nvarchar(50),
	MACONGTY varchar(20),
	MALOAIHANG varchar(20),
	SOLUONG int,
	DONVITINH varchar(5),
	GIAHANG varchar(10),

	PRIMARY KEY(MAHANG),
	CONSTRAINT FK_MATHANG_MACONGTY_NHACUNGCAP FOREIGN KEY(MACONGTY) REFERENCES NHACUNGCAP(MACONGTY) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_MATHANG_MALOAIHANG_LOAIHANG FOREIGN KEY(MALOAIHANG) REFERENCES LOAIHANG(MALOAIHANG) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE CHITIETDATHANG(
	SOHOADON varchar(20),
	MAHANG varchar(20),
	GIABAN varchar(20),
	SOLUONG int,
	MUCGIAMGIA int,

	PRIMARY KEY(SOHOADON, MAHANG),
	CONSTRAINT FK_CHITIETDATHANG_MAHANG_MATHANG FOREIGN KEY(MAHANG) REFERENCES MATHANG(MAHANG) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_CHITIETDATHANG_SOHOADON_DONDATHANG FOREIGN KEY(SOHOADON) REFERENCES DONDATHANG(SOHOADON) ON UPDATE CASCADE ON DELETE CASCADE
)

--Q2
ALTER TABLE CHITIETDATHANG ADD CONSTRAINT DF_SOLUONG DEFAULT(1) FOR SOLUONG
ALTER TABLE CHITIETDATHANG ADD CONSTRAINT DF_MUCGIAMGIA DEFAULT(0) FOR MUCGIAMGIA
--Q3
ALTER TABLE DONDATHANG ADD CONSTRAINT CHK_ CHECK(NGAYGIAOHANG >= NGAYDATHANG AND NGAYCHUYENHANG >= NGAYDATHANG)

--Q4
ALTER TABLE NHANVIEN ADD CONSTRAINT CHK_NHANVIEN_NGAYSINH CHECK(YEAR(NGAYLAMVIEC)-YEAR(NGAYSINH) > 17 AND YEAR(NGAYLAMVIEC)-YEAR(NGAYSINH) < 61)

--Q5



