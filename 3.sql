SELECT p.nama, COUNT(l.id_akses) AS total_akses_berhasil
FROM pengguna p
JOIN log_akses l ON p.id_pengguna = l.id_pengguna
WHERE l.status_akses = 'Berhasil'
GROUP BY p.id_pengguna, p.nama;
