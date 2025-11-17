create table san_pham (
id INT PRIMARY KEY,
ten_san_pham VARCHAR(255),
danh_muc VARCHAR(100),
gia_ban INT,
so_luong_ton INT
);
insert into san_pham 
values (1, 'Laptop Dell XPS 13', 'Laptop', 28000000, 15),
(2, 'iPhone 14 Pro Max', 'Điện thoại', 32000000, 30),
(3, 'Bàn phím cơ Logitech', 'Phụ kiện', 2500000, 50),
(4, 'Laptop MacBook Air M2', 'Laptop', 29500000, 20),
(5, 'Samsung Galaxy S23 Ultra', 'Điện thoại', 26000000, 25),
(6, 'Chuột không dây Fuhlen', 'Phụ kiện', 450000, 100),
(7, 'Tai nghe Sony WH-1000XM5', 'Phụ kiện', 8500000, 40),
(8, 'Laptop HP Envy 15', 'Laptop', 24000000, 18);
-- 1. Tìm các sản phẩm có giá bán nằm trong khoảng từ 20,000,000 đến 30,000,000
select * from san_pham 
where gia_ban between 20000000 AND 30000000;
-- 2. Tìm tất cả các sản phẩm có tên chứa từ 'laptop'
select * from san_pham
where ten_san_pham LIKE '%laptop%';
-- 3. Đếm tổng số sản phẩm thuộc mục 'phụ kiện'
select COUNT(*) AS so_luong_phu_kien from san_pham
where danh_muc = 'phụ kiện';
-- 4. Liệt kê 3 sản phẩm có giá bán cao nhất
select * from san_pham
order by gia_ban DESC
limit 3;