create database nhanvien;
use nhanvien; 

create table nhan_vien(
id_nhan_vien INT Primary Key,
ho_ten VARCHAR(150),
phong_ban VARCHAR(150), 
luong INT,
nam_sinh INT
);
insert into nhan_vien
values (1, 'Nguyễn Văn An', 'Kỹ thuật', 25000000, 1990),
(2, 'Trần Thị Bình', 'Kinh doanh', 18000000, 1992),
(3, 'Lê Văn Cường', 'Kỹ thuật', 30000000, 1988),
(4, 'Phạm Thị Dung', 'Nhân sự', 16000000, 1995),
(5, 'Hoàng Văn Giang', 'Kỹ thuật', 22000000, 1991),
(6, 'Vũ Thị Hà', 'Kinh doanh', 19000000, 1996),
(7, 'Nguyễn Minh Hùng', 'Kỹ thuật', 35000000, 1989),
(8, 'Đặng Thu Lan', 'Marketing', 21000000, 1994),
(9, 'Bùi Văn Kiên', 'Nhân sự', 17000000, 1997),
(10, 'Ngô Bảo Ngọc', 'Kinh doanh', 20000000, 1993);
-- 1. Lọc dữ liệu cơ bản 
select * from nhan_vien 
where ho_ten LIKE 'Nguyễn' ;
select ho_ten, phong_ban, luong
from nhan_vien
where luong between 15000000 and 20000000;
select * from nhan_vien
where phong_ban IN('Nhân sự', 'Kinh doanh'); 
-- 2. Hàm tổng hợp
select COUNT(*) AS tong_nhan_vien from nhan_vien;
select MAX(luong) AS luong_cao_nhat,
MIN(luong) AS luong_thap_nhat
from nhan_vien;
select AVG(luong) AS luong_trung_binh
from nhan_vien