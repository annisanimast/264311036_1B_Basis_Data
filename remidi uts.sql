SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `admin` (
  `id_pengguna` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `akses_1nf` (
  `id_akses` int NOT NULL,
  `template_data` varchar(50) NOT NULL,
  `id_pengguna` varchar(10) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `id_pintu` varchar(10) DEFAULT NULL,
  `status_pintu` varchar(20) DEFAULT NULL,
  `id_perangkat` varchar(10) DEFAULT NULL,
  `jenis_perangkat` varchar(50) DEFAULT NULL,
  `id_alert` varchar(10) DEFAULT NULL,
  `status_alert` varchar(20) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `id_admin` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `akses_1nf` (`id_akses`, `template_data`, `id_pengguna`, `nama`, `role`, `id_pintu`, `status_pintu`, `id_perangkat`, `jenis_perangkat`, `id_alert`, `status_alert`, `tanggal`, `jam`, `id_admin`) VALUES
(1, 'FP01', 'U01', 'Budi', 'penghuni', 'P01', 'terkunci', 'D01', 'fingerprint reader', 'A01', 'baru', '2026-10-20', '22:15:00', 'ADM01'),
(1, 'FP02', 'U01', 'Budi', 'penghuni', 'P01', 'terkunci', 'D01', 'fingerprint reader', 'A01', 'baru', '2026-10-20', '22:15:00', 'ADM01');


CREATE TABLE `akses_2nf` (
  `id_akses` int NOT NULL,
  `id_pengguna` varchar(10) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `id_pintu` varchar(10) DEFAULT NULL,
  `status_pintu` varchar(20) DEFAULT NULL,
  `id_perangkat` varchar(10) DEFAULT NULL,
  `jenis_perangkat` varchar(50) DEFAULT NULL,
  `id_alert` varchar(10) DEFAULT NULL,
  `status_alert` varchar(20) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `id_admin` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `akses_2nf` (`id_akses`, `id_pengguna`, `nama`, `role`, `id_pintu`, `status_pintu`, `id_perangkat`, `jenis_perangkat`, `id_alert`, `status_alert`, `tanggal`, `jam`, `id_admin`) VALUES
(1, 'U01', 'Budi', 'penghuni', 'P01', 'terkunci', 'D01', 'fingerprint reader', 'A01', 'baru', '2026-10-20', '22:15:00', 'ADM01');


CREATE TABLE `akses_unf` (
  `id_akses` int NOT NULL,
  `id_pengguna` varchar(10) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `template_fingerprint` varchar(255) DEFAULT NULL,
  `id_pintu` varchar(10) DEFAULT NULL,
  `status_pintu` varchar(20) DEFAULT NULL,
  `id_perangkat` varchar(10) DEFAULT NULL,
  `jenis_perangkat` varchar(50) DEFAULT NULL,
  `id_alert` varchar(10) DEFAULT NULL,
  `status_alert` varchar(20) DEFAULT NULL,
  `waktu_kejadian` varchar(30) DEFAULT NULL,
  `jumlah_pencobaan_gagal` int DEFAULT NULL,
  `id_admin` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `akses_unf` (`id_akses`, `id_pengguna`, `nama`, `role`, `template_fingerprint`, `id_pintu`, `status_pintu`, `id_perangkat`, `jenis_perangkat`, `id_alert`, `status_alert`, `waktu_kejadian`, `jumlah_pencobaan_gagal`, `id_admin`) VALUES
(1, 'U01', 'Budi', 'penghuni', 'FP01,FP02', 'P01', 'terkunci', 'D01', 'fingerprint reader', 'A01', 'baru', '2026-10-20 22:15:00', 3, 'ADM01');


CREATE TABLE `data_kondisi_perangkat` (
  `id_perangkat` varchar(10) NOT NULL,
  `waktu_pembacaan` timestamp NOT NULL,
  `level_baterai` int NOT NULL,
  `status_koneksi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `data_sensor` (
  `id_perangkat` varchar(10) NOT NULL,
  `waktu_pengukuran` timestamp NOT NULL,
  `suhu` decimal(5,2) DEFAULT NULL,
  `kelembapan` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `log_akses` (
  `id_akses` varchar(10) NOT NULL,
  `waktu_akses` timestamp NOT NULL,
  `status_akses` varchar(20) NOT NULL,
  `status_pintu` varchar(20) NOT NULL,
  `id_pengguna` varchar(10) NOT NULL,
  `id_pintu` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `menerima` (
  `id_pengguna` varchar(10) NOT NULL,
  `id_alert` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pengguna` (
  `id_pengguna` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `role` varchar(20) NOT NULL,
  `status_aktif` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `pengguna` (`id_pengguna`, `nama`, `role`, `status_aktif`) VALUES
('', 'nazril', 'pengguna ', '');


CREATE TABLE `penghuni` (
  `id_pengguna` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `perangkat` (
  `id_perangkat` varchar(10) NOT NULL,
  `jenis_perangkat` varchar(50) NOT NULL,
  `id_pintu` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `peringatan_pembobolan` (
  `id_alert` varchar(10) NOT NULL,
  `status_alert` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `id_akses` varchar(10) NOT NULL,
  `id_pintu` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `pintu` (
  `id_pintu` varchar(10) NOT NULL,
  `status_pintu` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rekap_akses_gagal_bulanan` (
  `id_rekap` int NOT NULL,
  `id_pintu` varchar(10) NOT NULL,
  `bulan` varchar(7) NOT NULL,
  `total_gagal` int DEFAULT '0',
  `terakhir_diperbarui` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `riwayat_pemeliharaan_perangkat` (
  `id_pemeliharaan` int NOT NULL,
  `id_perangkat` varchar(10) DEFAULT NULL,
  `id_admin` varchar(10) DEFAULT NULL,
  `tanggal_pemeliharaan` date NOT NULL,
  `deskripsi_perbaikan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `tamu` (
  `id_pengguna` varchar(10) NOT NULL,
  `masa_berlaku_akses` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `template_2nf` (
  `id_pengguna` varchar(10) NOT NULL,
  `template_data` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `template_2nf` (`id_pengguna`, `template_data`) VALUES
('U01', 'FP01'),
('U01', 'FP02');


CREATE TABLE `template_fingerprint` (
  `id_pengguna` varchar(10) NOT NULL,
  `template_fingerprint` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_pengguna`);

ALTER TABLE `akses_1nf`
  ADD PRIMARY KEY (`id_akses`,`template_data`);

ALTER TABLE `akses_2nf`
  ADD PRIMARY KEY (`id_akses`);

ALTER TABLE `akses_unf`
  ADD PRIMARY KEY (`id_akses`);

ALTER TABLE `data_kondisi_perangkat`
  ADD PRIMARY KEY (`id_perangkat`,`waktu_pembacaan`);

ALTER TABLE `data_sensor`
  ADD PRIMARY KEY (`id_perangkat`,`waktu_pengukuran`);

ALTER TABLE `log_akses`
  ADD PRIMARY KEY (`id_akses`),
  ADD KEY `id_pengguna` (`id_pengguna`),
  ADD KEY `id_pintu` (`id_pintu`),
  ADD KEY `idx_status_akses` (`status_akses`);

ALTER TABLE `menerima`
  ADD PRIMARY KEY (`id_pengguna`,`id_alert`),
  ADD KEY `id_alert` (`id_alert`);

ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

ALTER TABLE `penghuni`
  ADD PRIMARY KEY (`id_pengguna`);

ALTER TABLE `perangkat`
  ADD PRIMARY KEY (`id_perangkat`),
  ADD KEY `id_pintu` (`id_pintu`),
  ADD KEY `idx_jenis_perangkat` (`jenis_perangkat`);

ALTER TABLE `peringatan_pembobolan`
  ADD PRIMARY KEY (`id_alert`),
  ADD KEY `id_akses` (`id_akses`),
  ADD KEY `id_pintu` (`id_pintu`);

ALTER TABLE `pintu`
  ADD PRIMARY KEY (`id_pintu`);

ALTER TABLE `rekap_akses_gagal_bulanan`
  ADD PRIMARY KEY (`id_rekap`),
  ADD KEY `id_pintu` (`id_pintu`);

ALTER TABLE `riwayat_pemeliharaan_perangkat`
  ADD PRIMARY KEY (`id_pemeliharaan`),
  ADD KEY `id_perangkat` (`id_perangkat`),
  ADD KEY `id_admin` (`id_admin`);

ALTER TABLE `tamu`
  ADD PRIMARY KEY (`id_pengguna`);

ALTER TABLE `template_2nf`
  ADD PRIMARY KEY (`id_pengguna`,`template_data`);

ALTER TABLE `template_fingerprint`
  ADD PRIMARY KEY (`id_pengguna`,`template_fingerprint`);

ALTER TABLE `rekap_akses_gagal_bulanan`
  MODIFY `id_rekap` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `riwayat_pemeliharaan_perangkat`
  MODIFY `id_pemeliharaan` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`);

ALTER TABLE `data_kondisi_perangkat`
  ADD CONSTRAINT `data_kondisi_perangkat_ibfk_1` FOREIGN KEY (`id_perangkat`) REFERENCES `perangkat` (`id_perangkat`);

ALTER TABLE `data_sensor`
  ADD CONSTRAINT `data_sensor_ibfk_1` FOREIGN KEY (`id_perangkat`) REFERENCES `perangkat` (`id_perangkat`);

ALTER TABLE `log_akses`
  ADD CONSTRAINT `log_akses_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`),
  ADD CONSTRAINT `log_akses_ibfk_2` FOREIGN KEY (`id_pintu`) REFERENCES `pintu` (`id_pintu`);

ALTER TABLE `menerima`
  ADD CONSTRAINT `menerima_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `admin` (`id_pengguna`),
  ADD CONSTRAINT `menerima_ibfk_2` FOREIGN KEY (`id_alert`) REFERENCES `peringatan_pembobolan` (`id_alert`);

ALTER TABLE `penghuni`
  ADD CONSTRAINT `penghuni_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`);

ALTER TABLE `perangkat`
  ADD CONSTRAINT `perangkat_ibfk_1` FOREIGN KEY (`id_pintu`) REFERENCES `pintu` (`id_pintu`);

ALTER TABLE `peringatan_pembobolan`
  ADD CONSTRAINT `peringatan_pembobolan_ibfk_1` FOREIGN KEY (`id_akses`) REFERENCES `log_akses` (`id_akses`),
  ADD CONSTRAINT `peringatan_pembobolan_ibfk_2` FOREIGN KEY (`id_pintu`) REFERENCES `pintu` (`id_pintu`);

ALTER TABLE `rekap_akses_gagal_bulanan`
  ADD CONSTRAINT `rekap_akses_gagal_bulanan_ibfk_1` FOREIGN KEY (`id_pintu`) REFERENCES `pintu` (`id_pintu`);

ALTER TABLE `riwayat_pemeliharaan_perangkat`
  ADD CONSTRAINT `riwayat_pemeliharaan_perangkat_ibfk_1` FOREIGN KEY (`id_perangkat`) REFERENCES `perangkat` (`id_perangkat`) ON DELETE CASCADE,
  ADD CONSTRAINT `riwayat_pemeliharaan_perangkat_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE SET NULL;

ALTER TABLE `tamu`
  ADD CONSTRAINT `tamu_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`);

ALTER TABLE `template_fingerprint`
  ADD CONSTRAINT `template_fingerprint_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`);
COMMIT;

