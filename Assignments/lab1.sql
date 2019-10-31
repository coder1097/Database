CREATE DATABASE QLSV;

USE QLSV;

CREATE TABLE Khoa(
	MaSo varchar(10),
	Ten nvarchar(30) NOT NULL,
	NamThanhLap int NOT NULL,
	PRIMARY KEY(MaSo)
)

CREATE TABLE SinhVien(
	Tensv nvarchar(50) NOT NULL,
	Masv varchar(10),
	namsinh int CHECK(namsinh >=1 and namsinh <= 4) NOT NULL,
	Makhoa varchar(10) REFERENCES Khoa(MaSo),
	PRIMARY KEY(Masv)
)

CREATE TABLE MonHoc(
	Tenmh nvarchar(50) NOT NULL,
	Mamh varchar(10),
	TinChi int NOT NULL,
	Makhoa varchar(10) REFERENCES Khoa(MaSo),
	PRIMARY KEY(Mamh)
)

CREATE TABLE DieuKien(
	Mamh varchar(10) REFERENCES MonHoc(Mamh),
	Mamh_Truoc varchar(10) REFERENCES MonHoc(Mamh),
	PRIMARY KEY(Mamh, Mamh_Truoc)
)

CREATE TABLE HocPhan(
	Mahp varchar(10),
	Mamh varchar(10) REFERENCES MonHoc(Mamh),
	HocKy char(2) NOT NULL,
	Nam int NOT NULL,
	GiaoVien nvarchar(50) NOT NULL,
	PRIMARY KEY(Mahp)
)

CREATE TABLE KetQua(
	Masv varchar(10) REFERENCES SinhVien(Masv),
	Mahp varchar(10) REFERENCES HocPhan(Mahp),
	Diem float NOT NULL,
	PRIMARY KEY(Masv, Mahp)
)

