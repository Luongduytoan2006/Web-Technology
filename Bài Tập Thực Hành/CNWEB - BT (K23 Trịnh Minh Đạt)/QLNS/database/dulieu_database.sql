-- ===================================================================
-- SCRIPT TẠO VÀ KHỞI TẠO DỮ LIỆU CHO DATABASE 'dulieu'
-- ===================================================================

-- Bước 1: Xóa database cũ nếu tồn tại và tạo database mới với hỗ trợ tiếng Việt
DROP DATABASE IF EXISTS `dulieu`;
CREATE DATABASE `dulieu` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `dulieu`;

-- --------------------------------------------------------

-- Bước 2: Tạo cấu trúc cho bảng `admin`
CREATE TABLE `admin` (
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Thêm dữ liệu cho bảng `admin`
INSERT INTO `admin` (`username`, `password`) VALUES
('user01', '123456'),
('user02', '123456');

-- --------------------------------------------------------

-- Bước 3: Tạo cấu trúc cho bảng `phongban` (Bảng này phải được tạo trước `nhanvien`)
CREATE TABLE `phongban` (
  `IDPB` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tenpb` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Mota` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Thêm dữ liệu cho bảng `phongban`
INSERT INTO `phongban` (`IDPB`, `Tenpb`, `Mota`) VALUES
('PB01', 'Phòng Nhân sự', 'Quản lý các vấn đề về nhân sự công ty'),
('PB02', 'Phòng Kỹ thuật', 'Phát triển và bảo trì sản phẩm'),
('PB03', 'Phòng Kế hoạch', 'Lập kế hoạch kinh doanh và dự án');

-- --------------------------------------------------------

-- Bước 4: Tạo cấu trúc cho bảng `nhanvien`
CREATE TABLE `nhanvien` (
  `IDNV` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Hoten` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDPB` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Diachi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Thêm dữ liệu cho bảng `nhanvien`
INSERT INTO `nhanvien` (`IDNV`, `Hoten`, `IDPB`, `Diachi`) VALUES
('NV01', 'Lê Thị A', 'PB01', 'Đà Nẵng'),
('NV02', 'Trần Văn B', 'PB02', 'Quảng Trị'),
('NV03', 'Mạc Thị C', 'PB03', 'Huế'),
('NV04', 'Đinh Văn D', 'PB01', 'Hà Tĩnh');

-- --------------------------------------------------------

-- Bước 5: Thêm các khóa chính (Primary Key) cho các bảng
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

ALTER TABLE `phongban`
  ADD PRIMARY KEY (`IDPB`);

ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`IDNV`),
  ADD KEY `fk_nhanvien_phongban` (`IDPB`);

-- --------------------------------------------------------

-- Bước 6: Thêm khóa ngoại (Foreign Key) để liên kết bảng
-- Liên kết từ bảng `nhanvien` đến `phongban`
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `fk_nhanvien_phongban` FOREIGN KEY (`IDPB`) REFERENCES `phongban` (`IDPB`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- KẾT THÚC SCRIPT.