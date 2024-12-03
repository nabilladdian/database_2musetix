CREATE TABLE `users` (
  `id_user` INT PRIMARY KEY AUTO_INCREMENT,
  `email` VARCHAR(255) UNIQUE NOT NULL,
  `username` VARCHAR(100) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `nama_depan` VARCHAR(50),
  `nama_belakang` VARCHAR(50),
  `biografi` LONGTEXT,
  `gambar_profil` VARCHAR(255),
  `link_komunitas` VARCHAR(255)
);

CREATE TABLE `events` (
  `id_event` INT PRIMARY KEY AUTO_INCREMENT,
  `id_user` INT NOT NULL,
  `judul_event` VARCHAR(255) NOT NULL,
  `deskripsi` TEXT,
  `kategori_event` ENUM ('Konser', 'Teater', 'Orkestra') NOT NULL,
  `tanggal` DATE NOT NULL,
  `waktu` TIME NOT NULL,
  `lokasi` VARCHAR(255) NOT NULL,
  `kapasitas` INT NOT NULL,
  `harga` DECIMAL(10,2),
  `gambar_event` VARCHAR(255),
  `status` ENUM ('Aktif', 'Tidak Aktif') DEFAULT 'Aktif',
  `jumlah_tiket` INT NOT NULL
);

CREATE TABLE `payment_methods` (
  `id_payment` INT PRIMARY KEY AUTO_INCREMENT,
  `id_user` INT NOT NULL,
  `id_event` INT NOT NULL,
  `jenis_metode` ENUM ('Kartu Kredit/Debit', 'Virtual Account', 'QR Code') NOT NULL,
  `nomor_transaksi` VARCHAR(255) UNIQUE NOT NULL,
  `jumlah` DECIMAL(10,2) NOT NULL,
  `status_pembayaran` ENUM ('Berhasil', 'Gagal', 'Menunggu') DEFAULT 'Menunggu',
  `tanggal_pembayaran` DATETIME NOT NULL
);

ALTER TABLE `events` ADD FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

ALTER TABLE `payment_methods` ADD FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

ALTER TABLE `payment_methods` ADD FOREIGN KEY (`id_event`) REFERENCES `events` (`id_event`) ON DELETE CASCADE;
