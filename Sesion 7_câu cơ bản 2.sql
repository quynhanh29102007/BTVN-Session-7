create table sach (
id INT PRIMARY KEY,
tieu_de VARCHAR(255),
tac_gia VARCHAR(255),
the_loai VARCHAR(100),
nam_xuat_ban INT,
trang_thai VARCHAR(50)
);
insert into sach 
values (1, 'Dế Mèn phiêu lưu ký', 'Tô Hoài', 'Văn học', 1941, 'Có sẵn'),
(2, 'Cho tôi xin một vé đi tuổi thơ', 'Nguyễn Nhật Ánh', 'Văn học', 2008, 'Đã mượn'),
(3, 'Số đỏ', 'Vũ Trọng Phụng', 'Tiểu thuyết', 1936, 'Có sẵn'),
(4, 'Nhà giả kim', 'Paulo Coelho', 'Tiểu thuyết', 1988, 'Có sẵn'),
(5, 'Mắt biếc', 'Nguyễn Nhật Ánh', 'Văn học', 1990, 'Đã mượn'),
(6, 'Trên đường băng', 'Tony Buổi Sáng', 'Kỹ năng sống', 2015, 'Có sẵn'),
(7, 'Đắc nhân tâm', 'Dale Carnegie', 'Kỹ năng sống', 1936, 'Có sẵn');
 -- 1. Tìm tất cả cuốn sách có tên tác giả 'Nguyễn Nhật Ánh'
 select * from sach
 where tac_gia = 'Nguyễn Nhật Ánh';
 -- 2. Liệt kê tất cả cuốn sách thuộc thể loại 'Văn học' hoặc 'Tiểu thuyết'
 select * from sach 
 where the_loai IN ('Văn học', 'Tiểu thuyết');
 -- 3. Đếm số lượng sách hiện tại đang ở trạng thái 'đã mượn'
 select COUNT(*) AS trang_thai_da_muon
 where trang_thai = 'đã mượn';
 -- 4. Liệt kê 2 cuốn sách cũ nhất trong thư viện
 select * from sach
order by nam_xuat_ban ASC
limit 2