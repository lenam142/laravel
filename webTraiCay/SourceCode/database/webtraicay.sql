-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 12, 2023 lúc 10:34 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webtraicay`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `pty` int(11) DEFAULT 0,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `product_id`, `pty`, `price`, `created_at`, `updated_at`) VALUES
(15, 1, 10, 2, 46000, NULL, NULL),
(16, 1, 9, 4, 72000, NULL, NULL),
(17, 1, 10, 2, 46000, NULL, NULL),
(18, 1, 9, 11, 198000, NULL, NULL),
(19, 1, 10, 10, 230000, NULL, NULL),
(20, 1, 5, 3, 57000, NULL, NULL),
(21, 1, 9, 2, 36000, NULL, NULL),
(22, 3, 6, 1, 21000, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `address`, `email`, `content`, `created_at`, `updated_at`) VALUES
(1, 'lenam', '0985590120', 'binhthanh', 'lenam@gmail.com', 'iuyt', NULL, '2023-11-07 01:03:58'),
(2, 'lenam', '0985590120', 'binhthanh', 'lenam102@gmail.com', 'regrytr5', '2023-11-07 00:34:07', '2023-11-07 00:35:08'),
(3, 'lenam', '0985590120', 'binhthanh', 'nam@gmail.com', 'qưe', '2023-11-12 02:28:52', '2023-11-12 02:28:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menus`
--

CREATE TABLE `menus` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `content` longtext NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `name`, `parent_id`, `description`, `content`, `slug`, `active`, `created_at`, `updated_at`) VALUES
(3, 'Trái cây ngoại nhập', 0, 'Đắt', 'không có gì cả', NULL, 1, '2023-11-01 00:24:14', '2023-11-01 00:24:14'),
(4, 'Trái cây nội nhập', 0, 'Hàng Viết Nam', 'không có', NULL, 1, '2023-11-01 00:24:44', '2023-11-01 08:31:15'),
(6, 'mâm quả', 0, 'không có', 'không có', NULL, 1, '2023-11-01 00:25:34', '2023-11-01 00:25:34'),
(10, 'miền nam', 0, 'không có', 'không có', NULL, 1, '2023-11-06 20:52:50', '2023-11-06 20:52:50'),
(11, 'quả', 10, 'khongo có', '', NULL, 1, '2023-11-06 20:53:13', '2023-11-06 20:53:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(10, '2019_08_19_000000_create_failed_jobs_table', 1),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(12, '2023_10_26_043342_create_menus_table', 1),
(13, '2023_10_26_162825_create_products_table', 1),
(14, '2023_10_26_163650_update_table_product', 1),
(16, '2014_10_12_200000_add_two_factor_columns_to_users_table', 3),
(17, '2023_11_03_132350_create_sessions_table', 4),
(18, '2023_11_03_135623_create_users_table', 4),
(19, '2023_11_01_055715_create_customers_table', 5),
(20, '2023_11_01_070426_create_carts_table', 5),
(21, '2023_11_07_045443_create_jobs_table', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `content` longtext NOT NULL,
  `menu_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `price_sale` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `thumb` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `content`, `menu_id`, `price`, `price_sale`, `active`, `created_at`, `updated_at`, `thumb`) VALUES
(1, 'Nho mẫu đơn', 'Nho mẫu đơn', 'Nho mẫu đơn', 3, 18000, 16000, 1, '2023-11-01 00:28:06', '2023-11-01 00:28:06', '/storage/uploads/2023/11/01/Nho Mau Don__Han Quoc.jpg'),
(2, 'Nho mẫu đơn', 'Nho mẫu đơn', 'Nho thường có vị ngọt, một chút chua và có hương thơm đặc trưng. Chúng được sử dụng rộng rãi trong chế biến thực phẩm, như làm nước ép, sản xuất rượu vang, làm mứt hoặc được ăn tươi trực tiếp. Ngoài ra, nho cũng có chứa nhiều chất chống oxy hóa và các dưỡng chất có lợi cho sức khỏe, như vitamin C, kali và chất chống vi khuẩn.', 3, 18000, 16000, 1, '2023-11-01 00:28:31', '2023-11-01 00:28:31', '/storage/uploads/2023/11/01/Nho Mau Don__Han Quoc.jpg'),
(3, 'Kiwi Vàng', 'Kiwi Vàng', 'vỏ mỏng và mịn, màu vàng sáng hoặc vàng cam, khác biệt so với kiwi truyền thống có vỏ nâu. Thịt bên trong của Kiwi Vàng mềm mịn, màu vàng và chứa nhiều hạt nhỏ màu đen. Vị của Kiwi Vàng ngọt hơn so với kiwi xanh (green kiwi) và có hương thơm đặc trưng.', 3, 18000, 17000, 1, '2023-11-01 00:29:03', '2023-11-01 00:29:03', '/storage/uploads/2023/11/01/KIWI vang.jpg'),
(4, 'Lê Nam Phi', 'Lê Nam Phi', 'một loại lê có nguồn gốc từ Nam Phi. Nó có hình dạng tròn hoặc hơi hình xoài, với vỏ mỏng và màu xanh hoặc vàng. Thịt của lê Nam Phi mềm, ngọt và có mùi thơm đặc trưng.', 3, 20000, 18000, 1, '2023-11-01 08:28:56', '2023-11-01 08:28:56', '/storage/uploads/2023/11/01/Le Nam Phi.jpg'),
(5, 'Kiwi Xanh', 'Kiwi Xanh', 'Kiwi xanh có vỏ mỏng, lõm và có màu nâu. Bên trong, thịt của kiwi xanh màu xanh sáng, mềm mịn và chứa nhiều hạt nhỏ màu đen. Vị của kiwi xanh ngọt chua và có hương thơm đặc trưng. Nó là một nguồn tuyệt vời của vitamin C, chất xơ và chất chống oxy hóa, giúp cung cấp dinh dưỡng và hỗ trợ sức khỏe.', 3, 20000, 19000, 1, '2023-11-01 08:29:27', '2023-11-01 08:29:27', '/storage/uploads/2023/11/01/KIWI xanh.jpg'),
(6, 'Táo Xanh', 'Táo Xanh', 'vỏ mỏng, cứng và màu xanh sáng hoặc xanh lá cây. Thịt của táo xanh thường là trắng, giòn và có vị chua đặc trưng. Táo xanh có hương vị tươi mát và có độ giòn cao hơn so với nhiều loại táo khác.', 3, 23000, 21000, 1, '2023-11-01 08:30:28', '2023-11-01 08:30:28', '/storage/uploads/2023/11/01/Tao xanh.jpg'),
(7, 'Bưởi da xanh', 'Bưởi da xanh', 'vỏ dày, có màu vàng xanh hoặc xanh lá cây. Vỏ bưởi da xanh thường khá dày và có thể khó bóc. Bên trong, thịt của bưởi da xanh màu trắng hoặc hồng nhạt, phân chia thành các múi dễ tách rời nhau. Thịt bưởi da xanh có vị ngọt, mát và hơi chua, với hương thơm đặc trưng.', 4, 30000, 25000, 1, '2023-11-01 08:31:02', '2023-11-01 08:31:02', '/storage/uploads/2023/11/01/Buoi Da Xanh.jpg'),
(8, 'Chuối', 'Chuối', 'vỏ mỏng, dễ bóc và màu vàng hoặc xanh (trước khi chín). Bên trong, thịt của chuối mềm, mịn và có màu trắng hoặc vàng tùy vào loại chuối. Chuối có hạt nhỏ màu đen ở giữa. Vị của chuối thường là ngọt, có một chút chua và có hương thơm đặc trưng.', 4, 23000, 20000, 1, '2023-11-01 08:31:58', '2023-11-01 08:31:58', '/storage/uploads/2023/11/01/chuoi.jpg'),
(9, 'Bòn Bon', 'Bòn Bon', 'một món ăn trái cây ngọt ngào và thường được sử dụng trong các dịp lễ hội, tiệc tùng hoặc làm quà tặng. Chúng có sẵn trong các cửa hàng kẹo, cửa hàng socola và các cửa hàng đồ ngọt khác. Việc chọn bon bon thường dựa trên sở thích cá nhân và loại hương vị mong muốn.', 3, 20000, 18000, 1, '2023-11-01 08:32:28', '2023-11-01 08:32:28', '/storage/uploads/2023/11/01/bon bon.jpg'),
(10, 'mâm quả', 'mâm quả', 'Thịt của mận có màu vàng hoặc đỏ, mềm mịn và mọng nước. Mận có vị ngọt, một chút chua và có hương thơm đặc trưng. Trái mận có hạt ở bên trong, thường là một hoặc hai hạt lớn.', 6, 25000, 23000, 1, '2023-11-01 08:34:04', '2023-11-01 08:34:04', '/storage/uploads/2023/11/01/Mam Qua.jpg'),
(13, 'quả mận', 'không có', 'không có', 11, 20000, 0, 1, '2023-11-06 20:55:06', '2023-11-06 20:55:06', '/storage/uploads/2023/11/07/ba_thang_ngoc.jpg'),
(14, 'sa che', 'grdfewsa', 'jhgfds', 4, 11000, 14000, 1, '2023-11-07 00:48:56', '2023-11-07 00:48:56', '/storage/uploads/2023/11/07/20210604_RGFkOmxRF6Emt7SXpoGBDyZO.webp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5kO3BdJ8JwMSF57NvGzvujH4vHxQpcMfIokjmwFE', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaFg5OTZIb041S0ZCSWVlYTVJQmxZZVZJdlkweVZoZUlyZWRGSW43NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NToiY2FydHMiO2E6MTp7aTo5O2k6Mzt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1699322167),
('cR8KMcnPEWhFRLOWMiUVWW4eYnqOIdzSdLgNWgde', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoid2tZOFRDTUtKS0NKQnRBTUJPZHFHdkwzM0RPcXNtMjB0ZjdDdHlsayI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wcm9kdWN0cy9saXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1699325585),
('QEt043omlQKvHtaKVDxgy30FvXHajy4ThhHRPB2d', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoibFN1UVNuRjhjUmM4T2tESmQyYURIMjFPRVFmWHJlNnpyME40eVdsbiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jYXJ0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo1OiJjYXJ0cyI7YTozOntpOjI7czoxOiI3IjtpOjk7czoxOiIzIjtpOjU7aToxO319', 1699332744);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phanquyen` varchar(255) NOT NULL DEFAULT 'khach',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phanquyen`, `email_verified_at`, `password`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'lenam', 'nam@gmail.com', 'khach', NULL, '$2y$10$/KU7U0/4TsElcl76ldx2Ou.xrDEutXBsksgYcJZ2UfwxSbOzQdL5q', NULL, NULL, NULL, NULL, NULL),
(2, '', 'admin@gmail.com', 'admin', NULL, '$2y$10$/KU7U0/4TsElcl76ldx2Ou.xrDEutXBsksgYcJZ2UfwxSbOzQdL5q', NULL, NULL, NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_customer_id_foreign` (`customer_id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
