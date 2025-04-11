-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2023 at 04:09 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fashion_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `try_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(3, 'susu', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(4, 'Kyawkyaw', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(5, 'eimyat', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(20, 6, 7, 'Girl Wrap Blouse with Tie Belt', 30, 1, 'wrapblouse1.jpg'),
(21, 6, 9, 'Girl Cotton Dress', 20, 6, 'w3.jpg'),
(23, 6, 11, 'Girl Dress', 40, 1, 'ruffledress1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(6, 3, 'Dee', 'dee@gmail.com', '09889999', 'Hello'),
(9, 4, 'su', 'su@gmail.com', '068585871', 'Nice website with Good Features.');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(3, 4, 'Dee', '097845122', 'dee@gmail.com', 'credit card', 'No.2,Myeik Street,South Dagon,Yangon,Myanmar', 'Women bag bb (55 x 1) - Women bag (20 x 1) - ', 75, '2023-03-29', 'completed'),
(4, 7, 'Su Myat', '097845202', 'myat@gmail.com', 'cash on delivery', 'No.10,Cherry Street,Tarmwe,Yangon,Myanmar', 'Boy Shirt (12 x 1) - Girl Dress (20 x 1) - ', 32, '2023-03-30', 'completed'),
(5, 3, 'Nay', '09787884', 'nay@gmail.com', 'cash on delivery', 'No.7,Sabel Street,Tharkayta,Yangon,Myanmar', 'Boy Jacket (30 x 1) -', 30, '2023-04-02', 'completed'),
(6, 4, 'Dee', '068585871', 'dee@gmail.com', 'cash on delivery', 'No.10, Anawmar Street, North Dagon, Yangon, Myanmar', 'Girl Cotton Dress (20 x 1) - ', 20, '2023-04-22', 'completed'),
(7, 4, 'Dee', '0978456545', 'dee@gmail.com', 'cash on delivery', 'flat no. No.1, Cherry Street, Yangon, Yangon , Myanmar - 123456', 'Girl Cotton Dress (20 x 1) - Girl Wrap Blouse with Tie Belt (30 x 1) - Espadrille Sneakers (30 x 1) - ', 80, '2023-05-12', 'pending'),
(8, 3, 'Myat', '097845155', 'myat@gmail.com', 'cash on delivery', 'flat no. No.12, Yuzana Street, Yangon, Yangon , Myanmar - 222222', 'Girl Cotton Dress (20 x 1) - Girl Blouse (25 x 1) - ', 45, '2023-05-12', 'pending'),
(9, 9, 'Yoon Yoon', '0978456123', 'yoon@gmail.com', 'cash on delivery', 'flat no. No.15, Bogyoke Street, Yangon, Yangon , Myanmar - 333333', 'Girl dress (100 x 1) - Girl Stand-up Collar Blouse (22 x 1) - Girl Blouse (25 x 1) - ', 147, '2023-05-12', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `size` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `size`, `price`, `image_01`, `image_02`, `image_03`, `details`) VALUES
(7, 'Girl Wrap Blouse with Tie Belt', 'Free Size', 30, 'wrapblouse1.jpg', 'wrapblouse2.jpg', 'wrapblouse3.jpg', 'Blouse in soft, woven cotton fabric. Collar, V-shaped opening, and wrap over front with wide ties.'),
(9, 'Girl Cotton Dress', 'Free Size', 20, 'wdress1.jpg', 'wdress2.jpg', 'wdress3.jpg', 'Wide-cut sweatshirt with a lined drawstring hood, kangaroo pocket, and ribbing at cuffs and hem.'),
(10, 'Boy Jacket', 'Free Size', 30, 'menjacket1.jpg', 'menjacket2.jpg', 'menjacket3.jpg', 'Wide-cut sweatshirt with a lined drawstring hood, kangaroo pocket, and ribbing at cuffs and hem.'),
(11, 'Girl Dress', 'Free Size', 40, 'ruffledress1.jpg', 'ruffledress2.jpg', 'ruffledress3.jpg', 'Wide-cut sweatshirt with a lined drawstring hood, kangaroo pocket, and ribbing at cuffs and hem.'),
(12, 'Boy Regular Fit Oxford Shirt', 'Medium', 20, 'ttt.jpg', 'ttt1.jpg', 'ttt2.jpg', 'Short-sleeved shirt in woven, stretch cotton fabric.  Narrow shoulders gently tapered sleeves and accentuated waist for a flattering silhouette.'),
(14, 'Canvas Sneakers', 'Free Size', 30, 'wcs3.jpg', 'wcs2.jpg', 'wcs1.jpg', 'Sneakers in mesh and faux leather with reflective sections. Padded edge and tongue, lacing at front, and loop at back. Mesh lining, mesh insoles, and patterned soles. '),
(15, 'Girl Shirt', 'Free Size', 35, 'wshirt1.jpg', 'wshirt3.jpg', 'wshirt2.jpg', 'Oversized shirt in airy linen. Collar, buttons at the front, and a patch chest pocket. Double-layered yoke, slightly forward-facing shoulder seams, dropped shoulders, and long sleeves with button at cuffs. '),
(16, 'Espadrille Sneakers', 'Free Size', 30, 'wsneakers3.jpg', 'wsneakers2.jpg', 'wsneakers1.jpg', 'Sneakers in cotton twill with lacing at front and platform soles with braided jute trim. '),
(17, 'Girl Blouse', 'Free Size', 25, 'wcotton1.jpg', 'wcotton3.jpg', 'wcotton2.jpg', 'Short, fitted blouse in woven, creped fabric with a gently tapered waist. '),
(18, 'Girl dress', 'Free Size', 30, 'dress1.jpg', 'dress3.jpg', 'dress2.jpg', 'Sleeveless, ankle-length halter neck dress in softly draped satin. '),
(19, 'Girl Oversized Tie-top Blouse', 'Free Size', 40, 'womenblouse1.jpg', 'womenblouse3.jpg', 'womenblouse2.jpg', 'Blouse in a woven viscose and cotton blend. Low, gathered stand-up collar, low-cut V-neck at front, and short sleeves.'),
(20, 'Girl Cotton Blouse', 'Free Size', 40, 'eyeletblouse1.jpg', 'eyeletblouse2.jpg', 'eyeletblouse3.jpg', 'Shirt in woven cotton fabric. Collar, buttons at front, and long sleeves with buttons at cuffs. '),
(22, 'Straw Shoulder Bag', 'NOSIZE', 35, 'bag2.jpg', 'bag3.jpg', 'bag1.jpg', 'Small shoulder bag in defined, woven fabric. Shoulder strap in metal chain, flap with metal clasp.'),
(23, 'Small Shoulder Bag', 'NOSIZE', 36, 'bagsmall1.jpg', 'bagsmall2.jpg', 'bagsmall3.jpg', 'Small shoulder bag in defined, woven fabric. Shoulder strap in the metal chain, flap with a metal clasp.'),
(24, 'Jute-blend Mini Shopper bag', 'NOSIZE', 25, 'minibag1.jpg', 'minibag2.jpg', 'minibag3.jpg', 'Mini shopper in a jacquard-weave jute blend. Adjustable, detachable shoulder strap, two handles at the top, and an inner compartment with a zipper. Lined.'),
(25, 'Women Wallet bag', 'NOSIZE', 20, 'womenwallet1.jpg', 'womenwallet3.jpg', 'womenwallet2.jpg', 'Fashion Zipper Wallets Women&#39;s Long Purses Handbags Coin Purse Cards Holder PU Leather Billfold.'),
(26, 'Straw Bag', 'NOSIZE', 30, 'stbag.jpg', 'stbag1.jpg', 'stbag2.jpg', 'Lined, crochet-look bag in braided paper straw with two handles at top. Depth 4 in. Width 13 1/2 in.'),
(27, 'Rhinestone Decor Faux Pearl Drop Earrings Accessories', 'NOSIZE', 30, 'earing1.jpg', 'earing2.jpg', 'earing3.jpg', 'Pearls, Water Drop'),
(28, 'Textured Square Drop Earrings Accessories', 'NOSIZE', 20, 'ear1.jpg', 'ear2.jpg', 'ear3.jpg', 'Geometric, Rhinestone'),
(29, 'Rhinestone Geo Decor Earrings Accessories', 'NOSIZE', 15, 'geoear1.jpg', 'geoear2.jpg', 'geoear3.jpg', 'Geometric, Rhinestone'),
(30, 'Shoulder bag ', 'NOSIZE', 55, 'bag3.jpg', 'bag1.jpg', 'bag2.jpg', 'Small shoulder bag with matching pouch bag. Shoulder bag with adjustable, detachable shoulder strap with fastening for the pouch bag, handle in the metal chain, and zipper at the top.'),
(31, 'Girl Stand-up Collar Blouse', 'Free Size', 22, 'wblouse1.jpg', 'wblouse2.jpg', 'wblouse3.jpg', 'Blouse in woven fabric. Low stand-up collar, V-shaped opening at front, and elbow-length puff sleeves with smocked section at back of cuffs.'),
(32, 'Boy Slim Fit T-shirt', 'Free Size', 20, 'mentshirt1.jpg', 'mentshirt2.jpg', 'mentshirt3.jpg', 'Slim-fit T-shirts in soft cotton jersey with a round neck.'),
(33, 'Boy Relaxed Fit Hoodie', 'Free Size', 30, 'menhoodedjacket1.jpg', 'menhoodedjacket2.jpg', 'menhoodedjacket3.jpg', 'Slim-fit shirt in woven stretch fabric made from a cotton blend. Collar, classic button placket, and long sleeves with adjustable buttoning at cuffs. Gently rounded hem.'),
(34, 'Girl Linen-blend Dress', 'Free Size', 60, 'wdress1.jpg', 'wdress2.jpg', 'wdress3.jpg', 'Calf-length dress in a woven linen and cotton blend. Narrow, adjustable shoulder straps, sweetheart neckline, and wide smocking at back. Gathered seam at waist and a flared skirt. Lined.'),
(35, 'Shoulder Bag with Pouch', 'NOSIZE', 39, 'sbag2.jpg', 'sbag1.jpg', 'sbag3.jpg', 'Small shoulder bag with matching pouch bag. Shoulder bag with adjustable, detachable shoulder strap with fastening for the pouch bag, handle in metal chain, and zipper at top. Round pouch bag for storage of items such as earphones.'),
(36, 'Chunky Sneakers', 'Free Size', 50, 'menchunkysneaker3.jpg', 'menchunkysneaker2.jpg', 'menchunkysneaker1.jpg', 'Sneakers with reflective sections. Padded edge and tongue, lacing at front, and loop at front and back. Jersey lining and chunky soles.'),
(37, 'Girl Bouclé Jacket', 'Free Size', 40, 'wjacket1.jpg', 'wjacket2.jpg', 'wjacket3.jpg', 'Double-breasted jacket in woven, textured bouclé with wool content. Collar, pointed lapels, decorative metal buttons at front, and mock front pockets with flap. Vent at back. Satin lining.'),
(38, 'Girl Linen-blend Pull-on Pants', 'Free Size', 50, 'patternplant1.jpg', 'patternplant3.jpg', 'patternplant2.jpg', 'Full-length pants in an airy, woven viscose and linen blend. High waist, elasticized, drawstring waistband, and wide legs with side-seam pockets.'),
(39, 'Girl Linen-blend Wrap over Skirt', 'Free Size', 50, 'gilinenskirt.jpg', 'gilinenskirt1.jpg', 'gilinenskir2.jpg', 'Calf-length, fitted skirt in a viscose and linen weave. Regular waist with a concealed zip and hook-and-eye fastening at the back. Wrapover front with a concealed press-stud and wide ties at one side. Unlined.'),
(40, 'Girl Smock-topped Dress', 'Free Size', 50, 'topdress1.jpg', 'topdress2.jpg', 'topdress3.jpg', 'Knee-length, sleeveless dress in jersey with narrow, adjustable shoulder straps, a smocked, frill-trimmed bodice and a gently flared skirt.'),
(41, 'Imitation Leather Trainers Sneaker', 'Free Size', 30, 'leath1.jpg', 'leath2.jpg', 'leath3.jpg', 'Trainers in imitation leather with contrasting colour heel caps. Padded top edge and a tongue and lacing at the front. Linings and insoles in piqué and rubber soles that are patterned underneath.'),
(42, 'Girl Knot-detail Dress', 'Free Size', 40, 'knot1.jpg', 'knot2.jpg', 'knot3.jpg', 'CONSCIOUS CHOICE Calf-length dress in a crêpe weave with a knot detail at the front for a gently draped effect. Deep V-neckline, gently dropped shoulders and long sleeves with wide cuffs. High slit at the front. Unlined.'),
(43, 'Boy Slim Fit Polo Shirt', 'Free Size', 20, 'boy.jpg', 'boy1.jpg', 'boy2.jpg', 'Slim-fit polo shirt in soft cotton jersey with a collar, button placket and short sleeves.'),
(44, 'Boy Slim Fit Pima Cotton T-shirt', 'Free Size', 40, 'b.jpg', 'b1.jpg', 'b2.jpg', 'PREMIUM SELECTION Slim-fit T-shirt in soft pima cotton jersey. Round neckline with a finely-ribbed trim and a straight-cut hem.'),
(45, 'Korea New Fashion Baroque Pearl Earrings Accessories', 'NOSIZE', 20, 'a1.jpg', 'a3.jpg', 'a2.jpg', '2022 South Korea New Fashion Baroque Pearl Earrings Temperament Personality Versatile Pendant Earrings Elegant Jewelry For Women'),
(46, 'Baroque Pearl Earrings Accessories', 'NOSIZE', 15, 'ea2.jpg', 'ea1.jpg', 'ea3.jpg', '2022 South Korea New Fashion Baroque Pearl Earrings Temperament Personality Versatile Pendant Earrings Elegant Jewelry For Women'),
(47, 'Cubic Zirconia Women Hoop Earrings Accessories', 'NOSIZE', 20, 'c1.jpg', 'c2.jpg', 'c3.jpg', 'High Quality Cubic Zirconia Women Hoop Earrings Stylish Girl Accessories Party Daily Wearable Fashion Jewelry Gift'),
(48, 'Crystal Zircon Earrings Accessories', 'NOSIZE', 25, 'p.jpg', 'p1.jpg', 'p2.jpg', 'New Ladies Fashion High Quality Jewelry Double Row Crystal Zircon Round Silver Plated Cute Earrings 2023'),
(49, 'Crystal Trendy Water Zircon Earrings Accessories', 'NOSIZE', 20, 'd1.jpg', 'd3.jpg', 'd2.jpg', ' Crystal Trendy Water Zircon Flower Tassel Earbone Clip Ins Earrings Long Pendant Female Elegant '),
(50, 'Women&#39;s Luxury Opals Hoop Earrings Accessories', 'NOSIZE', 20, 'e1.jpg', 'e2.jpg', 'e3.jpg', 'Fashion Jewelry Party Girls Temperament Accessories Unusual Earrings'),
(51, 'Stud Earrings Accessories', 'NOSIZE', 15, 'f1.jpg', 'f2.jpg', 'f3.jpg', 'Classic Spring Summer Flower Zircon Cute Elegant Female Trendy Jewelry '),
(52, 'Vintage Round Charm Layered Necklace Women&#39;s Accessories', 'NOSIZE', 25, 'g2.jpg', 'g1.jpg', 'g3.jpg', 'Charm Layered Necklace Women&#39;s Jewelry Layered Accessories for Girls Clothing Aesthetic Gifts Fashion'),
(53, 'Charm Layered Necklace Women&#39;s Jewelry Accessories', 'NOSIZE', 25, 'h1.jpg', 'h2.jpg', 'h3.jpg', 'Charm Layered Necklace Women&#39;s Jewelry Accessories for Girls Clothing Aesthetic Gifts Fashion Pendan'),
(54, 'Crystal Zircon Heart Star Charm Accessories', 'NOSIZE', 20, 'j1.jpg', 'j2.jpg', 'j3.jpg', 'Crystal Zircon Heart Star Charm Layered Pendant Necklace Set '),
(55, 'Gold Color Double Layer Heart Necklace Accessories', 'NOSIZE', 35, 'k3.jpg', 'k1.jpg', 'k2.jpg', ' New Gold Color Double Layer Heart Necklace For Women Clavicle Chain Elegant Charm Wedding Pendant Jewelry'),
(56, 'Retro Metallic Gold Color Accessories', 'NOSIZE', 35, 'q1.jpg', 'q2.jpg', 'q3.jpg', 'Retro Metallic Gold Color Multiple Small Circle Pendant Earrings 2022 New Jewelry Fashion Wedding Party Earrings For Woman'),
(57, 'Lovely Multilayered Butterfly Necklace Accessories', 'NOSIZE', 30, 'ww1.jpg', 'ww2.jpg', 'ww3.jpg', 'Lovely Multilayered Butterfly Necklace Charm Statement Rhinestone Necklace for Women Vacation Jewelry '),
(58, 'Shiny Heart Chain Bracelet Accessories', 'NOSIZE', 35, 'ee1.jpg', 'ee2.jpg', 'ee3.jpg', 'Shiny Heart Chain Bracelet for Women Minimalist Adjustable Charm Bracelet Wedding Party Jewelry'),
(59, 'Silver Color Double Heart Bracelet Accessories', 'NOSIZE', 25, 'rr1.jpg', 'rr2.jpg', 'rr3.jpg', 'Silver Color Double Heart Bracelet & Bangle for Women Fine Fashion Jewelry'),
(60, 'Sparkling Gypsophila Adjustable Bracelet Accessories', 'NOSIZE', 30, 'tt1.jpg', 'tt2.jpg', 'tt3.jpg', 'Silver Colour Sparkling Gypsophila Adjustable Bracelet & Bangle For Women Fine Fashion Jewelry '),
(61, 'Fashion Silver Colour Double Layer Bracelet Accessories', 'NOSIZE', 30, 'yy1.jpg', 'yy2.jpg', 'yy3.jpg', 'Fashion Silver Colour Double Layer Bracelet Sparkling Exquisite Simple Women Bracelet Fine Jewelry'),
(62, 'Flap Lock Classic Women Bag', 'NOSIZE', 40, 'aa2.jpg', 'aa1.jpg', 'aa3.jpg', ' Winter Vintage Flap Lock Classic Women Bags Casual Leather'),
(63, 'Solid Color Chest Bag', 'NOSIZE', 45, 'bb3.jpg', 'bb2.jpg', 'bb1.jpg', 'Winter Vintage Flap Lock Classic Women Bags Casual Leather Shoulder Bags Clutch Crossbody Bag'),
(64, 'Heart Lady Women Bag', 'NOSIZE', 35, 'cc1.jpg', 'cc2.jpg', 'cc3.jpg', 'Mini Soft Plush Hobos Winter Furry Ladies Clutch Purse'),
(65, 'Woman Trend Large Capacity Female Shoulder Bag', 'NOSIZE', 35, 'v2.jpg', 'v1.jpg', 'v3.jpg', 'Leather Simple Designer Handbag Luxury'),
(66, 'Luxury Long Wallet Bag', 'NOSIZE', 15, 's1.jpg', 's2.jpg', 's3.jpg', 'Luxury Long Wallet Purses for Women Trend Slim Wallets Female Clutch Bag Birthday&#39;s Gift Ladies Credit Card '),
(67, 'Running Shoes Women Sneakers', 'Free Size', 25, 'ss1.jpg', 'ss2.jpg', 'ss3.jpg', ' Casual All-match Mesh Breathable Lightweight Fashion Platform Sneakers Women&#39;s Zapatillas Mujer'),
(68, 'Casual Walking Sneakers', 'Free Size', 25, 'dd1.jpg', 'dd2.jpg', 'dd3.jpg', 'Running Shoes Breathable Casual Shoes Outdoor Light Weight Sports Shoes Casual Walking Sneakers Tenis Feminino Shoes'),
(69, 'Women Chunky Sneakers ', 'Free Size', 35, 'uu1.jpg', 'uu2.jpg', 'uu3.jpg', 'Women Chunky Sneakers White Shoes Lace Up Tenis Feminino Zapatos De Mujer Chaussure Femme'),
(70, 'Espadrille Sneakers', 'Free Size', 30, 'vv.jpg', 'vv1.jpg', 'vv2.jpg', 'White Business Travel Unisex Tenis Masculino'),
(71, 'Girl Chunky Sneakers', 'Free Size', 25, 'ccc1.jpg', 'ccc2.jpg', 'ccc3.jpg', 'White Business Travel Unisex Tenis Masculino'),
(72, 'Girl Travel Chunky Sneakers', 'Free Size', 45, 'bbb1.jpg', 'bbb2.jpg', 'bbb3.jpg', 'White Travel Unisex Tenis Masculino'),
(73, 'Boy Regular Fit Linen-blend Shirt', 'Free Size', 25, 'mm2.jpg', 'mm1.jpg', 'mm3.jpg', 'Regular-fit shirt in a woven cotton and linen blend. Resort collar, buttons without placket, and open chest pocket. '),
(74, 'Boy Regular Fit Linen-blend Polo Shirt', 'Free Size', 35, 'nn1.jpg', 'nn2.jpg', 'nn3.jpg', 'Regular-fit polo shirt in a soft, fine-knit linen blend. Rib-knit collar with V-shaped opening at front.'),
(75, 'Boy Relaxed Fit Resort Shirt', 'Free Size', 35, 'pp.jpg', 'pp1.jpg', 'pp2.jpg', 'Relaxed-fit shirt in softly draped, woven viscose fabric. Resort collar, buttons without placket, and yoke at back. Open chest pocket, short sleeves, and a straight-cut hem.'),
(76, 'Boy Relaxed Fit Shirt', 'Free Size', 35, 'kk.jpg', 'kk2.jpg', 'kk3.jpg', 'Relaxed-fit shirt in softly draped, woven viscose fabric. Resort collar, buttons without placket, and yoke at back. Open chest pocket, short sleeves, and a straight-cut hem.'),
(77, 'Boy Relaxed Fit Patterned Resort Shirt', 'Free Size', 40, 'jj.jpg', 'jj2.jpg', 'jj3.jpg', 'Relaxed-fit shirt in woven viscose fabric with a printed pattern. Resort collar, buttons without placket, and short sleeves. Straight-cut hem.'),
(78, 'Boy Regular Fit Cotton Shirt', 'Free Size', 40, 'oo.jpg', 'oo1.jpg', 'oo3.jpg', 'Short-sleeved shirt in woven cotton fabric with a turn-down collar. Classic button placket, yoke at back, and a chest pocket. Rounded hem.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(3, 'myat', 'myat@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(4, 'Dee', 'dee@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(5, 'Nay', 'nay@gmail.com', '011c945f30ce2cbafc452f39840f025693339c42'),
(6, 'susu', 'susu@gmail.com', '011c945f30ce2cbafc452f39840f025693339c42'),
(7, 'Su Myat', 'sumyat@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(9, 'Yoon Yoon', 'yoon@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `pid`, `name`, `price`, `image`) VALUES
(20, 7, 17, 'Girl Blouse', 25, 'wcotton1.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- Table structure for table `review_table`
--

CREATE TABLE `review_table` (
  `review_id` int(11) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `user_rating` int(1) NOT NULL,
  `user_review` text NOT NULL,
  `datetime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `review_table`
--

INSERT INTO `review_table` (`review_id`, `user_name`, `user_rating`, `user_review`, `datetime`) VALUES
(6, 'Lorem Ipsum', 4, 'The camera quality is phenomenal, especially in low light conditions.', 1621935691),
(7, 'Jane Doe', 5, 'Battery life lasts me all day, even with heavy usage. Impressive!', 1621939888),
(8, 'John Doe', 5, 'Love the sleek design and lightning-fast performance of this iphone!', 1621940010);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `review_table`
--
ALTER TABLE `review_table`
  ADD PRIMARY KEY (`review_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `review_table`
--
ALTER TABLE `review_table`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
