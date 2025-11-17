create table don_hang (
id_don_hang INT PRIMARY KEY,
id_khach_hang INT,
danh_muc VARCHAR(100),
tong_tien INT,
ngay_dat DATE,
trang_thai VARCHAR(50) -- 'Hoan thanh', 'Da huy'
);
insert into don_hang 
values (1, 101, 'Dien tu', 15000000, '2023-01-15', 'Hoan thanh'),
(2, 102, 'Thoi trang', 2500000, '2023-01-20', 'Hoan thanh'),
(3, 101, 'Dien tu', 8000000, '2023-02-10', 'Hoan thanh'),
(4, 103, 'Gia dung', 5000000, '2023-02-12', 'Da huy'),
(5, 102, 'Thoi trang', 3000000, '2023-03-05', 'Hoan thanh'),
(6, 101, 'Gia dung', 4500000, '2023-03-08', 'Hoan thanh'),
(7, 104, 'Dien tu', 22000000, '2023-04-18', 'Hoan thanh'),
(8, 103, 'Thoi trang', 1800000, '2023-04-22', 'Hoan thanh'),
(9, 102, 'Dien tu', 12000000, '2022-12-10', 'Hoan thanh');
-- 1. Thống kê tổng số tiền chi tiêu cho mỗi khách hàng
select id_khach_hang, SUM(tong_tien) AS tong_chi_tieu
from don_hang
group by tong_chi_tieu
order by tong_chi_tieu DESC;
-- 2. Đếm số lượng đơn hàng theo từng danh mục sản phẩm
select danh_muc, COUNT(*) AS so_luong_don
from don_hang
group by danh_muc;
-- 3. Tìm những khách hàng đã đặt nhiều hơn 1 đơn hàng
select id_khach_hang from don_hang
group by id_khach_hang
having COUNT(id_don_hang)>1;
-- 4. Liệt kê các danh mục có tổng doanh thu (chỉ tính các đơn 'Hoan thanh') lớn hơn 10,000,000
select danh_muc, tong_doanh_thu from don_hang
where trang_thai = 'hoàn thành' 
group by danh_muc
having SUM(tong_doanh_thu) >10000000