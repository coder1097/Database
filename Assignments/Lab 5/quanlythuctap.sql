CREATE DATABASE quanlythuctap
GO
USE quanlythuctap
GO
CREATE TABLE Sinhvien(
	masv varchar(10),
	ten nvarchar(50),
	quequan nvarchar(50),
	ngaysinh date,
	hocluc float check(hocluc >= 0 and hocluc <= 10),
	PRIMARY KEY(masv),
)

CREATE TABLE Detai(
	madt int,
	tendt nvarchar(50),
	chunhiem_detai nvarchar(50),
	kinhphi int CHECK(kinhphi < 100000000) default(0),
	PRIMARY KEY(madt),
)

CREATE TABLE Sinhvien_Detai(
	masv varchar(10),
	madt int,
	noithuctap nvarchar(50),
	quangduong nvarchar(50),
	ketqua float check(ketqua >= 0 and ketqua <= 10),
	PRIMARY KEY(masv,madt),
	CONSTRAINT SinhvienDetai_masv_Sinhvien FOREIGN KEY(masv) REFERENCES Sinhvien(masv),
	CONSTRAINT SinhvienDetai_madt_Detai FOREIGN KEY(madt) REFERENCES Detai(madt)
)

INSERT INTO Sinhvien VALUES('51503346',N'Phan Quốc Tùng',N'Tiền Giang','1997-10-09',7.14)
INSERT INTO Sinhvien VALUES('51503347',N'Phan Quốc A',N'Tiền Giang','2005-10-09',8.5)
INSERT INTO Sinhvien VALUES('51503348',N'Phan Quốc B',N'Tiền Giang','2003-10-09',9)
INSERT INTO Sinhvien VALUES('51503349',N'Phan Quốc C',N'Tiền Giang','1987-10-09',9.3)
INSERT INTO Sinhvien VALUES('51503350',N'Phan Quốc D',N'Tiền Giang','2002-10-09',7.1)


INSERT INTO Detai VALUES(1,N'Đề tài A',N'Mai Ngọc Thắng',10000000)
INSERT INTO Detai VALUES(2,N'Đề tài B',N'Huỳnh Quốc Bảo',11000000)
INSERT INTO Detai VALUES(3,N'Đề tài C',N'Dương Hữu Phúc',35000000)
INSERT INTO Detai VALUES(4,N'Đề tài D',N'Nguyễn Đức Thắng',20000000)
INSERT INTO Detai VALUES(5,N'Đề tài E',N'Huỳnh Ngọc Tú',50000000)

INSERT INTO Sinhvien_Detai VALUES('51503346',1,N'FPT','A',8)
INSERT INTO Sinhvien_Detai VALUES('51503347',2,N'Phương Nam Telecom','C',8)
INSERT INTO Sinhvien_Detai VALUES('51503348',4,N'TMA Solution','B',8)
INSERT INTO Sinhvien_Detai VALUES('51503349',3,N'Google','E',8)
INSERT INTO Sinhvien_Detai VALUES('51503350',5,N'Amazon','F',8)

--2a
SELECT * FROM Sinhvien
WHERE year(getdate())-year(ngaysinh)<20 AND hocluc>8.5
--2b
SELECT * FROM Detai
WHERE kinhphi>1000000
--2c
SELECT * FROM Sinhvien a
INNER JOIN Sinhvien_Detai b ON a.masv=b.masv
WHERE year(getdate())-year(a.ngaysinh)<20 AND a.hocluc>8 AND b.ketqua>8
--2d
SELECT a.chunhiem_detai
FROM Detai a
INNER JOIN Sinhvien_Detai b ON a.madt=b.madt
INNER JOIN Sinhvien c ON b.masv=c.masv
WHERE c.quequan = 'TPHCM'
--2e
SELECT * FROM Sinhvien
WHERE year(ngaysinh) < 1980 AND quequan = N'Hải Phòng'
--2f
SELECT AVG(hocluc) AS DIEMTB_SVHANOI
FROM Sinhvien
WHERE quequan = N'Hà Nội'
--2g
SELECT COUNT(*) AS SO_TINH
FROM Detai a
INNER JOIN Sinhvien_Detai b ON a.madt=b.madt
WHERE a.madt=5
--2h
SELECT quequan, COUNT(*) AS SL_SV 
FROM Sinhvien
GROUP BY quequan
--3a
SELECT *
FROM Detai AS a
WHERE 2 <= (
	SELECT COUNT(*)
	FROM Sinhvien_Detai b
	WHERE a.madt=b.madt
)
--3b
--Danh sách các sv học giỏi hơn sv ở TPHCM
SELECT *
FROM Sinhvien
WHERE hocluc >ALL ( SELECT hocluc FROM Sinhvien
					WHERE quequan='TPHCM'
)
--3d
--Cho biết danh sách sinh viên thực tập tại quê nhà
SELECT *
FROM Sinhvien as a
WHERE masv IN(
	SELECT b.masv FROM Sinhvien_Detai b
	WHERE a.quequan=b.noithuctap
)
--3e
--Các đề tài không có sinh viên nào tham gia
SELECT *
FROM Detai 
WHERE madt NOT IN(
	SELECT DISTINCT madt 
	FROM Sinhvien_Detai
)
--3f
--Danh sách các đề tài có sinh viên giỏi nhất lớp tham gia
SELECT *
FROM Detai
WHERE madt IN(
	SELECT madt
	FROM Sinhvien_Detai
	WHERE masv IN(
		SELECT TOP 1 masv
		FROM Sinhvien
		ORDER BY hocluc DESC
	)
)
--3g
--Danh sách các đề tài không có sinh viên học kém nhất lớp tham gia

--3h
--Danh sách các sinh viên thực tập theo đề tài có kinh phí > 1/5 tổng kinh phí cho các đề tài			 


--3i
--D/s các sv có đ học tập cao hơn đ thực tập trung bình của đề tài có mã là 1
