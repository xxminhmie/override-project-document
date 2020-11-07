-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: shoe
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `bill_id` varchar(20) NOT NULL COMMENT 'Mã hóa đơn',
  `customer_id` varchar(20) NOT NULL COMMENT 'Mã khách hàng (có thể null)',
  `create_date` datetime NOT NULL COMMENT 'Ngày lập',
  `update_date` datetime NOT NULL COMMENT 'Cập nhật lần cuối',
  `discount` decimal(15,2) NOT NULL COMMENT 'Tổng giá trị chiết khấu',
  `total` int(10) NOT NULL COMMENT 'Tổng giá trị bill phải trả sau khi tính qua tất cả các khoảng.',
  `status` varchar(100) NOT NULL COMMENT 'Tình trạng hóa đơn. Khoảng giá trị: "pending, success, cancel"',
  PRIMARY KEY (`bill_id`),
  KEY `fk_bill_customer` (`customer_id`),
  CONSTRAINT `fk_bill_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_item`
--

DROP TABLE IF EXISTS `bill_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_item` (
  `bill_id` varchar(20) NOT NULL COMMENT 'Mã hóa đơn',
  `shop_sku` varchar(50) NOT NULL COMMENT 'Mã stock keeping unit do hệ thống laz tự động đặt. Khóa ShopSku là duy nhất',
  `seller_sku` varchar(50) NOT NULL COMMENT 'Mã stock keeping unit do người dùng đặt hoặc hệ thống tự tạo khi người dùng không đặt. Mã SellerSku là duy nhất',
  `number` int(10) NOT NULL COMMENT 'Số lượng',
  `price` decimal(15,2) NOT NULL COMMENT 'Giá tiền sản phẩm',
  `paid_price` decimal(15,2) NOT NULL COMMENT 'Số tiền phải trả, đã qua chiết khấu',
  PRIMARY KEY (`bill_id`,`shop_sku`),
  KEY `fk_billitem_sku` (`shop_sku`),
  CONSTRAINT `fk_billitem_bill` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_billitem_sku` FOREIGN KEY (`shop_sku`) REFERENCES `sku` (`shop_sku`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_item`
--

LOCK TABLES `bill_item` WRITE;
/*!40000 ALTER TABLE `bill_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` varchar(20) NOT NULL COMMENT 'Mã loại. Tương đương primary_category trong lazop.',
  `category_name` varchar(100) NOT NULL COMMENT 'Tên loại giày',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` varchar(20) NOT NULL COMMENT 'Mã khách hàng',
  `name` varchar(100) NOT NULL COMMENT 'Tên khách hàng',
  `phone_number` varchar(12) NOT NULL COMMENT 'Số điện thoại',
  `address` varchar(255) NOT NULL COMMENT 'Địa chỉ',
  `email` varchar(100) NOT NULL COMMENT 'Email',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_received_note`
--

DROP TABLE IF EXISTS `goods_received_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_received_note` (
  `grn_id` varchar(20) NOT NULL COMMENT 'Mã nhập hàng',
  `description` text NOT NULL COMMENT 'Chi tiết, nội dung, lý do của đơn nhập hàng.',
  `date_received` datetime NOT NULL COMMENT 'Ngày nhận hàng',
  `provider` varchar(50) NOT NULL COMMENT 'Tên đơn vị cung cấp',
  `telephone` varchar(12) NOT NULL COMMENT 'Số điện thoại',
  `address` varchar(255) NOT NULL COMMENT 'Địa chỉ nơi cung cấp',
  `status` varchar(20) NOT NULL COMMENT 'Trạng thái phếu nhập. Khoảng giá trị: “pending, success, canceled”',
  PRIMARY KEY (`grn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_received_note`
--

LOCK TABLES `goods_received_note` WRITE;
/*!40000 ALTER TABLE `goods_received_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_received_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_received_note_item`
--

DROP TABLE IF EXISTS `goods_received_note_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_received_note_item` (
  `grn_id` varchar(20) NOT NULL COMMENT 'Mã nhập hàng',
  `shop_sku` varchar(50) NOT NULL COMMENT 'Mã stock keeping unit do hệ thống laz tự động đặt. Khóa ShopSku là duy nhất',
  `seller_sku` varchar(50) NOT NULL COMMENT 'Mã stock keeping unit do người dùng đặt hoặc hệ thống tự tạo khi người dùng không đặt. Mã SellerSku là duy nhất',
  `name` varchar(255) NOT NULL COMMENT 'Tên sản phẩm',
  `color` varchar(255) NOT NULL COMMENT 'Màu',
  `size` varchar(20) NOT NULL COMMENT 'Size giày. Mẫu dữ liệu: EU:39',
  `quantity` int(10) NOT NULL COMMENT 'Số lượng',
  `price` decimal(15,2) NOT NULL COMMENT 'Giá nhập của sản phẩm',
  PRIMARY KEY (`grn_id`,`shop_sku`),
  KEY `fk_grni_sku` (`shop_sku`),
  CONSTRAINT `fk_grni_grn` FOREIGN KEY (`grn_id`) REFERENCES `goods_received_note` (`grn_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_grni_sku` FOREIGN KEY (`shop_sku`) REFERENCES `sku` (`shop_sku`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_received_note_item`
--

LOCK TABLES `goods_received_note_item` WRITE;
/*!40000 ALTER TABLE `goods_received_note_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_received_note_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `image` varchar(255) NOT NULL COMMENT 'URL của hình ảnh',
  PRIMARY KEY (`image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_product`
--

DROP TABLE IF EXISTS `image_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_product` (
  `shop_sku` varchar(50) NOT NULL COMMENT 'Mã stock keeping unit do hệ thống laz tự động đặt. Khóa ShopSku là duy nhất',
  `image` varchar(255) NOT NULL COMMENT 'Url của hình ảnh sau khi upload lên laz. Laz sẽ trả về 1 url của hình đó. Sử dụng hình ảnh nay để thêm vào SKU',
  PRIMARY KEY (`shop_sku`,`image`),
  KEY `fk_imageproduct_image` (`image`),
  CONSTRAINT `fk_imageproduct_image` FOREIGN KEY (`image`) REFERENCES `image` (`image`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_imageproduct_sku` FOREIGN KEY (`shop_sku`) REFERENCES `sku` (`shop_sku`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_product`
--

LOCK TABLES `image_product` WRITE;
/*!40000 ALTER TABLE `image_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laz_order`
--

DROP TABLE IF EXISTS `laz_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laz_order` (
  `order_id` varchar(20) NOT NULL COMMENT 'Mã đơn hàng. Lấy từ lazop',
  `create_date` datetime NOT NULL COMMENT 'Ngày lập',
  `update_date` datetime NOT NULL COMMENT 'Cập nhật lần cuối',
  `payment_method` varchar(100) NOT NULL COMMENT 'Phương thức thanh toán',
  `shipping_fee` decimal(15,2) NOT NULL COMMENT 'Tổng phí ship của đơn hàng còn phải trả',
  `price` int(10) NOT NULL COMMENT 'Tổng giá trị đơn hàng',
  `status` varchar(20) NOT NULL COMMENT 'Trạng thái order. Khoảng giá trị "unpair, pending, canceled, ready_to_ship, delivered, returned, shipped, failed"',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laz_order`
--

LOCK TABLES `laz_order` WRITE;
/*!40000 ALTER TABLE `laz_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `laz_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laz_order_item`
--

DROP TABLE IF EXISTS `laz_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laz_order_item` (
  `order_id` varchar(20) NOT NULL COMMENT 'Mã đơn hàng',
  `shop_sku` varchar(50) NOT NULL COMMENT 'Mã stock keeping unit do hệ thống laz tự động đặt. Khóa ShopSku là duy nhất',
  `seller_sku` varchar(50) NOT NULL COMMENT 'Mã stock keeping unit do người dùng đặt hoặc hệ thống tự tạo khi người dùng không đặt. Mã SellerSku là duy nhất',
  `name` varchar(100) NOT NULL COMMENT 'Tên sản phẩm. Tránh việc sản phẩm cùng id đó update tên sau này.',
  `variation` varchar(255) NOT NULL COMMENT 'Thể hiện tên của item. Dữ liệu mẫu: “Nhóm màu: màu hồng”',
  `item_price` decimal(15,2) NOT NULL COMMENT 'Giá sản phẩm chưa qua xử lý.',
  `paid_price` decimal(15,2) NOT NULL COMMENT 'Đơn giá. Giá tiền người mua phải trả sau khi đi qua tất cả giảm giá.',
  `quantity` int(10) NOT NULL COMMENT 'Số lượng',
  PRIMARY KEY (`order_id`,`shop_sku`),
  KEY `fk_orderitem_sku` (`shop_sku`),
  CONSTRAINT `fk_order_item_order` FOREIGN KEY (`order_id`) REFERENCES `laz_order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderitem_sku` FOREIGN KEY (`shop_sku`) REFERENCES `sku` (`shop_sku`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laz_order_item`
--

LOCK TABLES `laz_order_item` WRITE;
/*!40000 ALTER TABLE `laz_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `laz_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permision`
--

DROP TABLE IF EXISTS `permision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_name` varchar(100) DEFAULT NULL,
  `action_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permision`
--

LOCK TABLES `permision` WRITE;
/*!40000 ALTER TABLE `permision` DISABLE KEYS */;
INSERT INTO `permision` VALUES (1,'Quản lý kho','WAREHOUSE'),(2,'Quản lý sản phẩm','PRODUCT'),(3,'Quản lý laz order','LAZORDER'),(4,'Quản lý hóa đơn local','LOCALBILL'),(5,'Quản lý khách hàng local','LOCALCUSTOMER'),(6,'Thống kê','ANALYSIS');
/*!40000 ALTER TABLE `permision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` varchar(20) NOT NULL COMMENT 'Mã giày',
  `category_id` varchar(20) NOT NULL COMMENT 'Mã loại',
  `seller_id` int(11) DEFAULT NULL,
  `brand` varchar(50) NOT NULL COMMENT 'Tên nhãn hiệu. Mặc định là “No Brand”',
  `shoes_name` varchar(255) NOT NULL COMMENT 'Tên giày',
  `short_desciption` text NOT NULL COMMENT 'Mô tả ngắn về sản phẩm',
  `description` text NOT NULL COMMENT 'Mô tả sản phẩm',
  `status` varchar(20) NOT NULL COMMENT 'Khoảng giá trị:  “active, inactive, deleted”',
  PRIMARY KEY (`product_id`),
  KEY `fk_product_category` (`category_id`),
  KEY `fk_product_seller_idx` (`seller_id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_seller` FOREIGN KEY (`seller_id`) REFERENCES `seller_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Owner','Chủ gian hàng'),(2,'Staff','Nhân viên gian hàng');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permision`
--

DROP TABLE IF EXISTS `role_permision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permision` (
  `role_id` int(11) NOT NULL,
  `permision_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL COMMENT 'Giá trị khả dụng: 1,0. Thể hiện cho trạng thái kích hoạt và vô hiệu hóa permision cho role',
  KEY `fk_role_permision_role_idx` (`role_id`),
  KEY `fk_role_permision_permision_idx` (`permision_id`),
  CONSTRAINT `fk_role_permision_permision` FOREIGN KEY (`permision_id`) REFERENCES `permision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_permision_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permision`
--

LOCK TABLES `role_permision` WRITE;
/*!40000 ALTER TABLE `role_permision` DISABLE KEYS */;
INSERT INTO `role_permision` VALUES (1,1,1),(1,2,1),(1,3,1),(1,4,1),(1,5,1),(1,6,1),(2,1,1),(2,2,1),(2,3,1),(2,4,1),(2,5,1),(2,6,0);
/*!40000 ALTER TABLE `role_permision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_account`
--

DROP TABLE IF EXISTS `seller_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `phone_number` varchar(13) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `laz_app_key` varchar(255) DEFAULT NULL,
  `laz_app_secret` varchar(255) DEFAULT NULL,
  `laz_access_token` varchar(255) DEFAULT NULL,
  `laz_access_expires` int(11) DEFAULT NULL COMMENT 'Thời hạn của token. Tính bằng giây. Tồn tại 7 ngày đối với app test. 30 ngày đối với app online.',
  `laz_refresh_token` varchar(255) DEFAULT NULL,
  `laz_refresh_expires` int(11) DEFAULT NULL COMMENT 'Thời hạn của refresh token. Tính bằng giây. Tồn tại 30 ngày đối với app test. 180 ngày đối với app online.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_account`
--

LOCK TABLES `seller_account` WRITE;
/*!40000 ALTER TABLE `seller_account` DISABLE KEYS */;
INSERT INTO `seller_account` VALUES (1,'Tran','Long','01864173116','tranphanthanhlong18@gmail.com','Password789','122973','Yw6g8EvzqBQSF628Q5ZwcC2uNiI60ZSS',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `seller_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_role`
--

DROP TABLE IF EXISTS `seller_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller_role` (
  `seller_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`seller_id`,`role_id`),
  KEY `fk_seller_role_role_idx` (`role_id`),
  CONSTRAINT `fk_seller_role_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_seller_role_seller` FOREIGN KEY (`seller_id`) REFERENCES `seller_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_role`
--

LOCK TABLES `seller_role` WRITE;
/*!40000 ALTER TABLE `seller_role` DISABLE KEYS */;
INSERT INTO `seller_role` VALUES (1,1);
/*!40000 ALTER TABLE `seller_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sku`
--

DROP TABLE IF EXISTS `sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sku` (
  `shop_sku` varchar(50) NOT NULL COMMENT 'Mã stock keeping unit do hệ thống laz tự động đặt. Khóa ShopSku là duy nhất',
  `product_id` varchar(20) NOT NULL COMMENT 'Mã giày',
  `seller_sku` varchar(50) NOT NULL COMMENT 'Mã stock keeping unit do người dùng đặt hoặc hệ thống tự tạo khi người dùng không đặt. Mã SellerSku là duy nhất',
  `available` int(10) NOT NULL COMMENT 'Số lượng có thể bán được còn lại của stock keeping unit.',
  `quantity` int(10) NOT NULL COMMENT 'Số lượng của stock keeping unit.',
  `color_family` varchar(50) NOT NULL COMMENT 'Màu chính của sản phẩm, do người dùng nhập. Mẫu dữ liệu:  Màu trắng.',
  `size` varchar(20) NOT NULL COMMENT 'Size giày. Mẫu dữ liệu: EU:39',
  `height` varchar(20) NOT NULL COMMENT 'Chiều cao cục hàng sau khi đóng gói. Tính theo cm.',
  `width` varchar(20) NOT NULL COMMENT 'Chiều rộng gói hàng sau khi đóng gói. Tính theo cm.',
  `length` varchar(20) NOT NULL COMMENT 'Chiều dài gói hàng sau khi đóng gói. Tính theo cm.',
  `weight` varchar(20) NOT NULL COMMENT 'Cân nặng gói hàng sau khi đóng gói. Tính theo kg. Mẫu dữ liệu: 1',
  `price` decimal(15,2) NOT NULL COMMENT 'Giá gốc',
  `special_price` decimal(15,2) NOT NULL COMMENT 'Giá bán',
  `special_from_time` datetime NOT NULL COMMENT 'Ngày bắt đầu áp dụng giá bán. (giá bán đuuợc giảm từ giá gốc)',
  `special_to_time` datetime NOT NULL COMMENT 'Ngày kết thúc áp dụng giá bán',
  `status` varchar(20) NOT NULL COMMENT 'Khoảng giá trị:  “active, inactive, deleted”',
  PRIMARY KEY (`shop_sku`),
  KEY `fk_sku_product` (`product_id`),
  CONSTRAINT `fk_sku_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sku`
--

LOCK TABLES `sku` WRITE;
/*!40000 ALTER TABLE `sku` DISABLE KEYS */;
/*!40000 ALTER TABLE `sku` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-07 14:36:26
