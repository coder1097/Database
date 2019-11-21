CREATE DATABASE QLNV
USE QLNV

CREATE TABLE PHONG(
	MAPHONG char(3) PRIMARY KEY,
	TENPHONG nvarchar(40),
	DIACHI nvarchar(50),
	TEL char(10)
)

CREATE TABLE DMNN(
	MANN char(2) PRIMARY KEY,
	TENNN nvarchar(20)
)

CREATE TABLE NHANHVIEN(
	MANV char(5) PRIMARY KEY,
	HOTEN nvarchar(40),
	GIOITINH char(3),
	NGAYSINH date,
	LUONG int,
	MAPHONG char(3),
	SDT char(10),
	NGAYBC date
)

CREATE TABLE TDNN(
	MANV char(5),
	MANN char(2),
	TDO char(1),
	PRIMARY KEY(MANV,MANN)
)

INSERT INTO PHONG(MAPHONG,TENPHONG,DIACHI,TEL) VALUES('HCA',N'Hanh chinh to hop','123, Lang Ha, Dong Da, Ha Noi','048585793')
INSERT INTO PHONG(MAPHONG,TENPHONG,DIACHI,TEL) VALUES('KDA',N'Kinh doanh','123, Lang Ha, Dong Da, Ha Noi','048574943')
INSERT INTO PHONG(MAPHONG,TENPHONG,DIACHI,TEL) VALUES('KTA',N'Ky thuat','123, Lang Ha, Dong Da, Ha Noi','049480485')
INSERT INTO PHONG(MAPHONG,TENPHONG,DIACHI,TEL) VALUES('QTA',N'Quan tri','123, Lang Ha, Dong Da, Ha Noi','048508585')

INSERT INTO DMNN(MANN,TENNN) VALUES('01','Anh')
INSERT INTO DMNN(MANN,TENNN) VALUES('02','Nga')
INSERT INTO DMNN(MANN,TENNN) VALUES('03',N'Phap')
INSERT INTO DMNN(MANN,TENNN) VALUES('04',N'Nhat')
INSERT INTO DMNN(MANN,TENNN) VALUES('05',N'Trung Quoc')
INSERT INTO DMNN(MANN,TENNN) VALUES('06',N'Han Quoc')

INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('HC001',N'Nguyen Thi Ha',N'Nu','08/27/1950',2500000,'HCA','','02/08/1975')
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('HC002',N'Tran Van Nam','Nam','6/12/1975',3000000,'HCA','','6/8/1997')
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('HC003',N'Nguyen Thanh Huyen',N'Nu','7/3/1978',1500000,'HCA','','9/24/1999')
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('KD001',N'Le Tuyet Anh',N'Nu','2/3/1977',2500000,'KDA','','10/2/2001')
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('KD002',N'Nguyen Anh Tu','Nam','7/4/1942',2600000,'KDA','','9/24/1999')
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('KD003',N'Pham An Thai','Nam','5/9/1977',1600000,'KDA','','9/24/1999')
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('KD004',N'Le Van Hai','Nam','1/2/1976',2700000,'KDA','','6/8/1997')
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('KD005',N'Nguyen Phuong Minh','Nam','1/2/1980',2000000,'KDA','','10/2/2001')
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('KT001',N'Tran Dinh Kham','Nam','12/2/1981',2700000,'KTA','','1/1/2005')
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('KT002',N'Nguyen Manh Hung','Nam','8/16/1980',2300000,'KTA','','1/1/2005')
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('KT003',N'Pham Thanh Son','Nam','8/20/1984',2000000,'KTA','','1/1/2005')
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('KT004',N'Vu Thi Hoai',N'Nu','12/5/1980',2500000,'KTA','','10/2/2001')
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('KT005',N'Nguyen Thu Lan',N'Nu','10/5/1977',3000000,'KTA','','10/2/2001')
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('KT006',N'Tran Hoai Nam','Nam','7/2/1978',2800000,'KTA','','6/8/1997')
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('KT007',N'Hoang Nam Son','Nam','12/3/1940',3000000,'KTA','','7/2/1965')
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('KT008',N'Le Thu Trang',N'Nu','7/6/1950',2500000,'KTA','','8/2/1968')
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('KT009',N'Khuc Nam Hai','Nam','7/22/1980',2000000,'KTA','','1/1/2005')
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('KT010',N'Phung Trung Dung','Nam','8/28/1978',2200000,'KTA','','9/24/1999')

INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('HC001','01','A')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('HC001','02','B')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('HC002','01','C')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('HC002','03','C')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('HC003','01','D')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KD001','01','C')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KD001','02','C')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KD002','01','D')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KD002','02','A')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KD003','01','B')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KD003','02','C')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KD004','01','C')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KD004','04','A')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KD004','05','A')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KD005','01','B')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KD005','02','D')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KD005','03','B')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KD005','04','B')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KT001','01','D')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KT001','04','E')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KT002','01','C')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KT002','02','B')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KT003','01','D')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KT003','03','C')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KT004','01','D')
INSERT INTO TABLE TDNN(MANV,MANN,TDO) VALUES('KT005','01','C')

--Q3-1
INSERT INTO NHANVIEN(MANV,HOTEN,GIOITINH,NGAYSINH,LUONG,MAPHONG,SDT,NGAYBC) VALUES('QT001',N'Phan Quoc Tung','Nam','10/9/1997',150000,'QTA','','9/16/2019')
INSERT INTO TDNN(MANV,MANN,TDO) VALUES('QT001','01','C')
INSERT INTO TDNN(MANV,MANN,TDO) VALUES('QT001','04','A')

SELECT * FROM NHANVIEN WHERE MANV='KT001'

SELECT * FROM NHANVIEN WHERE GIOITINH = 'Nu'

SELECT * FROM NHANVIEN WHERE HOTEN IN('Nguyen')

SELECT * FROM NHANVIEN WHERE HOTEN IN('Van')

SELECT * FROM NHANVIEN WHERE YEAR(GETDATE())-YEAR(NGAYSINH) < 30

SELECT * FROM NHANVIEN WHERE YEAR(GETDATE())-YEAR(NGAYSINH) BETWEEN 25 AND 30

SELECT MANV FROM TDNN WHERE (MANN = '01' AND TDO = 'C') OR (MANN='01' AND TDO='D')

SELECT * FROM NHANVIEN WHERE YEAR(NGAYBC) < 2000

SELECT * FROM NHANVIEN WHERE YEAR(GETDATE())-YEAR(NGAYBC) > 10

SELECT MAPHONG,TENPHONG,TEL FROM PHONG 

SELECT TOP 2 HOTEN,NGAYSINH,NGAYBC FROM NHANVIEN

SELECT MANV,HOTEN,NGAYSINH,LUONG FROM NHANVIEN WHERE LUONG BETWEEN 2000000 AND 3000000

SELECT * FROM NHANVIEN WHERE SDT=''

SELECT * FROM NHANVIEN WHERE MONTH(NGAYSINH)==3

SELECT * FROM NHANVIEN ORDER BY LUONG ASC

SELECT AVG(LUONG) AS LUONG_TB_KD FROM NHANVIEN WHERE MAPHONG='KDA'

SELECT COUNT(MANV) AS SOLUONG_NV,AVG(LUONG) AS LUONG_TB_KD FROM NHANVIEN WHERE MAPHONG='KDA'
