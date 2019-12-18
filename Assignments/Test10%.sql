CREATE DATABASE QLTV
GO
USE QLTV;
CREATE TABLE NhaXuatBan (
MaNXB char(4) NOT NULL PRIMARY KEY,
TenNXB nvarchar(30) NOT NULL,
);
CREATE TABLE BanDoc (
MaThe char(6) NOT NULL PRIMARY KEY,
TenBanDoc nvarchar(30) NOT NULL,
DiaChi nvarchar(30),SoDT nchar(10)
);
CREATE TABLE TheLoai (
MaTL char(2) NOT NULL PRIMARY KEY,
TenTL nvarchar(20) NOT NULL,
);
CREATE TABLE Sach (
MaSach char(6) NOT NULL PRIMARY KEY,
Tuade nvarchar(30) NOT NULL,
MaNXB char(4) REFERENCES NhaXuatBan(MaNXB),
TacGia nvarchar(30),
SoLuong int,
NgayNhap Datetime,
MaTL char(2) REFERENCES TheLoai(MaTL)
);
CREATE TABLE MuonSach (
MaThe char(6) REFERENCES BanDoc(Mathe),
MaSach char(6) REFERENCES Sach(MaSach),
NgayMuon Datetime,
NgayTra Datetime
);
USE QLTV
INSERT INTO NhaXuatBan VALUES ('N001', N'Giáo dục');
INSERT INTO NhaXuatBan VALUES ('N002', N'Khoa học kỹ thuật');
INSERT INTO NhaXuatBan VALUES ('N003', N'Thống Kê');
SELECT * FROM NhaXuatBan;
INSERT INTO BanDoc VALUES ('050001', N'Trần Xuân', N'17 Yersin', '858936');
INSERT INTO BanDoc VALUES ('050002', N'Lê Nam', N'5 Hai Bà Trưng', '845623');
INSERT INTO BanDoc VALUES ('060001', N'Nguyễn Nam', N'10 Lý Tự Trọng',
'823456'); INSERT INTO BanDoc VALUES ('060002', N'Trần Hùng', N'20 Trần Phú',
'841256'); SELECT * FROM BanDoc
INSERT INTO TheLoai VALUES ('TH', N'Tin học')
INSERT INTO TheLoai VALUES ('HH', N'Hóa học')
INSERT INTO TheLoai VALUES ('KT', N'Kinh tế')
INSERT INTO TheLoai VALUES ('TN', N'Toán
học') SELECT * FROM TheLoai;
INSERT INTO Sach VALUES ('TH0001', N'Sử dụng Corel Draw', 'N002', N'Đậu Quang
Tuấn', 3, '08/09/2005', 'TH')
INSERT INTO Sach VALUES ('TH0002', N'Lập trình mạng', 'N003', N'Phạm Vĩnh Hưng',
2, '03/12/2003', 'TH')
INSERT INTO Sach VALUES ('TH0003', N'Thiêt kế mạng chuyên nghiệp', 'N002', N'Phạm
Vĩnh Hưng', 5, '04/05/2003', 'TH')
INSERT INTO Sach VALUES ('TH0004', N'Thực hành mạng', 'N003', N'Trần Quang', 3,
'06/05/2004', 'TH')INSERT INTO Sach VALUES ('TH0005', N'3D Studio kỹ xảo hoạt hình T1', 'N001',
N'Trương Bình', 2, '05/02/2004', 'TH')
INSERT INTO Sach VALUES ('TH0006', N'3D Studio kỹ xảo hoạt hình T2',
'N001', N'Trương Bình', 3, '05/06/2004', 'TH')
INSERT INTO Sach VALUES ('TH0007', N'Giáo trình Access 2000', 'N001', N'Thiện
Tâm', 5 ,'11/12/2005', 'TH')
SELECT * FROM Sach
INSERT INTO MuonSach VALUES ('050001', 'TH0006', '12/12/2006',
'2007/03/01') INSERT INTO MuonSach(Mathe,MaSach, NgayMuon) VALUES
('050001', 'TH0007', '12/12/2006')
INSERT INTO MuonSach VALUES ('050002', 'TH0001', '2006/03/08',
'2007/04/15') INSERT INTO MuonSach(Mathe,MaSach, NgayMuon) VALUES
('050002', 'TH0004', '2007/03/04')
INSERT INTO MuonSach VALUES ('050002', 'TH0002', '2007/03/04', '04/04/2007')
INSERT INTO MuonSach VALUES ('050002', 'TH0003', '02/04/2007', '2007/04/15')
INSERT INTO MuonSach (Mathe,MaSach, NgayMuon) VALUES ('060002', 'TH0001',
'2007/04/08')
INSERT INTO MuonSach VALUES ('060002', 'TH0007', '2007/03/15',
'2007/04/15') SELECT * FROM MuonSach

--author: 51503346-Phan Quoc Tung
--a
SELECT Tuade 
FROM Sach 
WHERE MaSach NOT IN(
	SELECT MaSach
	FROM MuonSach 
)
--b
SELECT *
FROM BanDoc
WHERE MaThe IN(
	SELECT TOP 1 MaThe
	FROM MuonSach
	GROUP BY(MaThe)
	ORDER BY COUNT(*) DESC
)

--c
CREATE VIEW [DSmuonTin] AS 
	SELECT b.TenBanDoc,b.DiaChi,b.SoDT,c.MaSach,c.Tuade
	FROM MuonSach a
	INNER JOIN BanDoc b ON a.MaThe=b.MaThe
	INNER JOIN Sach c ON a.MaSach=c.MaSach
	INNER JOIN TheLoai d ON c.MaTL=d.MaTL
	WHERE d.TenTL=N'Tin học'

--d
CREATE PROCEDURE muon_sach(@mathe char(6),@masach char(6), @ngaymuon datetime, @ngaytra datetime)
AS
	BEGIN
		IF (@mathe IS NULL OR EXISTS(SELECT MaThe FROM BanDoc)) AND (@masach IS NULL OR EXISTS(SELECT MaSach FROM Sach)) AND @ngaymuon <= @ngaytra
			INSERT INTO MuonSach VALUES(@mathe,@masach,@ngaymuon,@ngaytra)
	END

--e
CREATE PROCEDURE Danhsachmuon
AS
	BEGIN
		SELECT b.MaThe,b.TenBanDoc,b.SoDT
		FROM MuonSach a
		INNER JOIN BanDoc b ON a.MaThe=b.MaThe
	END

--f
CREATE FUNCTION Soluongsach(@tentheloai nvarchar(20))
RETURNS INT
AS
	BEGIN
		DECLARE @soluong INT
		SET @soluong = (
			SELECT COUNT(*)
			FROM Sach a
			INNER JOIN TheLoai b ON a.MaTL=b.MaTL
			WHERE b.TenTL=@tentheloai
		)
			
		RETURN @soluong
	END
--g
CREATE FUNCTION Thongkesls()
RETURNS TABLE
AS RETURN (
	SELECT a.MaNXB AS MA_NXB,COUNT(a.MaNXB) AS SL
	FROM Sach a
	INNER JOIN NhaXuatBan b ON a.MaNXB=b.MaNXB
	GROUP BY a.MaNXB
)



