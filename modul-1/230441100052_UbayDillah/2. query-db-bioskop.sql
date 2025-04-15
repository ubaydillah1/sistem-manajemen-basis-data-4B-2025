CREATE DATABASE db_bioskop;
USE db_bioskop;

CREATE TABLE USER (
  id_user INT AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  no_hp VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE author (
  id_author INT AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  bio TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE studio (
  id_studio INT AUTO_INCREMENT PRIMARY KEY,
  nama_studio VARCHAR(100) NOT NULL,
  kapasitas INT NOT NULL,
  lokasi VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE film (
  id_film INT AUTO_INCREMENT PRIMARY KEY,
  judul VARCHAR(100) NOT NULL,
  genre VARCHAR(50) NOT NULL,
  durasi INT NOT NULL, 
  studio_id INT NOT NULL,
  author_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (studio_id) REFERENCES studio(id_studio),
  FOREIGN KEY (author_id) REFERENCES author(id_author)
);

CREATE TABLE pemesanan (
  id_pemesanan INT AUTO_INCREMENT PRIMARY KEY,
  id_pengguna INT NOT NULL,
  id_film INT NOT NULL,
  jumlah_tiket INT NOT NULL,
  total_harga DECIMAL(10,2) NOT NULL,
  tanggal_pemesanan DATE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_pengguna) REFERENCES USER(id_user),
  FOREIGN KEY (id_film) REFERENCES film(id_film)
);

CREATE TABLE jadwal_tayang (
  id_jadwal INT AUTO_INCREMENT PRIMARY KEY,
  film_id INT NOT NULL,
  tanggal DATE NOT NULL,
  jam TIME NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (film_id) REFERENCES film(id_film)
);

INSERT INTO author (nama, email, bio) VALUES
('Andi Wijaya', 'andi@example.com', 'Sutradara film aksi dan drama.'),
('Budi Santoso', 'budi@example.com', 'Ahli sinematografi.'),
('Clara Dewi', 'clara@example.com', 'Penulis skenario berpengalaman.'),
('Dina Lestari', 'dina@example.com', 'Sutradara film komedi.'),
('Eko Prasetyo', 'eko@example.com', 'Penulis naskah horor.'),
('Fajar Nugroho', 'fajar@example.com', 'Editor film independen.'),
('Gita Rahma', 'gita@example.com', 'Penulis dan produser film.'),
('Herman Syah', 'herman@example.com', 'Pengarah artistik.'),
('Intan Sari', 'intan@example.com', 'Sutradara film remaja.'),
('Joko Anwar', 'joko@example.com', 'Sutradara dan penulis film thriller.');

INSERT INTO studio (nama_studio, kapasitas, lokasi) VALUES
('Studio 1', 100, 'Lantai 1'),
('Studio 2', 120, 'Lantai 1'),
('Studio 3', 80, 'Lantai 2'),
('Studio 4', 150, 'Lantai 2'),
('Studio 5', 200, 'Lantai 3'),
('Studio 6', 90, 'Lantai 3'),
('Studio 7', 110, 'Lantai 4'),
('Studio 8', 130, 'Lantai 4'),
('Studio 9', 100, 'Lantai 5'),
('Studio 10', 140, 'Lantai 5');

INSERT INTO film (judul, genre, durasi, studio_id, author_id) VALUES
('Petualangan Semut', 'Petualangan', 95, 1, 1),
('Cinta Dalam Hujan', 'Romantis', 105, 2, 2),
('Misteri Lorong Sekolah', 'Horor', 90, 3, 3),
('Hari-Hari Ceria', 'Komedi', 85, 4, 4),
('Langit Senja', 'Drama', 110, 5, 5),
('Pemburu Malam', 'Thriller', 120, 6, 6),
('Sahabat Sejati', 'Drama', 100, 7, 7),
('Alien dari Timur', 'Fiksi Ilmiah', 115, 8, 8),
('Musim Panas Terakhir', 'Romantis', 98, 9, 9),
('Pengejar Bayangan', 'Aksi', 130, 10, 10);

INSERT INTO USER (nama, email, no_hp) VALUES
('Agus', 'agus@mail.com', '081234567891'),
('Budi', 'budi@mail.com', '081234567892'),
('Citra', 'citra@mail.com', '081234567893'),
('Dina', 'dina@mail.com', '081234567894'),
('Eko', 'eko@mail.com', '081234567895'),
('Fani', 'fani@mail.com', '081234567896'),
('Gilang', 'gilang@mail.com', '081234567897'),
('Hana', 'hana@mail.com', '081234567898'),
('Ivan', 'ivan@mail.com', '081234567899'),
('Joko', 'joko@mail.com', '081234567800');

INSERT INTO jadwal_tayang (film_id, tanggal, jam) VALUES
(1, '2025-04-08', '14:00:00'),
(2, '2025-04-08', '16:00:00'),
(3, '2025-04-08', '18:00:00'),
(4, '2025-04-08', '20:00:00'),
(5, '2025-04-08', '13:00:00'),
(6, '2025-04-09', '15:00:00'),
(7, '2025-04-09', '17:00:00'),
(8, '2025-04-09', '19:00:00'),
(9, '2025-04-10', '21:00:00'),
(10, '2025-04-10', '22:00:00');

INSERT INTO pemesanan (id_pengguna, id_film, jumlah_tiket, total_harga, tanggal_pemesanan) VALUES
(1, 1, 2, 50000, '2025-04-01'),
(2, 2, 3, 75000, '2025-04-01'),
(3, 3, 1, 25000, '2025-04-02'),
(4, 4, 4, 100000, '2025-04-02'),
(5, 5, 2, 50000, '2025-04-03'),
(6, 6, 2, 50000, '2025-04-03'),
(7, 7, 3, 75000, '2025-04-04'),
(8, 8, 1, 25000, '2025-04-04'),
(9, 9, 5, 125000, '2025-04-05'),
(10, 10, 2, 50000, '2025-04-05');

SELECT * FROM author;

SELECT * FROM studio;

SELECT * FROM film;

SELECT * FROM jadwal_tayang;

SELECT * FROM USER;

SELECT * FROM pemesanan;

DROP DATABASE db_bioskop;






DROP DATABASE db_bioskop;
