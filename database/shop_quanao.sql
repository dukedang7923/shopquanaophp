-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 05, 2024 lúc 02:01 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop_quanao`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Hoodie', '2024-11-11 11:50:15', '2024-11-14 15:07:28'),
(2, 'T-shirt', '2024-11-11 11:50:15', '2024-11-14 15:03:28'),
(3, 'Shorts', '2024-11-11 11:50:15', '2024-11-14 15:57:28'),
(4, 'Trousers', '2024-11-11 10:57:52', '2024-11-14 15:14:29'),
(51, 'Móc Khóa', '2024-11-20 17:57:31', '2024-11-20 17:57:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `collection`
--

CREATE TABLE `collection` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `collection`
--

INSERT INTO `collection` (`id`, `name`) VALUES
(1, 'Dragon Ball Z'),
(2, 'GAM ESPORTS'),
(3, 'Lil Wuyn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(200) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `fullname`, `phone_number`, `email`, `address`, `note`, `order_date`) VALUES
(172, 'haha', '0315487454', 'oakak@gmail.com', 'dấdsa', '', '2024-11-20 17:45:59'),
(173, 'haha', '0315487454', 'oakak@gmail.com', 'dấdsa', 'cdksaj;ld', '2024-11-20 17:56:55'),
(174, 'haha', '0315487454', 'oakak@gmail.com', 'dấdsa', '', '2024-11-21 04:29:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `id_user`, `num`, `price`, `status`) VALUES
(172, 163, 1, 1, 1, 720000, 'Đang chuẩn bị'),
(173, 164, 2, 1, 1, 699000, 'Đang chuẩn bị'),
(176, 165, 5, 1, 1, 699000, 'Đang chuẩn bị'),
(177, 166, 4, 1, 1, 648000, 'Đang chuẩn bị'),
(183, 172, 1, 111, 1, 720000, 'Đang chuẩn bị'),
(184, 173, 6, 111, 1, 450000, 'Đang chuẩn bị'),
(185, 174, 2, 1, 3, 699000, 'Đang chuẩn bị'),
(186, 174, 6, 1, 1, 450000, 'Đang chuẩn bị');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `number` float NOT NULL,
  `thumbnail` varchar(500) NOT NULL,
  `thumbnail_1` varchar(500) NOT NULL,
  `thumbnail_2` varchar(500) NOT NULL,
  `thumbnail_3` varchar(500) NOT NULL,
  `thumbnail_4` varchar(500) NOT NULL,
  `thumbnail_5` varchar(500) NOT NULL,
  `content` longtext NOT NULL,
  `id_category` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id_sanpham` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `title`, `price`, `number`, `thumbnail`, `thumbnail_1`, `thumbnail_2`, `thumbnail_3`, `thumbnail_4`, `thumbnail_5`, `content`, `id_category`, `created_at`, `updated_at`, `id_sanpham`) VALUES
(1, 'DC | DBZ Shenron Hoodie - Black', 720000, 10, 'uploads/Screenshot 2024-11-20 215528.png', 'uploads/Screenshot 2024-11-20 215627.png', 'uploads/Screenshot 2024-11-20 215644.png', 'uploads/Screenshot 2024-11-20 215700.png', 'uploads/Screenshot 2024-11-20 215721.png', 'uploads/Screenshot 2024-11-20 215741.png', 'Chi tiết sản phẩm:\r\n• Kích thước: M - L - XL\r\n• Chất liệu: Nỉ chân cua.\r\n• Relaxed Fit.\r\n• Nhãn thương hiệu trang trí ở sườn túi.\r\n• Hình in mặt trước áo áp dụng công nghệ in kéo lụa.\r\n• Nhãn trang trí BST DC|DBZ may ở nón áo.\r\n\r\nMẫu cao 1m75 nặng 65kg - mặc sản phẩm size L', 1, '2024-11-11 10:37:18', '2024-11-11 10:37:18', 1),
(2, 'DC | DBZ Goku SS Chibi Hoodie - Cream', 699000, 20, 'uploads/Screenshot 2024-11-20 220759.png', 'uploads/Screenshot 2024-11-20 220820.png', 'uploads/Screenshot 2024-11-20 220835.png', 'uploads/Screenshot 2024-11-20 220908.png', 'uploads/Screenshot 2024-11-20 220921.png', 'uploads/Screenshot 2024-11-20 220933.png', 'Chi tiết sản phẩm:\r\n• Kích thước: M - L - XL\r\n• Chất liệu: Nỉ chân cua.\r\n• Relaxed Fit.\r\n• Nhãn thương hiệu trang trí ở sườn túi.\r\n• Hình in mặt trước áo áp dụng công nghệ in kéo lụa.\r\n• Nhãn trang trí BST DC|DBZ may ở nón áo.\r\n\r\nMẫu cao 1m6 nặng 45kg - mặc sản phẩm size M', 1, '2024-11-11 15:11:49', '2024-11-11 15:11:49', 1),
(3, 'DC | DBZ Goku & Shenron T-Shirt - Cream', 420000, 20, 'uploads/Screenshot 2024-11-20 221121.png', 'uploads/Screenshot 2024-11-20 221141.png', 'uploads/Screenshot 2024-11-20 221156.png', 'uploads/Screenshot 2024-11-20 221206.png', 'uploads/Screenshot 2024-11-20 221217.png', 'uploads/Screenshot 2024-11-20 221227.png', 'Chi tiết sản phẩm:\r\n• Kích thước: XS - S - M - L - XL\r\n• Chất liệu: Cotton.\r\n• Relaxed Fit.\r\n• Nhãn thương hiệu trang trí ở sườn áo.\r\n• Artwork mặt trước và sau được áp dụng kỹ thuật in lụa.\r\n• Nhãn trang trí BST DC | DBZ may ở thân trước.', 2, '2024-11-11 17:31:22', '2024-11-11 17:31:22', 1),
(4, 'Áo Thun Football Jersey DC x GAM Worlds 2024 - Cream', 648000, 20, 'uploads/Screenshot 2024-11-20 233013.png', 'uploads/Screenshot 2024-11-20 233024.png', 'uploads/Screenshot 2024-11-20 233046.png', 'uploads/Screenshot 2024-11-20 233057.png', 'uploads/Screenshot 2024-11-20 233108.png', 'uploads/Screenshot 2024-11-20 233119.png', 'Chi tiết sản phẩm:\r\n\r\nThiết kế giới hạn dành riêng cho đội tuyển GAM eSports tại giải đấu WORLDS 2024.\r\n\r\n• Kích thước: M - L - XL\r\n• Chất liệu: Polyester.\r\n• Relaxed Fit.\r\n• Các logo tài trợ có hiệu ứng được sử dụng kĩ thuật in decal.\r\n• Toàn bộ artwork còn lại được sử dụng kĩ thuật in lụa.\r\n• Nhãn Jersey trang trí được may ở góc dưới thân trước.', 2, '2024-11-11 21:59:06', '2024-11-11 21:59:06', 2),
(6, 'DirtyCoins x LilWuyn Logo Shorts - Black', 450000, 10, 'uploads/p25.png', 'uploads/p26.png', 'uploads/p27.png', 'uploads/p28.png', 'uploads/p29.png', 'uploads/p30.png', 'Chất liệu vải sợi tổng hợp. Hình mặt trước quần và logo DirtyCoins áp dụng kĩ thuật in lụa, lưng thun, có túi hai bên. Túi quần sau có nắp kèm nút bấm. Logo DirtyCoins thêu trên túi.', 3, '2024-11-11 12:37:46', '2024-11-12 12:37:46', 3),
(7, 'DC x GAM VCS Football Jersey - Black', 490000, 20, 'uploads/Screenshot 2024-11-20 233325.png', 'uploads/Screenshot 2024-11-20 233337.png', 'uploads/Screenshot 2024-11-20 233353.png', 'uploads/Screenshot 2024-11-20 233410.png', 'uploads/Screenshot 2024-11-20 233419.png', 'uploads/Screenshot 2024-11-20 233429.png', 'Chi tiết sản phẩm:\r\n\r\nThiết kế dành riêng cho đội tuyển GAM eSports tại giải đấu VCS mùa hè 2024.\r\n\r\n• Kích thước: M - L - XL.\r\n• Chất liệu: Polyester.\r\n• Relaxed Fit.\r\n• Các logo tài trợ có hiệu ứng được sử dụng kĩ thuật in decal.\r\n• Toàn bộ artwork còn lại được sử dụng kĩ thuật in lụa.\r\n• Nhãn Jersey trang trí được may ở góc dưới thân trước.', 2, '2024-11-12 12:40:58', '2024-11-12 12:40:58', 2),
(8, 'DC x GAM MSI Football Jersey - Black', 450000, 20, 'uploads/Screenshot 2024-11-20 233608.png', 'uploads/Screenshot 2024-11-20 233628.png', 'uploads/Screenshot 2024-11-20 233638.png', 'uploads/Screenshot 2024-11-20 233647.png', 'uploads/Screenshot 2024-11-20 233657.png', 'uploads/Screenshot 2024-11-20 233707.png', 'Chi tiết sản phẩm:\r\n\r\nThiết kế giới hạn dành riêng cho đội tuyển GAM eSports tại giải đấu MSI 2024.\r\n\r\n• Kích thước: M - L - XL.\r\n• Chất liệu: Polyester.\r\n• Relaxed Fit.\r\n• Các logo tài trợ có hiệu ứng được sử dụng kĩ thuật in decal.\r\n• Toàn bộ artwork còn lại được sử dụng kĩ thuật in lụa.\r\n• Nhãn Jersey trang trí được may ở góc dưới thân trước.\r\n\r\n', 2, '2024-11-12 12:43:18', '2024-11-12 12:43:18', 2),
(11, 'DC | DBZ Vegeta T-Shirt - White', 620000, 10, 'uploads/Screenshot 2024-11-20 222608.png', 'uploads/Screenshot 2024-11-20 222621.png', 'uploads/Screenshot 2024-11-20 222632.png', 'uploads/Screenshot 2024-11-20 222642.png', 'uploads/Screenshot 2024-11-20 222656.png', 'uploads/Screenshot 2024-11-20 222705.png', 'Chi tiết sản phẩm:\r\n• Kích thước: XS - S - M - L - XL\r\n• Chất liệu: Cotton.\r\n• Relaxed Fit.\r\n• Nhãn thương hiệu trang trí ở sườn áo.\r\n• Artwork mặt trước và sau được áp dụng kỹ thuật in lụa.\r\n\r\nMẫu cao 1m6 nặng 45kg - mặc sản phẩm size S', 2, '2024-11-12 13:06:27', '2024-11-12 13:06:27', 1),
(13, 'DirtyCoins x LilWuyn Print L/S T-Shirt - Tan', 550000, 10, 'uploads/p19.png', 'uploads/p21.png', 'uploads/p22.png', 'uploads/p20.png', 'uploads/p23.png', 'uploads/p24.png', 'Chất liệu nỉ cotton. Hình in thân trước và tay áo áp dụng công nghệ in kéo lụa thủ công. Bo cổ tay và bo thân trùng với màu vải tay áo và thân áo tương ứng. Tag vải riêng của BST được may trên túi phía trước.', 1, '2024-11-13 21:07:54', '2024-11-13 21:07:54', 3),
(14, 'DirtyCoins x LilWuyn Basic T-Shirt - Silver Lining', 699000, 10, 'uploads/1.png', 'uploads/3.png', 'uploads/4.png', 'uploads/2.png', 'uploads/5.png', 'uploads/6.png', 'Chất liệu nỉ cotton. Hình in thân trước và tay áo áp dụng công nghệ in kéo lụa thủ công. Bo cổ tay và bo thân trùng với màu vải tay áo và thân áo tương ứng. Tag vải riêng của BST được may trên túi phía trước.', 2, '2024-11-07 08:44:17', '2024-11-13 08:44:17', 3),
(51, 'DC | DBZ Goku SS Keychain - Black', 9999, 100, 'uploads/Screenshot 2024-11-20 223101.png', 'uploads/Screenshot 2024-11-20 223114.png', 'uploads/Screenshot 2024-11-20 223150.png', 'uploads/Screenshot 2024-11-20 223204.png', 'uploads/Screenshot 2024-11-20 223215.png', 'uploads/Screenshot 2024-11-20 223412.png', 'Keychain', 52, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id_admin` int(11) NOT NULL,
  `tenadmin` varchar(100) NOT NULL,
  `tendangnhap` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `diachi` varchar(100) NOT NULL,
  `matkhau` varchar(100) NOT NULL,
  `dienthoai` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`id_admin`, `tenadmin`, `tendangnhap`, `email`, `diachi`, `matkhau`, `dienthoai`) VALUES
(1, 'Đặng Hoàng Đức', 'dukedang', 'danghoangduc23@gmail.com', 'HN', '1234', '0393160061');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_dangky`
--

CREATE TABLE `tbl_dangky` (
  `id_dangky` int(11) NOT NULL,
  `tenkhachhang` varchar(200) NOT NULL,
  `tendangnhap` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `diachi` varchar(200) NOT NULL,
  `matkhau` varchar(100) NOT NULL,
  `dienthoai` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_dangky`
--

INSERT INTO `tbl_dangky` (`id_dangky`, `tenkhachhang`, `tendangnhap`, `email`, `diachi`, `matkhau`, `dienthoai`) VALUES
(1, 'chuchu', 'chuchu', 'chuchu@gmail.com', 'hn', '1234', '3232323'),
(2, 'haha', 'haha', 'haha@gmail.com', 'hn', '1234', '3232323'),
(3, 'hehe', 'hehe', 'hehe@gmail.com', 'hn', '1234', '12345678');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `hoten` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(28) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id_user`, `hoten`, `username`, `password`, `phone`, `email`) VALUES
(2, 'hoho', 'hoho', 'hoho1', '0915465654', 'hoho1@gmail.com');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Chỉ mục cho bảng `tbl_dangky`
--
ALTER TABLE `tbl_dangky`
  ADD PRIMARY KEY (`id_dangky`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `collection`
--
ALTER TABLE `collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tbl_dangky`
--
ALTER TABLE `tbl_dangky`
  MODIFY `id_dangky` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
