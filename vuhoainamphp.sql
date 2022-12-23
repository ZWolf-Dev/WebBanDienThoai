-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 22, 2022 at 09:36 AM
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
-- Database: `vuhoainamphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `vhn_cart`
--

CREATE TABLE `vhn_cart` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã sản phẩm',
  `catid` int(10) UNSIGNED NOT NULL COMMENT 'Mã loại sản phẩm',
  `name` varchar(1000) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên sản phẩm',
  `slug` varchar(1000) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Slug tên sản phẩm',
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Hình ảnh',
  `detail` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Chi tiết',
  `number` smallint(5) UNSIGNED NOT NULL COMMENT 'Số lượng',
  `price` float(12,2) UNSIGNED NOT NULL COMMENT 'Giá',
  `pricesale` float(12,3) UNSIGNED NOT NULL COMMENT 'Giá khuyến mãi',
  `metakey` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Từ khóa SEO',
  `metadesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mô tả SEO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày tạo',
  `created_by` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Người tạo',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày sửa',
  `updated_by` tinyint(3) UNSIGNED DEFAULT '1' COMMENT 'Người sửa',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vhn_category`
--

CREATE TABLE `vhn_category` (
  `id` int(11) NOT NULL COMMENT 'Mã Loại',
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
-- Dumping data for table `vhn_category`
--

INSERT INTO `vhn_category` (`id`, `name`, `slug`, `parentid`, `orders`, `metakey`, `metadesc`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Thời trang nam', 'thoi-trang-nam', 0, 1, 'Thời trang nam', 'Thời trang nam', '2020-07-03 09:06:19', 1, '2022-04-05 07:14:14', 1, 1),
(2, 'Thời trang nữ', 'thoi-trang-nu', 0, 2, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2022-04-05 10:20:31', 1, 1),
(3, 'Thời trang thể thao', 'thoi-trang-the-thao', 0, 3, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2022-05-20 07:55:33', 1, 1),
(4, 'Thời trang bé trai', 'thoi-trang-be-trai', 0, 4, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(5, 'Thời trang bé gái', 'thoi-trang-be-gai', 0, 5, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(6, 'Phụ kiện', 'phu-kien', 0, 6, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2022-05-20 07:59:04', 1, 1),
(7, 'Áo thun nam', 'ao-thun-nam', 1, 1, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(8, 'Áo sơ mi nam', 'ao-so-mi-nam', 1, 2, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(9, 'Áo kaki nam', 'ao-kaki-nam', 1, 3, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(10, 'Áo khoác nam', 'ao-khoac-nam', 1, 4, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(11, 'Áo len nam', 'ao-len-nam', 1, 5, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(12, 'Quần tây nam', 'quan-tay-nam', 1, 6, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(13, 'Quần jean nam', 'quan-jean-nam', 1, 6, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(14, 'Áo thun nũ', 'ao-thun-nu', 2, 1, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(15, 'Áo sơ mi nữ', 'ao-so-mi-nu', 2, 2, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(16, 'Áo kaki nữ', 'ao-kaki-nu', 2, 3, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(17, 'Áo khoác nữ', 'ao-khoac-ny', 2, 4, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2022-04-05 10:20:52', 1, 1),
(18, 'Áo len nữ', 'ao-len-nu', 2, 5, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(19, 'Váy ngắn', 'vay-ngan', 2, 6, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(20, 'Đầm', 'dam', 2, 6, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(21, 'Quần jean nữ', 'quan-jean-nu', 2, 6, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(22, 'Quần áo bóng đá', 'quan-ao-bong-da', 3, 1, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(23, 'Quần áo cầu lông', 'ao-ao-cau-long', 3, 2, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(24, 'Quần áo bóng rổ', 'quan-ao-bong-ro', 3, 3, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(25, 'Giày bóng đá', 'giay-bong-da', 3, 4, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(26, 'Giày cầu lông', 'giay-cau-long', 3, 5, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(27, 'Giày bóng rổ', 'giay-bong-ro', 3, 6, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(28, 'Phụ kiện thể thao', 'phu-kien-the-thao', 3, 6, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(29, 'Áo bé trai', 'ao-be-trai', 4, 1, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(30, 'Quần bé trai', 'quan-be-trai', 4, 2, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(31, 'Đồ bộ bé trai', 'do-bo-be-trai', 4, 3, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(32, 'Giày dep bé trai', 'giay-dep-be-trai', 4, 4, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(33, 'Áo bé gái', 'ao-be-gai', 5, 1, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(34, 'Quần bé gái', 'quan-be-gai', 5, 2, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(35, 'Đồ bộ bé gái', 'do-bo-be-gai', 5, 3, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(36, 'Đầm bé gái', 'dam-be-gai', 5, 4, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(37, 'Giày dep bé gái', 'giay-dep-be-gai', 5, 5, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:06:19', 1, '2020-07-03 09:06:19', 1, 1),
(38, 'Tui mới thêm 2022+2', 'tui-moi-them-2022-2', 4, 5, 'Tui mới thêm 2022 to', 'Tui mới thêm 2022 thao', '2022-04-05 07:10:49', 1, '2022-04-05 07:49:10', 1, 1),
(40, 'Tui mới thêm', 'tui-moi-them', 5, 3, 'Tui mới thêm', 'Tui mới thêm', '2022-04-05 07:49:06', 1, '2022-04-05 11:04:16', 1, 1),
(41, 'Tui mới thêmfhfhf', 'tui-moi-themfhfhf', 40, 3, 'ydyty', 'tyty', '2022-04-05 10:27:45', 1, '2022-04-05 10:27:51', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vhn_contact`
--

CREATE TABLE `vhn_contact` (
  `id` int(11) NOT NULL COMMENT 'Mã liên hệ',
  `userid` int(10) UNSIGNED DEFAULT '0',
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Họ và tên',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Email',
  `phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Điện thoại',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tiêu đề',
  `detail` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Chi tiết',
  `replyid` int(10) UNSIGNED DEFAULT NULL,
  `replydetail` text COLLATE utf8_unicode_ci COMMENT 'Nội dung liên hệ',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày liên hệ',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày trả lời',
  `updated_by` tinyint(4) UNSIGNED DEFAULT '0' COMMENT 'Người trả lời',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Tráng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vhn_contact`
--

INSERT INTO `vhn_contact` (`id`, `userid`, `fullname`, `email`, `phone`, `title`, `detail`, `replyid`, `replydetail`, `created_at`, `updated_at`, `updated_by`, `status`) VALUES
(1, 0, 'Nguyễn Văn Toàn', 'nguyenvantoan@gmail.com', '0987654321', 'Hỏi về liên kết mua sĩ', 'Hỏi về liên kết mua sĩ', NULL, NULL, '2020-06-30 22:31:49', '2020-06-30 22:31:49', 1, 1),
(2, 0, 'Lê Thái Sơn', 'lethaison@gmail.com', '0987667986', 'Hỏi về liên kết mua sĩ', 'Hỏi về liên kết mua sĩ', NULL, NULL, '2020-06-30 22:31:49', '2020-06-30 22:31:49', 1, 1),
(3, 0, 'Trần Ngọc Ái', 'tranngocai@gmail.com', '0987654379', 'Hỏi về liên kết mua sĩ', 'Hỏi về liên kết mua sĩ', NULL, NULL, '2020-06-30 22:31:49', '2020-06-30 22:31:49', 1, 1),
(4, 0, 'Mai Tiến Sơn', 'maitienson@gmail.com', '0987654367', 'Hỏi về liên kết mua sĩ', 'Hỏi về liên kết mua sĩ', NULL, NULL, '2020-06-30 22:31:49', '2020-06-30 22:31:49', 1, 1),
(5, 0, 'Vũ Hoài Nam', 'vhnam18032002@gmail.com', '0382158065', 'Mới nhập', 'Mới nhập Mới nhập Mới nhập Mới nhập', NULL, NULL, '2022-05-19 00:10:20', '2022-05-22 08:16:24', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `vhn_menu`
--

CREATE TABLE `vhn_menu` (
  `id` int(11) NOT NULL COMMENT 'Mã Menu',
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
-- Dumping data for table `vhn_menu`
--

INSERT INTO `vhn_menu` (`id`, `name`, `link`, `type`, `tableid`, `orders`, `position`, `parentid`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Trang chủ', 'index.php', 'custom', 1, 0, 'mainmenu', 0, '2020-06-30 15:36:22', 1, '2022-05-20 09:41:01', 1, 1),
(2, 'Giới thiệu', 'index.php?option=page&cat=gioi-thieu', 'page', 2, 0, 'mainmenu', 0, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(3, 'Sản phẩm', 'index.php?option=product', 'custom', 1, 0, 'mainmenu', 0, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(4, 'Thời trang nam', 'index.php?option=product&cat=thoi-trang-nam', 'category', 2, 0, 'mainmenu', 3, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(5, 'Thời trang nữ', 'index.php?option=product&cat=thoi-trang-nu', 'category', 2, 0, 'mainmenu', 3, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(6, 'Thời trang bé trai', 'index.php?option=product&cat=thoi-trang-be-trai', 'category', 4, 0, 'mainmenu', 3, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(7, 'Thời trang bé gái', 'index.php?option=product&cat=thoi-trang-be-gai', 'category', 5, 0, 'mainmenu', 3, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(8, 'Tin khuyễn mãi', 'index.php?option=post&cat=tin-khuyen-mai', 'topic', 1, 0, 'mainmenu', 0, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(9, 'Liên hệ', 'index.php?option=contact/contact', 'custom', 1, 0, 'mainmenu', 0, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(10, 'Thời trang thể thao', 'index.php?option=product&cat=thoi-trang-the-thao', 'category', 3, 0, 'mainmenu', 3, '2020-06-30 15:36:22', 1, '2022-05-20 09:19:36', 1, 1),
(11, 'Phụ kiện', 'index.php?option=product&cat=phu-kien', 'category', 2, 0, 'mainmenu', 3, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1),
(12, 'Tất cả sản phẩm', 'index.php?option=product/product', 'category', 2, 0, 'mainmenu', 3, '2020-06-30 15:36:22', 1, '2020-06-30 15:36:22', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vhn_order`
--

CREATE TABLE `vhn_order` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã đơn hàng',
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Code đơn hàng',
  `userid` int(11) NOT NULL COMMENT 'Mã khách hàng',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày tạo',
  `exportdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày xuất',
  `deliveryaddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Địa chỉ người nhận',
  `deliveryname` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên người nhận',
  `deliveryphone` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Điện thoại người nhận',
  `deliveryemail` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Email ngươig nhận',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày cập nhật',
  `updated_by` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'Người cập nhật',
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vhn_order`
--

INSERT INTO `vhn_order` (`id`, `code`, `userid`, `createdate`, `exportdate`, `deliveryaddress`, `deliveryname`, `deliveryphone`, `deliveryemail`, `updated_at`, `updated_by`, `status`) VALUES
(1, '20200107121212', 1, '2020-06-30 17:00:00', '2020-07-03 17:00:00', 'HCM', 'Hồ Đình Lợi', '0987654321', 'loi@gmail.com', '2022-05-22 09:14:32', 1, 1),
(2, '20200107121216', 1, '2020-06-30 17:00:00', '2020-07-03 17:00:00', 'Bình Dương', 'Hoàng Mai Toàn', '0987654321', 'toan@gmail.com', NULL, 1, 1),
(95, '2020010712195', 1, '2022-05-21 00:22:07', '2022-05-21 00:22:07', '14', 'Vũ Hoài Nam', '20220423', 'admin@gmail.com', '2022-05-22 09:15:52', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vhn_orderdetail`
--

CREATE TABLE `vhn_orderdetail` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã CT Đơn hàng',
  `orderid` int(10) UNSIGNED NOT NULL COMMENT 'Mã đơn hàng',
  `productid` int(10) UNSIGNED NOT NULL COMMENT 'Mã sản phẩm',
  `price` float(12,2) UNSIGNED NOT NULL COMMENT 'Giá sản phẩm',
  `quantity` int(10) UNSIGNED NOT NULL COMMENT 'Số lượng',
  `amount` float(12,2) UNSIGNED NOT NULL COMMENT 'Thành tiền'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vhn_orderdetail`
--

INSERT INTO `vhn_orderdetail` (`id`, `orderid`, `productid`, `price`, `quantity`, `amount`) VALUES
(1, 1, 23, 250000.00, 2, 500000.00),
(2, 1, 25, 250000.00, 3, 750000.00),
(3, 2, 33, 250000.00, 2, 500000.00),
(4, 2, 43, 250000.00, 3, 750000.00),
(5, 3, 34, 250000.00, 2, 500000.00),
(7, 3, 34, 250000.00, 2, 500000.00);

-- --------------------------------------------------------

--
-- Table structure for table `vhn_post`
--

CREATE TABLE `vhn_post` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã bài viết',
  `topid` int(10) UNSIGNED DEFAULT NULL COMMENT 'Mã chủ đề',
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
-- Dumping data for table `vhn_post`
--

INSERT INTO `vhn_post` (`id`, `topid`, `title`, `slug`, `detail`, `img`, `type`, `metakey`, `metadesc`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 0, 'Giới thiệu', 'gioi-thieu', 'Về chúng tôi\r\nSmart Z là một nền tảng thương mại điện tử thời trang nhanh B2C quốc tế. Công ty chủ yếu tập trung vào trang phục của phụ nữ, nhưng cũng cung cấp quần áo nam, quần áo trẻ em, phụ kiện, giày dép, túi xách và các mặt hàng thời trang khác. Smart Z chủ yếu nhắm vào Châu Âu, Châu Mỹ, Úc và Trung Đông cùng với các thị trường tiêu dùng khác.\r\n\r\nSứ mệnh của chúng tôi\r\nSmart Z tự hào cung cấp các phong cách theo xu hướng phục vụ cho cả nữ trẻ và thanh thiếu niên. Smart Z tuân thủ quan điểm \"mọi người đều có thể tận hưởng vẻ đẹp của thời trang\". Smart Z có thể đứng đầu trong các xu hướng thời trang mới nhất từ khắp nơi trên thế giới đồng thời nhanh chóng đưa các kiểu dáng này ra thị trường. Vì vậy, cho dù bạn đang tìm kiếm những chiếc đầm boho và áo thun họa tiết hay áo sơ mi sang trọng và đồ bơi, Smart Z là cửa hàng lý tưởng cho các tín đồ thời trang hiện đại nhưng tiết kiệm. Nhằm mục đích cung cấp các sản phẩm chất lượng cao và thời trang với giá hấp dẫn cho mọi người dùng trên thế giới.\r\n\r\nTìm thấy Chúng tôi\r\nSmart Z hiện vận chuyển đến hơn 220 quốc gia và khu vực trên toàn thế giới. Các trang web Hoa Kỳ, Tây Ban Nha, Pháp, Nga, Đức, Ý, Úc và Trung Đông, Smart Z vận chuyển từ một trong nhiều kho hàng có vị trí toàn cầu. Smart Z tiếp tục phát triển mạnh vì có nhân viên sản xuất xuất sắc và cùng giá trị của chúng tôi. Smart Z nhằm mục đích cung cấp các sản phẩm hợp thời trang có giá trị cao nhất đồng thời được chất lượng, giá trị và dịch vụ.', 'tin-tuc.jpg', 'page', 'Từ khóa SEO', 'Mô tả SEO', '2020-06-30 22:20:53', 1, '2020-06-30 22:20:53', 1, 1),
(2, 0, 'Chính sách vận chuyển', 'chinh-sach-van-chuyen', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'page', 'Từ khóa SEO', 'Mô tả SEO', '2020-06-30 22:20:53', 1, '2020-06-30 22:20:53', 1, 1),
(3, 0, 'Chính sách đổi trả', 'chinh-sach-doi-tra', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'page', 'Từ khóa SEO', 'Mô tả SEO', '2020-06-30 22:20:53', 1, '2020-06-30 22:20:53', 1, 1),
(4, 0, 'Cách thanh toán', 'cach-thanh-toan', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'page', 'Từ khóa SEO', 'Mô tả SEO', '2020-06-30 22:20:53', 1, '2020-06-30 22:20:53', 1, 1),
(5, 1, 'Tin tức 1', 'tin-tuc-1', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2022-05-22 08:27:48', 1, 2),
(6, 1, 'Tin tức 2', 'tin-tuc-2', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2020-07-25 06:24:18', 1, 2),
(7, 1, 'Tin tức 3', 'tin-tuc-3', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2022-05-22 06:57:32', 1, 2),
(9, 1, 'Tin tức 5', 'tin-tuc-5', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2020-07-03 09:12:37', 1, 1),
(10, 1, 'Tin tức 6', 'tin-tuc-6', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2020-07-03 09:12:37', 1, 1),
(11, 1, 'Tin tức 7', 'tin-tuc-7', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2020-07-03 09:12:37', 1, 1),
(12, 1, 'Tin tức 8', 'tin-tuc-8', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2020-07-03 09:12:37', 1, 1),
(13, 1, 'Tin tức 9', 'tin-tuc-9', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2020-07-03 09:12:37', 1, 1),
(14, 1, 'Tin tức 10', 'tin-tuc-10', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2020-07-03 09:12:37', 1, 1),
(15, 1, 'Tin tức 11', 'tin-tuc-11', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2020-07-03 09:12:37', 1, 1),
(16, 1, 'Tin tức 12', 'tin-tuc-12', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2020-07-03 09:12:37', 1, 1),
(17, 1, 'Tin tức 13', 'tin-tuc-13', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2020-07-03 09:12:37', 1, 1),
(18, 1, 'Tin tức 14', 'tin-tuc-14', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2020-07-03 09:12:37', 1, 1),
(19, 1, 'Tin tức 15', 'tin-tuc-15', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2020-07-03 09:12:37', 1, 1),
(20, 1, 'Tin tức 16', 'tin-tuc-16', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2020-07-03 09:12:37', 1, 1),
(21, 2, 'Dịch vụ-7', 'dich-vu-7', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2020-07-03 09:12:37', 1, 1),
(22, 2, 'Dịch vụ-8', 'dich-vu-8', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2020-07-03 09:12:37', 1, 1),
(23, 2, 'Dịch vụ-9', 'dich-vu-9', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'tin-tuc.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2020-07-03 09:12:37', 1, 1),
(24, 2, 'Dịch vụ-10', 'dich-vu-10', 'Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết Chi tiết bài viết ', 'dich-vu-10.jpg', 'post', 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:37', 1, '2020-07-25 07:14:19', 1, 1),
(25, 2, 'dịch vụ 11', 'dịch vụ 11', 'Mới nhập Mới nhập Mới nhập Mới nhập', NULL, 'post', 'dịch vụ 11', 'dịch vụ 11', '2022-05-22 07:52:52', 1, '2022-05-22 07:52:59', 1, 2),
(29, 0, 'Mới nhập', 'Mới nhập', 'Mới nhập Mới nhập Mới nhập Mới nhập', NULL, 'post', 'moi', 'moi', '2022-05-22 08:05:09', 1, '2022-05-22 08:20:20', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `vhn_product`
--

CREATE TABLE `vhn_product` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã sản phẩm',
  `catid` int(10) UNSIGNED NOT NULL COMMENT 'Mã loại sản phẩm',
  `name` varchar(1000) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên sản phẩm',
  `slug` varchar(1000) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Slug tên sản phẩm',
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Hình ảnh',
  `detail` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Chi tiết',
  `number` smallint(5) UNSIGNED NOT NULL COMMENT 'Số lượng',
  `price` float(12,2) UNSIGNED NOT NULL COMMENT 'Giá',
  `pricesale` float(12,3) UNSIGNED NOT NULL COMMENT 'Giá khuyến mãi',
  `metakey` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Từ khóa SEO',
  `metadesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mô tả SEO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày tạo',
  `created_by` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Người tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày sửa',
  `updated_by` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'Người sửa',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vhn_product`
--

INSERT INTO `vhn_product` (`id`, `catid`, `name`, `slug`, `img`, `detail`, `number`, `price`, `pricesale`, `metakey`, `metadesc`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 1, 'Thời trang nam-1', 'thoi-trang-nam-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:52', 1, '2022-04-06 01:54:51', 1, 1),
(2, 1, 'Thời trang nam-2', 'thoi-trang-nam-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:52', 1, '2020-07-03 09:12:52', 1, 1),
(3, 1, 'Thời trang nam-3', 'thoi-trang-nam-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:52', 1, '2020-07-03 09:12:52', 1, 1),
(4, 1, 'Thời trang nam-4', 'thoi-trang-nam-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:52', 1, '2020-07-03 09:12:52', 1, 1),
(6, 1, 'Thời trang nam-6', 'thoi-trang-nam-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:52', 1, '2020-07-03 09:12:52', 1, 1),
(7, 1, 'Thời trang nam-7', 'thoi-trang-nam-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:52', 1, '2020-07-03 09:12:52', 1, 1),
(8, 1, 'Thời trang nam-8', 'thoi-trang-nam-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:52', 1, '2020-07-03 09:12:52', 1, 1),
(9, 1, 'Thời trang nam-9', 'thoi-trang-nam-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:52', 1, '2020-07-03 09:12:52', 1, 1),
(10, 1, 'Thời trang nam-10', 'thoi-trang-nam-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:52', 1, '2020-07-03 09:12:52', 1, 1),
(11, 1, 'Thời trang nam-11', 'thoi-trang-nam-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:52', 1, '2020-07-03 09:12:52', 1, 1),
(12, 1, 'Thời trang nam-12', 'thoi-trang-nam-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:52', 1, '2020-07-03 09:12:52', 1, 1),
(13, 1, 'Thời trang nam-13', 'thoi-trang-nam-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:52', 1, '2020-07-03 09:12:52', 1, 1),
(14, 1, 'Thời trang nam-14', 'thoi-trang-nam-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:52', 1, '2020-07-03 09:12:52', 1, 1),
(15, 1, 'Thời trang nam-15', 'thoi-trang-nam-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:12:52', 1, '2020-07-03 09:12:52', 1, 1),
(16, 2, 'Thời trang nữ-1', 'thoi-trang-nu-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(17, 2, 'Thời trang nữ-2', 'thoi-trang-nu-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(18, 2, 'Thời trang nữ-3', 'thoi-trang-nu-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(19, 2, 'Thời trang nữ-4', 'thoi-trang-nu-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(20, 2, 'Thời trang nữ-5', 'thoi-trang-nu-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(21, 2, 'Thời trang nữ-6', 'thoi-trang-nu-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(22, 2, 'Thời trang nữ-7', 'thoi-trang-nu-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(23, 2, 'Thời trang nữ-8', 'thoi-trang-nu-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(24, 2, 'Thời trang nữ-9', 'thoi-trang-nu-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(25, 2, 'Thời trang nữ-10', 'thoi-trang-nu-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(26, 2, 'Thời trang nữ-11', 'thoi-trang-nu-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(27, 2, 'Thời trang nữ-12', 'thoi-trang-nu-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(28, 2, 'Thời trang nữ-13', 'thoi-trang-nu-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(29, 2, 'Thời trang nữ-14', 'thoi-trang-nu-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(30, 2, 'Thời trang nữ-15', 'thoi-trang-nu-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(31, 3, 'Thời trang thể thao-1', 'thoi-trang-the-thao-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(32, 3, 'Thời trang thể thao-2', 'thoi-trang-the-thao-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(33, 3, 'Thời trang thể thao-3', 'thoi-trang-the-thao-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(34, 3, 'Thời trang thể thao-4', 'thoi-trang-the-thao-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(35, 3, 'Thời trang thể thao-5', 'thoi-trang-the-thao-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(36, 3, 'Thời trang thể thao-6', 'thoi-trang-the-thao-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(37, 3, 'Thời trang thể thao-7', 'thoi-trang-the-thao-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(38, 3, 'Thời trang thể thao-8', 'thoi-trang-the-thao-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(39, 3, 'Thời trang thể thao-9', 'thoi-trang-the-thao-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(40, 3, 'Thời trang thể thao-10', 'thoi-trang-the-thao-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(41, 3, 'Thời trang thể thao-11', 'thoi-trang-the-thao-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(42, 3, 'Thời trang thể thao-12', 'thoi-trang-the-thao-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(43, 3, 'Thời trang thể thao-13', 'thoi-trang-the-thao-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(44, 3, 'Thời trang thể thao-14', 'thoi-trang-the-thao-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(45, 3, 'Thời trang thể thao-15', 'thoi-trang-the-thao-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(46, 4, 'Thời trang bé trai-1', 'thoi-trang-be-trai-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(47, 4, 'Thời trang bé trai-2', 'thoi-trang-be-trai-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(48, 4, 'Thời trang bé trai-3', 'thoi-trang-be-trai-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(49, 4, 'Thời trang bé trai-4', 'thoi-trang-be-trai-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(50, 4, 'Thời trang bé trai-5', 'thoi-trang-be-trai-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(51, 4, 'Thời trang bé trai-6', 'thoi-trang-be-trai-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(52, 4, 'Thời trang bé trai-7', 'thoi-trang-be-trai-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(53, 4, 'Thời trang bé trai-8', 'thoi-trang-be-trai-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(54, 4, 'Thời trang bé trai-9', 'thoi-trang-be-trai-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(55, 4, 'Thời trang bé trai-10', 'thoi-trang-be-trai-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(56, 4, 'Thời trang bé trai-11', 'thoi-trang-be-trai-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(57, 4, 'Thời trang bé trai-12', 'thoi-trang-be-trai-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(58, 4, 'Thời trang bé trai-13', 'thoi-trang-be-trai-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(59, 4, 'Thời trang bé trai-14', 'thoi-trang-be-trai-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(60, 4, 'Thời trang bé trai-15', 'thoi-trang-be-trai-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(61, 5, 'Thời trang bé gái-1', 'thoi-trang-be-gai-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(62, 5, 'Thời trang bé gái-2', 'thoi-trang-be-gai-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(63, 5, 'Thời trang bé gái-3', 'thoi-trang-be-gai-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(64, 5, 'Thời trang bé gái-4', 'thoi-trang-be-gai-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(65, 5, 'Thời trang bé gái-5', 'thoi-trang-be-gai-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(66, 5, 'Thời trang bé gái-6', 'thoi-trang-be-gai-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(67, 5, 'Thời trang bé gái-7', 'thoi-trang-be-gai-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(68, 5, 'Thời trang bé gái-8', 'thoi-trang-be-gai-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(69, 5, 'Thời trang bé gái-9', 'thoi-trang-be-gai-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(70, 5, 'Thời trang bé gái-10', 'thoi-trang-be-gai-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(71, 5, 'Thời trang bé gái-11', 'thoi-trang-be-gai-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(72, 5, 'Thời trang bé gái-12', 'thoi-trang-be-gai-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(73, 5, 'Thời trang bé gái-13', 'thoi-trang-be-gai-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(74, 5, 'Thời trang bé gái-14', 'thoi-trang-be-gai-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(75, 5, 'Thời trang bé gái-15', 'thoi-trang-be-gai-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(76, 6, 'Phụ kiện-1', 'phu-kien-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(77, 6, 'Phụ kiện-2', 'phu-kien-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(78, 6, 'Phụ kiện-3', 'phu-kien-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(79, 6, 'Phụ kiện-4', 'phu-kien-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(80, 6, 'Phụ kiện-5', 'phu-kien-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(81, 6, 'Phụ kiện-6', 'phu-kien-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(82, 6, 'Phụ kiện-7', 'phu-kien-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(83, 6, 'Phụ kiện-8', 'phu-kien-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(84, 6, 'Phụ kiện-9', 'phu-kien-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(85, 6, 'Phụ kiện-10', 'phu-kien-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(86, 6, 'Phụ kiện-11', 'phu-kien-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(87, 6, 'Phụ kiện-12', 'phu-kien-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(88, 6, 'Phụ kiện-13', 'phu-kien-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(89, 6, 'Phụ kiện-14', 'phu-kien-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(90, 6, 'Phụ kiện-15', 'phu-kien-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(91, 7, 'Áo thun nam-1', 'ao-thun-nam-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(92, 7, 'Áo thun nam-2', 'ao-thun-nam-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(93, 7, 'Áo thun nam-3', 'ao-thun-nam-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(94, 7, 'Áo thun nam-4', 'ao-thun-nam-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(95, 7, 'Áo thun nam-5', 'ao-thun-nam-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(96, 7, 'Áo thun nam-6', 'ao-thun-nam-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(97, 7, 'Áo thun nam-7', 'ao-thun-nam-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(98, 7, 'Áo thun nam-8', 'ao-thun-nam-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(99, 7, 'Áo thun nam-9', 'ao-thun-nam-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(100, 7, 'Áo thun nam-10', 'ao-thun-nam-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(101, 7, 'Áo thun nam-11', 'ao-thun-nam-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(102, 7, 'Áo thun nam-12', 'ao-thun-nam-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(103, 7, 'Áo thun nam-13', 'ao-thun-nam-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(104, 7, 'Áo thun nam-14', 'ao-thun-nam-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(105, 7, 'Áo thun nam-15', 'ao-thun-nam-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(106, 8, 'Áo sơ mi nam-1', 'ao-so-mi-nam-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(107, 8, 'Áo sơ mi nam-2', 'ao-so-mi-nam-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(108, 8, 'Áo sơ mi nam-3', 'ao-so-mi-nam-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(109, 8, 'Áo sơ mi nam-4', 'ao-so-mi-nam-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(110, 8, 'Áo sơ mi nam-5', 'ao-so-mi-nam-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(111, 8, 'Áo sơ mi nam-6', 'ao-so-mi-nam-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(112, 8, 'Áo sơ mi nam-7', 'ao-so-mi-nam-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(113, 8, 'Áo sơ mi nam-8', 'ao-so-mi-nam-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(114, 8, 'Áo sơ mi nam-9', 'ao-so-mi-nam-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(115, 8, 'Áo sơ mi nam-10', 'ao-so-mi-nam-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(116, 8, 'Áo sơ mi nam-11', 'ao-so-mi-nam-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(117, 8, 'Áo sơ mi nam-12', 'ao-so-mi-nam-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(118, 8, 'Áo sơ mi nam-13', 'ao-so-mi-nam-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(119, 8, 'Áo sơ mi nam-14', 'ao-so-mi-nam-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(120, 8, 'Áo sơ mi nam-15', 'ao-so-mi-nam-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(121, 9, 'Áo kaki nam-1', 'ao-kaki-nam-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(122, 9, 'Áo kaki nam-2', 'ao-kaki-nam-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(123, 9, 'Áo kaki nam-3', 'ao-kaki-nam-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(124, 9, 'Áo kaki nam-4', 'ao-kaki-nam-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(125, 9, 'Áo kaki nam-5', 'ao-kaki-nam-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(126, 9, 'Áo kaki nam-6', 'ao-kaki-nam-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(127, 9, 'Áo kaki nam-7', 'ao-kaki-nam-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(128, 9, 'Áo kaki nam-8', 'ao-kaki-nam-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(129, 9, 'Áo kaki nam-9', 'ao-kaki-nam-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(130, 9, 'Áo kaki nam-10', 'ao-kaki-nam-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(131, 9, 'Áo kaki nam-11', 'ao-kaki-nam-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(132, 9, 'Áo kaki nam-12', 'ao-kaki-nam-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(133, 9, 'Áo kaki nam-13', 'ao-kaki-nam-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(134, 9, 'Áo kaki nam-14', 'ao-kaki-nam-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(135, 9, 'Áo kaki nam-15', 'ao-kaki-nam-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(136, 10, 'Áo khoác nam-1', 'ao-khoac-nam-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(137, 10, 'Áo khoác nam-2', 'ao-khoac-nam-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(138, 10, 'Áo khoác nam-3', 'ao-khoac-nam-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(139, 10, 'Áo khoác nam-4', 'ao-khoac-nam-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(140, 10, 'Áo khoác nam-5', 'ao-khoac-nam-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(141, 10, 'Áo khoác nam-6', 'ao-khoac-nam-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(142, 10, 'Áo khoác nam-7', 'ao-khoac-nam-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(143, 10, 'Áo khoác nam-8', 'ao-khoac-nam-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(144, 10, 'Áo khoác nam-9', 'ao-khoac-nam-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(145, 10, 'Áo khoác nam-10', 'ao-khoac-nam-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(146, 10, 'Áo khoác nam-11', 'ao-khoac-nam-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(147, 10, 'Áo khoác nam-12', 'ao-khoac-nam-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(148, 10, 'Áo khoác nam-13', 'ao-khoac-nam-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(149, 10, 'Áo khoác nam-14', 'ao-khoac-nam-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(150, 10, 'Áo khoác nam-15', 'ao-khoac-nam-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(151, 11, 'Áo len nam-1', 'ao-len-nam-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(152, 11, 'Áo len nam-2', 'ao-len-nam-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(153, 11, 'Áo len nam-3', 'ao-len-nam-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(154, 11, 'Áo len nam-4', 'ao-len-nam-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(155, 11, 'Áo len nam-5', 'ao-len-nam-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(156, 11, 'Áo len nam-6', 'ao-len-nam-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(157, 11, 'Áo len nam-7', 'ao-len-nam-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(158, 11, 'Áo len nam-8', 'ao-len-nam-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(159, 11, 'Áo len nam-9', 'ao-len-nam-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(160, 11, 'Áo len nam-10', 'ao-len-nam-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(161, 11, 'Áo len nam-11', 'ao-len-nam-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(162, 11, 'Áo len nam-12', 'ao-len-nam-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(163, 11, 'Áo len nam-13', 'ao-len-nam-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(164, 11, 'Áo len nam-14', 'ao-len-nam-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(165, 11, 'Áo len nam-15', 'ao-len-nam-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(166, 12, 'Quần tây nam-1', 'quan-tay-nam-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(167, 12, 'Quần tây nam-2', 'quan-tay-nam-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(168, 12, 'Quần tây nam-3', 'quan-tay-nam-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(169, 12, 'Quần tây nam-4', 'quan-tay-nam-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(170, 12, 'Quần tây nam-5', 'quan-tay-nam-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(171, 12, 'Quần tây nam-6', 'quan-tay-nam-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(172, 12, 'Quần tây nam-7', 'quan-tay-nam-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(173, 12, 'Quần tây nam-8', 'quan-tay-nam-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(174, 12, 'Quần tây nam-9', 'quan-tay-nam-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(175, 12, 'Quần tây nam-10', 'quan-tay-nam-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(176, 12, 'Quần tây nam-11', 'quan-tay-nam-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(177, 12, 'Quần tây nam-12', 'quan-tay-nam-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(178, 12, 'Quần tây nam-13', 'quan-tay-nam-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(179, 12, 'Quần tây nam-14', 'quan-tay-nam-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(180, 12, 'Quần tây nam-15', 'quan-tay-nam-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(181, 13, 'Quần jean nam-1', 'quan-jean-nam-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(182, 13, 'Quần jean nam-2', 'quan-jean-nam-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(183, 13, 'Quần jean nam-3', 'quan-jean-nam-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(184, 13, 'Quần jean nam-4', 'quan-jean-nam-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(185, 13, 'Quần jean nam-5', 'quan-jean-nam-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(186, 13, 'Quần jean nam-6', 'quan-jean-nam-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(187, 13, 'Quần jean nam-7', 'quan-jean-nam-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(188, 13, 'Quần jean nam-8', 'quan-jean-nam-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(189, 13, 'Quần jean nam-9', 'quan-jean-nam-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(190, 13, 'Quần jean nam-10', 'quan-jean-nam-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(191, 13, 'Quần jean nam-11', 'quan-jean-nam-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(192, 13, 'Quần jean nam-12', 'quan-jean-nam-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(193, 13, 'Quần jean nam-13', 'quan-jean-nam-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(194, 13, 'Quần jean nam-14', 'quan-jean-nam-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(195, 13, 'Quần jean nam-15', 'quan-jean-nam-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:09', 1, '2020-07-03 09:13:09', 1, 1),
(196, 14, 'Áo thun nũ-1', 'ao-thun-nu-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(197, 14, 'Áo thun nũ-2', 'ao-thun-nu-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(198, 14, 'Áo thun nũ-3', 'ao-thun-nu-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(199, 14, 'Áo thun nũ-4', 'ao-thun-nu-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(200, 14, 'Áo thun nũ-5', 'ao-thun-nu-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(201, 14, 'Áo thun nũ-6', 'ao-thun-nu-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(202, 14, 'Áo thun nũ-7', 'ao-thun-nu-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(203, 14, 'Áo thun nũ-8', 'ao-thun-nu-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(204, 14, 'Áo thun nũ-9', 'ao-thun-nu-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(205, 14, 'Áo thun nũ-10', 'ao-thun-nu-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(206, 14, 'Áo thun nũ-11', 'ao-thun-nu-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(207, 14, 'Áo thun nũ-12', 'ao-thun-nu-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(208, 14, 'Áo thun nũ-13', 'ao-thun-nu-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(209, 14, 'Áo thun nũ-14', 'ao-thun-nu-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(210, 14, 'Áo thun nũ-15', 'ao-thun-nu-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(211, 15, 'Áo sơ mi nữ-1', 'ao-so-mi-nu-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(212, 15, 'Áo sơ mi nữ-2', 'ao-so-mi-nu-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(213, 15, 'Áo sơ mi nữ-3', 'ao-so-mi-nu-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(214, 15, 'Áo sơ mi nữ-4', 'ao-so-mi-nu-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(215, 15, 'Áo sơ mi nữ-5', 'ao-so-mi-nu-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(216, 15, 'Áo sơ mi nữ-6', 'ao-so-mi-nu-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(217, 15, 'Áo sơ mi nữ-7', 'ao-so-mi-nu-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(218, 15, 'Áo sơ mi nữ-8', 'ao-so-mi-nu-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(219, 15, 'Áo sơ mi nữ-9', 'ao-so-mi-nu-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(220, 15, 'Áo sơ mi nữ-10', 'ao-so-mi-nu-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(221, 15, 'Áo sơ mi nữ-11', 'ao-so-mi-nu-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(222, 15, 'Áo sơ mi nữ-12', 'ao-so-mi-nu-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(223, 15, 'Áo sơ mi nữ-13', 'ao-so-mi-nu-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(224, 15, 'Áo sơ mi nữ-14', 'ao-so-mi-nu-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(225, 15, 'Áo sơ mi nữ-15', 'ao-so-mi-nu-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(226, 16, 'Áo kaki nữ-1', 'ao-kaki-nu-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(227, 16, 'Áo kaki nữ-2', 'ao-kaki-nu-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(228, 16, 'Áo kaki nữ-3', 'ao-kaki-nu-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(229, 16, 'Áo kaki nữ-4', 'ao-kaki-nu-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(230, 16, 'Áo kaki nữ-5', 'ao-kaki-nu-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(231, 16, 'Áo kaki nữ-6', 'ao-kaki-nu-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(232, 16, 'Áo kaki nữ-7', 'ao-kaki-nu-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(233, 16, 'Áo kaki nữ-8', 'ao-kaki-nu-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(234, 16, 'Áo kaki nữ-9', 'ao-kaki-nu-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(235, 16, 'Áo kaki nữ-10', 'ao-kaki-nu-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(236, 16, 'Áo kaki nữ-11', 'ao-kaki-nu-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(237, 16, 'Áo kaki nữ-12', 'ao-kaki-nu-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(238, 16, 'Áo kaki nữ-13', 'ao-kaki-nu-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(239, 16, 'Áo kaki nữ-14', 'ao-kaki-nu-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(240, 16, 'Áo kaki nữ-15', 'ao-kaki-nu-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(241, 17, 'Áo khoác nữ-1', 'ao-khoac-ny-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(242, 17, 'Áo khoác nữ-2', 'ao-khoac-ny-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(243, 17, 'Áo khoác nữ-3', 'ao-khoac-ny-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(244, 17, 'Áo khoác nữ-4', 'ao-khoac-ny-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(245, 17, 'Áo khoác nữ-5', 'ao-khoac-ny-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(246, 17, 'Áo khoác nữ-6', 'ao-khoac-ny-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(247, 17, 'Áo khoác nữ-7', 'ao-khoac-ny-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(248, 17, 'Áo khoác nữ-8', 'ao-khoac-ny-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(249, 17, 'Áo khoác nữ-9', 'ao-khoac-ny-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(250, 17, 'Áo khoác nữ-10', 'ao-khoac-ny-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(251, 17, 'Áo khoác nữ-11', 'ao-khoac-ny-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(252, 17, 'Áo khoác nữ-12', 'ao-khoac-ny-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(253, 17, 'Áo khoác nữ-13', 'ao-khoac-ny-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(254, 17, 'Áo khoác nữ-14', 'ao-khoac-ny-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(255, 17, 'Áo khoác nữ-15', 'ao-khoac-ny-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(256, 18, 'Áo len nữ-1', 'ao-len-nu-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(257, 18, 'Áo len nữ-2', 'ao-len-nu-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(258, 18, 'Áo len nữ-3', 'ao-len-nu-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(259, 18, 'Áo len nữ-4', 'ao-len-nu-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(260, 18, 'Áo len nữ-5', 'ao-len-nu-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(261, 18, 'Áo len nữ-6', 'ao-len-nu-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(262, 18, 'Áo len nữ-7', 'ao-len-nu-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(263, 18, 'Áo len nữ-8', 'ao-len-nu-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(264, 18, 'Áo len nữ-9', 'ao-len-nu-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(265, 18, 'Áo len nữ-10', 'ao-len-nu-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(266, 18, 'Áo len nữ-11', 'ao-len-nu-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(267, 18, 'Áo len nữ-12', 'ao-len-nu-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(268, 18, 'Áo len nữ-13', 'ao-len-nu-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(269, 18, 'Áo len nữ-14', 'ao-len-nu-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(270, 18, 'Áo len nữ-15', 'ao-len-nu-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1);
INSERT INTO `vhn_product` (`id`, `catid`, `name`, `slug`, `img`, `detail`, `number`, `price`, `pricesale`, `metakey`, `metadesc`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(271, 19, 'Váy ngắn-1', 'vay-ngan-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(272, 19, 'Váy ngắn-2', 'vay-ngan-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(273, 19, 'Váy ngắn-3', 'vay-ngan-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(274, 19, 'Váy ngắn-4', 'vay-ngan-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(275, 19, 'Váy ngắn-5', 'vay-ngan-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(276, 19, 'Váy ngắn-6', 'vay-ngan-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(277, 19, 'Váy ngắn-7', 'vay-ngan-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(278, 19, 'Váy ngắn-8', 'vay-ngan-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(279, 19, 'Váy ngắn-9', 'vay-ngan-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(280, 19, 'Váy ngắn-10', 'vay-ngan-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(281, 19, 'Váy ngắn-11', 'vay-ngan-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(282, 19, 'Váy ngắn-12', 'vay-ngan-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(283, 19, 'Váy ngắn-13', 'vay-ngan-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(284, 19, 'Váy ngắn-14', 'vay-ngan-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(285, 19, 'Váy ngắn-15', 'vay-ngan-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(286, 20, 'Đầm-1', 'dam-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(287, 20, 'Đầm-2', 'dam-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(288, 20, 'Đầm-3', 'dam-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(289, 20, 'Đầm-4', 'dam-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(290, 20, 'Đầm-5', 'dam-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(291, 20, 'Đầm-6', 'dam-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(292, 20, 'Đầm-7', 'dam-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(293, 20, 'Đầm-8', 'dam-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(294, 20, 'Đầm-9', 'dam-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(295, 20, 'Đầm-10', 'dam-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(296, 20, 'Đầm-11', 'dam-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(297, 20, 'Đầm-12', 'dam-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(298, 20, 'Đầm-13', 'dam-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(299, 20, 'Đầm-14', 'dam-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(300, 20, 'Đầm-15', 'dam-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(301, 21, 'Quần jean nữ-1', 'quan-jean-nu-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(302, 21, 'Quần jean nữ-2', 'quan-jean-nu-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(303, 21, 'Quần jean nữ-3', 'quan-jean-nu-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(304, 21, 'Quần jean nữ-4', 'quan-jean-nu-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(305, 21, 'Quần jean nữ-5', 'quan-jean-nu-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(306, 21, 'Quần jean nữ-6', 'quan-jean-nu-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(307, 21, 'Quần jean nữ-7', 'quan-jean-nu-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(308, 21, 'Quần jean nữ-8', 'quan-jean-nu-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(309, 21, 'Quần jean nữ-9', 'quan-jean-nu-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(310, 21, 'Quần jean nữ-10', 'quan-jean-nu-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(311, 21, 'Quần jean nữ-11', 'quan-jean-nu-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(312, 21, 'Quần jean nữ-12', 'quan-jean-nu-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(313, 21, 'Quần jean nữ-13', 'quan-jean-nu-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(314, 21, 'Quần jean nữ-14', 'quan-jean-nu-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(315, 21, 'Quần jean nữ-15', 'quan-jean-nu-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(316, 22, 'Quần áo bóng đá-1', 'quan-ao-bong-da-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(317, 22, 'Quần áo bóng đá-2', 'quan-ao-bong-da-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(318, 22, 'Quần áo bóng đá-3', 'quan-ao-bong-da-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(319, 22, 'Quần áo bóng đá-4', 'quan-ao-bong-da-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(320, 22, 'Quần áo bóng đá-5', 'quan-ao-bong-da-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(321, 22, 'Quần áo bóng đá-6', 'quan-ao-bong-da-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(322, 22, 'Quần áo bóng đá-7', 'quan-ao-bong-da-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(323, 22, 'Quần áo bóng đá-8', 'quan-ao-bong-da-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(324, 22, 'Quần áo bóng đá-9', 'quan-ao-bong-da-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(325, 22, 'Quần áo bóng đá-10', 'quan-ao-bong-da-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(326, 22, 'Quần áo bóng đá-11', 'quan-ao-bong-da-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(327, 22, 'Quần áo bóng đá-12', 'quan-ao-bong-da-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(328, 22, 'Quần áo bóng đá-13', 'quan-ao-bong-da-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(329, 22, 'Quần áo bóng đá-14', 'quan-ao-bong-da-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(330, 22, 'Quần áo bóng đá-15', 'quan-ao-bong-da-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(331, 23, 'Quần áo cầu lông-1', 'ao-ao-cau-long-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(332, 23, 'Quần áo cầu lông-2', 'ao-ao-cau-long-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(333, 23, 'Quần áo cầu lông-3', 'ao-ao-cau-long-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(334, 23, 'Quần áo cầu lông-4', 'ao-ao-cau-long-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(335, 23, 'Quần áo cầu lông-5', 'ao-ao-cau-long-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(336, 23, 'Quần áo cầu lông-6', 'ao-ao-cau-long-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(337, 23, 'Quần áo cầu lông-7', 'ao-ao-cau-long-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(338, 23, 'Quần áo cầu lông-8', 'ao-ao-cau-long-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(339, 23, 'Quần áo cầu lông-9', 'ao-ao-cau-long-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(340, 23, 'Quần áo cầu lông-10', 'ao-ao-cau-long-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(341, 23, 'Quần áo cầu lông-11', 'ao-ao-cau-long-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(342, 23, 'Quần áo cầu lông-12', 'ao-ao-cau-long-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(343, 23, 'Quần áo cầu lông-13', 'ao-ao-cau-long-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(344, 23, 'Quần áo cầu lông-14', 'ao-ao-cau-long-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(345, 23, 'Quần áo cầu lông-15', 'ao-ao-cau-long-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(346, 24, 'Quần áo bóng rổ-1', 'quan-ao-bong-ro-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(347, 24, 'Quần áo bóng rổ-2', 'quan-ao-bong-ro-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(348, 24, 'Quần áo bóng rổ-3', 'quan-ao-bong-ro-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(349, 24, 'Quần áo bóng rổ-4', 'quan-ao-bong-ro-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(350, 24, 'Quần áo bóng rổ-5', 'quan-ao-bong-ro-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(351, 24, 'Quần áo bóng rổ-6', 'quan-ao-bong-ro-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(352, 24, 'Quần áo bóng rổ-7', 'quan-ao-bong-ro-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(353, 24, 'Quần áo bóng rổ-8', 'quan-ao-bong-ro-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(354, 24, 'Quần áo bóng rổ-9', 'quan-ao-bong-ro-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(355, 24, 'Quần áo bóng rổ-10', 'quan-ao-bong-ro-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(356, 24, 'Quần áo bóng rổ-11', 'quan-ao-bong-ro-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(357, 24, 'Quần áo bóng rổ-12', 'quan-ao-bong-ro-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(358, 24, 'Quần áo bóng rổ-13', 'quan-ao-bong-ro-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(359, 24, 'Quần áo bóng rổ-14', 'quan-ao-bong-ro-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(360, 24, 'Quần áo bóng rổ-15', 'quan-ao-bong-ro-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(361, 25, 'Giày bóng đá-1', 'giay-bong-da-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(362, 25, 'Giày bóng đá-2', 'giay-bong-da-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(363, 25, 'Giày bóng đá-3', 'giay-bong-da-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(364, 25, 'Giày bóng đá-4', 'giay-bong-da-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(365, 25, 'Giày bóng đá-5', 'giay-bong-da-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(366, 25, 'Giày bóng đá-6', 'giay-bong-da-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(367, 25, 'Giày bóng đá-7', 'giay-bong-da-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(368, 25, 'Giày bóng đá-8', 'giay-bong-da-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(369, 25, 'Giày bóng đá-9', 'giay-bong-da-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(370, 25, 'Giày bóng đá-10', 'giay-bong-da-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(371, 25, 'Giày bóng đá-11', 'giay-bong-da-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(372, 25, 'Giày bóng đá-12', 'giay-bong-da-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(373, 25, 'Giày bóng đá-13', 'giay-bong-da-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(374, 25, 'Giày bóng đá-14', 'giay-bong-da-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(375, 25, 'Giày bóng đá-15', 'giay-bong-da-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(376, 26, 'Giày cầu lông-1', 'giay-cau-long-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(377, 26, 'Giày cầu lông-2', 'giay-cau-long-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(378, 26, 'Giày cầu lông-3', 'giay-cau-long-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(379, 26, 'Giày cầu lông-4', 'giay-cau-long-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(380, 26, 'Giày cầu lông-5', 'giay-cau-long-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(381, 26, 'Giày cầu lông-6', 'giay-cau-long-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(382, 26, 'Giày cầu lông-7', 'giay-cau-long-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(383, 26, 'Giày cầu lông-8', 'giay-cau-long-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(384, 26, 'Giày cầu lông-9', 'giay-cau-long-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(385, 26, 'Giày cầu lông-10', 'giay-cau-long-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(386, 26, 'Giày cầu lông-11', 'giay-cau-long-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(387, 26, 'Giày cầu lông-12', 'giay-cau-long-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(388, 26, 'Giày cầu lông-13', 'giay-cau-long-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(389, 26, 'Giày cầu lông-14', 'giay-cau-long-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(390, 26, 'Giày cầu lông-15', 'giay-cau-long-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(391, 27, 'Giày bóng rổ-1', 'giay-bong-ro-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(392, 27, 'Giày bóng rổ-2', 'giay-bong-ro-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(393, 27, 'Giày bóng rổ-3', 'giay-bong-ro-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(394, 27, 'Giày bóng rổ-4', 'giay-bong-ro-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(395, 27, 'Giày bóng rổ-5', 'giay-bong-ro-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(396, 27, 'Giày bóng rổ-6', 'giay-bong-ro-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(397, 27, 'Giày bóng rổ-7', 'giay-bong-ro-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(398, 27, 'Giày bóng rổ-8', 'giay-bong-ro-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(399, 27, 'Giày bóng rổ-9', 'giay-bong-ro-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(400, 27, 'Giày bóng rổ-10', 'giay-bong-ro-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(401, 27, 'Giày bóng rổ-11', 'giay-bong-ro-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(402, 27, 'Giày bóng rổ-12', 'giay-bong-ro-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(403, 27, 'Giày bóng rổ-13', 'giay-bong-ro-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(404, 27, 'Giày bóng rổ-14', 'giay-bong-ro-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(405, 27, 'Giày bóng rổ-15', 'giay-bong-ro-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(406, 28, 'Phụ kiện thể thao-1', 'phu-kien-the-thao-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(407, 28, 'Phụ kiện thể thao-2', 'phu-kien-the-thao-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(408, 28, 'Phụ kiện thể thao-3', 'phu-kien-the-thao-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(409, 28, 'Phụ kiện thể thao-4', 'phu-kien-the-thao-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(410, 28, 'Phụ kiện thể thao-5', 'phu-kien-the-thao-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(411, 28, 'Phụ kiện thể thao-6', 'phu-kien-the-thao-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(412, 28, 'Phụ kiện thể thao-7', 'phu-kien-the-thao-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(413, 28, 'Phụ kiện thể thao-8', 'phu-kien-the-thao-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(414, 28, 'Phụ kiện thể thao-9', 'phu-kien-the-thao-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(415, 28, 'Phụ kiện thể thao-10', 'phu-kien-the-thao-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(416, 28, 'Phụ kiện thể thao-11', 'phu-kien-the-thao-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(417, 28, 'Phụ kiện thể thao-12', 'phu-kien-the-thao-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(418, 28, 'Phụ kiện thể thao-13', 'phu-kien-the-thao-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(419, 28, 'Phụ kiện thể thao-14', 'phu-kien-the-thao-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(420, 28, 'Phụ kiện thể thao-15', 'phu-kien-the-thao-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(421, 29, 'Áo bé trai-1', 'ao-be-trai-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(422, 29, 'Áo bé trai-2', 'ao-be-trai-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(423, 29, 'Áo bé trai-3', 'ao-be-trai-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(424, 29, 'Áo bé trai-4', 'ao-be-trai-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(425, 29, 'Áo bé trai-5', 'ao-be-trai-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(426, 29, 'Áo bé trai-6', 'ao-be-trai-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(427, 29, 'Áo bé trai-7', 'ao-be-trai-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(428, 29, 'Áo bé trai-8', 'ao-be-trai-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(429, 29, 'Áo bé trai-9', 'ao-be-trai-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(430, 29, 'Áo bé trai-10', 'ao-be-trai-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(431, 29, 'Áo bé trai-11', 'ao-be-trai-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(432, 29, 'Áo bé trai-12', 'ao-be-trai-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(433, 29, 'Áo bé trai-13', 'ao-be-trai-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(434, 29, 'Áo bé trai-14', 'ao-be-trai-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(435, 29, 'Áo bé trai-15', 'ao-be-trai-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(436, 30, 'Quần bé trai-1', 'quan-be-trai-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(437, 30, 'Quần bé trai-2', 'quan-be-trai-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(438, 30, 'Quần bé trai-3', 'quan-be-trai-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(439, 30, 'Quần bé trai-4', 'quan-be-trai-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(440, 30, 'Quần bé trai-5', 'quan-be-trai-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(441, 30, 'Quần bé trai-6', 'quan-be-trai-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(442, 30, 'Quần bé trai-7', 'quan-be-trai-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(443, 30, 'Quần bé trai-8', 'quan-be-trai-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(444, 30, 'Quần bé trai-9', 'quan-be-trai-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(445, 30, 'Quần bé trai-10', 'quan-be-trai-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(446, 30, 'Quần bé trai-11', 'quan-be-trai-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(447, 30, 'Quần bé trai-12', 'quan-be-trai-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(448, 30, 'Quần bé trai-13', 'quan-be-trai-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(449, 30, 'Quần bé trai-14', 'quan-be-trai-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(450, 30, 'Quần bé trai-15', 'quan-be-trai-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(451, 31, 'Đồ bộ bé trai-1', 'do-bo-be-trai-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(452, 31, 'Đồ bộ bé trai-2', 'do-bo-be-trai-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(453, 31, 'Đồ bộ bé trai-3', 'do-bo-be-trai-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(454, 31, 'Đồ bộ bé trai-4', 'do-bo-be-trai-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(455, 31, 'Đồ bộ bé trai-5', 'do-bo-be-trai-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(456, 31, 'Đồ bộ bé trai-6', 'do-bo-be-trai-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(457, 31, 'Đồ bộ bé trai-7', 'do-bo-be-trai-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(458, 31, 'Đồ bộ bé trai-8', 'do-bo-be-trai-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(459, 31, 'Đồ bộ bé trai-9', 'do-bo-be-trai-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(460, 31, 'Đồ bộ bé trai-10', 'do-bo-be-trai-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(461, 31, 'Đồ bộ bé trai-11', 'do-bo-be-trai-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(462, 31, 'Đồ bộ bé trai-12', 'do-bo-be-trai-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(463, 31, 'Đồ bộ bé trai-13', 'do-bo-be-trai-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(464, 31, 'Đồ bộ bé trai-14', 'do-bo-be-trai-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(465, 31, 'Đồ bộ bé trai-15', 'do-bo-be-trai-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(466, 32, 'Giày dep bé trai-1', 'giay-dep-be-trai-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(467, 32, 'Giày dep bé trai-2', 'giay-dep-be-trai-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(468, 32, 'Giày dep bé trai-3', 'giay-dep-be-trai-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(469, 32, 'Giày dep bé trai-4', 'giay-dep-be-trai-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(470, 32, 'Giày dep bé trai-5', 'giay-dep-be-trai-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(471, 32, 'Giày dep bé trai-6', 'giay-dep-be-trai-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(472, 32, 'Giày dep bé trai-7', 'giay-dep-be-trai-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(473, 32, 'Giày dep bé trai-8', 'giay-dep-be-trai-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(474, 32, 'Giày dep bé trai-9', 'giay-dep-be-trai-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(475, 32, 'Giày dep bé trai-10', 'giay-dep-be-trai-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(476, 32, 'Giày dep bé trai-11', 'giay-dep-be-trai-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(477, 32, 'Giày dep bé trai-12', 'giay-dep-be-trai-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(478, 32, 'Giày dep bé trai-13', 'giay-dep-be-trai-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(479, 32, 'Giày dep bé trai-14', 'giay-dep-be-trai-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(480, 32, 'Giày dep bé trai-15', 'giay-dep-be-trai-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(481, 33, 'Áo bé gái-1', 'ao-be-gai-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(482, 33, 'Áo bé gái-2', 'ao-be-gai-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(483, 33, 'Áo bé gái-3', 'ao-be-gai-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(484, 33, 'Áo bé gái-4', 'ao-be-gai-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(485, 33, 'Áo bé gái-5', 'ao-be-gai-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(486, 33, 'Áo bé gái-6', 'ao-be-gai-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(487, 33, 'Áo bé gái-7', 'ao-be-gai-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(488, 33, 'Áo bé gái-8', 'ao-be-gai-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(489, 33, 'Áo bé gái-9', 'ao-be-gai-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(490, 33, 'Áo bé gái-10', 'ao-be-gai-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(491, 33, 'Áo bé gái-11', 'ao-be-gai-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(492, 33, 'Áo bé gái-12', 'ao-be-gai-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(493, 33, 'Áo bé gái-13', 'ao-be-gai-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(494, 33, 'Áo bé gái-14', 'ao-be-gai-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(495, 33, 'Áo bé gái-15', 'ao-be-gai-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(496, 34, 'Quần bé gái-1', 'quan-be-gai-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(497, 34, 'Quần bé gái-2', 'quan-be-gai-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(498, 34, 'Quần bé gái-3', 'quan-be-gai-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(499, 34, 'Quần bé gái-4', 'quan-be-gai-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(500, 34, 'Quần bé gái-5', 'quan-be-gai-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(501, 34, 'Quần bé gái-6', 'quan-be-gai-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(502, 34, 'Quần bé gái-7', 'quan-be-gai-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(503, 34, 'Quần bé gái-8', 'quan-be-gai-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(504, 34, 'Quần bé gái-9', 'quan-be-gai-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(505, 34, 'Quần bé gái-10', 'quan-be-gai-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(506, 34, 'Quần bé gái-11', 'quan-be-gai-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(507, 34, 'Quần bé gái-12', 'quan-be-gai-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(508, 34, 'Quần bé gái-13', 'quan-be-gai-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(509, 34, 'Quần bé gái-14', 'quan-be-gai-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(510, 34, 'Quần bé gái-15', 'quan-be-gai-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(511, 35, 'Đồ bộ bé gái-1', 'do-bo-be-gai-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(512, 35, 'Đồ bộ bé gái-2', 'do-bo-be-gai-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(513, 35, 'Đồ bộ bé gái-3', 'do-bo-be-gai-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(514, 35, 'Đồ bộ bé gái-4', 'do-bo-be-gai-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(515, 35, 'Đồ bộ bé gái-5', 'do-bo-be-gai-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(516, 35, 'Đồ bộ bé gái-6', 'do-bo-be-gai-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(517, 35, 'Đồ bộ bé gái-7', 'do-bo-be-gai-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(518, 35, 'Đồ bộ bé gái-8', 'do-bo-be-gai-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(519, 35, 'Đồ bộ bé gái-9', 'do-bo-be-gai-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(520, 35, 'Đồ bộ bé gái-10', 'do-bo-be-gai-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(521, 35, 'Đồ bộ bé gái-11', 'do-bo-be-gai-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(522, 35, 'Đồ bộ bé gái-12', 'do-bo-be-gai-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(523, 35, 'Đồ bộ bé gái-13', 'do-bo-be-gai-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(524, 35, 'Đồ bộ bé gái-14', 'do-bo-be-gai-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(525, 35, 'Đồ bộ bé gái-15', 'do-bo-be-gai-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(526, 36, 'Đầm bé gái-1', 'dam-be-gai-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(527, 36, 'Đầm bé gái-2', 'dam-be-gai-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(528, 36, 'Đầm bé gái-3', 'dam-be-gai-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(529, 36, 'Đầm bé gái-4', 'dam-be-gai-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(530, 36, 'Đầm bé gái-5', 'dam-be-gai-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(531, 36, 'Đầm bé gái-6', 'dam-be-gai-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(532, 36, 'Đầm bé gái-7', 'dam-be-gai-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(533, 36, 'Đầm bé gái-8', 'dam-be-gai-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(534, 36, 'Đầm bé gái-9', 'dam-be-gai-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(535, 36, 'Đầm bé gái-10', 'dam-be-gai-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(536, 36, 'Đầm bé gái-11', 'dam-be-gai-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(537, 36, 'Đầm bé gái-12', 'dam-be-gai-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(538, 36, 'Đầm bé gái-13', 'dam-be-gai-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(539, 36, 'Đầm bé gái-14', 'dam-be-gai-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1);
INSERT INTO `vhn_product` (`id`, `catid`, `name`, `slug`, `img`, `detail`, `number`, `price`, `pricesale`, `metakey`, `metadesc`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(540, 36, 'Đầm bé gái-15', 'dam-be-gai-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:10', 1, '2020-07-03 09:13:10', 1, 1),
(541, 37, 'Giày dep bé gái-1', 'giay-dep-be-gai-1', '1.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:11', 1, '2022-04-05 11:23:21', 1, 1),
(542, 37, 'Giày dep bé gái-2', 'giay-dep-be-gai-2', '2.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:11', 1, '2020-07-03 09:13:11', 1, 1),
(543, 37, 'Giày dep bé gái-3', 'giay-dep-be-gai-3', '3.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:11', 1, '2020-07-03 09:13:11', 1, 1),
(544, 37, 'Giày dep bé gái-4', 'giay-dep-be-gai-4', '4.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:11', 1, '2020-07-03 09:13:11', 1, 1),
(545, 37, 'Giày dep bé gái-5', 'giay-dep-be-gai-5', '5.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:11', 1, '2020-07-03 09:13:11', 1, 1),
(546, 37, 'Giày dep bé gái-6', 'giay-dep-be-gai-6', '6.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:11', 1, '2020-07-03 09:13:11', 1, 1),
(547, 37, 'Giày dep bé gái-7', 'giay-dep-be-gai-7', '7.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:11', 1, '2020-07-03 09:13:11', 1, 1),
(548, 37, 'Giày dep bé gái-8', 'giay-dep-be-gai-8', '8.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:11', 1, '2020-07-03 09:13:11', 1, 1),
(549, 37, 'Giày dep bé gái-9', 'giay-dep-be-gai-9', '9.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:11', 1, '2020-07-03 09:13:11', 1, 1),
(550, 37, 'Giày dep bé gái-10', 'giay-dep-be-gai-10', '10.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:11', 1, '2020-07-03 09:13:11', 1, 1),
(551, 37, 'Giày dep bé gái-11', 'giay-dep-be-gai-11', '11.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:11', 1, '2020-07-03 09:13:11', 1, 1),
(552, 37, 'Giày dep bé gái-12', 'giay-dep-be-gai-12', '12.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:11', 1, '2020-07-03 09:13:11', 1, 1),
(553, 37, 'Giày dep bé gái-13', 'giay-dep-be-gai-13', '13.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:11', 1, '2020-07-03 09:13:11', 1, 1),
(554, 37, 'Giày dep bé gái-14', 'giay-dep-be-gai-14', '14.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:11', 1, '2020-07-03 09:13:11', 1, 1),
(555, 37, 'Giày dep bé gái-15', 'giay-dep-be-gai-15', '15.jpg', 'Chi tiết sản phẩm', 1, 259000.00, 259000.000, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:13:11', 1, '2020-07-03 09:13:11', 1, 1),
(578, 7, 'ÁO THUN T-SHIRT M-F 01', 'ao-thun-t-shirt-m-f-01', '1.jpg', 'ÁO THUN T-SHIRT M-F 01', 21, 499000.00, 377000.000, 'ÁO THUN T-SHIRT M-F 01', 'ÁO THUN T-SHIRT M-F 01', '2022-04-07 03:46:52', 1, NULL, NULL, 1),
(579, 4, 'Bộ thun bé trai ngắn Vàng', 'bo-thun-be-trai-ngan-vang', '4.jpg', 'Bộ thun bé trai ngắn Vàng', 1, 139000.00, 249000.000, 'Bộ thun bé trai ngắn Vàng', 'Bộ thun bé trai ngắn Vàng', '2022-04-07 03:48:21', 1, NULL, NULL, 1),
(580, 5, 'Áo khoác thun bé gái Xanh', 'ao-khoac-thun-be-gai-xanh', '6.jpg', 'Áo khoác thun bé gái Xanh', 9, 149000.00, 239000.000, 'Áo khoác thun bé gái Xanh', 'Áo khoác thun bé gái Xanh', '2022-04-07 03:49:47', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vhn_slider`
--

CREATE TABLE `vhn_slider` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã Slider',
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
-- Dumping data for table `vhn_slider`
--

INSERT INTO `vhn_slider` (`id`, `name`, `link`, `position`, `img`, `orders`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Khuyễn mãi hè 2020', 'http://domain.com/index.php?option=page&cat=khuyen-mai-he', 'slideshow', 'slider_1.jpg', 1, '2020-07-01 00:12:13', 1, '2022-05-20 06:50:48', 1, 1),
(2, 'Khuyễn mãi mùa khai giảng', 'http://domain.com/index.php?option=page&cat=khuyen-mai-mua-khai-giang', 'slideshow', 'slider_2.jpg', 1, '2020-07-01 00:12:13', 1, '2022-05-20 06:50:49', 1, 1),
(3, 'Khuyễn mãi giáng sinh', 'http://domain.com/index.php?option=page&cat=khuyen-giang-sinh', 'slideshow', 'slider_3.jpg', 1, '2020-07-01 00:12:13', 1, '2020-07-01 00:12:13', 1, 1),
(4, 'Khuyễn mãi Covid', 'http://domain.com/index.php?option=page&cat=khuyen-mai-covid', 'slideshow', 'slider_4.jpg', 1, '2020-07-01 00:12:13', 1, '2022-05-20 07:04:38', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vhn_topic`
--

CREATE TABLE `vhn_topic` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã chủ đề',
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
-- Dumping data for table `vhn_topic`
--

INSERT INTO `vhn_topic` (`id`, `name`, `slug`, `parentid`, `orders`, `metakey`, `metadesc`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Tin tức', 'tin-tuc', 0, 1, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:14:39', 1, '2020-07-03 09:14:39', 1, 1),
(2, 'Dịch vụ', 'dich-vu', 0, 2, 'Từ khóa SEO', 'Mô tả SEO', '2020-07-03 09:14:39', 1, '2020-07-03 09:14:39', 1, 1),
(3, 'Dịch vụ', 'dich-vu', 0, 1, 'agyj,dukyk', 'sykdiiidkty', '2022-04-06 02:13:50', 1, '2022-05-22 06:55:51', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vhn_user`
--

CREATE TABLE `vhn_user` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã tài khoản',
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
-- Dumping data for table `vhn_user`
--

INSERT INTO `vhn_user` (`id`, `fullname`, `username`, `password`, `email`, `gender`, `phone`, `img`, `roles`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Quản trị', 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'admin@gmail.com', 1, '0987654367', 'admin.jpg', 1, '2020-07-01 00:16:03', 1, '2020-07-01 00:16:03', 1, 1),
(2, 'Khách hàng', 'khachhang', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'khachhang@gmail.com', 1, '0987654367', 'khachhang.jpg', 0, '2020-07-01 00:16:03', 1, '2020-07-01 00:16:03', 1, 1),
(3, 'Vũ Hoài Nam', 'moithem', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'vuhoainam@gmail.com', 1, '0382158065', NULL, 0, '2022-05-20 07:38:05', 1, '2022-05-20 08:02:58', 1, 1),
(6, 'Vũ Hoài Nam', 'moithem', '8cb2237d0679ca88db6464eac60da96345513964', 'vuhoainam@gmail.com', 1, '0382158065', NULL, 0, '2022-05-20 07:54:16', 1, '2022-05-20 08:02:54', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vhn_cart`
--
ALTER TABLE `vhn_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vhn_category`
--
ALTER TABLE `vhn_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vhn_contact`
--
ALTER TABLE `vhn_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vhn_menu`
--
ALTER TABLE `vhn_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vhn_order`
--
ALTER TABLE `vhn_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vhn_orderdetail`
--
ALTER TABLE `vhn_orderdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vhn_post`
--
ALTER TABLE `vhn_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vhn_product`
--
ALTER TABLE `vhn_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vhn_slider`
--
ALTER TABLE `vhn_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vhn_topic`
--
ALTER TABLE `vhn_topic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vhn_user`
--
ALTER TABLE `vhn_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vhn_cart`
--
ALTER TABLE `vhn_cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã sản phẩm';

--
-- AUTO_INCREMENT for table `vhn_category`
--
ALTER TABLE `vhn_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã Loại', AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `vhn_contact`
--
ALTER TABLE `vhn_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã liên hệ', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vhn_menu`
--
ALTER TABLE `vhn_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã Menu', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vhn_order`
--
ALTER TABLE `vhn_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã đơn hàng', AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `vhn_orderdetail`
--
ALTER TABLE `vhn_orderdetail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã CT Đơn hàng', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vhn_post`
--
ALTER TABLE `vhn_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã bài viết', AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `vhn_product`
--
ALTER TABLE `vhn_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã sản phẩm', AUTO_INCREMENT=581;

--
-- AUTO_INCREMENT for table `vhn_slider`
--
ALTER TABLE `vhn_slider`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã Slider', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vhn_topic`
--
ALTER TABLE `vhn_topic`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã chủ đề', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vhn_user`
--
ALTER TABLE `vhn_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã tài khoản', AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
