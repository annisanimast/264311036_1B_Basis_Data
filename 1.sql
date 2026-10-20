
-- Tabel Induk 1
CREATE TABLE pengguna (
  id_pengguna VARCHAR(10) PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  role VARCHAR(20) NOT NULL,
  status_aktif VARCHAR(10) NOT NULL
);

-- Tabel Induk 2
CREATE TABLE pintu (
  id_pintu VARCHAR(10) PRIMARY KEY,
  status_pintu VARCHAR(20) NOT NULL
);

-- Tabel Transaksi (2 FOREIGN KEY)
CREATE TABLE log_akses (
  id_akses VARCHAR(10) PRIMARY KEY,
  waktu_akses TIMESTAMP NOT NULL,
  status_akses VARCHAR(20) NOT NULL,
  status_pintu VARCHAR(20) NOT NULL,
  id_pengguna VARCHAR(10) NOT NULL,
  id_pintu VARCHAR(10) NOT NULL,
  FOREIGN KEY (id_pengguna) REFERENCES pengguna(id_pengguna),
  FOREIGN KEY (id_pintu) REFERENCES pintu(id_pintu)
);

