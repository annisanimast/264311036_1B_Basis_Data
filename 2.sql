-- [CREATE] INSERT 3 baris per tabel (total 9 baris)
INSERT INTO pengguna (id_pengguna, nama, role, status_aktif) VALUES
('P001', 'Budi', 'Admin', 'Aktif'),
('P002', 'Sari', 'Penghuni', 'Aktif'),
('P003', 'Andi', 'Tamu', 'Aktif');

INSERT INTO pintu (id_pintu, status_pintu) VALUES
('PT001', 'Terkunci'),
('PT002', 'Terkunci'),
('PT003', 'Terbuka');

INSERT INTO log_akses (id_akses, waktu_akses, status_akses, status_pintu, id_pengguna, id_pintu) VALUES
('LA001', '2026-10-20 08:00:00', 'Berhasil', 'Terbuka', 'P001', 'PT001'),
('LA002', '2026-10-20 09:30:00', 'Gagal', 'Terkunci', 'P002', 'PT002'),
('LA003', '2026-10-20 10:15:00', 'Berhasil', 'Terbuka', 'P003', 'PT003');

-- [READ] Tampilkan seluruh isi salah satu tabel induk
SELECT * FROM pengguna;

-- [UPDATE] Ubah status di tabel transaksi (WHERE pada primary key)
UPDATE log_akses
SET status_akses = 'Berhasil'
WHERE id_akses = 'LA002';

-- [DELETE] Hapus satu baris di tabel transaksi (WHERE pada primary key)
DELETE FROM log_akses
WHERE id_akses = 'LA003';
