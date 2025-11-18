create database ghidanh;
use ghidanh;

create table ghi_danh (
id_ghi_danh INT PRIMARY KEY,
id_hoc_vien INT,
id_khoa_hoc INT,
ten_khoa_hoc VARCHAR(255),
ten_giang_vien VARCHAR(255),
gia_tien INT,
ngay_ghi_danh DATE,
trang_thai_hoan_thanh VARCHAR(50)
);
 insert into ghi_danh
 values (1, 101, 1, 'SQL cho nguoi moi bat dau', 'Nguyen Van A', 500000, '2023-01-20', 'Da hoan thanh'),
(2, 102, 1, 'SQL cho nguoi moi bat dau', 'Nguyen Van A', 500000, '2023-02-15', 'Chua hoan thanh'),
(3, 103, 2, 'Python co ban', 'Tran Thi B', 700000, '2023-02-25', 'Da hoan thanh'),
(4, 101, 2, 'Python co ban', 'Tran Thi B', 700000, '2023-03-05', 'Da hoan thanh'),
(5, 104, 3, 'Thiet ke Web chuyen nghiep', 'Le Van C', 1200000, '2023-03-10', 'Chua hoan thanh'),
(6, 102, 3, 'Thiet ke Web chuyen nghiep', 'Le Van C', 1200000, '2023-04-12', 'Chua hoan thanh'),
(7, 105, 1, 'SQL cho nguoi moi bat dau', 'Nguyen Van A', 600000, '2023-05-15', 'Da hoan thanh'),
(8, 103, 3, 'Thiet ke Web chuyen nghiep', 'Le Van C', 1200000, '2023-05-20', 'Da hoan thanh'),
(9, 101, 4, 'Machine Learning ung dung', 'Nguyen Van A', 1500000, '2023-06-01', 'Chua hoan thanh'),
(10, 106, 2, 'Python co ban', 'Tran Thi B', 700000, '2022-11-30', 'Da hoan thanh'),
(11, 102, 2, 'Python co ban', 'Tran Thi B', 700000, '2023-07-01', 'Chua hoan thanh');
 -- 1. Đánh giá hiệu suất giảng viên trong Quý 1 năm 2023
 select ten_giang_vien, SUM(gia_tien) from ghi_danh
 where ngay_ghi_danh between '2023-01-01' AND '2023-03-31'
 group by ten_giang_vien
 having SUM(gia_tien)>1000000 ;
 -- 2. Tìm các khóa học phổ biến nhưng có tỷ lệ hoàn thành thấp
 select ten_khoa_hoc, 
 COUNT(*) AS so_luong_ghi_danh,
 (SUM(CASE WHEN trang_thai_hoan_thanh = 'Da hoan thanh' THEN 1 ELSE 0 END) * 100/COUNT(*)) AS ti_le_hoan_thanh 
 from ghi_danh
 where id_hoc_vien = 2 AND trang_thai_hoan_thanh<50
 group by ten_khoa_hoc
 having COUNT(*)>=2
 AND (SUM(CASE WHEN trang_thai_hoan_thanh = 'Da hoan thanh' THEN 1 ELSE 0 END) * 100/COUNT(*))<50;
 -- 3. Xác định học viên tích cực nhất
 select id_hoc_vien,
 COUNT(DISTINCT id_khoa_hoc) AS so_khoa_hoc_da_dang_ky,
 SUM(gia_tien) AS tong_chi_tieu
 from ghi_danh
 group by id_hoc_vien
 having COUNT(DISTINCT id_khoa_hoc)>=2
 AND SUM(gia_tien)>1000000;
 --  4. Phân tích doanh thu theo tháng trong năm 2023
select MONTH(ngay_ghi_danh) AS thang_ghi_danh,
SUM(gia_tien) AS tong_doanh_thu from ghi_danh
where YEAR(ngay_ghi_danh) = 2023
group by MONTH(ngay_ghi_danh)
having SUM(gia_tien)>1000000 
order by thang_ghi_danh ASC