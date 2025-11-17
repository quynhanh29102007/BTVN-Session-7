create table phim (
id INT PRIMARY KEY,
tieu_de VARCHAR(255),
dao_dien VARCHAR(255),
nam_phat_hanh INT,
the_loai VARCHAR(100),
diem_danh_gia DECIMAL(3, 1)
);
insert into phim (id, tieu_de, dao_dien, nam_phat_hanh, the_loai, diem_danh_gia)
values (1, 'Inception', 'Christopher Nolan', 2010, 'Khoa học viễn tưởng', 8.8),
(2, 'The Dark Knight', 'Christopher Nolan', 2008, 'Hành động', 9.0),
(3, 'Parasite', 'Bong Joon Ho', 2019, 'Tâm lý', 8.5),
(4, 'Mắt Biếc', 'Victor Vũ', 2019, 'Lãng mạn', 7.8),
(5, 'Interstellar', 'Christopher Nolan', 2014, 'Khoa học viễn tưởng', 8.6),
(6, 'Avengers: Endgame', 'Anthony Russo', 2019, 'Hành động', 8.4),
(7, 'Joker', 'Todd Phillips', 2019, 'Tâm lý', 8.4);
-- 1. Tìm tất cả các bộ phim của đạo diễn 'Christopher Nolan'
select * from phim
where dao_dien = 'Christopher Nolan';
-- 2. Liệt kê các bộ phim được phát hành trong thập kỷ 2010 (từ năm 2010 đến 2019)
select * from phim
where nam_phat_hanh between 2010 and 2019;
-- 3. Tính điểm đánh giá trung bình của tất cả các bộ phim trong danh sách
select AVG(diem_danh_gia) AS diem_trung_binh from phim;
-- 4. Liệt kê 3 bộ phim có điểm đánh giá cao nhất, sắp xếp theo thứ tự điểm từ cao đến thấp
select * from phim 
order by diem_danh_gia DESC 
limit 3