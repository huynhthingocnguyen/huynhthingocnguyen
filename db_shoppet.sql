CREATE DATABASE QLShopPet
USE QLShopPet

-- Tạo bảng và chèn dữ liệu vào bảng PhanQuyen
CREATE TABLE PhanQuyen(
	IDQuyen int  PRIMARY KEY NOT NULL,
	TenQuyen nvarchar(20) NULL,
);
INSERT INTO PhanQuyen(IDQuyen, TenQuyen) VALUES
					(1, N'Khách hàng'),
					(2, N'Quản trị viên');

-- Tạo bảng và chèn dữ liệu vào bảng Nguoidung
CREATE TABLE Nguoidung(
	MaNguoiDung int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Hoten nvarchar(50) NULL,
	Email nvarchar(50) NULL,
	Dienthoai nchar(10) NULL,
	Matkhau varchar(50) NULL,
	IDQuyen int NULL,
	Diachi nvarchar(100) NULL,
	Anhdaidien nchar(30) NULL,
	FOREIGN KEY (IDQuyen) REFERENCES PhanQuyen(IDQuyen)
);
SET IDENTITY_INSERT Nguoidung ON;
INSERT INTO Nguoidung(MaNguoiDung, Hoten, Email, Dienthoai, Matkhau, IDQuyen, Diachi, Anhdaidien) VALUES
(1, N'Admin', N'admin@gmail.com', N'0812883636', N'admin', 2, N'Quảng Ngãi', N'/Images/images/anime.jpg'),
(2, N'Huỳnh Thị Ngọc Nguyên', N'nguyen001@gmail.com', N'0812883645', N'nguyen001', 1, N'Phú Yên', N'/Images/images/ngocnguyen.jpg'),
(3, N'Nguyễn Thanh Trung', N'trung001@gmail.com', N'0373818709', N'trung001', 1, N'Quảng Ngãi', N'/Images/images/avata_chinh.png');
SET IDENTITY_INSERT Nguoidung OFF;

-- Tạo bảng và chèn dữ liệu vào bảng Hangsanxuat
CREATE TABLE Hangsanxuat(
	Mahang int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Tenhang nchar(20) NULL,
);
SET IDENTITY_INSERT Hangsanxuat ON;
INSERT INTO Hangsanxuat(Mahang, Tenhang) VALUES
						(1, N'Royal'),
						(2, N'Beef'),
						(3, N'Lamb'),
						(4, N'Salmon'),
						(5, N'FiB''S');
SET IDENTITY_INSERT Hangsanxuat OFF;

-- Tạo bảng và chèn dữ liệu vào bảng Loaithucung
CREATE TABLE Loaithucung(
	Maltc int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Tenltc nchar(10) NULL,
);
SET IDENTITY_INSERT Loaithucung ON;
INSERT INTO Loaithucung(Maltc, Tenltc) VALUES
						(1, N'Chó'),
						(2, N'Mèo');
SET IDENTITY_INSERT Loaithucung OFF;

-- Tạo bảng và chèn dữ liệu vào bảng Donhang
CREATE TABLE Donhang(
	Madon int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Ngaydat datetime NULL,
	Tinhtrang int NULL,
	MaNguoidung int NULL,
	Thanhtoan int NULL,
	Diachinhanhang nvarchar(100) NULL,
	Tongtien decimal(18, 0) NULL,
	FOREIGN KEY (MaNguoidung) REFERENCES Nguoidung(MaNguoidung)
);
SET IDENTITY_INSERT Donhang ON;
INSERT INTO Donhang(Madon, Ngaydat, Tinhtrang, MaNguoidung, Thanhtoan, Diachinhanhang, Tongtien) VALUES
(1, CAST(N'2023-05-26T06:57:48.457' AS DateTime), 1, 3, 1, N'', CAST(330000 AS Decimal(18, 0))),
(2, CAST(N'2023-05-26T07:45:12.053' AS DateTime), 1, 3, 1, N'', CAST(480000 AS Decimal(18, 0))),
(3, CAST(N'2023-05-27T03:25:07.627' AS DateTime), 1, 2, 1, N'', CAST(800000 AS Decimal(18, 0)));
SET IDENTITY_INSERT Donhang OFF;
-- Tạo bảng và chèn dữ liệu vào bảng Sanpham
CREATE TABLE Sanpham(
	Masp int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Tensp nvarchar(50) NULL,
	Giatien decimal(18, 0) NULL,
	Soluong int NULL,
	Mota nvarchar(500) NULL,
	Anhbia nvarchar(50) NULL,
	Mahang int NULL,
	Maltc int NULL,
	FOREIGN KEY (Mahang) REFERENCES Hangsanxuat(Mahang),
	FOREIGN KEY (Maltc) REFERENCES Loaithucung(Maltc)
);
SET IDENTITY_INSERT Sanpham ON;
INSERT INTO Sanpham(Masp, Tensp, Giatien, Soluong, Mota, Anhbia, Mahang, Maltc) VALUES
(2, N'FEE RANGE CHICKEN', CAST(330000 AS Decimal(18, 0)), 9, N'Được sản xuất theo công nghệ NHẬT BẢN trên dây chuyền hiện đại, quy trình kiểm soát chất lượng chặt chẻ, cam kết chất lượng dẫn đầu, đáp ứng tốt nhu cầu vệ sinh cũng như cho không gian luôn sạch sẻ cho thú cưng và người sử dụng.', N'/Images/files/product_01.jpg', 2, 2),
(5, N'BEEF-NEW ZEALEAN', CAST(200000 AS Decimal(18, 0)), 10, N'Được sản xuất theo công nghệ NHẬT BẢN trên dây chuyền hiện đại, quy trình kiểm soát chất lượng chặt chẻ, cam kết chất lượng dẫn đầu, đáp ứng tốt nhu cầu vệ sinh cũng như cho không gian luôn sạch sẻ cho thú cưng và người sử dụng.', N'/Images/files/product_02.jpg', 2, 2),
(6, N'LAMB', CAST(400000 AS Decimal(18, 0)), 10, N'Được sản xuất theo công nghệ NHẬT BẢN trên dây chuyền hiện đại, quy trình kiểm soát chất lượng chặt chẻ, cam kết chất lượng dẫn đầu, đáp ứng tốt nhu cầu vệ sinh cũng như cho không gian luôn sạch sẻ cho thú cưng và người sử dụng.', N'/Images/files/product_03.jpg', 2, 2),
(7, N'BEEF-GOOD DOG', CAST(200000 AS Decimal(18, 0)), 8, N'Được sản xuất theo công nghệ NHẬT BẢN trên dây chuyền hiện đại, quy trình kiểm soát chất lượng chặt chẻ, cam kết chất lượng dẫn đầu, đáp ứng tốt nhu cầu vệ sinh cũng như cho không gian luôn sạch sẻ cho thú cưng và người sử dụng.', N'/Images/files/product_04.jpg', 2, 2),
(8, N'SALMON-CAT ARR', CAST(100000 AS Decimal(18, 0)), 30, N'Được sản xuất theo công nghệ NHẬT BẢN trên dây chuyền hiện đại, quy trình kiểm soát chất lượng chặt chẻ, cam kết chất lượng dẫn đầu, đáp ứng tốt nhu cầu vệ sinh cũng như cho không gian luôn sạch sẻ cho thú cưng và người sử dụng.', N'/Images/files/product_05.jpg', 2, 1),
(9, N'VANISON-GOOD DOG', CAST(150000 AS Decimal(18, 0)), 26, N'Được sản xuất theo công nghệ NHẬT BẢN trên dây chuyền hiện đại, quy trình kiểm soát chất lượng chặt chẻ, cam kết chất lượng dẫn đầu, đáp ứng tốt nhu cầu vệ sinh cũng như cho không gian luôn sạch sẻ cho thú cưng và người sử dụng.', N'/Images/files/product_06.jpg', 2, 1),
(10, N'RABBIT-TRAINNERS', CAST(200000 AS Decimal(18, 0)), 10, N'Được sản xuất theo công nghệ NHẬT BẢN trên dây chuyền hiện đại, quy trình kiểm soát chất lượng chặt chẻ, cam kết chất lượng dẫn đầu, đáp ứng tốt nhu cầu vệ sinh cũng như cho không gian luôn sạch sẻ cho thú cưng và người sử dụng.', N'/Images/files/product_07.jpg', 2, 1),
(11, N'ROYAL CANIN-KITTEN-CAT GOOD', CAST(200000 AS Decimal(18, 0)), 20, N'Được sản xuất theo công nghệ NHẬT BẢN trên dây chuyền hiện đại, quy trình kiểm soát chất lượng chặt chẻ, cam kết chất lượng dẫn đầu, đáp ứng tốt nhu cầu vệ sinh cũng như cho không gian luôn sạch sẻ cho thú cưng và người sử dụng.', N'/Images/files/product_08.jpg', 1, 1),
(13, N'DOG CHOW', CAST(1000000 AS Decimal(18, 0)), 10, N'Được sản xuất theo công nghệ NHẬT BẢN trên dây chuyền hiện đại, quy trình kiểm soát chất lượng chặt chẻ, cam kết chất lượng dẫn đầu, đáp ứng tốt nhu cầu vệ sinh cũng như cho không gian luôn sạch sẻ cho thú cưng và người sử dụng.', N'/Images/files/product_09.jpg', 3, 1),
(14, N'FIB''S FOOD DOG', CAST(200000 AS Decimal(18, 0)), 10, N'Được sản xuất theo công nghệ NHẬT BẢN trên dây chuyền hiện đại, quy trình kiểm soát chất lượng chặt chẻ, cam kết chất lượng dẫn đầu, đáp ứng tốt nhu cầu vệ sinh cũng như cho không gian luôn sạch sẻ cho thú cưng và người sử dụng.', N'/Images/files/product_10.jpg', 3, 1),
(17, N'PEDIGRE-ADULTO', CAST(300000 AS Decimal(18, 0)), 20, N'Được sản xuất theo công nghệ NHẬT BẢN trên dây chuyền hiện đại, quy trình kiểm soát chất lượng chặt chẻ, cam kết chất lượng dẫn đầu, đáp ứng tốt nhu cầu vệ sinh cũng như cho không gian luôn sạch sẻ cho thú cưng và người sử dụng.', N'/Images/files/product_11.jpg', 2, 1),
(18, N'ROYAL CANIN-KITTEN-CAT SMALL', CAST(500000 AS Decimal(18, 0)), 30, N'Được sản xuất theo công nghệ NHẬT BẢN trên dây chuyền hiện đại, quy trình kiểm soát chất lượng chặt chẻ, cam kết chất lượng dẫn đầu, đáp ứng tốt nhu cầu vệ sinh cũng như cho không gian luôn sạch sẻ cho thú cưng và người sử dụng.', N'/Images/files/product_12.jpg', 2, 1);
SET IDENTITY_INSERT Sanpham OFF;

-- Tạo bảng và chèn dữ liệu vào bảng Chitietdonhang
CREATE TABLE Chitietdonhang(
	Madon int NOT NULL ,
	Masp int NOT NULL,
	Soluong int NULL,
	Dongia decimal(18, 0) NULL,
	Thanhtien decimal(18, 0) NULL,
	Phuongthucthanhtoan int NULL,
	PRIMARY KEY (Madon, Masp),
	FOREIGN KEY (Madon) REFERENCES Donhang(Madon),
	FOREIGN KEY (Masp) REFERENCES Sanpham(Masp)
);
INSERT INTO Chitietdonhang(Madon, Masp, Soluong, Dongia, Thanhtien, Phuongthucthanhtoan) VALUES
(1, 2, 1, CAST(330000 AS Decimal(18, 0)), CAST(330000 AS Decimal(18, 0)), 1),
(2, 2, 1, CAST(330000 AS Decimal(18, 0)), CAST(330000 AS Decimal(18, 0)), 1),
(2, 9, 1, CAST(150000 AS Decimal(18, 0)), CAST(150000 AS Decimal(18, 0)), 1),
(3, 6, 2, CAST(400000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), 1);

