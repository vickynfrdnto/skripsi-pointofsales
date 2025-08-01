-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2025 at 04:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE `access` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` int(11) NOT NULL,
  `kelola_akun` tinyint(1) NOT NULL,
  `kelola_barang` tinyint(1) NOT NULL,
  `transaksi` tinyint(1) NOT NULL,
  `kelola_laporan` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `access`
--

INSERT INTO `access` (`id`, `user`, `kelola_akun`, `kelola_barang`, `transaksi`, `kelola_laporan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, '2024-08-08 04:25:43', '2024-08-08 04:25:43'),
(2, 2, 0, 0, 0, 1, '2024-08-08 06:44:55', '2024-08-08 06:45:41'),
(3, 3, 0, 1, 1, 1, '2024-08-08 06:50:57', '2024-08-08 06:50:57');

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `nama_kegiatan` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `id_user`, `user`, `nama_kegiatan`, `jumlah`, `created_at`, `updated_at`) VALUES
(1, 1, 'Yunita', 'transaksi', 1, '2025-07-31 07:28:22', '2025-07-31 07:28:22'),
(2, 1, 'Yunita', 'transaksi', 1, '2025-07-31 07:37:48', '2025-07-31 07:37:48'),
(3, 1, 'Yunita', 'transaksi', 1, '2025-07-31 07:48:45', '2025-07-31 07:48:45'),
(4, 1, 'Yunita', 'transaksi', 1, '2025-07-31 07:49:05', '2025-07-31 07:49:05'),
(5, 1, 'Yunita', 'transaksi', 1, '2025-07-31 08:56:01', '2025-07-31 08:56:01'),
(6, 1, 'Yunita', 'transaksi', 1, '2025-07-31 11:02:47', '2025-07-31 11:02:47');

-- --------------------------------------------------------

--
-- Table structure for table `barang_movements`
--

CREATE TABLE `barang_movements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `jenis` enum('masuk','keluar') NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barang_movements`
--

INSERT INTO `barang_movements` (`id`, `kode_barang`, `jenis`, `jumlah`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, '99999', 'masuk', 10, 'Barang baru ditambahkan', '2025-07-31 08:55:17', '2025-07-31 08:55:17'),
(2, '2', 'keluar', 5, 'Barang terjual via transaksi T31072025155549', '2025-07-31 08:56:01', '2025-07-31 08:56:01'),
(3, '333', 'masuk', 10, 'Barang baru ditambahkan', '2025-07-31 09:48:22', '2025-07-31 09:48:22'),
(4, '2', 'keluar', 5, 'Barang terjual via transaksi T31072025180236', '2025-07-31 11:02:47', '2025-07-31 11:02:47'),
(5, '44', 'masuk', 10, 'Barang baru ditambahkan', '2025-07-31 12:53:21', '2025-07-31 12:53:21');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `markets`
--

CREATE TABLE `markets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_toko` varchar(255) NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `markets`
--

INSERT INTO `markets` (`id`, `nama_toko`, `no_telp`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 'TOKO SUMBER REZEKI', '0812-8363-9357', 'KUTABUMI\n                ', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2020_05_22_230351_create_product_table', 1),
(10, '2020_05_26_114219_create_supply_table', 1),
(11, '2020_05_26_123200_create_trigger_supply', 1),
(12, '2020_06_03_202123_create_supply_system', 1),
(13, '2020_06_03_202129_create_transaction_table', 1),
(14, '2020_06_10_225325_create_access_table', 1),
(15, '2020_06_12_133440_create_activity_table', 1),
(16, '2020_06_15_205927_create_market_table', 1),
(17, '2024_08_08_113958_create_pelanggans_table', 2),
(18, '2025_07_31_152234_add_jenis_to_transactions_table', 3),
(19, '2025_07_31_155025_create_barang_movements_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggans`
--

CREATE TABLE `pelanggans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `notel` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelanggans`
--

INSERT INTO `pelanggans` (`id`, `nama`, `email`, `alamat`, `notel`, `created_at`, `updated_at`) VALUES
(1, 'Ahmad Faizal A', 'ahmadfaisal@gmail.com', 'Tangerang', '085770323', '2024-08-08 06:13:36', '2025-07-31 07:59:31');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL DEFAULT 'barang.jpg',
  `jenis_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `berat_barang` varchar(255) DEFAULT NULL,
  `merek` varchar(255) DEFAULT NULL,
  `stok` int(11) NOT NULL DEFAULT 15,
  `harga` bigint(20) NOT NULL,
  `keterangan` varchar(255) NOT NULL DEFAULT 'Tersedia',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `kode_barang`, `foto`, `jenis_barang`, `nama_barang`, `berat_barang`, `merek`, `stok`, `harga`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, '1', 'barang.jpg', 'engsel', 'jaket', '6 Pcs', 'helm', 0, 100000, 'Habis', '2025-07-31 07:23:46', '2025-07-31 07:49:05'),
(2, '2', 'barang.jpg', 'handle', 'baju', '10 Pcs', 'nevada', 0, 200000, 'Habis', '2025-07-31 08:52:40', '2025-07-31 11:02:47'),
(3, '99999', 'barang.jpg', 'engsel', 'celana', '10 Pcs', 'supreme', 10, 1000000, 'Tersedia', '2025-07-31 08:55:17', '2025-07-31 08:55:17'),
(4, '333', 'barang.jpg', 'engsel', 'kipas', '10 Pcs', 'sanyo', 10, 100000, 'Tersedia', '2025-07-31 09:48:22', '2025-07-31 09:48:22'),
(5, '44', 'barang.jpg', 'handle', 'kerudung', '30 Pcs', 'pasha', 10, 100000, 'Tersedia', '2025-07-31 12:53:21', '2025-07-31 12:53:21');

-- --------------------------------------------------------

--
-- Table structure for table `supplies`
--

CREATE TABLE `supplies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_beli` bigint(20) NOT NULL,
  `id_pemasok` int(11) NOT NULL,
  `pemasok` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `supplies`
--
DELIMITER $$
CREATE TRIGGER `tg_pasok_barang` AFTER INSERT ON `supplies` FOR EACH ROW BEGIN
                UPDATE products SET stok = stok + NEW.jumlah WHERE kode_barang = NEW.kode_barang;
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `supply_systems`
--

CREATE TABLE `supply_systems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supply_systems`
--

INSERT INTO `supply_systems` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, '2025-07-31 07:31:57');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_transaksi` varchar(255) NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `merek` varchar(50) DEFAULT NULL,
  `foto` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `harga` bigint(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_barang` bigint(20) NOT NULL,
  `subtotal` bigint(20) NOT NULL,
  `diskon` int(11) NOT NULL,
  `total` bigint(20) NOT NULL,
  `bayar` bigint(20) NOT NULL,
  `kembali` bigint(20) NOT NULL,
  `id_kasir` int(11) NOT NULL,
  `kasir` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jenis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `kode_transaksi`, `kode_barang`, `nama_barang`, `merek`, `foto`, `harga`, `jumlah`, `total_barang`, `subtotal`, `diskon`, `total`, `bayar`, `kembali`, `id_kasir`, `kasir`, `created_at`, `updated_at`, `jenis`) VALUES
(1, 'T31072025142805', '1', 'jaket', 'helm', 'default.jpg', 100000, 1, 100000, 100000, 0, 100000, 100000, 0, 1, 'Yunita', '2025-07-31 07:28:22', '2025-07-31 07:28:22', NULL),
(2, 'T31072025143739', '1', 'jaket', 'helm', 'default.jpg', 100000, 4, 400000, 400000, 0, 400000, 400000, 0, 1, 'Yunita', '2025-07-31 07:37:48', '2025-07-31 07:37:48', NULL),
(3, 'T31072025144656', '1', 'jaket', 'helm', 'default.jpg', 100000, 3, 300000, 300000, 0, 300000, 300000, 0, 1, 'Yunita', '2025-07-31 07:48:45', '2025-07-31 07:48:45', NULL),
(4, 'T31072025144849', '1', 'jaket', 'helm', 'default.jpg', 100000, 1, 100000, 100000, 0, 100000, 100000, 0, 1, 'Yunita', '2025-07-31 07:49:05', '2025-07-31 07:49:05', NULL),
(5, 'T31072025155549', '2', 'baju', 'nevada', 'default.jpg', 200000, 5, 1000000, 1000000, 0, 1000000, 1000000, 0, 1, 'Yunita', '2025-07-31 08:56:01', '2025-07-31 08:56:01', NULL),
(6, 'T31072025180236', '2', 'baju', 'nevada', 'default.jpg', 200000, 5, 1000000, 1000000, 0, 1000000, 1000000, 0, 1, 'Yunita', '2025-07-31 11:02:47', '2025-07-31 11:02:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `role`, `foto`, `email`, `email_verified_at`, `username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Yunita', 'admin', 'default.jpg', 'yunita@gmail.com', NULL, 'yunita', '$2y$10$2IkMZh.EqGPUXYUFclrlhenHUMnA298HoGTJDkT.8YEqx4IYgvKhC', 'tdNPclSELQjI7eAzeMtEaTptj9FKiXKCICEazEWl7Y4OusTrnnN3VPXkmSCr', '2024-08-08 04:25:43', '2024-08-08 04:25:43'),
(2, 'Faisal', 'admin', 'default.jpg', 'ahmadfaisal@gmail.com', NULL, 'Faisa', '$2y$10$1B4pd7VjrZWGlGtoopgFiu3BMoLqHaG.1wtotr.U6iOoMLUL9JuCy', '3lx1pHwECrGCY1sesVb1b0jVSJXhYOalZPs4gHWUloPKEcUzvJ9AjbU6qKxj', '2024-08-08 06:44:55', '2025-07-31 08:00:01'),
(3, 'kasir', 'kasir', 'default.jpg', 'kasir@gmail.com', NULL, 'kasir', '$2y$10$0U2EhOdPPl8IGstKt569sum/d2zZ/zgcqZxZ9LFrfMjn.fQ15H14C', 'DHK48E7jCXE9pw6VyOhlYkarmWG0ktnD1epYcuLOd4hkQgDg5EPtC1lPFcbB', '2024-08-08 06:50:57', '2024-08-08 06:50:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access`
--
ALTER TABLE `access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_movements`
--
ALTER TABLE `barang_movements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `markets`
--
ALTER TABLE `markets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pelanggans`
--
ALTER TABLE `pelanggans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplies`
--
ALTER TABLE `supplies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supply_systems`
--
ALTER TABLE `supply_systems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access`
--
ALTER TABLE `access`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `barang_movements`
--
ALTER TABLE `barang_movements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `markets`
--
ALTER TABLE `markets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelanggans`
--
ALTER TABLE `pelanggans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supplies`
--
ALTER TABLE `supplies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supply_systems`
--
ALTER TABLE `supply_systems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
