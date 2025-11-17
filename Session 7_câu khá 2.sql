create table mon_an (
id INT PRIMARY KEY,
ten_mon VARCHAR(255),
danh_muc VARCHAR(100), -- 'Món chính', 'Khai vị', 'Tráng miệng', 'Đồ uống' 
gia_tien INT,
trang_thai_phuc_vu VARCHAR(50) -- 'Đang phục vụ', 'Tạm ngưng'
);
insert into mon_an
values (1, 'Phở Bò Tái', 'Món chính', 50000, 'Đang phục vụ'),
(2, 'Cơm Gà Xối Mỡ', 'Món chính', 45000, 'Đang phục vụ'),
(3, 'Gỏi Cuốn Tôm Thịt', 'Khai vị', 30000, 'Đang phục vụ'),
(4, 'Bún Bò Huế', 'Món chính', 55000, 'Tạm ngưng'),
(5, 'Nước Cam Ép', 'Đồ uống', 25000, 'Đang phục vụ'),
(6, 'Chè Hạt Sen', 'Tráng miệng', 20000, 'Đang phục vụ'),
(7, 'Cà Phê Sữa Đá', 'Đồ uống', 22000, 'Đang phục vụ'),
(8, 'Bò Lúc Lắc', 'Món chính', 70000, 'Đang phục vụ');
-- 1. Liệt kê các món ăn thuộc danh mục 'Món chính' hoặc 'Khai vị'
select * from mon_an
where danh_muc IN( ' Món chính', 'Khai vị');
-- 2. Tìm món ăn có giá rẻ nhất trong số các món đang được phục vụ ('Đang phục vụ')
select MIN(gia_tien) AS gia_re_nhat 
from mon_an
where trang_thai_phuc_vu = 'Đang phục vụ';
-- 3. Tìm tất cả các món ăn có chữ 'Bò' trong tên món
select * from mon_an
where ten_mon LIKE'%Bò%';
-- 4. Liệt kê 3 món ăn có giá tiền từ thấp đến cao nhất
select * from mon_an
order by gia_tien ASC 
limit 3