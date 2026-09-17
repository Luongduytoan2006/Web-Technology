-- Xóa cơ sở dữ liệu nếu đã tồn tại để tránh lỗi
DROP DATABASE IF EXISTS TestKiHe;

-- Tạo cơ sở dữ liệu mới với bảng mã utf8 để hỗ trợ tiếng Việt
CREATE DATABASE TestKiHe CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Sử dụng cơ sở dữ liệu vừa tạo
USE TestKiHe;

-- Tạo bảng Khoa
CREATE TABLE khoa (
  makhoa VARCHAR(10) PRIMARY KEY,
  tenkhoa NVARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- Tạo bảng Người dùng để đăng nhập
CREATE TABLE nguoidung (
  tendangnhap VARCHAR(50) PRIMARY KEY,
  matkhau VARCHAR(255) NOT NULL -- Lưu mật khẩu đã được mã hóa
) ENGINE=InnoDB;

-- Tạo bảng Sinh viên
CREATE TABLE sinhvien (
  masv VARCHAR(10) PRIMARY KEY,
  hoten NVARCHAR(50) NOT NULL,
  gioitinh NVARCHAR(3) NOT NULL,
  makhoa VARCHAR(10),
  FOREIGN KEY (makhoa) REFERENCES khoa(makhoa)
) ENGINE=InnoDB;

-- Chèn dữ liệu mẫu cho bảng Khoa
INSERT INTO khoa (makhoa, tenkhoa) VALUES
('CNTT', 'Công nghệ thông tin'),
('TOAN', 'Khoa Toán'),
('LY', 'Khoa Lý');

-- Chèn dữ liệu mẫu cho bảng Người dùng
INSERT INTO nguoidung (tendangnhap, matkhau) VALUES
('admin', '123456'),
('user1', 'pass123'),
('user2', 'pass456'),
('user', 'password');

-- Chèn dữ liệu mẫu cho bảng Sinh viên
INSERT INTO sinhvien (masv, hoten, gioitinh, makhoa) VALUES
('1051010565', 'Lý Lê Bằng', 'Nam', 'TOAN'),
('1051016523', 'Trần Anh Tuấn', 'Nam', 'TOAN'),
('1051036666', 'Lê Lan Anh', 'Nữ', 'CNTT'),
('1051037777', 'Đặng Thùy Nga', 'Nữ', 'LY'),
('1051070388', 'Nguyễn Văn A', 'Nam', 'CNTT'),
('1051070584', 'Trần Văn Long', 'Nam', 'CNTT'),
('1051072354', 'Lê Văn Nam', 'Nam', 'CNTT');