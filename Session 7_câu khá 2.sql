create table nhat_ky_nguoi_dung (
id_nhat_ky INT PRIMARY KEY,
id_nguoi_dung INT,
id_bai_viet INT,
chuyen_muc VARCHAR(100),
thoi_gian_doc_giay INT,
ngay_ghi_nhat_ky DATE
);
insert into nhat_ky_nguoi_dung
values (1, 1, 101, 'Lap trinh', 300, '2023-10-01'),
(2, 2, 102, 'Thiet ke', 180, '2023-10-01'),
(3, 1, 103, 'Lap trinh', 450, '2023-10-02'),
(4, 3, 104, 'Bao mat', 600, '2023-10-03'),
(5, 2, 101, 'Lap trinh', 240, '2023-10-03'),
(6, 1, 104, 'Bao mat', 500, '2023-10-04'),
(7, 4, 102, 'Thiet ke', 120, '2023-10-04'),
(8, 3, 101, 'Lap trinh', 320, '2023-10-05'),
(9, 2, 105, 'Thiet ke', 200, '2023-10-05');
-- 1. Tính tổng thời gian đọc của mỗi người dùng
select id_nguoi_dung, SUM(thoi_gian) AS tong_thoi_gian_doc
from nhat_ky_nguoi_dung
group by id_nguoi_dung
order by tong_thoi_gian_doc DESC;
-- 2. Đếm số lượt đọc cho mỗi chuyên mục
select chuyen_muc, COUNT(*) AS so_luot_doc 
from nhat_ky_nguoi_dung
group by chuyen_muc;
--  3. Tìm những bài viết (id_bai_viet) được đọc bởi nhiều hơn 1 người dùng
select id_bai_viet from nhat_ky_nguoi_dung 
group by id_bai_viet
having COUNT(DISTINCT id_nguoi_dung) >1;
-- 4. Liệt kê những người dùng có thời gian đọc trung bình cho mỗi bài viết lớn hơn 350 giây
select id_nguoi_dung, AVG(thoi_gian_doc_trung_binh) AS thoi_gian_doc_trung_binh
group by id_nguoi_dung
having AVG(thoi_gian_trung_binh)>350