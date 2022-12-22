-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2022-12-20 16:28:25
-- 伺服器版本： 10.4.24-MariaDB
-- PHP 版本： 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `beauty_cos`
--

-- --------------------------------------------------------

--
-- 資料表結構 `administrator`
--

CREATE TABLE `administrator` (
  `Member_ID` varchar(10) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `E-mail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `administrator`
--

INSERT INTO `administrator` (`Member_ID`, `Name`, `E-mail`) VALUES
('1', 'janne Lin', 'qq@gmail.com'),
('3', 'Cathy Bing', 'xyz.jessie0918@gmail.com'),
('4', 'Rose Geller', '');

-- --------------------------------------------------------

--
-- 資料表結構 `contact`
--

CREATE TABLE `contact` (
  `Seller_Member_ID` varchar(10) NOT NULL,
  `Cust_id` varchar(10) NOT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `contact`
--

INSERT INTO `contact` (`Seller_Member_ID`, `Cust_id`, `message`) VALUES
('2', '6', 'Hello'),
('2', '7', 'Hi'),
('2', '8', 'Are still having any stock of the product?');

-- --------------------------------------------------------

--
-- 資料表結構 `coupon`
--

CREATE TABLE `coupon` (
  `Coupon_ID` varchar(10) NOT NULL,
  `discount` float NOT NULL,
  `Start_date` date DEFAULT NULL,
  `price_limit` int(10) DEFAULT NULL,
  `NumberOfUsage` int(10) DEFAULT NULL,
  `Seller_ID` varchar(10) NOT NULL,
  `Admin_ID` varchar(10) NOT NULL,
  `End_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `coupon`
--

INSERT INTO `coupon` (`Coupon_ID`, `discount`, `Start_date`, `price_limit`, `NumberOfUsage`, `Seller_ID`, `Admin_ID`, `End_date`) VALUES
('001', 0.8, '2022-12-07', 300, 1, '2', '1', '2022-12-31'),
('002', 0.7, '2022-12-01', 100, 0, '5', '1', '2022-01-07');

-- --------------------------------------------------------

--
-- 資料表結構 `customer`
--

CREATE TABLE `customer` (
  `Member_ID` varchar(10) NOT NULL,
  `Purse_money` int(11) DEFAULT NULL,
  `Seller_Member_ID` varchar(10) NOT NULL,
  `Coupon_id` varchar(10) NOT NULL,
  `Admin_Member_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `customer`
--

INSERT INTO `customer` (`Member_ID`, `Purse_money`, `Seller_Member_ID`, `Coupon_id`, `Admin_Member_ID`) VALUES
('6', 0, '2', '001', '1'),
('7', 0, '5', '002', '1'),
('8', 0, '2', '001', '1');

-- --------------------------------------------------------

--
-- 資料表結構 `cust_address`
--

CREATE TABLE `cust_address` (
  `address` varchar(50) NOT NULL,
  `Cust_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `cust_address`
--

INSERT INTO `cust_address` (`address`, `Cust_id`) VALUES
('1007 York St, Denver,CO 80206', '6'),
('11600 W 2nd Pl, Lakewood, CO 80228', '7'),
('5195 Wadsworth Blvd, Arvada, CO 80002', '8');

-- --------------------------------------------------------

--
-- 資料表結構 `list`
--

CREATE TABLE `list` (
  `order_id` varchar(8) NOT NULL,
  `product_id` varchar(8) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `list`
--

INSERT INTO `list` (`order_id`, `product_id`, `quantity`) VALUES
('00000001', '000001', 1),
('00000002', '000002', 1),
('00000003', '000001', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `ID` varchar(10) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Phone No` varchar(20) NOT NULL,
  `NickName` varchar(20) NOT NULL,
  `E-mail` varchar(50) DEFAULT NULL,
  `Password` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`ID`, `FirstName`, `LastName`, `Phone No`, `NickName`, `E-mail`, `Password`) VALUES
('1', 'Jessie', 'Hsu', '0986817298', 'Jessie', 'hsusiyan@gmail.com', 123),
('2', 'Marry', 'Jane', '0918306026', 'Jane', '', 0),
('3', 'Cathy', 'Bing', '0911785423', 'Catie', '', 11),
('4', 'Rose', 'Geller', '0902389081', 'Rose', '', 1234),
('5', 'Jessica', 'Buffay', '0916489854', 'Jessica', 'asky@gmail.com', 100),
('6', 'Fred', 'Winfred', '0915487754', 'Fred', 'FredW@gmail.com', 45663),
('7', 'Jimme', 'Derick', '0987444854', 'Jimme', 'JimmeD@gmail.com', 982),
('8', 'Johnny', 'Marvin', '0953489818', 'Johnny', 'Johnnyss@gmail.com', 456311);

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `ID` varchar(8) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Price` int(11) NOT NULL,
  `Stock` int(11) DEFAULT NULL,
  `image_src` text DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `review` text DEFAULT NULL,
  `Seller_member_id` varchar(10) NOT NULL,
  `Shop_id` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`ID`, `Name`, `Price`, `Stock`, `image_src`, `detail`, `review`, `Seller_member_id`, `Shop_id`) VALUES
('000001', 'may 櫻花漸層唇膏', 300, 9, 'https://cf.shopee.tw/file/18e8cea4f6d0062c49bde9a9255f4979', '🌸變色:可根據嘴唇的溫度和濕度調整唇顏色的深度。\n🌸天然安全:以精油、蜂蠟、種子油製成,可讓您的嘴唇保持水分。\n🌸效果:防水、持久保濕、防嘴唇乾裂、健康安全。\n🌸保濕唇膏 + 護唇膏:不僅呵護嘴唇,而且您也可以享受嘴唇豐富的色素。\n🌸包裝內含:3 種顏色果凍唇膏', '', '2', '001'),
('000002', '十色眼影盤 大地色 人魚色 南瓜西柚色 啞光珠光', 29, 5, 'https://th.bing.com/th/id/OIP.6eL4v-VA5Zz4kzBOhObfaQHaHa?pid=ImgDet&rs=1', '一盒多用\n臥蠶/眼影/一盒搞定方便攜帶\n粉質細膩\n輕滑透薄，上色均勻，不卡粉\n一盤十色', '', '5', '002'),
('000003', '零毛孔美肌柔焦棒', 490, 6, 'https://static.popdaily.com.tw/u/202107/d764971f-09ce-4918-a563-068a6aed1d48.jpeg', '10秒快速提亮潤色，特殊彈性球狀粉體，填補瑕疵平整肌膚。\n毛孔隱形，修飾膚色不均與暗沉，展現粉嫩透白光澤肌。\n添加玻尿酸與Ceramide保濕潤澤、虎耳草萃取物緊緻毛孔、高分子有機矽彈性粉體抑制油光。\n無Paraben防腐劑、無酒精、無香料。', '', '5', '002'),
('000004', '花漾腮紅(小花腮紅) Cheek Pop 小花腮紅', 920, 6, 'https://tshop.r10s.com/be7/58b/ceac/dcfc/f041/9c14/aca5/112ce99dd80242ac110002.jpg', '最新專利「慢火精緻烘焙技術(new patented slow-bake process)」，讓腮紅由液狀轉為粉狀，顏色更為持久，同時提供最純淨自然的紅潤色調，絕對顯色不脫妝。這款腮紅以腮紅刷輕刷可以呈現粉霧的繽紛感，用指腹疊擦則有絲滑乳霜的豐盈質地。它能輕鬆呈現持久的頰色，全天呈現光采無瑕的美麗肌膚，呈現繽紛時髦的紅潤臉頰，是春天時尚妝扮的完美搭配。', '', '2', '001'),
('000005', 'KISSME開架超！持久極細抗暈眼線液筆', 439, 6, 'https://api.watsons.com.tw/medias/prd-side-225225.jpg?context=bWFzdGVyfGltYWdlc3wxMDMyNDZ8aW1hZ2UvanBlZ3xoMjcvaGYwLzkzMDI2MDE4MjYzMzQvV1RDVFctMjI1MjI1LXNpZGUuanBnfGY4ZDQxM2NkYTIxNWE4YjIzNWZkNDE3YWIxN2UyMWQwZWNmYTE4Zjk0NDllMjg4MWRiMjQ2MzMxZGI5ZTMyNTU', '從眼頭到眼尾描繪精緻極細線條，新手和手殘黨也可以快速上手，\n速乾成分，一筆完妝不沾眼皮，迅速打造完美深邃眼神，\n新持久成分和新高密着成分，持久顯色不暈染，\n全日保持完美妝容，直到夜晚也持久不脫妝\n從早到晚，綻放完美深邃眼神', '', '2', '001'),
('000006', 'KISSME專屬型色眉彩膏R', 320, 9, 'https://api.watsons.com.tw/medias/prd-side-228462.jpg?context=bWFzdGVyfGltYWdlc3wxMDUzOTR8aW1hZ2UvanBlZ3xoY2YvaDY3Lzk0MDA4MjIzOTkwMDYvV1RDVFctMjI4NDYyLXNpZGUuanBnfDQ3YzI1M2RiYzEwNTBlZWYyYzBjNWFjYTM3MTg4MjIwZGZiMTdhMmUwNzljZjRjYjA4OGZlYTQ1ZDliYTMxNGE', '高顯色度，搭配髮色，明亮修飾眉毛光澤\n長時間不掉色，耐汗、抗磨擦\n精巧型螺旋刷頭，輕輕刷拭即能完整著色，並且能避免染眉膏直接接觸到肌膚的困擾添加維他命B5(保護眉毛成分)，使眉毛具有光澤且強韌有彈性。', '', '5', '002'),
('000007', '飛激長瞬翹防水睫毛膏(黑)', 390, 10, 'https://th.bing.com/th/id/R.dae1ac2560b85e10d5278fe277bf4fd3?rik=9DXRjzSqnNWRyQ&riu=http%3a%2f%2fdiz36nn4q02zr.cloudfront.net%2fwebapi%2fimagesV3%2fOriginal%2fSalePage%2f4623912%2f0%2f121403%3fv%3d1&ehk=I%2btR283Hhab8urANFb%2bQ%2bSu1pWDz1EkF0Vypurinfvc%3d&risl=&pid=ImgRaw&r=0', '被譽為開架美睫霸主的飛激長瞬翹防水睫毛膏，以傲人的睫毛纖長力在美妝圈大受好評。瞬翹定型膏體和無重力纖維一舉打造長時防油、抗熱、定翹等多種功效，搭配最適合亞洲人眼型的細緻纖型長刷頭、密度適中的纖細短刷毛，不但能輕鬆刷出持久淨長翹睫，這次還換上了超值得收藏的加倍佳限定包裝，勢必引發一場史上最甜蜜的囤貨風潮！', '', '5', '002'),
('000008', 'Eyecon藝想調色眼彩盤(火星)', 980, 9, 'https://th.bing.com/th/id/R.d492c6d1b71ab30e12d080d897d19d30?rik=u8%2fVPTkA4mLDAw&riu=http%3a%2f%2fdiz36nn4q02zr.cloudfront.net%2fwebapi%2fimagesV3%2fOriginal%2fSalePage%2f7158536%2f0%2f637908880998770000%3fv%3d1&ehk=zlSzfQsHvwafR8hP%2b%2f%2b3a1lI7BjfeESZEWeEyo9lxyk%3d&risl=&pid=ImgRaw&r=0', 'KAIBEAUTY全新上市的【EYECON藝想調色眼彩盤】靈感來自紅色行星——火星，並結合宇宙星系的神秘元素，運用微妙且富有層次的光澤及色系，完美演繹多元眼妝，營造各式謎樣魅惑氣場。\n', '', '2', '001'),
('000009', '深玫絲絨眼影盒', 360, 5, 'https://image.presslogic.com/girls.presslogic.com/wp-content/uploads/2018/12/181120.jpg', '如花瓣層層交疊般的暗濁色澤\n打造深邃立體的魅惑眼眸', '', '5', '002'),
('000010', 'CHANEL 香奈兒 1號紅色山茶花唇頰蜜', 1650, 8, 'https://th.bing.com/th/id/OIP.o_uk1H33KDaOMjoykmdEWwAAAA?pid=ImgDet&rs=1', '全新多用途潤色唇頰蜜添加紅色山茶花精萃油與草本蠟質，如乳霜般滋潤，以指尖沾取後輕點雙唇或顴骨，綻放紅潤自然的好氣色。豐潤質地一觸即化、滑順好推，擦上後立即化開並注入舒緩與水潤能量。', '', '5', '002'),
('000011', 'SHISEIDO 資生堂國際櫃 激抗痕亮采緊緻乳(白金乳)', 3200, 4, 'https://flipa-production.s3-ap-southeast-1.amazonaws.com/uploads/product_image/106052/1/_250x250_106052_20220713091449KhhBHPgBdS.png', '激抗痕亮采緊緻乳除了有白金水獨家成分外，更使用溫和滋潤的澳洲堅果油來補充、肌膚皮脂膜，作為你保養的最後一步，搭配使用保養更加乘。', '', '2', '001'),
('000012', 'Visée AVANT 隨心玩美眼影', 230, 4, 'https://content.shopback.com/tw/wp-content/uploads/2019/01/08002055/11ace8b15854ab3a294904.jpg', '塗抹一次就能展演美麗呈色效果，打造令人印象深刻雙眸的單色眼影。', '', '2', '001'),
('000013', '3合1持久造型眉筆 EYEBROW POWDER & PENCIL EX', 520, 8, 'https://img.jollybuy.com/tiaotiao_lazada/goods/ca3d2282d79f45cdbc5a446b6bfb9f0a_Q50.jpg', '眉筆、眉粉、眉刷三合一功能，3步驟輕鬆打造立體美人眉。', '', '2', '001'),
('000014', 'innisfree 無油無慮礦物控油蜜粉 No sebum mineral powder', 240, 6, 'https://flipa-production.s3-ap-southeast-1.amazonaws.com/uploads/product_image/47181/1/_250x250_47181_20220419065629dbIcHJhIED.jpg', '【 限量 】2022史努比限定版', '', '5', '002'),
('000015', '透頰潤唇兩用霜Lip & Cheek Gel', 320, 8, 'https://flipa-production.s3-ap-southeast-1.amazonaws.com/uploads/product_image/77616/1/_250x250_77616_20201224015902eLsEGUSspG.jpg', '滑順質地 與肌膚溫度融合的膠狀質地，抹上立即與肌膚貼合 創造如同由肌膚底層透出來的紅潤妝感!', '', '2', '001'),
('000016', 'LUDEYA 露蒂雅 3合1微臻全能氣墊粉餅', 1980, 6, 'https://flipa-production.s3-ap-southeast-1.amazonaws.com/uploads/product_image/93636/1/_250x250_93636_20191119015652wEojuTUHAC.jpg', '彩妝史上超進化  精品級全能氣墊，變形金剛級氣墊粉餅，智慧旋轉雙層設計', '', '5', '002'),
('000017', '彩妝史上超進化  精品級全能氣墊，變形金剛級氣墊粉餅，智慧旋轉雙層設計', 900, 5, 'https://flipa-production.s3-ap-southeast-1.amazonaws.com/uploads/product_image/81514/1/_250x250_81514.jpg', '商品特長 ◆色彩持久不脫落。*添加服貼型油質、皮脂吸附粉體 ◆通過10小時持色測試。 ◆不受汗水影響的防水型眉采', '', '2', '001');

-- --------------------------------------------------------

--
-- 資料表結構 `rated`
--

CREATE TABLE `rated` (
  `Seller_Member_ID` varchar(10) NOT NULL,
  `Cust_id` varchar(10) NOT NULL,
  `star` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `rated`
--

INSERT INTO `rated` (`Seller_Member_ID`, `Cust_id`, `star`) VALUES
('2', '6', 4),
('5', '7', 3),
('2', '8', 4);

-- --------------------------------------------------------

--
-- 資料表結構 `report`
--

CREATE TABLE `report` (
  `Admin_Member_ID` varchar(10) NOT NULL,
  `Cust_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `report`
--

INSERT INTO `report` (`Admin_Member_ID`, `Cust_id`) VALUES
('1', '6'),
('1', '7'),
('1', '8');

-- --------------------------------------------------------

--
-- 資料表結構 `seller`
--

CREATE TABLE `seller` (
  `Seller_Member_ID` varchar(10) NOT NULL,
  `Admin_Member_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `seller`
--

INSERT INTO `seller` (`Seller_Member_ID`, `Admin_Member_ID`) VALUES
('2', '1'),
('5', '1');

-- --------------------------------------------------------

--
-- 資料表結構 `shop`
--

CREATE TABLE `shop` (
  `ID` varchar(8) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Seller_member_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `shop`
--

INSERT INTO `shop` (`ID`, `Name`, `Seller_member_id`) VALUES
('001', 'Maggie_shop', '2'),
('002', 'Kela-shop', '5');

-- --------------------------------------------------------

--
-- 資料表結構 `_order`
--

CREATE TABLE `_order` (
  `order_id` varchar(8) NOT NULL,
  `Shipping_fee` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `Start_date` date NOT NULL,
  `state` text NOT NULL,
  `total_price` int(11) NOT NULL,
  `coupon_id` varchar(10) DEFAULT NULL,
  `Seller_member_id` varchar(10) NOT NULL,
  `Cust_id` varchar(10) NOT NULL,
  `order_location` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `_order`
--

INSERT INTO `_order` (`order_id`, `Shipping_fee`, `address`, `Start_date`, `state`, `total_price`, `coupon_id`, `Seller_member_id`, `Cust_id`, `order_location`) VALUES
('00000001', 99, '1007 York St, Denver,CO 80206', '2022-12-08', 'acknowledge an order', 350, '001', '2', '6', 'Taipei'),
('00000002', 130, '11600 W 2nd Pl, Lakewood, CO 80228', '2022-10-25', 'order complete', 600, '002', '5', '7', 'Taichung'),
('00000003', 100, '5195 Wadsworth Blvd, Arvada, CO 80002', '2022-11-25', 'product had been transmitted', 400, '001', '2', '8', 'Shanghai');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`Member_ID`) USING BTREE;

--
-- 資料表索引 `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`Seller_Member_ID`,`Cust_id`),
  ADD KEY `ID_Cust_in_contact_relation` (`Cust_id`);

--
-- 資料表索引 `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`Coupon_ID`),
  ADD KEY `ID_Seller_in_Coupon` (`Seller_ID`),
  ADD KEY `ID_admin_in_Coupon` (`Admin_ID`);

--
-- 資料表索引 `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Member_ID`),
  ADD KEY `ID_coupon_in_Customerr` (`Coupon_id`),
  ADD KEY `Admin_id` (`Admin_Member_ID`) USING BTREE,
  ADD KEY `ID_Seller` (`Seller_Member_ID`);

--
-- 資料表索引 `cust_address`
--
ALTER TABLE `cust_address`
  ADD PRIMARY KEY (`address`,`Cust_id`),
  ADD KEY `FK_Customer` (`Cust_id`);

--
-- 資料表索引 `list`
--
ALTER TABLE `list`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `FK_Product_id` (`product_id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Product_FK_Seller` (`Seller_member_id`),
  ADD KEY `FK_Shop` (`Shop_id`);

--
-- 資料表索引 `rated`
--
ALTER TABLE `rated`
  ADD KEY `ID_Cust_in_rated_relation` (`Cust_id`),
  ADD KEY `Seller_Member_ID` (`Seller_Member_ID`,`Cust_id`) USING BTREE;

--
-- 資料表索引 `report`
--
ALTER TABLE `report`
  ADD KEY `ID_Cust_in_report_relation` (`Cust_id`),
  ADD KEY `Admin_Member_ID` (`Admin_Member_ID`,`Cust_id`) USING BTREE;

--
-- 資料表索引 `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`Seller_Member_ID`),
  ADD KEY `Admin_Member_ID` (`Admin_Member_ID`) USING BTREE;

--
-- 資料表索引 `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Seller` (`Seller_member_id`);

--
-- 資料表索引 `_order`
--
ALTER TABLE `_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `FK_Coupon` (`coupon_id`),
  ADD KEY `Order_FK_Seller` (`Seller_member_id`),
  ADD KEY `Order_FK_Customer` (`Cust_id`);

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `ID_re_Member` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `ID_Cust_in_contact_relation` FOREIGN KEY (`Cust_id`) REFERENCES `customer` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_Seller_in_contact_relation` FOREIGN KEY (`Seller_Member_ID`) REFERENCES `seller` (`Seller_Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `coupon`
--
ALTER TABLE `coupon`
  ADD CONSTRAINT `ID_Seller_in_Coupon` FOREIGN KEY (`Seller_ID`) REFERENCES `seller` (`Seller_Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_admin_in_Coupon` FOREIGN KEY (`Admin_ID`) REFERENCES `administrator` (`Member_ID`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `ID_Member` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_Seller` FOREIGN KEY (`Seller_Member_ID`) REFERENCES `seller` (`Seller_Member_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_admin_in_Customer` FOREIGN KEY (`Admin_Member_ID`) REFERENCES `administrator` (`Member_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_coupon_in_Customerr` FOREIGN KEY (`Coupon_id`) REFERENCES `coupon` (`Coupon_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `cust_address`
--
ALTER TABLE `cust_address`
  ADD CONSTRAINT `FK_Customer` FOREIGN KEY (`Cust_id`) REFERENCES `customer` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `list`
--
ALTER TABLE `list`
  ADD CONSTRAINT `FK_Order_List` FOREIGN KEY (`order_id`) REFERENCES `_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_Shop` FOREIGN KEY (`Shop_id`) REFERENCES `shop` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Product_FK_Seller` FOREIGN KEY (`Seller_member_id`) REFERENCES `seller` (`Seller_Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `rated`
--
ALTER TABLE `rated`
  ADD CONSTRAINT `ID_Cust_in_rated_relation` FOREIGN KEY (`Cust_id`) REFERENCES `customer` (`Member_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_Seller_in_rated_relation` FOREIGN KEY (`Seller_Member_ID`) REFERENCES `seller` (`Seller_Member_ID`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `ID_Cust_in_report_relation` FOREIGN KEY (`Cust_id`) REFERENCES `customer` (`Member_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_admin_in_report_relation` FOREIGN KEY (`Admin_Member_ID`) REFERENCES `administrator` (`Member_ID`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `ID_Member_in_Seller` FOREIGN KEY (`Seller_Member_ID`) REFERENCES `member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_admin_in_Seller` FOREIGN KEY (`Admin_Member_ID`) REFERENCES `administrator` (`Member_ID`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `shop`
--
ALTER TABLE `shop`
  ADD CONSTRAINT `FK_Seller` FOREIGN KEY (`Seller_member_id`) REFERENCES `seller` (`Seller_Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `_order`
--
ALTER TABLE `_order`
  ADD CONSTRAINT `FK_Coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`Coupon_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Order_FK_Customer` FOREIGN KEY (`Cust_id`) REFERENCES `customer` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Order_FK_Seller` FOREIGN KEY (`Seller_member_id`) REFERENCES `seller` (`Seller_Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
