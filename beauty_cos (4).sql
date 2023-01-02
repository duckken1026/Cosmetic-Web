-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2023-01-02 15:44:44
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
  `Phone No` varchar(20) DEFAULT NULL,
  `NickName` varchar(20) DEFAULT NULL,
  `E-mail` varchar(50) NOT NULL,
  `Password` int(20) NOT NULL
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
('000017', 'Cosmo Angel推薦：佳麗寶 COFFRET D\'OR W雙采魅力造型眉筆組', 900, 5, 'https://flipa-production.s3-ap-southeast-1.amazonaws.com/uploads/product_image/81514/1/_250x250_81514.jpg', '商品特長 ◆色彩持久不脫落。*添加服貼型油質、皮脂吸附粉體 ◆通過10小時持色測試。 ◆不受汗水影響的防水型眉采', '', '2', '001'),
('000018', 'CEZANNE 長效控油妝前隔離乳', 290, 6, 'https://beauty-upgrade.tw/wp-content/uploads/2019/01/item_014-251x300.jpg', '這款隔離乳有著「不容易脫妝」「到傍晚也不怕」等高評價留言。因為含有吸附油脂的成分，所以能夠長效維持。<br>也有著「粉瓶可以讓肌膚亮一個色階」的平價，在日本網購網站上榮獲底妝第一名！', '', '2', '001'),
('000019', 'INTEGRATE 隔離霜', 200, 5, 'https://beauty-upgrade.tw/wp-content/uploads/2019/01/0098_efm_01-300x300.jpg', '可以遮住肌膚瑕疵的紫色妝前乳，在各大網站的評價都很不錯。保護自己的肌膚，使臉部透亮。<br>\n用手指取一粒珍珠大小的分量，塗抹在想遮住地方即可。會比平常的肌膚再亮一個色號，簡直就是魔法。', '', '5', '002'),
('000020', 'CEZANNE 抗UV粉底霜N', 235, 8, 'https://beauty-upgrade.tw/wp-content/uploads/2019/01/item_011_3-251x300.jpg', 'CEZANNE的『抗UV粉底霜N』有著保養肌膚、校正肌膚顏色以及修飾毛孔的功效。<br><br>\n明明是平價產品，確有保養肌膚的功效，不管是乾燥肌還是敏感肌都可以使用。上妝之後的肌膚看起來也會比較明亮，有01、02、03三種色號，可以選擇適合自己的顏色。', '', '5', '002'),
('000021', 'MAYBELLINE FIT ME 反孔特霧粉底液', 340, 6, 'https://beauty-upgrade.tw/wp-content/uploads/2019/01/%E3%82%AD%E3%83%A3%E3%83%97%E3%83%81%E3%83%A31-8-168x300.jpg', '雖然是平價品牌，確有12種色號可以選擇的粉底液。在美國還是銷售冠軍呢！<br><br>\n輕量的質地，可以遮住毛孔跟色差。即使到晚上也不容易脫妝，簡直就像是素顏。', '', '2', '001'),
('000022', 'MISSHA 輕透裸光無暇氣墊粉餅', 520, 9, 'https://beauty-upgrade.tw/wp-content/uploads/2019/01/%E5%B9%B3%E5%83%B9%E5%BA%95%E5%A6%9D9-8-300x300.jpg', '忙碌的早晨也可以快速的上妝的氣墊粉餅。可以一邊保濕一邊化妝是這款單品如此有人氣的祕密。MISSHA的氣墊粉餅價格親民，也不容易脫妝唷！<br><br>\n不知道要買哪一款底妝的時候很推薦這一款。', '', '2', '001'),
('000023', 'CANMAKE 棉花糖蜜粉餅', 520, 10, 'https://beauty-upgrade.tw/wp-content/uploads/2019/01/%E3%82%AD%E3%83%A3%E3%83%97%E3%83%81%E3%83%A33-2-243x300.jpg', '可以遮住色差以及毛孔、再讓肌膚有透亮美肌的粉餅。除了上在底妝的上面之外，想要自然妝感的時候，沒有粉底也可以唷！<br><br>\n在鼻翼稍微上一些，就可以完美遮瑕。除了可以訂妝，還能當成粉底使用，是很方便的單品。', '', '2', '001'),
('000024', 'CANMAKE 肌秘美顏蜜粉餅', 430, 12, 'https://beauty-upgrade.tw/wp-content/uploads/2019/01/%E3%82%AD%E3%83%A3%E3%83%97%E3%83%81%E3%83%A34-4-300x269.jpg', '柔基因子可以讓肌膚的瑕疵看不見，演出完美的肌膚。白天可以作為粉底使用，晚上則可以當成保養品。不管是出去玩還是去運動都可以帶著他，十分的輕巧。<br><br>\n有五種滋潤成分，可以吸附多餘的油脂，使肌膚保持絲滑。盒子也十分的可愛受歡迎唷！', '', '2', '001'),
('000025', '完美霧面眉影盤 Perfect Multi Eyes', 380, 7, 'https://dg9ugnb21lig7.cloudfront.net/uploads/product_image/83273/1/_250x250_83273.jpg', ' 不含亮片的霧面眼影盤，完美眼妝的必備單品！也能用來畫眉毛與眼線。顏色巧妙地融於肌膚，展現自然的漸層，讓眼妝更美麗！', '', '5', '002'),
('000026', 'CHANEL 香奈兒 斜紋軟呢四色眼影', 3210, 9, 'https://dg9ugnb21lig7.cloudfront.net/uploads/product_image/106811/1/_250x250_106811_20220826042739iBiakOEMeE.jpg', '全新「香奈兒斜紋軟呢四色眼影」推出四款色選，斜紋軟呢幻化為浮雕圖騰，翩然展現於每款眼彩之上。四色眼彩精準捕捉此經典布料的創意精神，猶如以不同纖維交織而成的斜紋軟呢，色彩彼此交融，盡情揮灑各種濃淡變化，造就時尚大膽妝效。斜紋軟呢百搭實穿，而同款眼彩的使用方式也一樣輕鬆好上手。', '', '5', '002'),
('000027', 'DAZZSHOP 非凡力量睫毛膏', 1120, 6, 'https://dg9ugnb21lig7.cloudfront.net/uploads/product_image/80916/1/_250x250_80916.jpg', '具定妝效果的打底膏與睫毛膏合而為一的雙效型睫毛膏。<br>\n打底膏可使用洗面乳卸除，睫毛膏則使用溫水即可卸除。<br>\n5種刷法，滿足不同的眼妝需求。<br>\n適合各種眼型及膚質，尤其推薦使用睫毛膏總是容易暈染的使用者。', '', '5', '002'),
('000028', '1028 野罌粟絨霧眼彩盤', 390, 5, 'https://dg9ugnb21lig7.cloudfront.net/uploads/product_image/103998/1/_250x250_103998_20220106013726NbnmAiCqEs.jpg', '在粉質上以獨家特殊工藝壓製，將濃郁色料完整注入並烘焙成形，打造前所未有的頂級濕式烘烤粉質，上眼服貼不飛粉。濃郁飽滿的色澤，可簡單暈染出乾淨的立體感。在充滿節慶與派對氣氛的季節，綻放精緻眼妝！', '', '2', '001'),
('000029', 'CANMAKE 睫毛復活液', 295, 3, 'https://dg9ugnb21lig7.cloudfront.net/uploads/product_image/35675/1/_250x250_35675_20201224075847XDeJRceIhi.jpg', '只要塗抹上一層能即時搶救開始下垂的睫毛,回復睫毛的捲翹度讓雙眼又大又明亮!\n在睫毛膏之後使用, 如睫毛夾捲過後的持久捲翹效果,當做睫毛雨衣可抗暈染! 作為透明睫毛膏用時,賦予睫毛自然的捲翹度。', '', '5', '002'),
('000030', 'YSL 聖羅蘭 奢華緞面漆光唇釉', 1360, 7, 'https://dg9ugnb21lig7.cloudfront.net/uploads/product_image/76903/1/_250x250_76903.jpg', '添加獨特頂級精華乳霜成分，絲緞般的乳狀質地一抹融於雙唇，搭配濃郁持色的3倍顯色因子，創造長效持久不沾染的漆光亮澤，展現大膽玩色的風格。', '', '2', '001'),
('000031', 'JILL STUART 吉麗絲朵 甜心愛戀顏彩盤N', 1450, 3, 'https://dg9ugnb21lig7.cloudfront.net/uploads/product_image/16842/1/_250x250_16842.jpg', '可盡情自由混合不同色彩質感的四色頰彩。創造出自然純真的粉嫩半霧面雙頰。以草莓水果塔為設計概念的淡雅粉紅色限定款顏彩盤。', '', '2', '001'),
('000032', '晶巧光燦眼盒(淨采) LUNASOL SKIN MODELING EYES', 1550, 7, 'https://dg9ugnb21lig7.cloudfront.net/uploads/product_image/13933/1/_250x250_13933_w_250xh_250xfar_C.jpg', '澄淨光感+透亮色調重疊暈染，襯托肌膚最佳陰影、立體感收斂之前眼盤耀眼亮片光澤，改為內斂纖細的光透色澤&光澤。', '', '2', '001'),
('000033', 'YSL 聖羅蘭 情挑誘吻蜜唇露', 1280, 6, 'https://dg9ugnb21lig7.cloudfront.net/uploads/product_image/84502/1/_250x250_84502.jpg', '超創新｜革命性蜜唇露質地<br>\n宛如柔滑糖蜜的全新蜜唇露質地，透過全新革命性配方，結合唇露的持久顯色及唇膏的清新色澤，能賦予雙唇極度出色的水感滋潤度與持妝力，不僅僅能讓雙唇飽滿水潤，同時更能打造持久水感、明亮顯色，甜而不膩的蜜光美唇！', '', '2', '001'),
('000034', 'Dior 迪奧 癮誘超模漆光唇釉', 1200, 6, 'https://dg9ugnb21lig7.cloudfront.net/uploads/product_image/79059/1/_250x250_79059.jpg', '以洛杉磯傳奇地標為靈感，煥發著西岸獨有的燦爛陽光。透明度提高44%，色彩粒子顯色效果更加卓越，具有令人驚豔的飽和度及亮澤感。', '', '2', '001'),
('000035', 'CHANEL 香奈兒 超炫耀絲絨唇露', 1250, 3, 'https://dg9ugnb21lig7.cloudfront.net/uploads/product_image/77122/1/_250x250_77122.jpg', '全新超炫耀絲絨唇露系列賦予唇部霧面絲絨妝效，塗抹的當下，雙唇倍感滋潤且色彩飽滿，質地接著轉換成散發性感低調的霧面光澤，彷彿為雙唇穿上高級訂製服的絲絨薄紗。獨特植絨刷頭設計，輕輕一畫即可輕易描繪唇形，帶來令人印象深刻的時尚印記。', '', '2', '001'),
('000036', 'ALBION 奧碧虹 翹彈力睫毛定型液', 1080, 6, 'https://dg9ugnb21lig7.cloudfront.net/uploads/product_image/11347/1/_250x250_11347_w_250xh_250xfar_C.jpg', '不管是向下生長的睫毛、平直的睫毛，都能維持完美的捲度。<br>\n含防水配方的透明睫毛膏。', '', '5', '002'),
('000037', 'shu uemura 植村秀 腮紅', 650, 7, 'https://dg9ugnb21lig7.cloudfront.net/uploads/product_image/7489/1/_250x250_7489_w_250xh_250xfar_C.jpg', 'shu uemura【腮紅】因含荷荷芭油保養成分，即使整天上妝也臉龐也不會過於乾澀；擁有淨化效果的粉末，可與任何彩妝品互搭使用也不易形成渾濁的不清潔感，是極具口碑的腮紅系列。', '', '5', '002'),
('000038', 'ff 緋緋 立體眉粉盒', 330, 4, 'https://dg9ugnb21lig7.cloudfront.net/uploads/product_image/7131/1/_250x250_7131_w_250xh_250xfar_C.jpg', '立體眉粉盒，粉質細也很持久、不易飛粉', '', '5', '002'),
('000039', '巴黎萊雅 絕對情迷鏡面唇膏', 420, 4, 'https://dg9ugnb21lig7.cloudfront.net/uploads/product_image/84593/1/_250x250_84593.jpg', '專櫃級訂製漆光唇膏 打造仙女光暈', '', '5', '002'),
('000040', 'LAURA MERCIER 蘿拉蜜思 微整立體修容餅', 1600, 8, 'https://dg9ugnb21lig7.cloudfront.net/uploads/product_image/53041/1/_250x250_53041_w_250xh_250xfar_C.jpg', '微整立體修容餅以獨特革命性技術，將薄透極細礦物粉末與肌膚完美貼合，使用「BRONZE修容」透過巧妙的光影變化，創造自然的輪廓修飾效果，帶給肌膚健康明亮的光澤。再搭配「HIGHLIGHT立體光」刷於顴骨三角區、T字部或下巴處打亮，創造黃金比例的深邃立體臉型，為肌膚呈現夏日的健康性感形象！', '', '5', '002'),
('000041', 'MAYBELLINE 媚比琳 時尚3D立體雙效眉彩盤', 320, 7, 'https://dg9ugnb21lig7.cloudfront.net/uploads/product_image/74405/1/_250x250_74405.jpg', 'Maybelline 2016全新推出「時尚3D立體雙效眉彩盤」擁有眉蠟x眉粉雙效質地！質地一「蠟」能針對眉毛毛流做專業塑型，質地二「粉」則能同時作到眉彩上色與自然鼻影，讓妳一盒輕鬆打造宛若混血般的3D立體深邃輪廓！立即提升妳的眼部魅力進階女神行列！', '', '5', '002');

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
