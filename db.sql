-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 02, 2022 at 10:14 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vuhoainam`
--

-- --------------------------------------------------------

--
-- Table structure for table `db_baiviet`
--

CREATE TABLE `db_baiviet` (
  `Id_baiviet` int(11) UNSIGNED NOT NULL COMMENT 'Mã bài viết',
  `Id_chude` int(11) UNSIGNED DEFAULT NULL,
  `title` varchar(1000) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tiêu đề bài viết',
  `slug` varchar(1000) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Slug tiêu đề',
  `detail` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Chi tiết bài viết',
  `img` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Hình ảnh',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'post' COMMENT 'Kiểu bài viết',
  `metakey` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Từ khóa SEO',
  `metadesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mô tả SEO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày tạo',
  `created_by` tinyint(4) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Người tạo',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày sửa',
  `updated_by` tinyint(4) UNSIGNED DEFAULT '1' COMMENT 'Người sửa',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT '2' COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_baiviet`
--

INSERT INTO `db_baiviet` (`Id_baiviet`, `Id_chude`, `title`, `slug`, `detail`, `img`, `type`, `metakey`, `metadesc`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 0, 'Giới thiệu', 'gioi-thieu', '<h5>Về chúng tôi</h5><br>\r\nHN Store là một nền tảng thương mại điện tử thời trang nhanh B2C quốc tế. Công ty chủ yếu tập trung vào trang phục của phụ nữ, nhưng cũng cung cấp quần áo nam, quần áo trẻ em, phụ kiện, giày dép, túi xách và các mặt hàng thời trang khác. HN Store chủ yếu nhắm vào Châu Âu, Châu Mỹ, Úc và Trung Đông cùng với các thị trường tiêu dùng khác.<br>\r\n<br>\r\n<h5>Sứ mệnh của chúng tôi</h5><br>\r\nHN Store tự hào cung cấp các phong cách theo xu hướng phục vụ cho cả nữ trẻ và thanh thiếu niên. HN Store tuân thủ quan điểm \"mọi người đều có thể tận hưởng vẻ đẹp của thời trang\". HN Store có thể đứng đầu trong các xu hướng thời trang mới nhất từ khắp nơi trên thế giới đồng thời nhanh chóng đưa các kiểu dáng này ra thị trường. Vì vậy, cho dù bạn đang tìm kiếm những chiếc đầm boho và áo thun họa tiết hay áo sơ mi sang trọng và đồ bơi, HN Store là cửa hàng lý tưởng cho các tín đồ thời trang hiện đại nhưng tiết kiệm. Nhằm mục đích cung cấp các sản phẩm chất lượng cao và thời trang với giá hấp dẫn cho mọi người dùng trên thế giới.<br>\r\n<br>\r\n<h5>Tìm thấy Chúng tôi</h5><br>\r\nHN Store hiện vận chuyển đến hơn 220 quốc gia và khu vực trên toàn thế giới. Các trang web Hoa Kỳ, Tây Ban Nha, Pháp, Nga, Đức, Ý, Úc và Trung Đông, HN Store vận chuyển từ một trong nhiều kho hàng có vị trí toàn cầu. HN Store tiếp tục phát triển mạnh vì có nhân viên sản xuất xuất sắc và cùng giá trị của chúng tôi. HN Store nhằm mục đích cung cấp các sản phẩm hợp thời trang có giá trị cao nhất đồng thời được chất lượng, giá trị và dịch vụ.<br>\r\n', 'tin-tuc.jpg', 'page', 'Từ khóa SEO', 'Mô tả SEO', '2020-06-30 15:20:53', 1, '2022-06-04 02:55:02', 1, 1),
(2, 0, 'Chính sách vận chuyển', 'chinh-sach-van-chuyen', 'Khi mua hàng tại HN Store, quý khách có thể lựa chọn một trong các hình thức vận chuyển, giao nhận sau:<br>\r\n\r\n-HN Store trực tiếp vận chuyển và giao hàng tận tay khách hàng.<br>\r\n-HN Store giao hàng cho khách hàng thông qua các nhà cung cấp dịch vụ chuyển phát.', 'tin-tuc.jpg', 'page', 'Từ khóa SEO', 'Mô tả SEO', '2020-06-30 15:20:53', 1, '2020-06-30 15:20:53', 1, 1),
(3, 0, 'Chính sách đổi trả', 'chinh-sach-doi-tra', '-Khách hàng cần đổi hàng trong vòng 30 ngày làm việc tính từ thời điểm quý khách nhận hàng. <br>\r\n-Sản phẩm đổi trả cần nguyên vẹn nhãn mác, hộp, bao bì gốc của sản phẩm như khi Quý khách nhận hàng lúc đầu. <br>\r\n-Chỉ đổi sang các sản phẩm bằng hoặc cao hơn giá. <br>\r\n-Không áp dụng trả hàng với các trường hợp không thích, không dùng đến…<br>\r\n-Chỉ trả hàng khi có lỗi của nhà sản xuất không thể khắc phục hoặc giao nhầm, giao sai hàng đặt ban đầu', 'tin-tuc.jpg', 'page', 'Từ khóa SEO', 'Mô tả SEO', '2020-06-30 15:20:53', 1, '2020-06-30 15:20:53', 1, 1),
(4, 0, 'Cách thanh toán', 'cach-thanh-toan', 'Thanh toán bằng Credit card.<br> Thanh toán bằng ví điện tử.<br> Thanh toán bằng cổng thanh toán.<br> Thanh toán bằng smartphone.', 'tin-tuc.jpg', 'page', 'Từ khóa SEO', 'Mô tả SEO', '2020-06-30 15:20:53', 1, '2020-06-30 15:20:53', 1, 1),
(5, 1, 'Tin tức 1', 'tin-tuc-1', 'Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2022-09-25 00:59:06', 1, 1),
(6, 1, 'Tin tức 2', 'tin-tuc-2', 'Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2022-09-25 00:59:08', 1, 1),
(7, 1, 'Tin tức 3', 'tin-tuc-3', 'Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2022-09-25 00:59:08', 1, 1),
(9, 1, 'Tin tức 5', 'tin-tuc-5', 'Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2020-07-03 02:12:37', 1, 1),
(10, 1, 'Tin tức 6', 'tin-tuc-6', 'Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2020-07-03 02:12:37', 1, 1),
(11, 1, 'Tin tức 7', 'tin-tuc-7', 'Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2020-07-03 02:12:37', 1, 1),
(12, 1, 'Tin tức 8', 'tin-tuc-8', 'Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2020-07-03 02:12:37', 1, 1),
(13, 1, 'Tin tức 9', 'tin-tuc-9', 'Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2020-07-03 02:12:37', 1, 1),
(14, 1, 'Tin tức 10', 'tin-tuc-10', 'Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2020-07-03 02:12:37', 1, 1),
(15, 1, 'Tin tức 11', 'tin-tuc-11', 'Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2020-07-03 02:12:37', 1, 1),
(16, 1, 'Tin tức 12', 'tin-tuc-12', 'Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2020-07-03 02:12:37', 1, 1),
(17, 1, 'Tin tức 13', 'tin-tuc-13', 'Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2020-07-03 02:12:37', 1, 1),
(18, 1, 'Tin tức 14', 'tin-tuc-14', 'Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2020-07-03 02:12:37', 1, 1),
(19, 1, 'Tin tức 15', 'tin-tuc-15', 'Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2020-07-03 02:12:37', 1, 1),
(20, 1, 'Tin tức 16', 'tin-tuc-16', 'Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2022-06-04 02:52:34', 1, 2),
(21, 2, 'Dịch vụ-7', 'dich-vu-7', 'Chi tiết bài viết ', 'dich-vu-08.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2020-07-03 02:12:37', 1, 1),
(22, 2, 'Dịch vụ-8', 'dich-vu-8', 'Chi tiết bài viết ', 'dich-vu-08.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2020-07-03 02:12:37', 1, 1),
(23, 2, 'Dịch vụ-9', 'dich-vu-9', 'Chi tiết bài viết ', 'dich-vu-09.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2020-07-03 02:12:37', 1, 1),
(24, 2, 'Dịch vụ-10', 'dich-vu-10', 'fdddddf', 'dich-vu-10.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:12:37', 1, '2020-07-25 00:14:19', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_binhluan`
--

CREATE TABLE `db_binhluan` (
  `Id_bl` int(11) NOT NULL,
  `Id_sp` int(11) NOT NULL,
  `Ho_ten` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Ngay_gio` datetime NOT NULL,
  `Noi_dung` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Dien_thoai` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_chitiet_donhang`
--

CREATE TABLE `db_chitiet_donhang` (
  `Id_ct_hd` int(11) NOT NULL,
  `Id_hd` int(11) NOT NULL,
  `Id_sp` int(11) NOT NULL,
  `So_luong_mua` int(5) NOT NULL,
  `Don_gia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_chude`
--

CREATE TABLE `db_chude` (
  `Id_chude` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên chủ đề',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Slug tên chủ đề',
  `parentid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Mã cấp cha',
  `orders` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Sắp xếp',
  `metakey` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Từ khóa SEO',
  `metadesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mô tả SEO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày tạo',
  `created_by` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Người tạo',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày sửa',
  `updated_by` tinyint(3) UNSIGNED DEFAULT '1' COMMENT 'Người sửa',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_chude`
--

INSERT INTO `db_chude` (`Id_chude`, `name`, `slug`, `parentid`, `orders`, `metakey`, `metadesc`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(0, 'Giới thiệu', 'gioi-thieu', 0, 0, 'Từ khóa SEO', 'Mô tả SEO', '2022-04-05 19:13:50', 1, '2022-05-21 23:55:51', 1, 1),
(1, 'Tin tức', 'tin-tuc', 0, 1, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:14:39', 1, '2020-07-03 02:14:39', 1, 1),
(2, 'Dịch vụ', 'dich-vu', 0, 2, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:14:39', 1, '2020-07-03 02:14:39', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_danhmuc`
--

CREATE TABLE `db_danhmuc` (
  `Id_dm` int(11) NOT NULL,
  `Ten_danhmuc` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_danhmuc`
--

INSERT INTO `db_danhmuc` (`Id_dm`, `Ten_danhmuc`) VALUES
(1, 'Điện thoại'),
(2, 'Laptop'),
(3, 'Máy nghe nhạc'),
(4, 'Máy tính bảng'),
(5, 'Sạc dự phòng'),
(6, 'Phụ kiện');

-- --------------------------------------------------------

--
-- Table structure for table `db_donhang_dh`
--

CREATE TABLE `db_donhang_dh` (
  `Id_hd` int(11) NOT NULL,
  `Id_user` int(11) NOT NULL,
  `Id_tinh_trang` int(3) NOT NULL,
  `Id_nvgh` int(11) NOT NULL,
  `Ngay_lap` datetime NOT NULL,
  `Tong_gia` int(11) NOT NULL,
  `Noi_nhan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Ghi_chu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Ma_donhang` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Ngay_xuat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Ten_nguoi_nhan` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Sdt_nguoi_nhan` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `Email_nguoi_nhan` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `Ngay_cap_nhat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Nguoi_cap_nhat` tinyint(3) UNSIGNED DEFAULT NULL,
  `Trang_thai` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_giohang`
--

CREATE TABLE `db_giohang` (
  `Id_sp` int(11) NOT NULL COMMENT 'id san phẩm',
  `Id_km` int(11) NOT NULL COMMENT 'id khuyến mãi',
  `Id_dm` int(11) NOT NULL COMMENT 'id danh mục',
  `Ten_sp` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'tên đt',
  `Anh_sp` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ảnh đt',
  `Gia_sp` int(12) NOT NULL COMMENT 'giá',
  `So_luong` int(5) NOT NULL COMMENT 'số lượng',
  `Kich_thuoc` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'kích thức',
  `Trong_luong` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'trọng lượng',
  `Mau_sac` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'màu sắc',
  `Am_thanh` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'âm thanh',
  `Bo_nho` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'bộ nhớ',
  `He_dieu_hanh` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'hệ điều hành',
  `The_nho` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'thẻ nhớ',
  `Camera` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'camera',
  `Pin` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'loại pin, số giờ hoạt động',
  `Bao_hanh` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'thời gian bảo hành',
  `Ket_noi` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'kết nối vs các thiết bị khác',
  `Gia_km` int(11) NOT NULL COMMENT 'giá khuyến mãi',
  `Batdau_km` datetime NOT NULL COMMENT 'ngày bắt đầu khuyến mãi',
  `Ketthuc_km` datetime NOT NULL COMMENT 'ngày kết thúc khuyến mãi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_menu`
--

CREATE TABLE `db_menu` (
  `Id_menu` int(11) NOT NULL COMMENT 'Mã Menu',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên Menu',
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Liên kết',
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kiểu Menu',
  `tableid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Mã trong bảng',
  `orders` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Thứ tự',
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Vị trí',
  `parentid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Mã cấp cha',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày Tạo',
  `created_by` tinyint(4) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Người tạo',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày sửa',
  `updated_by` tinyint(4) UNSIGNED DEFAULT '1' COMMENT 'Người sửa',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_menu`
--

INSERT INTO `db_menu` (`Id_menu`, `name`, `link`, `type`, `tableid`, `orders`, `position`, `parentid`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Trang chủ', 'index.php?option=login/index', 'custom', 1, 0, 'mainmenu', 0, '2020-06-30 15:36:22', 1, '2022-05-20 09:41:01', 1, 1),
(2, 'Giới thiệu', 'index.php?option=page&cat=gioi-thieu', 'page', 2, 0, 'mainmenu', 0, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(3, 'Sản phẩm', 'index.php?option=product', 'custom', 1, 0, 'mainmenu', 0, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(4, 'Điện thoại', 'index.php?option=product&cat=dien-thoai', 'category', 2, 0, 'mainmenu', 3, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(5, 'Laptop', 'index.php?option=product&cat=laptop', 'category', 2, 0, 'mainmenu', 3, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(6, 'Máy tính bản', 'index.php?option=product&cat=may-tinh-bang', 'category', 4, 0, 'mainmenu', 3, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(7, 'Sạc dự phòng', 'index.php?option=product&cat=sac-du-phong', 'category', 5, 0, 'mainmenu', 3, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(8, 'Tin khuyễn mãi', 'index.php?option=post&cat=tin-khuyen-mai', 'topic', 1, 0, 'mainmenu', 0, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(9, 'Liên hệ', 'index.php?option=contact/contact', 'custom', 1, 0, 'mainmenu', 0, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(10, 'Máy nghe nhạc', 'index.php?option=product&cat=may-nghe-nhac', 'category', 3, 0, 'mainmenu', 3, '2020-06-30 15:36:22', 1, '2022-05-20 09:19:36', 1, 1),
(11, 'Phụ kiện', 'index.php?option=product&cat=phu-kien', 'category', 2, 0, 'mainmenu', 3, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(12, 'Tất cả sản phẩm', 'index.php?option=product/product', 'category', 2, 0, 'mainmenu', 3, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_nhanvien_giaohang`
--

CREATE TABLE `db_nhanvien_giaohang` (
  `Id_nvgh` int(11) NOT NULL,
  `Ten_nvgh` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Sdt_1` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `Sdt_2` varchar(11) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_sanpham`
--

CREATE TABLE `db_sanpham` (
  `Id_sp` int(11) NOT NULL COMMENT 'id san phẩm',
  `Id_thuonghieu` int(11) NOT NULL,
  `Id_km` int(11) NOT NULL COMMENT 'id khuyến mãi',
  `Id_dm` int(11) NOT NULL COMMENT 'id danh mục',
  `Ten_sp` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'tên đt',
  `Anh_sp` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ảnh đt',
  `Gia_sp` float(12,2) NOT NULL COMMENT 'giá',
  `So_luong` smallint(5) UNSIGNED NOT NULL COMMENT 'số lượng',
  `Kich_thuoc` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'kích thức',
  `Trong_luong` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'trọng lượng',
  `Mau_sac` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'màu sắc',
  `Am_thanh` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'âm thanh',
  `Bo_nho` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'bộ nhớ',
  `He_dieu_hanh` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'hệ điều hành',
  `The_nho` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'thẻ nhớ',
  `Camera` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'camera',
  `Pin` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'loại pin, số giờ hoạt động',
  `Bao_hanh` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'thời gian bảo hành',
  `Ket_noi` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'kết nối vs các thiết bị khác',
  `Gia_km` int(11) NOT NULL COMMENT 'giá khuyến mãi',
  `Batdau_km` datetime NOT NULL COMMENT 'ngày bắt đầu khuyến mãi',
  `Ketthuc_km` datetime NOT NULL COMMENT 'ngày kết thúc khuyến mãi',
  `slug` varchar(1000) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Slug tên sản phẩm',
  `Tu_khoa_SEO` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Mo_ta_SEO` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Ngay_tao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Nguoi_tao` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `Ngay_sửa` timestamp NULL DEFAULT NULL,
  `Người_sửa` tinyint(3) UNSIGNED DEFAULT NULL,
  `Trang_thai` tinyint(3) UNSIGNED NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_sanpham`
--

INSERT INTO `db_sanpham` (`Id_sp`, `Id_thuonghieu`, `Id_km`, `Id_dm`, `Ten_sp`, `Anh_sp`, `Gia_sp`, `So_luong`, `Kich_thuoc`, `Trong_luong`, `Mau_sac`, `Am_thanh`, `Bo_nho`, `He_dieu_hanh`, `The_nho`, `Camera`, `Pin`, `Bao_hanh`, `Ket_noi`, `Gia_km`, `Batdau_km`, `Ketthuc_km`, `slug`, `Tu_khoa_SEO`, `Mo_ta_SEO`, `Ngay_tao`, `Nguoi_tao`, `Ngay_sửa`, `Người_sửa`, `Trang_thai`) VALUES
(1, 1, 1, 1, 'redme note 7', NULL, 259000.00, 1, '2422x23325', '435g', 'Đỏ', 'Vibration: MP3, WAV ringtones', 'Bộ nhớ trong 65g, ram 4g', 'Android', '32g', '200 MP', 'Li-ion 5500mAh', '12 tháng', 'WIFI, 3G, BLUETOOTH', 500, '2022-07-03 00:00:00', '2022-12-03 00:00:00', 'redme-note-7', 'redme note 7', 'redme note 7', '2020-07-03 02:06:19', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_slider`
--

CREATE TABLE `db_slider` (
  `Id_slider` int(11) UNSIGNED NOT NULL COMMENT 'Mã Slider',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên Slider',
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Liên kết',
  `position` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Vị trí',
  `img` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Hình ảnh',
  `orders` int(10) UNSIGNED NOT NULL COMMENT 'Thứ tự',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày tạo',
  `created_by` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Người tạo',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày sửa',
  `updated_by` tinyint(3) UNSIGNED DEFAULT '1' COMMENT 'Người sửa',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_slider`
--

INSERT INTO `db_slider` (`Id_slider`, `name`, `link`, `position`, `img`, `orders`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Khuyễn mãi hè 2020', 'http://domain.com/index.php?option=page&cat=khuyen-mai-he', 'slideshow', 'slider_1.jpg', 1, '2020-07-01 00:12:13', 1, '2022-06-04 09:56:16', 1, 1),
(2, 'Khuyễn mãi mùa khai giảng', 'http://domain.com/index.php?option=page&cat=khuyen-mai-mua-khai-giang', 'slideshow', 'slider_2.jpg', 1, '2020-07-01 00:12:13', 1, '2022-05-20 06:50:49', 1, 1),
(3, 'Khuyễn mãi giáng sinh', 'http://domain.com/index.php?option=page&cat=khuyen-giang-sinh', 'slideshow', 'slider_3.jpg', 1, '2020-07-01 00:12:13', 1, '2020-07-01 00:12:13', 1, 1),
(4, 'Khuyễn mãi Covid', 'http://domain.com/index.php?option=page&cat=khuyen-mai-covid', 'slideshow', 'slider_4.jpg', 1, '2020-07-01 00:12:13', 1, '2022-05-20 07:04:38', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_sp_ban`
--

CREATE TABLE `db_sp_ban` (
  `Id_sp_ban` int(11) NOT NULL,
  `Id_sp` int(11) NOT NULL,
  `So_luong_ban` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_thuonghieu`
--

CREATE TABLE `db_thuonghieu` (
  `Id_thuonghieu` int(11) NOT NULL COMMENT 'Mã Loại',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên loại SP',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'SLug Loại SP',
  `parentid` int(11) UNSIGNED DEFAULT '0' COMMENT 'Mã cấp cha',
  `orders` int(11) DEFAULT NULL COMMENT 'Thứ tự',
  `metakey` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Từ khóa SEO',
  `metadesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mô tả SEO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày tạo',
  `created_by` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Người tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày sửa',
  `updated_by` tinyint(4) UNSIGNED DEFAULT NULL COMMENT 'Người sửa',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT '2' COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_thuonghieu`
--

INSERT INTO `db_thuonghieu` (`Id_thuonghieu`, `name`, `slug`, `parentid`, `orders`, `metakey`, `metadesc`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Điện thoại', 'dien-thoai', 0, 1, 'Thời trang nam', 'Thời trang nam', '2020-07-03 02:06:19', 1, '2022-04-05 00:14:14', 1, 1),
(2, 'Laptop', 'laptop', 0, 2, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2022-04-05 03:20:31', 1, 1),
(3, 'Máy nghe nhạc', 'may-nghe-nhac', 0, 3, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2022-05-20 00:55:33', 1, 1),
(4, 'Máy tính bảng', 'may-tinh-bang', 0, 4, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(5, 'Sạc dự phòng', 'sac-du-phong', 0, 5, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(6, 'Phụ kiện', 'phu-kien', 0, 6, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2022-05-20 00:59:04', 1, 1),
(7, 'Samsung', 'ao-thun-nam', 1, 1, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(8, 'iPhone', 'iphone', 1, 2, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(9, 'Oppo', 'oppo', 1, 3, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(10, 'Xiaomi', 'xiaomi', 1, 4, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(11, 'Vivo', 'vivo', 1, 5, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(12, 'Nokia', 'nokia', 1, 6, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(13, 'Realme', 'realme', 1, 6, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(14, 'Asus', 'asus', 2, 1, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(15, 'Acer', 'acer', 2, 2, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(16, 'Dell', 'dell', 2, 3, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(17, 'HP', 'hp', 2, 4, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2022-04-05 03:20:52', 1, 1),
(18, 'MSI', 'msi', 2, 5, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(19, 'Lenovo', 'lenovo', 2, 6, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(20, 'LG', 'lg', 2, 6, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(21, 'Apple', 'apple', 2, 6, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(22, 'Sony', 'sony', 3, 1, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(23, 'Fiio', 'fiio', 3, 2, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(24, 'Astell&Kern', 'astell&Kern', 3, 3, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(25, 'Ibasso ', 'ibasso ', 3, 4, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(26, 'Cowon ', 'cowon ', 3, 5, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(27, 'Ipod ', 'ipod', 3, 6, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(28, 'Phụ kiện đện thoại', 'phu-kien-dien-thoai', 3, 6, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(29, 'iPad ', 'ipad', 4, 1, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(30, 'Apple', 'apple', 4, 2, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(31, 'Samsung', 'samsung', 4, 3, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(32, 'Sony', 'sony', 4, 4, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(33, 'Anker', 'anker', 5, 1, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(34, 'Xiaomi', 'xiaomi', 5, 2, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(35, 'Energizer', 'energizer', 5, 3, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(36, 'Xmobile', 'xmobile', 5, 4, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1),
(37, 'Samsung', 'samsung', 5, 5, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 02:06:19', 1, '2020-07-03 02:06:19', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_tinh_trang`
--

CREATE TABLE `db_tinh_trang` (
  `Id_tinh_trang` int(11) NOT NULL,
  `Tinh_trang` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_user`
--

CREATE TABLE `db_user` (
  `Id_user` int(11) NOT NULL,
  `fullname` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Họ và tên',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên đăng nhâp',
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mật khẩu',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Email',
  `gender` tinyint(3) UNSIGNED NOT NULL COMMENT 'Giới tính',
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Điện thoại',
  `img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Hình',
  `roles` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quyền truy cập',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày tạo',
  `created_by` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Người tạo',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày sửa',
  `updated_by` tinyint(3) UNSIGNED DEFAULT '1' COMMENT 'Người sửa',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_user`
--

INSERT INTO `db_user` (`Id_user`, `fullname`, `username`, `password`, `email`, `gender`, `phone`, `img`, `roles`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Quản trị', 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'admin@gmail.com', 1, '0987654367', 'admin.jpg', 1, '2020-06-30 17:16:03', 1, '2020-06-30 17:16:03', 1, 1),
(2, 'Khách hàng', 'khachhang', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'khachhang@gmail.com', 1, '0987654367', 'khachhang.jpg', 0, '2020-06-30 17:16:03', 1, '2020-06-30 17:16:03', 1, 1),
(9, 'Vũ Hoài Nam', 'Vuhoainam', '1e6660185ff2cce7335b3e63dd8a7e541212752b', 'vhnam18032002@gmail.com', 1, '0382158065', '01.jpg', 1, '2022-06-01 00:33:51', 1, '2022-06-01 00:33:51', 1, 1),
(10, 'KhachHangMoi', 'Khachhangmoi', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'khachhangmoi@gmail.com', 0, '0397215469', 'Logo (2).png', 1, '2022-06-04 06:19:20', 1, '2022-06-04 03:19:02', 1, 2),
(11, 'Vũ Hoài Nam', 'Tuimoi', '133', 'vhnam18032002@gmail.com', 1, '0382158065', NULL, 0, '2022-06-04 05:06:21', 1, '2022-06-04 05:07:30', 1, 1),
(12, 'Tui mới nhập nha 2022', 'Tuimoithem', '123', 'khachhangmoi@gmail.com', 1, '97215463', 'Logo (2).png', 0, '2022-06-03 22:41:42', 1, '2022-06-04 05:41:42', 1, 2),
(13, 'Vũ Hoài Nam', 'Tuimoithemnha', '1245', 'vhnam18032002@gmail.com', 0, '0382158065', '03.jpg', 0, '2022-06-04 05:54:32', 1, '2022-06-04 05:54:32', 1, 2),
(14, 'Vũ Hoài Nam', 'Tuimoithemnha', '123456', 'vhnam18032002@gmail.com', 0, '0382158065', NULL, 0, '2022-06-04 05:55:20', 1, '2022-06-04 05:55:20', 1, 2),
(15, 'Vũ Hoài Nam', 'Tuimoithemnha', '123456', 'vhnam18032002@gmail.com', 0, '0382158065', 'Logo.png', 0, '2022-06-04 05:55:42', 1, '2022-06-04 05:55:42', 1, 2),
(16, 'Vũ Hoài Nam', 'Tuimoithemnha', '123456', 'vhnam18032002@gmail.com', 0, '0382158065', 'Logo.png', 0, '2022-06-04 05:55:58', 1, '2022-06-04 05:56:06', 1, 2),
(17, 'Vũ Hoài Nam', 'VHN', '123456', 'vhn@gmail.com', 0, '0382158065', 'Logo (2).png', 0, '2022-06-03 23:01:22', 1, '2022-06-04 06:01:22', 1, 2),
(18, 'Vũ Hoài Nam', 'ágdheta', 'raehryyr', 'vhnam18032002@gmail.com', 1, '0382158065', 'Logo (2).png', 0, '2022-06-03 23:03:26', 1, '2022-06-04 06:03:26', 1, 2),
(19, 'Vũ Hoài Nam', 'ágdheta', 'raehryyr', 'vhnam18032002@gmail.com', 1, '0382158065', 'Logo (2).png', 0, '2022-06-03 23:03:59', 1, '2022-06-04 06:03:59', 1, 2),
(20, 'Vũ Hoài Nam', 'Tuimoi', '133', 'vhnam18032002@gmail.com', 1, '0382158065', 'Logo (2).png', 0, '2022-06-04 06:16:48', 1, '2022-06-04 06:16:48', 1, 2),
(21, 'Vũ Hoài Nam', 'Tuimoin', '123456', 'vhnam18032002@gmail.com', 1, '03821580678', 'Logo (2).png', 0, '2022-06-04 06:22:21', 1, '2022-06-04 06:17:17', 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `db_baiviet`
--
ALTER TABLE `db_baiviet`
  ADD PRIMARY KEY (`Id_baiviet`),
  ADD KEY `Id_chude` (`Id_chude`);

--
-- Indexes for table `db_binhluan`
--
ALTER TABLE `db_binhluan`
  ADD PRIMARY KEY (`Id_bl`),
  ADD KEY `Id_sp` (`Id_sp`);

--
-- Indexes for table `db_chitiet_donhang`
--
ALTER TABLE `db_chitiet_donhang`
  ADD PRIMARY KEY (`Id_ct_hd`),
  ADD KEY `Id_hd` (`Id_hd`),
  ADD KEY `Id_sp` (`Id_sp`);

--
-- Indexes for table `db_chude`
--
ALTER TABLE `db_chude`
  ADD PRIMARY KEY (`Id_chude`);

--
-- Indexes for table `db_danhmuc`
--
ALTER TABLE `db_danhmuc`
  ADD PRIMARY KEY (`Id_dm`);

--
-- Indexes for table `db_donhang_dh`
--
ALTER TABLE `db_donhang_dh`
  ADD PRIMARY KEY (`Id_hd`),
  ADD KEY `Id_nvgh` (`Id_nvgh`),
  ADD KEY `Id_tinh_trang` (`Id_tinh_trang`),
  ADD KEY `Id_user` (`Id_user`);

--
-- Indexes for table `db_giohang`
--
ALTER TABLE `db_giohang`
  ADD PRIMARY KEY (`Id_sp`),
  ADD KEY `Id_dm` (`Id_dm`);

--
-- Indexes for table `db_menu`
--
ALTER TABLE `db_menu`
  ADD PRIMARY KEY (`Id_menu`);

--
-- Indexes for table `db_nhanvien_giaohang`
--
ALTER TABLE `db_nhanvien_giaohang`
  ADD PRIMARY KEY (`Id_nvgh`);

--
-- Indexes for table `db_sanpham`
--
ALTER TABLE `db_sanpham`
  ADD PRIMARY KEY (`Id_sp`),
  ADD KEY `Id_dm` (`Id_dm`),
  ADD KEY `Id_loai_sp` (`Id_thuonghieu`);

--
-- Indexes for table `db_slider`
--
ALTER TABLE `db_slider`
  ADD PRIMARY KEY (`Id_slider`);

--
-- Indexes for table `db_sp_ban`
--
ALTER TABLE `db_sp_ban`
  ADD PRIMARY KEY (`Id_sp_ban`),
  ADD KEY `Id_sp` (`Id_sp`);

--
-- Indexes for table `db_thuonghieu`
--
ALTER TABLE `db_thuonghieu`
  ADD PRIMARY KEY (`Id_thuonghieu`);

--
-- Indexes for table `db_tinh_trang`
--
ALTER TABLE `db_tinh_trang`
  ADD PRIMARY KEY (`Id_tinh_trang`);

--
-- Indexes for table `db_user`
--
ALTER TABLE `db_user`
  ADD PRIMARY KEY (`Id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `db_baiviet`
--
ALTER TABLE `db_baiviet`
  MODIFY `Id_baiviet` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã bài viết', AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `db_binhluan`
--
ALTER TABLE `db_binhluan`
  MODIFY `Id_bl` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_chitiet_donhang`
--
ALTER TABLE `db_chitiet_donhang`
  MODIFY `Id_ct_hd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_chude`
--
ALTER TABLE `db_chude`
  MODIFY `Id_chude` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `db_danhmuc`
--
ALTER TABLE `db_danhmuc`
  MODIFY `Id_dm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `db_donhang_dh`
--
ALTER TABLE `db_donhang_dh`
  MODIFY `Id_hd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_giohang`
--
ALTER TABLE `db_giohang`
  MODIFY `Id_sp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id san phẩm';

--
-- AUTO_INCREMENT for table `db_menu`
--
ALTER TABLE `db_menu`
  MODIFY `Id_menu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã Menu', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `db_nhanvien_giaohang`
--
ALTER TABLE `db_nhanvien_giaohang`
  MODIFY `Id_nvgh` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_sanpham`
--
ALTER TABLE `db_sanpham`
  MODIFY `Id_sp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id san phẩm', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_slider`
--
ALTER TABLE `db_slider`
  MODIFY `Id_slider` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã Slider', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `db_sp_ban`
--
ALTER TABLE `db_sp_ban`
  MODIFY `Id_sp_ban` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_thuonghieu`
--
ALTER TABLE `db_thuonghieu`
  MODIFY `Id_thuonghieu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã Loại', AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `db_tinh_trang`
--
ALTER TABLE `db_tinh_trang`
  MODIFY `Id_tinh_trang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_user`
--
ALTER TABLE `db_user`
  MODIFY `Id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `db_baiviet`
--
ALTER TABLE `db_baiviet`
  ADD CONSTRAINT `db_baiviet_ibfk_1` FOREIGN KEY (`Id_chude`) REFERENCES `db_chude` (`Id_chude`);

--
-- Constraints for table `db_binhluan`
--
ALTER TABLE `db_binhluan`
  ADD CONSTRAINT `db_binhluan_ibfk_1` FOREIGN KEY (`Id_sp`) REFERENCES `db_sanpham` (`Id_sp`);

--
-- Constraints for table `db_chitiet_donhang`
--
ALTER TABLE `db_chitiet_donhang`
  ADD CONSTRAINT `db_chitiet_donhang_ibfk_1` FOREIGN KEY (`Id_hd`) REFERENCES `db_donhang_dh` (`Id_hd`),
  ADD CONSTRAINT `db_chitiet_donhang_ibfk_2` FOREIGN KEY (`Id_sp`) REFERENCES `db_sanpham` (`Id_sp`);

--
-- Constraints for table `db_donhang_dh`
--
ALTER TABLE `db_donhang_dh`
  ADD CONSTRAINT `db_donhang_dh_ibfk_2` FOREIGN KEY (`Id_nvgh`) REFERENCES `db_nhanvien_giaohang` (`Id_nvgh`),
  ADD CONSTRAINT `db_donhang_dh_ibfk_3` FOREIGN KEY (`Id_tinh_trang`) REFERENCES `db_tinh_trang` (`Id_tinh_trang`),
  ADD CONSTRAINT `db_donhang_dh_ibfk_4` FOREIGN KEY (`Id_user`) REFERENCES `db_user` (`Id_user`);

--
-- Constraints for table `db_sanpham`
--
ALTER TABLE `db_sanpham`
  ADD CONSTRAINT `db_sanpham_ibfk_1` FOREIGN KEY (`Id_dm`) REFERENCES `db_danhmuc` (`Id_dm`),
  ADD CONSTRAINT `db_sanpham_ibfk_2` FOREIGN KEY (`Id_thuonghieu`) REFERENCES `db_thuonghieu` (`Id_thuonghieu`);

--
-- Constraints for table `db_sp_ban`
--
ALTER TABLE `db_sp_ban`
  ADD CONSTRAINT `db_sp_ban_ibfk_1` FOREIGN KEY (`Id_sp`) REFERENCES `db_sanpham` (`Id_sp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
