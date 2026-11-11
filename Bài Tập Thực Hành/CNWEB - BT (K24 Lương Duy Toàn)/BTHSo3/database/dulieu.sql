-- tạo csdl DULIEU
DROP DATABASE IF EXISTS DULIEU;
CREATE DATABASE DULIEU CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE DULIEU;

-- bảng admin
CREATE TABLE admin (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(50) NOT NULL
);

-- bảng phongban
CREATE TABLE phongban (
    IDPB  VARCHAR(10) PRIMARY KEY,
    Tenpb VARCHAR(100) NOT NULL,
    Mota  VARCHAR(255)
);

-- bảng nhanvien, IDPB là khoá ngoại tới phongban
CREATE TABLE nhanvien (
    IDNV   VARCHAR(10) PRIMARY KEY,
    Hoten  VARCHAR(100) NOT NULL,
    IDPB   VARCHAR(10),
    Diachi VARCHAR(255),
    FOREIGN KEY (IDPB) REFERENCES phongban(IDPB)
);

-- dữ liệu mẫu
INSERT INTO admin VALUES
('user01', '123abc'),
('user02', 'abc123');

INSERT INTO phongban VALUES
('PB01', 'Phòng ban 1', 'Tổ chức'),
('PB02', 'Phòng ban 2', 'Kế toán'),
('PB03', 'Phòng ban 3', 'Kỹ thuật');

INSERT INTO nhanvien VALUES
('NV01', 'Lê A',      'PB01', 'Đà Nẵng'),
('NV02', 'Trần B',    'PB02', 'Quảng Ngãi'),
('NV03', 'Nguyễn C',  'PB03', 'Gia Lai'),
('NV04', 'Mạc D',     'PB01', 'Quảng Trị'),
('NV05', 'Đinh E',    'PB02', 'Hà Tĩnh');
