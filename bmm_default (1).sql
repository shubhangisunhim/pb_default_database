-- phpMyAdmin SQL Dump
-- version 5.2.0-1.el7.remi
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 30, 2025 at 02:21 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testdb30sept`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders_ship_tracking`
--

CREATE TABLE `orders_ship_tracking` (
  `ship_tracking_id` bigint NOT NULL,
  `order_id` bigint NOT NULL DEFAULT '0',
  `ship_status_order` int NOT NULL DEFAULT '1',
  `order_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `show_to` enum('a','s') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 's',
  `updated_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_pickup_details`
--

CREATE TABLE `order_pickup_details` (
  `pickup_id` bigint NOT NULL,
  `address_pickup_id` bigint DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `order_pickup_date` date DEFAULT NULL,
  `order_pickup_from_time` time DEFAULT NULL,
  `order_pickup_to_time` time DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_address`
--

CREATE TABLE `tbl_address` (
  `address_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` enum('m','f','o') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `alternate_mobile` varchar(15) DEFAULT NULL,
  `whatsapp_number` varchar(50) DEFAULT NULL,
  `country_code` varchar(15) DEFAULT NULL,
  `alternate_country_code` varchar(15) DEFAULT NULL,
  `whatsapp_country_code` varchar(15) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `addressline1` varchar(255) DEFAULT NULL,
  `addressline2` varchar(255) DEFAULT NULL,
  `landmark_place` varchar(255) DEFAULT NULL,
  `zipcode` varchar(15) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `state` varchar(15) DEFAULT NULL,
  `country` varchar(15) DEFAULT NULL,
  `isdefault` enum('y','n') DEFAULT NULL COMMENT 'y: yes ; n : no',
  `address_type` enum('h','w','o') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'h: Home; o: other, w:work',
  `address_lat` varchar(100) DEFAULT NULL,
  `address_long` varchar(100) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `updated_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blogs`
--

CREATE TABLE `tbl_blogs` (
  `blog_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `blog_slug` varchar(255) DEFAULT NULL,
  `blog_excerpt` text,
  `description` text,
  `featured_image` varchar(255) DEFAULT NULL,
  `blogs_tags` varchar(255) DEFAULT NULL,
  `catergory` varchar(255) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blogs_comment`
--

CREATE TABLE `tbl_blogs_comment` (
  `comment_id` bigint NOT NULL,
  `blog_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `parent_comment_id` varchar(255) DEFAULT NULL,
  `comment_message` varchar(255) DEFAULT NULL,
  `comment_likes` bigint NOT NULL DEFAULT '0',
  `comment_dislikes` bigint NOT NULL DEFAULT '0',
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2','3') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blogs_likes`
--

CREATE TABLE `tbl_blogs_likes` (
  `like_id` bigint NOT NULL,
  `item_id` bigint DEFAULT NULL,
  `item_type` enum('c','b') DEFAULT NULL COMMENT 'c : comment b : blog',
  `like_type` enum('l','d') NOT NULL DEFAULT 'l' COMMENT 'l : like d: dislike ',
  `user_id` bigint DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brands`
--

CREATE TABLE `tbl_brands` (
  `brand_id` int NOT NULL,
  `store_id` int DEFAULT NULL,
  `product_category_id` bigint NOT NULL,
  `brand_name` varchar(100) DEFAULT NULL,
  `brand_logo` varchar(255) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '1' COMMENT '0; inactive 1 : active  2: logical delete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `id` bigint NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `product_qty` int DEFAULT '1',
  `coupon_id` bigint NOT NULL DEFAULT '0',
  `cart_type` enum('c','s') NOT NULL DEFAULT 'c' COMMENT 'c- cart, s-save_later',
  `inserted_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart_settings`
--

CREATE TABLE `tbl_cart_settings` (
  `id` bigint NOT NULL,
  `core_plugin_id` bigint DEFAULT NULL,
  `var_name` varchar(255) NOT NULL,
  `var_value` text NOT NULL,
  `status` enum('0','1','2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cmspages`
--

CREATE TABLE `tbl_cmspages` (
  `page_id` int NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_type` enum('c','p') NOT NULL DEFAULT 'c' COMMENT 'c : cms page ; p : policies ',
  `page_slug` varchar(50) DEFAULT NULL,
  `page_description` text NOT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `updated_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_cmspages`
--

INSERT INTO `tbl_cmspages` (`page_id`, `page_title`, `page_type`, `page_slug`, `page_description`, `featured_image`, `inserted_date`, `updated_date`, `status`) VALUES
(1, 'About us', 'c', 'about-us', '<p>we provide high-quality solutions</p>', '599', '2022-01-19 18:18:14', '2023-04-07 11:26:53', '1'),
(125, 'Privacy Policy', 'p', 'privacy-policy', '<p>this is privacy1jyujykuy</p>', NULL, '2023-12-28 18:43:47', '2025-04-28T09:58:08+05:30', '1'),
(127, 'Shipping Policy', 'p', 'shipping-policy', '<p>&nbsp;this is shipping1&nbsp;this is shipping1</p>', NULL, '2023-12-28 18:43:52', '2025-04-28T09:58:08+05:30', '1'),
(133, 'Return Or Exchange Policy', 'p', 'return-or-exchange-policy', '<p>refund and exchange poilcy valid only 15 days and this is contact&nbsp;1</p>', NULL, '2024-01-14 08:13:30', '2025-04-28T09:58:08+05:30', '1'),
(182, 'Terms and Conditions', 'p', 'terms-and-conditions', '<p>this is terms1</p>', NULL, '2024-03-22 11:02:33', '2025-04-28T09:58:08+05:30', '1'),
(183, 'Refund Policy', 'p', 'refund-policy', '<p>this is return1</p>', NULL, '2024-03-22 11:02:33', '2025-04-28T09:58:08+05:30', '1'),
(184, 'Contact us', 'p', 'contact-us', '<p>this is contact&nbsp;123</p>', NULL, '2024-03-22 11:02:33', '2025-04-28T09:58:08+05:30', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact_us_queries`
--

CREATE TABLE `tbl_contact_us_queries` (
  `id` bigint NOT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `parent_message_id` bigint NOT NULL DEFAULT '0',
  `message_of` enum('a','c') NOT NULL DEFAULT 'c'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupons`
--

CREATE TABLE `tbl_coupons` (
  `coupon_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `couponcode` varchar(50) DEFAULT NULL,
  `coupon_type` enum('percentage','flat','buyxgety','freebie','freeshipping','coins') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '''percentage'',''flat'',''buyxgety'',''freebie'',''freeshipping'',''coins''',
  `discount_type` enum('f','p') DEFAULT 'f' COMMENT 'f: flat; p: percetage',
  `description` text,
  `coupon_info` text,
  `valid_from` varchar(100) DEFAULT NULL,
  `valid_to` varchar(100) DEFAULT NULL,
  `have_end_date` enum('y','n') NOT NULL DEFAULT 'y',
  `coupon_price` varchar(50) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupons_applied`
--

CREATE TABLE `tbl_coupons_applied` (
  `id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `coupon_id` bigint NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_information`
--

CREATE TABLE `tbl_customer_information` (
  `id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` enum('m','f','o') DEFAULT 'm' COMMENT 'm: male f: female o : other',
  `photo` varchar(255) DEFAULT NULL,
  `is_verified` enum('y','n') DEFAULT 'n',
  `whatsapp_number` varchar(15) DEFAULT NULL,
  `whatsapp_country_code` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_email_templates`
--

CREATE TABLE `tbl_email_templates` (
  `template_id` bigint NOT NULL,
  `email_slug` varchar(50) DEFAULT NULL,
  `email_title` varchar(50) DEFAULT NULL,
  `email_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `from_name` varchar(50) DEFAULT NULL,
  `from_email` varchar(50) DEFAULT NULL,
  `email_subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email_content` text,
  `inserted_date` varchar(100) DEFAULT NULL,
  `updated_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_email_templates`
--

INSERT INTO `tbl_email_templates` (`template_id`, `email_slug`, `email_title`, `email_info`, `from_name`, `from_email`, `email_subject`, `email_content`, `inserted_date`, `updated_date`) VALUES
(1, 'welcome-customer', 'Manual Registration', 'Email with Activation Link', '', 'support@buildmymart.com', 'Welcome to store', '<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <style>\r\n      body {\r\n        font-family: Arial, sans-serif;\r\n        color: #333;\r\n        background-color: #ffffff;\r\n        padding: 20px;\r\n      }\r\n      .email-container {\r\n        max-width: 600px;\r\n        margin: auto;\r\n        background: #ffffff;\r\n        border: 1px solid #e0e0e0;\r\n        overflow: hidden;\r\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\r\n      }\r\n      .header {\r\n        text-align: center;\r\n        padding: 20px;\r\n        background-color: #ffffff;\r\n      }\r\n      .header img {\r\n        max-height: 60px;\r\n      }\r\n      .content {\r\n        padding: 20px;\r\n        color: #333;\r\n      }\r\n      .button {\r\n        display: inline-block;\r\n        padding: 12px 24px;\r\n        margin: 20px 0;\r\n        color: #ffffff;\r\n        background-color: #004aad;\r\n        text-decoration: none;\r\n        border-radius: 5px;\r\n        font-weight: bold;\r\n      }\r\n      .button:hover {\r\n        background-color: #00367e;\r\n      }\r\n      .footer {\r\n        font-size: 12px;\r\n        color: #777;\r\n        text-align: center;\r\n        padding: 20px;\r\n        border-top: 2px solid #ff8a00;\r\n        background-color: #f9f9f9;\r\n      }\r\n      .social-icons {\r\n        margin: 10px 0;\r\n      }\r\n      .social-icons a {\r\n        display: inline-block;\r\n        margin: 0 6px;\r\n      }\r\n      .social-icons img {\r\n        height: 24px;\r\n        width: 24px;\r\n        vertical-align: middle;\r\n      }\r\n      .unsubscribe {\r\n        display: block;\r\n        margin-top: 10px;\r\n        color: #999;\r\n        font-size: 11px;\r\n        text-decoration: underline;\r\n      }\r\n    </style>\r\n  </head>\r\n  <body>\r\n    <div class=\"email-container\">\r\n      <div class=\"header\">\r\n       {SITELOGO}\r\n      </div>\r\n      <div class=\"content\">\r\n        <p>Dear {NAME},</p>\r\n        <p>Thank you for registering with <strong>{STORENAME}</strong>! To complete your registration, please verify your email address by clicking the button below:</p>\r\n\r\n        <p style=\"text-align: center;\">\r\n          <a href=\"{VERIFYACCOUNT}\" class=\"button\" style=\"text-align: center; color: #ffffff;\">Verify My Account</a>\r\n        </p>\r\n\r\n        <p>If you did not create this account, you can safely ignore this email.</p>\r\n\r\n        <p>We’re excited to have you on board. Let\'s get started!</p>\r\n      </div>\r\n      <div class=\"footer\">\r\n        <div class=\"social-icons\">\r\n         {SOCIALICONS}\r\n        </div>\r\n        <p>\r\n          <!-- This message was sent to [Customer Email].<br> -->\r\n          <strong>Disclaimer:</strong> This email and any attachments are confidential and intended only for the individual or entity to whom they are addressed.\r\n        </p>\r\n        <p>{COPYRIGHT}</p>\r\n        <!-- <a href=\"[UnsubscribeURL]\" class=\"unsubscribe\">Unsubscribe from email notifications</a> -->\r\n      </div>\r\n    </div>\r\n  </body>\r\n</html>\r\n', '2024-12-14 05:11:15', '2025-02-11 14:35:15'),
(2, 'customer-login-otp', 'Customer login otp', 'Email with OTP', NULL, 'support@buildmymart.com', 'OTP Requirement for your account', '<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <style>\r\n      body {\r\n        font-family: Arial, sans-serif;\r\n        color: #333;\r\n        background-color: #ffffff;\r\n        padding: 20px;\r\n      }\r\n      .email-container {\r\n        max-width: 600px;\r\n        margin: auto;\r\n        background: #ffffff;\r\n        border: 1px solid #e0e0e0;\r\n        overflow: hidden;\r\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\r\n      }\r\n      .header {\r\n        text-align: center;\r\n        padding: 20px;\r\n        background-color: #ffffff;\r\n      }\r\n      .header img {\r\n        max-height: 60px;\r\n      }\r\n      .content {\r\n        padding: 20px;\r\n        color: #333;\r\n      }\r\n      .otp-box {\r\n        background-color: #f2f7ff;\r\n        border: 1px solid #004aad;\r\n        border-radius: 5px;\r\n        padding: 15px;\r\n        margin: 20px 0;\r\n        text-align: center;\r\n        font-size: 24px;\r\n        font-weight: bold;\r\n        letter-spacing: 4px;\r\n      }\r\n      .button {\r\n        display: inline-block;\r\n        padding: 12px 24px;\r\n        margin: 20px 0;\r\n        color: #ffffff;\r\n        background-color: #004aad;\r\n        text-decoration: none;\r\n        border-radius: 5px;\r\n        font-weight: bold;\r\n      }\r\n      .button:hover {\r\n        background-color: #00367e;\r\n      }\r\n      .footer {\r\n        font-size: 12px;\r\n        color: #777;\r\n        text-align: center;\r\n        padding: 20px;\r\n        border-top: 2px solid #ff8a00;\r\n        background-color: #f9f9f9;\r\n      }\r\n      .social-icons {\r\n        margin: 10px 0;\r\n      }\r\n      .social-icons a {\r\n        display: inline-block;\r\n        margin: 0 6px;\r\n      }\r\n      .social-icons img {\r\n        height: 24px;\r\n        width: 24px;\r\n        vertical-align: middle;\r\n      }\r\n      .unsubscribe {\r\n        display: block;\r\n        margin-top: 10px;\r\n        color: #999;\r\n        font-size: 11px;\r\n        text-decoration: underline;\r\n      }\r\n    </style>\r\n  </head>\r\n  <body>\r\n    <div class=\"email-container\">\r\n      <div class=\"header\">\r\n       {SITELOGO}\r\n      </div>\r\n      <div class=\"content\">\r\n        <p>Dear {NAME},</p>\r\n        <p>You are trying to log in to your {STORENAME} account. Use the OTP below to complete your login:</p>\r\n\r\n        <div class=\"otp-box\">\r\n          {EMAILOTP}\r\n        </div>\r\n\r\n      <!--   <p style=\"text-align: center;\">\r\n          <a href=\"[LoginURL]\" class=\"button\">Continue to Dashboard</a>\r\n        </p> -->\r\n\r\n        <!-- <p><strong>Note:</strong> This OTP is valid for 10 minutes and can only be used once.</p> -->\r\n\r\n        <p>If you did not initiate this request, please ignore this email or contact support immediately.</p>\r\n      </div>\r\n      <div class=\"footer\">\r\n        <div class=\"social-icons\">\r\n         {SOCIALICONS}\r\n        </div>\r\n        <p>\r\n          <!-- This email is intended for [Merchant Email]. If you are not the intended recipient, please disregard this message.<br> -->\r\n          <strong>Disclaimer:</strong> This email and any attachments are confidential and intended only for the individual or entity to whom they are addressed.\r\n        </p>\r\n        <p>{COPYRIGHT}</p>\r\n        <!-- <a href=\"[UnsubscribeURL]\" class=\"unsubscribe\">Unsubscribe from email notifications</a> -->\r\n      </div>\r\n    </div>\r\n  </body>\r\n</html>\r\n', '2024-12-14 05:24:21', '2024-12-14 05:24:21'),
(3, 'forgot-password', 'Forgot password', 'Email with Reset Password Link ', NULL, 'support@buildmymart.com', 'Forgot your password?', '<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <style>\r\n      body {\r\n        font-family: Arial, sans-serif;\r\n        color: #333;\r\n        background-color: #ffffff;\r\n        padding: 20px;\r\n      }\r\n      .email-container {\r\n        max-width: 600px;\r\n        margin: auto;\r\n        background: #ffffff;\r\n        border: 1px solid #e0e0e0;\r\n        overflow: hidden;\r\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\r\n      }\r\n      .header {\r\n        text-align: center;\r\n        padding: 20px;\r\n        background-color: #ffffff;\r\n      }\r\n      .header img {\r\n        max-height: 60px;\r\n      }\r\n      .content {\r\n        padding: 20px;\r\n        color: #333;\r\n      }\r\n      .button {\r\n        display: inline-block;\r\n        padding: 12px 24px;\r\n        margin: 20px 0;\r\n        color: #ffffff;\r\n        background-color: #004aad;\r\n        text-decoration: none;\r\n        border-radius: 5px;\r\n        font-weight: bold;\r\n      }\r\n      .button:hover {\r\n        background-color: #00367e;\r\n      }\r\n      .footer {\r\n        font-size: 12px;\r\n        color: #777;\r\n        text-align: center;\r\n        padding: 20px;\r\n        border-top: 2px solid #ff8a00;\r\n        background-color: #f9f9f9;\r\n      }\r\n      .social-icons {\r\n        margin: 10px 0;\r\n      }\r\n      .social-icons a {\r\n        display: inline-block;\r\n        margin: 0 6px;\r\n      }\r\n      .social-icons img {\r\n        height: 24px;\r\n        width: 24px;\r\n        vertical-align: middle;\r\n      }\r\n      .unsubscribe {\r\n        display: block;\r\n        margin-top: 10px;\r\n        color: #999;\r\n        font-size: 11px;\r\n        text-decoration: underline;\r\n      }\r\n    </style>\r\n  </head>\r\n  <body>\r\n    <div class=\"email-container\">\r\n      <div class=\"header\">\r\n       {SITELOGO}\r\n      </div>\r\n      <div class=\"content\">\r\n        <p>Dear {NAME},</p>\r\n        <p>We received a request to reset the password for your {STORENAME} account associated with this email address.</p>\r\n\r\n        <p style=\"text-align: center;\">\r\n          <a href=\"{RESETURL}\" class=\"button\" style=\"color: #ffffff;\">Reset Your Password</a>\r\n        </p>\r\n\r\n        <!-- <p>This link will expire in 30 minutes. If you did not request a password reset, please ignore this email or contact our support team.</p> -->\r\n\r\n        <p>For your security, we recommend choosing a strong and unique password.</p>\r\n      </div>\r\n      <div class=\"footer\">\r\n        <div class=\"social-icons\">\r\n          {SOCIALICONS}\r\n        </div>\r\n        <p>\r\n          <!-- This email was sent to [Merchant Email].<br> -->\r\n          <strong>Disclaimer:</strong> This message and its contents are confidential and intended only for the recipient.\r\n        </p>\r\n        <p> {COPYRIGHT}</p>\r\n        <!-- <a href=\"[UnsubscribeURL]\" class=\"unsubscribe\">Unsubscribe from email notifications</a> -->\r\n      </div>\r\n    </div>\r\n  </body>\r\n</html>\r\n', '2024-12-14 05:36:44', '2024-12-14 05:36:44'),
(4, 'contact-query-customer', 'Contact Query Customer', NULL, NULL, 'support@buildmymart.com', 'Thank you for contacting us', '<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <style>\r\n      body {\r\n        font-family: Arial, sans-serif;\r\n        color: #333;\r\n        background-color: #ffffff;\r\n        padding: 20px;\r\n      }\r\n      .email-container {\r\n        max-width: 700px;\r\n        margin: auto;\r\n        background: #ffffff;\r\n        border: 1px solid #e0e0e0;\r\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\r\n      }\r\n      .header {\r\n        text-align: center;\r\n        padding: 20px;\r\n      }\r\n      .header img {\r\n        max-height: 60px;\r\n      }\r\n      .content {\r\n        padding: 20px;\r\n      }\r\n      .section {\r\n        background-color: #fff8e6;\r\n        border-left: 4px solid #ff8a00;\r\n        padding: 15px;\r\n        border-radius: 5px;\r\n        margin: 20px 0;\r\n      }\r\n      .section p {\r\n        margin: 5px 0;\r\n      }\r\n     .details {\r\n        background-color: #f2f7ff;\r\n        border: 1px solid #004aad;\r\n        border-radius: 6px;\r\n        padding: 15px;\r\n        margin: 20px 0;\r\n      }\r\n      .details p {\r\n        margin: 6px 0;\r\n      }\r\n      .footer {\r\n        font-size: 12px;\r\n        color: #777;\r\n        text-align: center;\r\n        padding: 20px;\r\n        border-top: 2px solid #ff8a00;\r\n        background-color: #f9f9f9;\r\n      }\r\n      .social-icons {\r\n        margin: 10px 0;\r\n      }\r\n      .social-icons a {\r\n        display: inline-block;\r\n        margin: 0 6px;\r\n      }\r\n      .social-icons img {\r\n        height: 24px;\r\n        width: 24px;\r\n        vertical-align: middle;\r\n      }\r\n    </style>\r\n  </head>\r\n  <body>\r\n    <div class=\"email-container\">\r\n      <div class=\"header\">\r\n        {SITELOGO}\r\n      </div>\r\n       <div class=\"content\">\r\n        <h2>Hey,</h2>\r\n        <p>Thank you for contacting us. Our team will reach out to you soon.</p>\r\n\r\n        <div class=\"details\">\r\n          <p><strong>Name:</strong> {NAME}</p>\r\n          <p><strong>Email:</strong> {EMAIL}</p>\r\n          <p><strong>Phone:</strong> {PHONE}</p>\r\n          <p><strong>Message:</strong></p>\r\n          <p>{MESSAGE}</p>\r\n        </div>\r\n\r\n       \r\n      </div>\r\n\r\n      <div class=\"footer\">\r\n        <div class=\"social-icons\">\r\n          {SOCIALICONS} </div>\r\n        <!--<p>This is an automated system email. Do not reply.</p>-->\r\n        <p>{COPYRIGHT}</p>\r\n      </div>\r\n    </div>\r\n  </body>\r\n</html>\r\n', '2024-12-14 05:36:44', '2024-12-14 05:36:44'),
(5, 'orderplaced', 'Order Placed', 'Order Placed Email', '', 'support@buildmymart.com', 'Your Order has been successfully placed', '<!DOCTYPE html>\n<html>\n  <head>\n    <style>\n      body {\n        font-family: Arial, sans-serif;\n        color: #333;\n        background-color: #ffffff;\n        padding: 20px;\n      }\n      .email-container {\n        max-width: 700px;\n        margin: auto;\n        background: #ffffff;\n        border: 1px solid #e0e0e0;\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\n      }\n      .header {\n        text-align: center;\n        padding: 20px;\n        background-color: #ffffff;\n      }\n      .header img {\n        max-height: 60px;\n      }\n      .content {\n        padding: 20px;\n      }\n      .section-title {\n        font-weight: bold;\n        margin-top: 30px;\n        margin-bottom: 10px;\n        border-bottom: 1px solid #ccc;\n        padding-bottom: 6px;\n      }\n      .address-box {\n        background: #f2f7ff;\n        padding: 15px;\n        border: 1px solid #d0d0d0;\n        border-radius: 5px;\n        margin-bottom: 10px;\n      }\n      table {\n        width: 100%;\n        border-collapse: collapse;\n        margin-top: 15px;\n      }\n      table th, table td {\n        border: 1px solid #ddd;\n        padding: 10px;\n        text-align: left;\n      }\n      table th {\n        background-color: #f9f9f9;\n      }\n      .total {\n        text-align: right;\n        font-weight: bold;\n      }\n      .button {\n        display: inline-block;\n        padding: 12px 24px;\n        margin: 20px 0;\n        color: #ffffff;\n        background-color: #004aad;\n        text-decoration: none;\n        border-radius: 5px;\n        font-weight: bold;\n      }\n      .footer {\n        font-size: 12px;\n        color: #777;\n        text-align: center;\n        padding: 20px;\n        border-top: 2px solid #ff8a00;\n        background-color: #f9f9f9;\n      }\n      .social-icons a {\n        margin: 0 6px;\n        display: inline-block;\n      }\n      .social-icons img {\n        height: 24px;\n        width: 24px;\n      }\n      .unsubscribe {\n        display: block;\n        margin-top: 10px;\n        color: #999;\n        font-size: 11px;\n        text-decoration: underline;\n      }\n    </style>\n  </head>\n  <body>\n    <div class=\"email-container\">\n      <div class=\"header\">\n       {SITELOGO}\n      </div>\n      <div class=\"content\">\n        <p>Hello {NAME},</p>\n        <p>Thank you for your order! Your order <strong>{ORDERNUMBER}</strong> has been received and is now being processed.</p>\n\n        <div class=\"section-title\">Order Summary</div>\n        <table>\n          <thead>\n            <tr>\n              <th>Product</th>\n              <th>Qty</th>\n              <th>Unit Price</th>\n              <th>Total</th>\n            </tr>\n          </thead>\n          <tbody>\n            <!-- Repeat this row for each product -->\n            {PRODUCTLIST}\n            <!-- End product rows -->\n            <tr>\n              <td colspan=\"3\" class=\"total\" style=\"text-align: left;\">Subtotal</td>\n              <td style=\"text-align: left;\">{SUBTOTAL}</td>\n            </tr>\n            {DISCOUNT}\n            <tr>\n              <td colspan=\"3\" class=\"total\" style=\"text-align: left;\">Delivery Charges</td>\n              <td style=\"text-align: left;\">{SHIPPING}</td>\n            </tr>\n            <tr>\n              <td colspan=\"3\" class=\"total\" style=\"text-align: left;\">Tax</td>\n              <td style=\"text-align: left;\">{TAX}</td>\n            </tr>\n            {OTHER_CHARGES}\n\n            <tr>\n              <td colspan=\"3\" class=\"total\" style=\"text-align: left;\">Grand Total</td>\n              <td style=\"text-align: left;\"><strong>{TOTAL_AMOUNT}</strong></td>\n            </tr>\n          </tbody>\n        </table>\n\n        <div class=\"section-title\">Billing Address</div>\n        <div class=\"address-box\">\n          {BILLING_NAME}<br>\n            {BILLING_ADDRESS}<br>\n         {BILLING_PHONE}<br>\n          {BILLING_EMAIL}\n        </div>\n\n        <div class=\"section-title\">Shipping Address</div>\n        <div class=\"address-box\">\n           {SHIPPING_NAME}<br>\n          {SHIPPING_ADDRESS}<br>\n          {SHIPPING_PHONE}<br>\n           {SHIPPING_EMAIL}\n        </div>\n\n        <p style=\"text-align:center; color: #ffffff;\">\n          <a href=\"{VIEW_ORDER}\" class=\"button\" style=\"color: #ffffff;\">View Order Details</a>\n        </p>\n\n        <p>If you have any questions or need help, feel free to contact our support team.</p>\n        <p>Thank you for shopping with {STORENAME}!</p>\n      </div>\n      <div class=\"footer\">\n        <div class=\"social-icons\">\n         {SOCIALICONS}\n        </div>\n        <p>\n          <!-- This message was sent to [Customer Email].<br> -->\n          <strong>Disclaimer:</strong> This email and any attachments are confidential and intended only for the individual or entity to whom they are addressed.\n        </p>\n        <p> {COPYRIGHT}</p>\n        <!-- <a href=\"[UnsubscribeURL]\" class=\"unsubscribe\">Unsubscribe from email notifications</a> -->\n      </div>\n    </div>\n  </body>\n</html>\n', '2024-12-15 01:45:57', '2025-05-08T21:45:18+05:30'),
(6, 'customer-login-info', 'Customer login info', 'Email with Login Credentials', NULL, 'support@buildmymart.com', 'Login Credentials ', '<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <style>\r\n      body {\r\n        font-family: Arial, sans-serif;\r\n        color: #333;\r\n        background-color: #ffffff;\r\n        padding: 20px;\r\n      }\r\n      .email-container {\r\n        max-width: 600px;\r\n        margin: auto;\r\n        background: #ffffff;\r\n        border: 1px solid #e0e0e0;\r\n        overflow: hidden;\r\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\r\n      }\r\n      .header {\r\n        text-align: center;\r\n        padding: 20px;\r\n        background-color: #ffffff;\r\n      }\r\n      .header img {\r\n        max-height: 60px;\r\n      }\r\n      .content {\r\n        padding: 20px;\r\n        color: #333;\r\n      }\r\n      .credentials {\r\n        background-color: #f2f7ff;\r\n        border: 1px solid #004aad;\r\n        border-radius: 5px;\r\n        padding: 15px;\r\n        margin: 20px 0;\r\n      }\r\n      .credentials p {\r\n        margin: 6px 0;\r\n        font-weight: bold;\r\n      }\r\n      .button {\r\n        display: inline-block;\r\n        padding: 12px 24px;\r\n        margin: 20px 0;\r\n        color: #ffffff;\r\n        background-color: #004aad;\r\n        text-decoration: none;\r\n        border-radius: 5px;\r\n        font-weight: bold;\r\n      }\r\n      .button:hover {\r\n        background-color: #00367e;\r\n      }\r\n      .footer {\r\n        font-size: 12px;\r\n        color: #777;\r\n        text-align: center;\r\n        padding: 20px;\r\n        border-top: 2px solid #ff8a00;\r\n        background-color: #f9f9f9;\r\n      }\r\n      .social-icons {\r\n        margin: 10px 0;\r\n      }\r\n      .social-icons a {\r\n        display: inline-block;\r\n        margin: 0 6px;\r\n      }\r\n      .social-icons img {\r\n        height: 24px;\r\n        width: 24px;\r\n        vertical-align: middle;\r\n      }\r\n      .unsubscribe {\r\n        display: block;\r\n        margin-top: 10px;\r\n        color: #999;\r\n        font-size: 11px;\r\n        text-decoration: underline;\r\n      }\r\n    </style>\r\n  </head>\r\n  <body>\r\n    <div class=\"email-container\">\r\n      <div class=\"header\">\r\n        {SITELOGO}\r\n      </div>\r\n      <div class=\"content\">\r\n        <p>Dear {NAME},</p>\r\n        <p>Welcome to <strong>{STORENAME}</strong>! Your customer account has been successfully created. Below are your login credentials:</p>\r\n\r\n        <div class=\"credentials\">\r\n          <p>Username: <span style=\"font-weight:normal;\">{USERNAME}</span></p>\r\n          <p>Password: <span style=\"font-weight:normal;\">{PASSWORD}</span></p>\r\n        </div>\r\n\r\n        <p style=\"text-align: center; color: #ffffff; \">\r\n          <a href=\"{LOGINURL}\" class=\"button\" style=\"text-align: center; color: #ffffff; \">Login to Your Account</a>\r\n        </p>\r\n\r\n        <p><strong>Note:</strong> For your security, we recommend changing your password after your first login.</p>\r\n\r\n        <p>If you did not register for this account, please contact our support team immediately.</p>\r\n      </div>\r\n      <div class=\"footer\">\r\n        <div class=\"social-icons\">\r\n         {SOCIALICONS}\r\n        </div>\r\n        <p>\r\n          <!-- This email is intended for [Customer Email]. If you are not the intended recipient, please disregard this message.<br> -->\r\n          <strong>Disclaimer:</strong> This email and any attachments are confidential and intended only for the individual or entity to whom they are addressed.\r\n        </p>\r\n        <p>{COPYRIGHT}</p>\r\n        <!-- <a href=\"[UnsubscribeURL]\" class=\"unsubscribe\">Unsubscribe from email notifications</a> -->\r\n      </div>\r\n    </div>\r\n  </body>\r\n</html>\r\n', '2024-12-15 02:48:24', '2024-12-15 02:48:24'),
(7, 'new-password', 'New password', 'Email Notification for change Password', NULL, 'support@buildmymart.com', 'Your password has been changed.', '<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <style>\r\n      body {\r\n        font-family: Arial, sans-serif;\r\n        color: #333;\r\n        background-color: #ffffff;\r\n        padding: 20px;\r\n      }\r\n      .email-container {\r\n        max-width: 600px;\r\n        margin: auto;\r\n        background: #ffffff;\r\n        border: 1px solid #e0e0e0;\r\n        overflow: hidden;\r\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\r\n      }\r\n      .header {\r\n        text-align: center;\r\n        padding: 20px;\r\n        background-color: #ffffff;\r\n      }\r\n      .header img {\r\n        max-height: 60px;\r\n      }\r\n      .content {\r\n        padding: 20px;\r\n        color: #333;\r\n      }\r\n      .button {\r\n        display: inline-block;\r\n        padding: 12px 24px;\r\n        margin: 20px 0;\r\n        color: #ffffff;\r\n        background-color: #004aad;\r\n        text-decoration: none;\r\n        border-radius: 5px;\r\n        font-weight: bold;\r\n      }\r\n      .button:hover {\r\n        background-color: #00367e;\r\n      }\r\n      .footer {\r\n        font-size: 12px;\r\n        color: #777;\r\n        text-align: center;\r\n        padding: 20px;\r\n        border-top: 2px solid #ff8a00;\r\n        background-color: #f9f9f9;\r\n      }\r\n      .social-icons {\r\n        margin: 10px 0;\r\n      }\r\n      .social-icons a {\r\n        display: inline-block;\r\n        margin: 0 6px;\r\n      }\r\n      .social-icons img {\r\n        height: 24px;\r\n        width: 24px;\r\n        vertical-align: middle;\r\n      }\r\n      .unsubscribe {\r\n        display: block;\r\n        margin-top: 10px;\r\n        color: #999;\r\n        font-size: 11px;\r\n        text-decoration: underline;\r\n      }\r\n    </style>\r\n  </head>\r\n  <body>\r\n    <div class=\"email-container\">\r\n      <div class=\"header\">\r\n       {SITELOGO}\r\n      </div>\r\n      <div class=\"content\">\r\n        <p>Dear {NAME},</p>\r\n        <p>Your password has been successfully changed.</p>\r\n\r\n        <p style=\"text-align: center; color: #ffffff;\">\r\n          <a href=\"{LOGINURL}\" class=\"button\" style=\"text-align: center; color: #ffffff; \">Login to account</a>\r\n        </p>\r\n\r\n        <p>If you did not request this password change, please contact our support team immediately.</p>\r\n      </div>\r\n      <div class=\"footer\">\r\n        <div class=\"social-icons\">\r\n        {SOCIALICONS}\r\n        </div>\r\n        <p>\r\n          <!-- This email is intended for [Merchant Email]. If you are not the intended recipient, please disregard this message.<br> -->\r\n          <strong>Disclaimer:</strong> This email and any attachments are confidential and intended only for the individual or entity to whom they are addressed.\r\n        </p>\r\n        <p>{COPYRIGHT}</p>\r\n        <!-- <a href=\"[UnsubscribeURL]\" class=\"unsubscribe\">Unsubscribe from email notifications</a> -->\r\n      </div>\r\n    </div>\r\n  </body>\r\n</html>\r\n', '2024-12-15 02:52:55', '2024-12-15 02:52:55'),
(8, 'order-cancellation-requested', 'order cancellation request', 'Order Cancel Request Information', '', 'support@buildmymart.com', 'Your Cancellation request for the order {ORDER_NUMBER}', '<!DOCTYPE html>\n<html>\n  <head>\n    <style>\n      body {\n        font-family: Arial, sans-serif;\n        color: #333;\n        background-color: #ffffff;\n        padding: 20px;\n      }\n      .email-container {\n        max-width: 700px;\n        margin: auto;\n        background: #ffffff;\n        border: 1px solid #e0e0e0;\n        border-radius: 8px;\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\n      }\n      .header {\n        text-align: center;\n        padding: 20px;\n      }\n      .header img {\n        max-height: 60px;\n      }\n      .content {\n        padding: 20px;\n      }\n      .section-title {\n        font-weight: bold;\n        margin-top: 30px;\n        margin-bottom: 10px;\n        border-bottom: 1px solid #ccc;\n        padding-bottom: 6px;\n      }\n      table {\n        width: 100%;\n        border-collapse: collapse;\n        margin-top: 15px;\n      }\n      table th, table td {\n        border: 1px solid #ddd;\n        padding: 10px;\n        text-align: left;\n      }\n      table th {\n        background-color: #f9f9f9;\n      }\n      .total {\n        text-align: right;\n        font-weight: bold;\n      }\n      .footer {\n        font-size: 12px;\n        color: #777;\n        text-align: center;\n        padding: 20px;\n        border-top: 2px solid #ff8a00;\n        background-color: #f9f9f9;\n      }\n      .button {\n        display: inline-block;\n        padding: 12px 24px;\n        margin: 20px 0;\n        color: #ffffff;\n        background-color: #004aad;\n        text-decoration: none;\n        border-radius: 5px;\n        font-weight: bold;\n      }\n      .button:hover {\n        background-color: #00367e;\n      }\n      .social-icons a {\n        margin: 0 6px;\n        display: inline-block;\n      }\n      .social-icons img {\n        height: 24px;\n        width: 24px;\n      }\n      .unsubscribe {\n        display: block;\n        margin-top: 10px;\n        color: #999;\n        font-size: 11px;\n        text-decoration: underline;\n      }\n    </style>\n  </head>\n  <body>\n    <div class=\"email-container\">\n      <div class=\"header\">\n        {SITELOGO}\n      </div>\n      <div class=\"content\">\n        <p>Dear {NAME},</p>\n        <p>We\'ve received your request to cancel the following items from your order <strong>{ORDER_NUMBER}</strong>. Below are the cancellation details:</p>\n\n        <div class=\"section-title\">Cancellation Request</div>\n        <table>\n          <thead>\n            <tr>\n              <th>Product</th>\n              <th>Requested Qty</th>\n              <th>Unit Price</th>\n              <th>Subtotal</th>\n            </tr>\n          </thead>\n          <tbody>\n            <!-- Repeat this row for each product -->\n           {PRODUCTLIST}\n            <!-- End product rows -->\n            <!-- <tr> \n              <td colspan=\"3\" class=\"total\">Total Cancellation Value</td>\n              <td><strong>{TOTAL_AMOUNT}</strong></td>\n            </tr> -->\n          </tbody>\n        </table>\n\n        <p style=\"text-align:center; color: #ffffff;\">\n          <a href=\"{VIEW_ORDER}\" class=\"button\" style=\"color: #ffffff;\">View Order Details</a>\n        </p>\n        <p><strong>Status:</strong> Your request is under review. You will be notified once it is processed.</p>\n\n        <p>If you did not request this cancellation or have any questions, please contact our support team immediately.</p>\n\n        <p>Thank you for shopping with {STORENAME}</p>\n      </div>\n\n      <div class=\"footer\">\n        <div class=\"social-icons\">\n         {SOCIALICONS}\n        </div>\n        <p>\n          <!-- This message was sent to [Customer Email].<br> -->\n          <strong>Disclaimer:</strong> This email and any attachments are confidential and intended only for the individual or entity to whom they are addressed.\n        </p>\n        <p>{COPYRIGHT}</p>\n        <!-- <a href=\"[UnsubscribeURL]\" class=\"unsubscribe\">Unsubscribe from email notifications</a> -->\n      </div>\n    </div>\n  </body>\n</html>\n', '2024-12-15 06:03:45', '2024-12-15 06:03:45'),
(9, 'order-confirmed', 'Order Confirmed', 'Order confirmed Information', '', 'support@buildmymart.com', 'Your order {ORDER_NUMBER} has been confirmed', '<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <style>\r\n      body {\r\n        font-family: Arial, sans-serif;\r\n        color: #333;\r\n        background-color: #ffffff;\r\n        padding: 20px;\r\n      }\r\n      .email-container {\r\n        max-width: 700px;\r\n        margin: auto;\r\n        background: #ffffff;\r\n        border: 1px solid #e0e0e0;\r\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\r\n      }\r\n      .header {\r\n        text-align: center;\r\n        padding: 20px;\r\n      }\r\n      .header img {\r\n        max-height: 60px;\r\n      }\r\n      .content {\r\n        padding: 20px;\r\n      }\r\n      .section-title {\r\n        font-weight: bold;\r\n        margin-top: 30px;\r\n        margin-bottom: 10px;\r\n        border-bottom: 1px solid #ccc;\r\n        padding-bottom: 6px;\r\n      }\r\n      table {\r\n        width: 100%;\r\n        border-collapse: collapse;\r\n        margin-top: 15px;\r\n      }\r\n      table th, table td {\r\n        border: 1px solid #ddd;\r\n        padding: 10px;\r\n        text-align: left;\r\n      }\r\n      table th {\r\n        background-color: #f9f9f9;\r\n      }\r\n      .total {\r\n        text-align: right;\r\n        font-weight: bold;\r\n      }\r\n      .address-box {\r\n        background-color: #f5f5f5;\r\n        padding: 15px;\r\n        border-radius: 5px;\r\n        margin-bottom: 20px;\r\n      }\r\n      .footer {\r\n        font-size: 12px;\r\n        color: #777;\r\n        text-align: center;\r\n        padding: 20px;\r\n        border-top: 2px solid #ff8a00;\r\n        background-color: #f9f9f9;\r\n      }\r\n      .social-icons a {\r\n        margin: 0 6px;\r\n        display: inline-block;\r\n      }\r\n      .social-icons img {\r\n        height: 24px;\r\n        width: 24px;\r\n      }\r\n      .unsubscribe {\r\n        display: block;\r\n        margin-top: 10px;\r\n        color: #999;\r\n        font-size: 11px;\r\n        text-decoration: underline;\r\n      }\r\n    </style>\r\n  </head>\r\n  <body>\r\n    <div class=\"email-container\">\r\n      <div class=\"header\">\r\n        {SITELOGO}\r\n      </div>\r\n      <div class=\"content\">\r\n        <p>Dear {NAME},</p>\r\n        <p>Thank you for shopping with <strong>{STORENAME}</strong>! Your order <strong>{ORDER_NUMBER} </strong> has been successfully confirmed.</p>\r\n\r\n        <div class=\"section-title\">Delivery Address</div>\r\n        <div class=\"address-box\">\r\n          {ORDER_ADDRESS}\r\n        </div>\r\n\r\n     <!--    <div class=\"section-title\">Order Summary</div>\r\n        <table>\r\n          <thead>\r\n            <tr>\r\n              <th>Product</th>\r\n              <th>Qty</th>\r\n              <th>Unit Price</th>\r\n              <th>Subtotal</th>\r\n            </tr>\r\n          </thead>\r\n          <tbody>\r\n\r\n            <tr>\r\n              <td>Product Name 1</td>\r\n              <td>2</td>\r\n              <td>$10.00</td>\r\n              <td>$20.00</td>\r\n            </tr>\r\n            <tr>\r\n              <td>Product Name 2</td>\r\n              <td>1</td>\r\n              <td>$15.00</td>\r\n              <td>$15.00</td>\r\n            </tr>\r\n           \r\n            <tr>\r\n              <td colspan=\"3\" class=\"total\">Total Amount</td>\r\n              <td><strong>$35.00</strong></td>\r\n            </tr>\r\n          </tbody>\r\n        </table> -->\r\n\r\n        <!-- <p><strong>Estimated Delivery:</strong> [Estimated Delivery Date]</p> -->\r\n        <p>You will receive another notification when your order is shipped.</p>\r\n\r\n        <p>If you have any questions about your order, feel free to contact our support team.</p>\r\n\r\n        <p>Thank you for choosing {STORENAME}!</p>\r\n      </div>\r\n\r\n      <div class=\"footer\">\r\n        <div class=\"social-icons\">\r\n       {SOCIALICONS}\r\n        </div>\r\n        <p>\r\n          <!-- This message was sent to [Customer Email].<br> -->\r\n          <strong>Disclaimer:</strong> This email and any attachments are confidential and intended only for the individual or entity to whom they are addressed.\r\n        </p>\r\n        <p>{COPYRIGHT}</p>\r\n        <!-- <a href=\"[UnsubscribeURL]\" class=\"unsubscribe\">Unsubscribe from email notifications</a> -->\r\n      </div>\r\n    </div>\r\n  </body>\r\n</html>\r\n', '2024-12-15 08:21:26', '2024-12-15 08:21:26'),
(10, 'order-dispatched', 'Order dispatched', 'Order Dispatched Information', NULL, 'support@buildmymart.com', 'Your order is dispatched.', '<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <style>\r\n      body {\r\n        font-family: Arial, sans-serif;\r\n        color: #333;\r\n        background-color: #ffffff;\r\n        padding: 20px;\r\n      }\r\n      .email-container {\r\n        max-width: 700px;\r\n        margin: auto;\r\n        background: #ffffff;\r\n        border: 1px solid #e0e0e0;\r\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\r\n      }\r\n      .header {\r\n        text-align: center;\r\n        padding: 20px;\r\n      }\r\n      .header img {\r\n        max-height: 60px;\r\n      }\r\n      .content {\r\n        padding: 20px;\r\n      }\r\n      .section-title {\r\n        font-weight: bold;\r\n        margin-top: 30px;\r\n        margin-bottom: 10px;\r\n        border-bottom: 1px solid #ccc;\r\n        padding-bottom: 6px;\r\n      }\r\n      table {\r\n        width: 100%;\r\n        border-collapse: collapse;\r\n        margin-top: 15px;\r\n      }\r\n      table th, table td {\r\n        border: 1px solid #ddd;\r\n        padding: 10px;\r\n        text-align: left;\r\n      }\r\n      table th {\r\n        background-color: #f9f9f9;\r\n      }\r\n      .total {\r\n        text-align: right;\r\n        font-weight: bold;\r\n      }\r\n      .address-box {\r\n        background-color: #f5f5f5;\r\n        padding: 15px;\r\n        border-radius: 5px;\r\n        margin-bottom: 20px;\r\n      }\r\n      .button {\r\n        display: inline-block;\r\n        padding: 10px 20px;\r\n        background-color: #004aad;\r\n        color: #fff;\r\n        text-decoration: none;\r\n        border-radius: 5px;\r\n        font-weight: bold;\r\n        margin-top: 20px;\r\n      }\r\n      .button:hover {\r\n        background-color: #00367e;\r\n      }\r\n      .footer {\r\n        font-size: 12px;\r\n        color: #777;\r\n        text-align: center;\r\n        padding: 20px;\r\n        border-top: 2px solid #ff8a00;\r\n        background-color: #f9f9f9;\r\n      }\r\n      .social-icons a {\r\n        margin: 0 6px;\r\n        display: inline-block;\r\n      }\r\n      .social-icons img {\r\n        height: 24px;\r\n        width: 24px;\r\n      }\r\n      .unsubscribe {\r\n        display: block;\r\n        margin-top: 10px;\r\n        color: #999;\r\n        font-size: 11px;\r\n        text-decoration: underline;\r\n      }\r\n    </style>\r\n  </head>\r\n  <body>\r\n    <div class=\"email-container\">\r\n      <div class=\"header\">\r\n        {SITELOGO}\r\n      </div>\r\n      <div class=\"content\">\r\n        <p>Dear {NAME},</p>\r\n        <p>Great news! Your order <strong>{ORDER_NUMBER}</strong> has been dispatched and is on its way to you.</p>\r\n\r\n        <div class=\"section-title\">Delivery Address</div>\r\n        <div class=\"address-box\">\r\n         {ORDER_ADDRESS}\r\n        </div>\r\n\r\n       <!--  <div class=\"section-title\">Order Summary</div>\r\n        <table>\r\n          <thead>\r\n            <tr>\r\n              <th>Product</th>\r\n              <th>Qty</th>\r\n              <th>Unit Price</th>\r\n              <th>Subtotal</th>\r\n            </tr>\r\n          </thead>\r\n          <tbody>\r\n          \r\n            <tr>\r\n              <td>Product Name 1</td>\r\n              <td>2</td>\r\n              <td>$10.00</td>\r\n              <td>$20.00</td>\r\n            </tr>\r\n            <tr>\r\n              <td>Product Name 2</td>\r\n              <td>1</td>\r\n              <td>$15.00</td>\r\n              <td>$15.00</td>\r\n            </tr>\r\n          \r\n            <tr>\r\n              <td colspan=\"3\" class=\"total\">Total Amount</td>\r\n              <td><strong>$35.00</strong></td>\r\n            </tr>\r\n          </tbody>\r\n        </table> -->\r\n\r\n        <div class=\"section-title\">Tracking Information</div>\r\n        <!-- <p><strong>Courier:</strong> [Courier Name]</p> -->\r\n        <!-- <p><strong>Tracking Number:</strong> [Tracking Number]</p> -->\r\n        <p>\r\n          <a href=\"{VIEW_ORDER}\" class=\"button\" style=\"text-align: center; color: #ffffff;\">Track Your Order</a>\r\n        </p>\r\n\r\n        <p>We hope you enjoy your purchase! If you have any issues, feel free to contact our support team.</p>\r\n\r\n        <p>Thank you for shopping with {STORENAME}!</p>\r\n      </div>\r\n\r\n      <div class=\"footer\">\r\n        <div class=\"social-icons\">\r\n         {SOCIALICONS}\r\n        </div>\r\n        <p>\r\n          <!-- This message was sent to [Customer Email].<br> -->\r\n          <strong>Disclaimer:</strong> This email and any attachments are confidential and intended only for the individual or entity to whom they are addressed.\r\n        </p>\r\n        <p>{COPYRIGHT}</p>\r\n        <!-- <a href=\"[UnsubscribeURL]\" class=\"unsubscribe\">Unsubscribe from email notifications</a> -->\r\n      </div>\r\n    </div>\r\n  </body>\r\n</html>\r\n', '2024-12-15 15:10:46', '2024-12-15 15:10:46'),
(11, 'order-delivered', 'Order Delivered', 'Order Delivered Information', NULL, 'support@buildmymart.com', 'Your Order Has Been Delivered!', '<!DOCTYPE html>\n<html>\n  <head>\n    <style>\n      body {\n        font-family: Arial, sans-serif;\n        color: #333;\n        background-color: #ffffff;\n        padding: 20px;\n      }\n      .email-container {\n        max-width: 700px;\n        margin: auto;\n        background: #ffffff;\n        border: 1px solid #e0e0e0;\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\n      }\n      .header {\n        text-align: center;\n        padding: 20px;\n      }\n      .header img {\n        max-height: 60px;\n      }\n      .content {\n        padding: 20px;\n      }\n      .section-title {\n        font-weight: bold;\n        margin-top: 30px;\n        margin-bottom: 10px;\n        border-bottom: 1px solid #ccc;\n        padding-bottom: 6px;\n      }\n      table {\n        width: 100%;\n        border-collapse: collapse;\n        margin-top: 15px;\n      }\n      table th, table td {\n        border: 1px solid #ddd;\n        padding: 10px;\n        text-align: left;\n      }\n      table th {\n        background-color: #f9f9f9;\n      }\n      .total {\n        text-align: right;\n        font-weight: bold;\n      }\n      .address-box {\n        background-color: #f5f5f5;\n        padding: 15px;\n        border-radius: 5px;\n        margin-bottom: 20px;\n      }\n      .button {\n        display: inline-block;\n        padding: 10px 20px;\n        background-color: #004aad;\n        color: #fff;\n        text-decoration: none;\n        border-radius: 5px;\n        font-weight: bold;\n        margin-top: 20px;\n      }\n      .button:hover {\n        background-color: #00367e;\n      }\n      .footer {\n        font-size: 12px;\n        color: #777;\n        text-align: center;\n        padding: 20px;\n        border-top: 2px solid #ff8a00;\n        background-color: #f9f9f9;\n      }\n      .social-icons a {\n        margin: 0 6px;\n        display: inline-block;\n      }\n      .social-icons img {\n        height: 24px;\n        width: 24px;\n      }\n      .unsubscribe {\n        display: block;\n        margin-top: 10px;\n        color: #999;\n        font-size: 11px;\n        text-decoration: underline;\n      }\n    </style>\n  </head>\n  <body>\n    <div class=\"email-container\">\n      <div class=\"header\">\n        {SITELOGO}\n      </div>\n      <div class=\"content\">\n        <p>Dear {NAME},</p>\n        <p>We’re happy to let you know that your order <strong>{ORDER_NUMBER}</strong> has been successfully delivered to the following address:</p>\n\n        <div class=\"address-box\">\n         {ORDER_ADDRESS}\n        </div>\n\n     <!--    <div class=\"section-title\">Order Summary</div>\n        <table>\n          <thead>\n            <tr>\n              <th>Product</th>\n              <th>Qty</th>\n              <th>Unit Price</th>\n              <th>Subtotal</th>\n            </tr>\n          </thead>\n          <tbody>\n         \n            <tr>\n              <td>Product Name 1</td>\n              <td>2</td>\n              <td>$10.00</td>\n              <td>$20.00</td>\n            </tr>\n            <tr>\n              <td>Product Name 2</td>\n              <td>1</td>\n              <td>$15.00</td>\n              <td>$15.00</td>\n            </tr>\n           \n            <tr>\n              <td colspan=\"3\" class=\"total\">Total Amount</td>\n              <td><strong>$35.00</strong></td>\n            </tr>\n          </tbody>\n        </table> -->\n\n        <p>If everything looks good, we\'d love to hear your feedback. Your satisfaction means the world to us.</p>\n\n        <p style=\"text-align: center;\">\n          <a href=\"{RATINGPAGEURL}\" class=\"button\" style=\"text-align: center; color: #ffffff;\">Leave Feedback</a>\n        </p>\n\n        <p>Thank you for shopping with <strong>{STORENAME}</strong>! We hope to see you again soon.</p>\n      </div>\n\n      <div class=\"footer\">\n        <div class=\"social-icons\">\n       {SOCIALICONS}\n        </div>\n        <p>\n          <!-- This message was sent to [Customer Email].<br> -->\n          <strong>Disclaimer:</strong> This email and any attachments are confidential and intended only for the individual or entity to whom they are addressed.\n        </p>\n        <p>{COPYRIGHT}</p>\n        <!-- <a href=\"[UnsubscribeURL]\" class=\"unsubscribe\">Unsubscribe from email notifications</a> -->\n      </div>\n    </div>\n  </body>\n</html>\n', '2024-12-15 15:20:40', '2024-12-15 15:20:40'),
(12, 'newsletter-subscription-acknowledgement', 'Thank you for subscribing', 'Newsletter subscription Information', NULL, 'support@buildmymart.com', 'Thank you for subscribing', '<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <style>\r\n      body {\r\n        font-family: Arial, sans-serif;\r\n        color: #333;\r\n        background-color: #ffffff;\r\n        padding: 20px;\r\n      }\r\n      .email-container {\r\n        max-width: 600px;\r\n        margin: auto;\r\n        background: #ffffff;\r\n        border: 1px solid #e0e0e0;\r\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\r\n      }\r\n      .header {\r\n        text-align: center;\r\n        padding: 20px;\r\n      }\r\n      .header img {\r\n        max-height: 60px;\r\n      }\r\n      .content {\r\n        padding: 20px;\r\n      }\r\n      .button {\r\n        display: inline-block;\r\n        padding: 12px 24px;\r\n        margin: 20px 0;\r\n        color: #ffffff;\r\n        background-color: #004aad;\r\n        text-decoration: none;\r\n        border-radius: 5px;\r\n        font-weight: bold;\r\n      }\r\n      .button:hover {\r\n        background-color: #00367e;\r\n      }\r\n      .footer {\r\n        font-size: 12px;\r\n        color: #777;\r\n        text-align: center;\r\n        padding: 20px;\r\n        border-top: 2px solid #ff8a00;\r\n        background-color: #f9f9f9;\r\n      }\r\n      .social-icons {\r\n        margin: 10px 0;\r\n      }\r\n      .social-icons a {\r\n        display: inline-block;\r\n        margin: 0 6px;\r\n      }\r\n      .social-icons img {\r\n        height: 24px;\r\n        width: 24px;\r\n        vertical-align: middle;\r\n      }\r\n      .unsubscribe {\r\n        display: block;\r\n        margin-top: 10px;\r\n        color: #999;\r\n        font-size: 11px;\r\n        text-decoration: underline;\r\n      }\r\n    </style>\r\n  </head>\r\n  <body>\r\n    <div class=\"email-container\">\r\n      <div class=\"header\">\r\n        {SITELOGO}\r\n      </div>\r\n      <div class=\"content\">\r\n        <p>Hi Subscriber,</p>\r\n        <p>Thank you for subscribing to the <strong>{STORENAME} Newsletter</strong>!</p>\r\n        <p>You\'ll now be the first to know about:</p>\r\n        <ul>\r\n          <li>Exclusive discounts and offers</li>\r\n          <li>Latest product arrivals</li>\r\n          <li>Merchant tips and resources</li>\r\n        </ul>\r\n        <p>We’re excited to have you on board!</p>\r\n\r\n        <p style=\"text-align: center; color: #ffffff;\">\r\n          <a href=\"{STOREURL}\" class=\"button\" style=\"text-align: center; color: #ffffff;\">Visit Our Store</a>\r\n        </p>\r\n\r\n        <p>If this wasn\'t you or you subscribed by mistake, you can unsubscribe anytime using the link below.</p>\r\n      </div>\r\n\r\n      <div class=\"footer\">\r\n        <div class=\"social-icons\">\r\n         {SOCIALICONS}\r\n        </div>\r\n        <p>\r\n          <!-- This email was sent to [Subscriber Email].<br> -->\r\n          If you did not subscribe or wish to stop receiving emails, you may unsubscribe at any time.\r\n        </p>\r\n        <p>{COPYRIGHT}</p>\r\n        <!-- <a href=\"[UnsubscribeURL]\" class=\"unsubscribe\">Unsubscribe from newsletter</a> -->\r\n      </div>\r\n    </div>\r\n  </body>\r\n</html>\r\n', '2024-12-19 14:18:05', '2024-12-19 14:18:05');
INSERT INTO `tbl_email_templates` (`template_id`, `email_slug`, `email_title`, `email_info`, `from_name`, `from_email`, `email_subject`, `email_content`, `inserted_date`, `updated_date`) VALUES
(15, 'change-password', 'Change Password', 'Change Password Notification', NULL, 'support@buildmymart.com', 'Your password has been changed.', '<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <style>\r\n      body {\r\n        font-family: Arial, sans-serif;\r\n        color: #333;\r\n        background-color: #ffffff;\r\n        padding: 20px;\r\n      }\r\n      .email-container {\r\n        max-width: 600px;\r\n        margin: auto;\r\n        background: #ffffff;\r\n        border: 1px solid #e0e0e0;\r\n        overflow: hidden;\r\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\r\n      }\r\n      .header {\r\n        text-align: center;\r\n        padding: 20px;\r\n        background-color: #ffffff;\r\n      }\r\n      .header img {\r\n        max-height: 60px;\r\n      }\r\n      .content {\r\n        padding: 20px;\r\n        color: #333;\r\n      }\r\n      .button {\r\n        display: inline-block;\r\n        padding: 12px 24px;\r\n        margin: 20px 0;\r\n        color: #ffffff;\r\n        background-color: #004aad;\r\n        text-decoration: none;\r\n        border-radius: 5px;\r\n        font-weight: bold;\r\n      }\r\n      .button:hover {\r\n        background-color: #00367e;\r\n      }\r\n      .footer {\r\n        font-size: 12px;\r\n        color: #777;\r\n        text-align: center;\r\n        padding: 20px;\r\n        border-top: 2px solid #ff8a00;\r\n        background-color: #f9f9f9;\r\n      }\r\n      .social-icons {\r\n        margin: 10px 0;\r\n      }\r\n      .social-icons a {\r\n        display: inline-block;\r\n        margin: 0 6px;\r\n      }\r\n      .social-icons img {\r\n        height: 24px;\r\n        width: 24px;\r\n        vertical-align: middle;\r\n      }\r\n      .unsubscribe {\r\n        display: block;\r\n        margin-top: 10px;\r\n        color: #999;\r\n        font-size: 11px;\r\n        text-decoration: underline;\r\n      }\r\n    </style>\r\n  </head>\r\n  <body>\r\n    <div class=\"email-container\">\r\n      <div class=\"header\">\r\n        {SITELOGO}\r\n      </div>\r\n      <div class=\"content\">\r\n        <p>Dear {NAME},</p>\r\n        <p>Your password has been successfully changed.</p>\r\n\r\n        <p style=\"text-align: center;\">\r\n          <a href=\"{LOGINURL}\" class=\"button\">Login to account</a>\r\n        </p>\r\n\r\n        <p>If you did not request this password change, please contact our support team immediately.</p>\r\n      </div>\r\n      <div class=\"footer\">\r\n        <div class=\"social-icons\">\r\n        {SOCIALICONS}\r\n        </div>\r\n        <p>\r\n          <!-- This email is intended for [Merchant Email]. If you are not the intended recipient, please disregard this message.<br> -->\r\n          <strong>Disclaimer:</strong> This email and any attachments are confidential and intended only for the individual or entity to whom they are addressed.\r\n        </p>\r\n        <p>{COPYRIGHT}</p>\r\n        <!-- <a href=\"[UnsubscribeURL]\" class=\"unsubscribe\">Unsubscribe from email notifications</a> -->\r\n      </div>\r\n    </div>\r\n  </body>\r\n</html>\r\n', '2025-02-07 05:39:25', '2025-02-07 05:39:25'),
(16, 'subscription-order-complaint', 'Subscription Order', 'Subscription Order Complaint', '', 'support@buildmymart.com', 'We Have Received Your Subscription Order Complaint', '<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <style>\r\n      body {\r\n        font-family: Arial, sans-serif;\r\n        color: #333;\r\n        background-color: #ffffff;\r\n        padding: 20px;\r\n      }\r\n      .email-container {\r\n        max-width: 700px;\r\n        margin: auto;\r\n        background: #ffffff;\r\n        border: 1px solid #e0e0e0;\r\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\r\n      }\r\n      .header {\r\n        text-align: center;\r\n        padding: 20px;\r\n      }\r\n      .header img {\r\n        max-height: 60px;\r\n      }\r\n      .content {\r\n        padding: 20px;\r\n      }\r\n      .section {\r\n        background-color: #f9f9f9;\r\n        border-left: 4px solid #004aad;\r\n        padding: 15px;\r\n        border-radius: 5px;\r\n        margin: 20px 0;\r\n      }\r\n      .section p {\r\n        margin: 5px 0;\r\n      }\r\n      .button {\r\n        display: inline-block;\r\n        padding: 12px 24px;\r\n        margin: 20px 0;\r\n        color: #ffffff;\r\n        background-color: #004aad;\r\n        text-decoration: none;\r\n        border-radius: 5px;\r\n        font-weight: bold;\r\n      }\r\n      .button:hover {\r\n        background-color: #00367e;\r\n      }\r\n      .footer {\r\n        font-size: 12px;\r\n        color: #777;\r\n        text-align: center;\r\n        padding: 20px;\r\n        border-top: 2px solid #ff8a00;\r\n        background-color: #f9f9f9;\r\n      }\r\n      .social-icons {\r\n        margin: 10px 0;\r\n      }\r\n      .social-icons a {\r\n        display: inline-block;\r\n        margin: 0 6px;\r\n      }\r\n      .social-icons img {\r\n        height: 24px;\r\n        width: 24px;\r\n        vertical-align: middle;\r\n      }\r\n      .unsubscribe {\r\n        display: block;\r\n        margin-top: 10px;\r\n        color: #999;\r\n        font-size: 11px;\r\n        text-decoration: underline;\r\n      }\r\n    </style>\r\n  </head>\r\n  <body>\r\n    <div class=\"email-container\">\r\n      <div class=\"header\">\r\n        {SITELOGO}\r\n      </div>\r\n      <div class=\"content\">\r\n        <p>Dear {NAME},</p>\r\n        <p>We have received your complaint regarding your subscription order <strong>{ORDER_NUMBER}</strong>. Your concerns are important to us and our support team is currently reviewing the issue.</p>\r\n\r\n     \r\n\r\n        <p>Our team will respond within 24–48 hours. You may track the status of your complaint or provide additional information at the link below:</p>\r\n\r\n        <p style=\"text-align: center; color: #ffffff;\">\r\n          <a href=\"{VIEWCOMPLAINT}\" class=\"button\" style=\"text-align: center; color: #ffffff;\">View Details</a>\r\n        </p>\r\n\r\n        <p>If you have any further questions, feel free to reach out to our support team anytime.</p>\r\n        <p>Thank you for your patience and for being a valued subscriber.</p>\r\n      </div>\r\n\r\n      <div class=\"footer\">\r\n        <div class=\"social-icons\">\r\n         {SOCIALICONS}\r\n        </div>\r\n        <p>\r\n          <!-- This message was sent to [Customer Email].<br> -->\r\n          <strong>Disclaimer:</strong> This email and any attachments are confidential and intended only for the individual or entity to whom they are addressed.\r\n        </p>\r\n        <p>{COPYRIGHT}</p>\r\n        <!-- <a href=\"[UnsubscribeURL]\" class=\"unsubscribe\">Unsubscribe from notifications</a> -->\r\n      </div>\r\n    </div>\r\n  </body>\r\n</html>', '2025-03-06 12:27:39', '2025-08-29T18:07:49+05:30'),
(17, 'subscription-order-complaint-admin', 'Subscription Order Complaint', 'A order complaint information', '', 'support@buildmymart.com', 'New Subscription Order Complaint Received', '<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <style>\r\n      body {\r\n        font-family: Arial, sans-serif;\r\n        color: #333;\r\n        background-color: #ffffff;\r\n        padding: 20px;\r\n      }\r\n      .email-container {\r\n        max-width: 700px;\r\n        margin: auto;\r\n        background: #ffffff;\r\n        border: 1px solid #e0e0e0;\r\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\r\n      }\r\n      .header {\r\n        text-align: center;\r\n        padding: 20px;\r\n      }\r\n      .header img {\r\n        max-height: 60px;\r\n      }\r\n      .content {\r\n        padding: 20px;\r\n      }\r\n      .section {\r\n        background-color: #f9f9f9;\r\n        border-left: 4px solid #004aad;\r\n        padding: 15px;\r\n        border-radius: 5px;\r\n        margin: 20px 0;\r\n      }\r\n      .section p {\r\n        margin: 5px 0;\r\n      }\r\n      .button {\r\n        display: inline-block;\r\n        padding: 12px 24px;\r\n        margin: 20px 0;\r\n        color: #ffffff;\r\n        background-color: #004aad;\r\n        text-decoration: none;\r\n        border-radius: 5px;\r\n        font-weight: bold;\r\n      }\r\n      .button:hover {\r\n        background-color: #00367e;\r\n      }\r\n      .footer {\r\n        font-size: 12px;\r\n        color: #777;\r\n        text-align: center;\r\n        padding: 20px;\r\n        border-top: 2px solid #ff8a00;\r\n        background-color: #f9f9f9;\r\n      }\r\n      .social-icons {\r\n        margin: 10px 0;\r\n      }\r\n      .social-icons a {\r\n        display: inline-block;\r\n        margin: 0 6px;\r\n      }\r\n      .social-icons img {\r\n        height: 24px;\r\n        width: 24px;\r\n        vertical-align: middle;\r\n      }\r\n      .unsubscribe {\r\n        display: block;\r\n        margin-top: 10px;\r\n        color: #999;\r\n        font-size: 11px;\r\n        text-decoration: underline;\r\n      }\r\n    </style>\r\n  </head>\r\n  <body>\r\n    <div class=\"email-container\">\r\n      <div class=\"header\">\r\n       {SITELOGO}\r\n      </div>\r\n      <div class=\"content\">\r\n        <p>Dear {NAME},</p>\r\n        <p>We have received your complaint regarding your subscription order <strong>{ORDER_NUMBER}</strong>. Your concerns are important to us and our support team is currently reviewing the issue.</p>\r\n\r\n     \r\n\r\n        <p>Our team will respond within 24–48 hours. You may track the status of your complaint or provide additional information at the link below:</p>\r\n\r\n       \r\n\r\n        <p>If you have any further questions, feel free to reach out to our support team anytime.</p>\r\n        <p>Thank you for your patience and for being a valued subscriber.</p>\r\n      </div>\r\n\r\n      <div class=\"footer\">\r\n        <div class=\"social-icons\">\r\n       {SOCIALICONS}\r\n        </div>\r\n        <p>\r\n          <!-- This message was sent to [Customer Email].<br> -->\r\n          <strong>Disclaimer:</strong> This email and any attachments are confidential and intended only for the individual or entity to whom they are addressed.\r\n        </p>\r\n        <p>{COPYRIGHT}</p>\r\n        <!-- <a href=\"[UnsubscribeURL]\" class=\"unsubscribe\">Unsubscribe from notifications</a> -->\r\n      </div>\r\n    </div>\r\n  </body>\r\n</html>\r\n', NULL, NULL),
(18, 'order-cancellation-request-rejected', 'order cancellation request rejected', 'Order Cancel Request Information rejected', '', 'support@buildmymart.com', 'You order cancellation request is rejected. ', '<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <style>\r\n      body {\r\n        font-family: Arial, sans-serif;\r\n        color: #333;\r\n        background-color: #ffffff;\r\n        padding: 20px;\r\n      }\r\n      .email-container {\r\n        max-width: 700px;\r\n        margin: auto;\r\n        background: #ffffff;\r\n        border: 1px solid #e0e0e0;\r\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\r\n      }\r\n      .header {\r\n        text-align: center;\r\n        padding: 20px;\r\n      }\r\n      .header img {\r\n        max-height: 60px;\r\n      }\r\n      .content {\r\n        padding: 20px;\r\n      }\r\n      .section-title {\r\n        font-weight: bold;\r\n        margin-top: 30px;\r\n        margin-bottom: 10px;\r\n        border-bottom: 1px solid #ccc;\r\n        padding-bottom: 6px;\r\n      }\r\n      table {\r\n        width: 100%;\r\n        border-collapse: collapse;\r\n        margin-top: 15px;\r\n      }\r\n      table th, table td {\r\n        border: 1px solid #ddd;\r\n        padding: 10px;\r\n        text-align: left;\r\n      }\r\n      table th {\r\n        background-color: #f9f9f9;\r\n      }\r\n      .total {\r\n        text-align: right;\r\n        font-weight: bold;\r\n      }\r\n      .footer {\r\n        font-size: 12px;\r\n        color: #777;\r\n        text-align: center;\r\n        padding: 20px;\r\n        border-top: 2px solid #ff8a00;\r\n        background-color: #f9f9f9;\r\n      }\r\n      .button {\r\n        display: inline-block;\r\n        padding: 12px 24px;\r\n        margin: 20px 0;\r\n        color: #ffffff;\r\n        background-color: #004aad;\r\n        text-decoration: none;\r\n        border-radius: 5px;\r\n        font-weight: bold;\r\n      }\r\n      .button:hover {\r\n        background-color: #00367e;\r\n      }\r\n      .social-icons a {\r\n        margin: 0 6px;\r\n        display: inline-block;\r\n      }\r\n      .social-icons img {\r\n        height: 24px;\r\n        width: 24px;\r\n      }\r\n      .unsubscribe {\r\n        display: block;\r\n        margin-top: 10px;\r\n        color: #999;\r\n        font-size: 11px;\r\n        text-decoration: underline;\r\n      }\r\n    </style>\r\n  </head>\r\n  <body>\r\n    <div class=\"email-container\">\r\n      <div class=\"header\">\r\n        {SITELOGO}\r\n      </div>\r\n      <div class=\"content\">\r\n        <p>Dear {NAME},</p>\r\n        <p>Your request has been rejected for your order <strong>{ORDER_NUMBER}</strong>. Below are the details:</p>\r\n\r\n        <div class=\"section-title\">{MESSAGE}</div>\r\n       \r\n\r\n        <!--<p style=\"text-align:center; color: #ffffff;\">-->\r\n        <!--  <a href=\"{VIEW_ORDER}\" class=\"button\" style=\"color: #ffffff;\">View Order Details</a>-->\r\n        <!--</p>-->\r\n\r\n        <p>If you  have any questions, please contact our support team immediately.</p>\r\n\r\n        <p>Thank you for shopping with {STORENAME}</p>\r\n      </div>\r\n\r\n      <div class=\"footer\">\r\n        <div class=\"social-icons\">\r\n         {SOCIALICONS}\r\n        </div>\r\n        <p>\r\n          <!-- This message was sent to [Customer Email].<br> -->\r\n          <strong>Disclaimer:</strong> This email and any attachments are confidential and intended only for the individual or entity to whom they are addressed.\r\n        </p>\r\n        <p>{COPYRIGHT}</p>\r\n        <!-- <a href=\"[UnsubscribeURL]\" class=\"unsubscribe\">Unsubscribe from email notifications</a> -->\r\n      </div>\r\n    </div>\r\n  </body>\r\n</html>\r\n', '2024-12-15 06:03:45', '2024-12-15 06:03:45'),
(19, 'order-cancellation-request-accepted', 'order cancellation request accepted', 'Order Cancel Request Information accepted', '', 'support@buildmymart.com', 'You order cancellation  request has been accepted. ', '<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <style>\r\n      body {\r\n        font-family: Arial, sans-serif;\r\n        color: #333;\r\n        background-color: #ffffff;\r\n        padding: 20px;\r\n      }\r\n      .email-container {\r\n        max-width: 700px;\r\n        margin: auto;\r\n        background: #ffffff;\r\n        border: 1px solid #e0e0e0;\r\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\r\n      }\r\n      .header {\r\n        text-align: center;\r\n        padding: 20px;\r\n      }\r\n      .header img {\r\n        max-height: 60px;\r\n      }\r\n      .content {\r\n        padding: 20px;\r\n      }\r\n      .section-title {\r\n        font-weight: bold;\r\n        margin-top: 30px;\r\n        margin-bottom: 10px;\r\n        border-bottom: 1px solid #ccc;\r\n        padding-bottom: 6px;\r\n      }\r\n      table {\r\n        width: 100%;\r\n        border-collapse: collapse;\r\n        margin-top: 15px;\r\n      }\r\n      table th, table td {\r\n        border: 1px solid #ddd;\r\n        padding: 10px;\r\n        text-align: left;\r\n      }\r\n      table th {\r\n        background-color: #f9f9f9;\r\n      }\r\n      .total {\r\n        text-align: right;\r\n        font-weight: bold;\r\n      }\r\n      .footer {\r\n        font-size: 12px;\r\n        color: #777;\r\n        text-align: center;\r\n        padding: 20px;\r\n        border-top: 2px solid #ff8a00;\r\n        background-color: #f9f9f9;\r\n      }\r\n      .button {\r\n        display: inline-block;\r\n        padding: 12px 24px;\r\n        margin: 20px 0;\r\n        color: #ffffff;\r\n        background-color: #004aad;\r\n        text-decoration: none;\r\n        border-radius: 5px;\r\n        font-weight: bold;\r\n      }\r\n      .button:hover {\r\n        background-color: #00367e;\r\n      }\r\n      .social-icons a {\r\n        margin: 0 6px;\r\n        display: inline-block;\r\n      }\r\n      .social-icons img {\r\n        height: 24px;\r\n        width: 24px;\r\n      }\r\n      .unsubscribe {\r\n        display: block;\r\n        margin-top: 10px;\r\n        color: #999;\r\n        font-size: 11px;\r\n        text-decoration: underline;\r\n      }\r\n    </style>\r\n  </head>\r\n  <body>\r\n    <div class=\"email-container\">\r\n      <div class=\"header\">\r\n        {SITELOGO}\r\n      </div>\r\n      <div class=\"content\">\r\n        <p>Dear {NAME},</p>\r\n        <p>Your request has been accepted for your order <strong>{ORDER_NUMBER}</strong>. Below are the details:</p>\r\n\r\n        <div class=\"section-title\">{MESSAGE}</div>\r\n       \r\n\r\n        <!--<p style=\"text-align:center; color: #ffffff;\">-->\r\n        <!--  <a href=\"{VIEW_ORDER}\" class=\"button\" style=\"color: #ffffff;\">View Order Details</a>-->\r\n        <!--</p>-->\r\n\r\n        <p>If you  have any questions, please contact our support team immediately.</p>\r\n\r\n        <p>Thank you for shopping with {STORENAME}</p>\r\n      </div>\r\n\r\n      <div class=\"footer\">\r\n        <div class=\"social-icons\">\r\n         {SOCIALICONS}\r\n        </div>\r\n        <p>\r\n          <!-- This message was sent to [Customer Email].<br> -->\r\n          <strong>Disclaimer:</strong> This email and any attachments are confidential and intended only for the individual or entity to whom they are addressed.\r\n        </p>\r\n        <p>{COPYRIGHT}</p>\r\n        <!-- <a href=\"[UnsubscribeURL]\" class=\"unsubscribe\">Unsubscribe from email notifications</a> -->\r\n      </div>\r\n    </div>\r\n  </body>\r\n</html>\r\n', '2024-12-15 06:03:45', '2024-12-15 06:03:45'),
(20, 'order-cancelled', 'Order cancelled by admin', '', 'Admin', 'support@domain.com', 'Your Order {ORDER_NUMBER} has been cancelled', '<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <style>\r\n      body {\r\n        font-family: Arial, sans-serif;\r\n        color: #333;\r\n        background-color: #ffffff;\r\n        padding: 20px;\r\n      }\r\n      .email-container {\r\n        max-width: 700px;\r\n        margin: auto;\r\n        background: #ffffff;\r\n        border: 1px solid #e0e0e0;\r\n        box-shadow: 0 0 10px rgba(0,0,0,0.05);\r\n      }\r\n      .header {\r\n        text-align: center;\r\n        padding: 20px;\r\n      }\r\n      .header img {\r\n        max-height: 60px;\r\n      }\r\n      .content {\r\n        padding: 20px;\r\n      }\r\n      .section-title {\r\n        font-weight: bold;\r\n        margin-top: 30px;\r\n        margin-bottom: 10px;\r\n        border-bottom: 1px solid #ccc;\r\n        padding-bottom: 6px;\r\n      }\r\n      .reason-box {\r\n        background-color: #fff3f3;\r\n        border: 1px solid #f5c2c2;\r\n        padding: 15px;\r\n        border-radius: 5px;\r\n        color: #b20000;\r\n        margin-top: 15px;\r\n        margin-bottom: 20px;\r\n      }\r\n      .button {\r\n        display: inline-block;\r\n        padding: 10px 20px;\r\n        background-color: #004aad;\r\n        color: #fff;\r\n        text-decoration: none;\r\n        border-radius: 5px;\r\n        font-weight: bold;\r\n        margin-top: 20px;\r\n      }\r\n      .button:hover {\r\n        background-color: #00367e;\r\n      }\r\n      .footer {\r\n        font-size: 12px;\r\n        color: #777;\r\n        text-align: center;\r\n        padding: 20px;\r\n        border-top: 2px solid #ff8a00;\r\n        background-color: #f9f9f9;\r\n      }\r\n      .social-icons a {\r\n        margin: 0 6px;\r\n        display: inline-block;\r\n      }\r\n      .social-icons img {\r\n        height: 24px;\r\n        width: 24px;\r\n      }\r\n      .unsubscribe {\r\n        display: block;\r\n        margin-top: 10px;\r\n        color: #999;\r\n        font-size: 11px;\r\n        text-decoration: underline;\r\n      }\r\n    </style>\r\n  </head>\r\n  <body>\r\n    <div class=\"email-container\">\r\n      <div class=\"header\">\r\n        {SITELOGO}\r\n      </div>\r\n      <div class=\"content\">\r\n        <p>Dear {NAME},</p>\r\n        <p>We regret to inform you that your order <strong>{ORDER_NUMBER}</strong> has been <strong>cancelled by the admin</strong>.</p>\r\n\r\n        <div class=\"section-title\">Reason for Cancellation</div>\r\n        <div class=\"reason-box\">\r\n          {CANCEL_REASON}\r\n        </div>\r\n\r\n        <p>If you have any questions or need further assistance, please don’t hesitate to contact our support team.</p>\r\n\r\n        <p>Thank you for understanding,<br>\r\n        Team <strong>{STORENAME}</strong></p>\r\n      </div>\r\n\r\n      <div class=\"footer\">\r\n        <div class=\"social-icons\">\r\n          {SOCIALICONS}\r\n        </div>\r\n        <p>\r\n          <strong>Disclaimer:</strong> This email and any attachments are confidential and intended only for the individual or entity to whom they are addressed.\r\n        </p>\r\n        <p>{COPYRIGHT}</p>\r\n      </div>\r\n    </div>\r\n  </body>\r\n</html>\r\n', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faq`
--

CREATE TABLE `tbl_faq` (
  `faq_id` bigint NOT NULL,
  `store_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` text,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '1' COMMENT '0: inactive 1 active : 2 : logicla delte'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faq_categories`
--

CREATE TABLE `tbl_faq_categories` (
  `faq_category_id` bigint NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_forgotpass_request`
--

CREATE TABLE `tbl_forgotpass_request` (
  `request_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `user_token` varchar(255) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login_history`
--

CREATE TABLE `tbl_login_history` (
  `id` bigint NOT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `login_time` varchar(100) DEFAULT NULL,
  `logout_time` varchar(100) DEFAULT NULL,
  `login_device` varchar(255) DEFAULT NULL,
  `device_details` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_media`
--

CREATE TABLE `tbl_media` (
  `media_id` int NOT NULL,
  `media_title` varchar(255) DEFAULT NULL,
  `media_alt_text` varchar(255) DEFAULT NULL,
  `media_caption` varchar(255) DEFAULT NULL,
  `media_description` varchar(255) DEFAULT NULL,
  `media_url` varchar(255) DEFAULT NULL,
  `media_type` enum('i','v','pi','pv','pp','o','d') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'i' COMMENT 'i: image v : video , pp: product pdf , pi : pridct image , o: other',
  `is_product_media` enum('y','n') NOT NULL DEFAULT 'n',
  `media_thumbnail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menus`
--

CREATE TABLE `tbl_menus` (
  `menu_id` bigint NOT NULL,
  `menu_name` varchar(100) DEFAULT NULL,
  `menu_slug` varchar(100) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menus_items`
--

CREATE TABLE `tbl_menus_items` (
  `item_id` bigint NOT NULL,
  `parent_item_id` bigint DEFAULT '0',
  `menu_id` bigint DEFAULT NULL,
  `page_id` bigint DEFAULT NULL,
  `menu_type` enum('c','p','l','h','o','pc') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'h: home page l : cusotm link c: custome pages p : policees pc: productcategory ',
  `menu_label` varchar(100) DEFAULT NULL,
  `menu_order` int DEFAULT NULL,
  `menu_link` varchar(255) DEFAULT 'javascript:void(0);'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_newsletter_subscribers`
--

CREATE TABLE `tbl_newsletter_subscribers` (
  `id` bigint NOT NULL,
  `store_id` bigint DEFAULT NULL COMMENT 'store id = vendor id = shopkeeper',
  `email` varchar(50) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_newsletter_templates`
--

CREATE TABLE `tbl_newsletter_templates` (
  `template_id` bigint NOT NULL,
  `email_slug` varchar(50) DEFAULT NULL,
  `email_title` varchar(50) DEFAULT NULL,
  `from_name` varchar(50) DEFAULT NULL,
  `from_email` varchar(50) DEFAULT NULL,
  `email_subject` varchar(50) DEFAULT NULL,
  `email_content` text,
  `inserted_date` varchar(100) DEFAULT NULL,
  `updated_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification_settings`
--

CREATE TABLE `tbl_notification_settings` (
  `notification_id` bigint NOT NULL,
  `user_id` bigint NOT NULL DEFAULT '0',
  `user_type` enum('3','4','5') NOT NULL DEFAULT '3',
  `notification_title` varchar(255) NOT NULL,
  `notification_slug` varchar(255) NOT NULL,
  `email_flag` enum('y','n') NOT NULL DEFAULT 'y',
  `sms_flag` enum('y','n') NOT NULL DEFAULT 'y',
  `whatsapp_flag` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'y',
  `push_flag` enum('y','n') NOT NULL DEFAULT 'y',
  `status` enum('0','1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_options`
--

CREATE TABLE `tbl_options` (
  `id` bigint NOT NULL,
  `var_name` varchar(50) NOT NULL,
  `var_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_options`
--

INSERT INTO `tbl_options` (`id`, `var_name`, `var_value`) VALUES
(1, 'rows_per_page', '10'),
(12, 'password', ''),
(13, 'site_protected', 'n'),
(14, 'google_captcha', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `order_id` bigint NOT NULL,
  `parent_order_id` bigint DEFAULT '0',
  `order_number` varchar(255) DEFAULT NULL,
  `order_type` enum('d','p') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'd' COMMENT 'd : delivery , p : pickup',
  `user_id` bigint DEFAULT NULL,
  `shipping_address_id` bigint DEFAULT NULL,
  `billing_address_id` bigint DEFAULT NULL,
  `order_notes` varchar(255) DEFAULT NULL,
  `subtotal_amount` varchar(50) DEFAULT NULL,
  `shipping_amount` varchar(50) DEFAULT NULL,
  `tax_amount` varchar(50) DEFAULT NULL,
  `other_amount` varchar(50) DEFAULT NULL,
  `cod_charges` varchar(50) DEFAULT NULL,
  `discount_amount` varchar(50) DEFAULT NULL,
  `wallet_amount` varchar(50) DEFAULT NULL,
  `online_amount` varchar(50) DEFAULT NULL,
  `final_amount` varchar(50) DEFAULT NULL,
  `coupon_id` bigint NOT NULL DEFAULT '0',
  `shipment_details` text,
  `box_details` text,
  `invoice_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `currency_id` bigint DEFAULT NULL,
  `currency_value` varchar(15) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `updated_date` varchar(100) DEFAULT NULL,
  `order_status` enum('completed','cancelled','returned','confirmed','placed','delivered','dispatched','pickup','exchanged','aborted','refunded') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'placed',
  `payment_type` enum('o','c','u') DEFAULT 'u' COMMENT 'o: online l c : cash on delivery , u : unpaid',
  `payment_status` enum('p','n') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'n' COMMENT 'p : paid ; n : not paid',
  `order_by` bigint DEFAULT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_cancel_reason`
--

CREATE TABLE `tbl_orders_cancel_reason` (
  `id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  `cancel_reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_cancel_reqests`
--

CREATE TABLE `tbl_orders_cancel_reqests` (
  `order_request_id` bigint NOT NULL,
  `order_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `request_type` enum('r','e','c') DEFAULT 'c',
  `notes` text,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_information`
--

CREATE TABLE `tbl_orders_information` (
  `id` bigint NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `product_mrp_price` varchar(50) DEFAULT NULL,
  `product_sell_price` varchar(50) DEFAULT NULL,
  `product_qty` int DEFAULT NULL,
  `product_total_price` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_payment_information`
--

CREATE TABLE `tbl_orders_payment_information` (
  `order_payment_info_id` bigint NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `payment_gateway_id` bigint DEFAULT NULL,
  `transaction_id` bigint DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `invoice_id` bigint DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `paid_amount` float(10,2) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `payment_method` varchar(100) NOT NULL,
  `payment_response` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_settings`
--

CREATE TABLE `tbl_orders_settings` (
  `id` bigint NOT NULL,
  `core_plugin_id` bigint DEFAULT NULL,
  `var_name` varchar(255) NOT NULL,
  `var_value` text NOT NULL,
  `status` enum('0','1','2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_orders_settings`
--

INSERT INTO `tbl_orders_settings` (`id`, `core_plugin_id`, `var_name`, `var_value`, `status`) VALUES
(1, NULL, 'min_order_value', '1', '1'),
(2, NULL, 'order_prefix', 'OD', '1'),
(3, NULL, 'order_grace_period', '15', '1'),
(4, NULL, 'order_fullfillment', 'false', '1'),
(5, NULL, 'checkout_as_guest', 'false', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_address`
--

CREATE TABLE `tbl_order_address` (
  `address_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` enum('m','f','o') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `alternate_mobile` varchar(15) DEFAULT NULL,
  `whatsapp_number` varchar(50) DEFAULT NULL,
  `country_code` varchar(15) DEFAULT NULL,
  `alternate_country_code` varchar(15) DEFAULT NULL,
  `whatsapp_country_code` varchar(15) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `addressline1` varchar(255) DEFAULT NULL,
  `addressline2` varchar(255) DEFAULT NULL,
  `landmark_place` varchar(255) DEFAULT NULL,
  `zipcode` varchar(15) DEFAULT NULL,
  `city` int DEFAULT NULL,
  `state` int DEFAULT NULL,
  `country` int DEFAULT NULL,
  `isdefault` enum('y','n') DEFAULT NULL COMMENT 'y: yes ; n : no',
  `address_type` enum('h','o','w') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'h: Home; o: Other, w:work',
  `address_lat` varchar(100) DEFAULT NULL,
  `address_long` varchar(100) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `updated_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_amount_refunded`
--

CREATE TABLE `tbl_order_amount_refunded` (
  `refund_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  `refund_amount` varchar(50) NOT NULL,
  `refund_type` enum('wallet','automatic') NOT NULL DEFAULT 'automatic',
  `payment_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `payment_method` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `payment_response` text NOT NULL,
  `inserted_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_refund_query`
--

CREATE TABLE `tbl_order_refund_query` (
  `order_refund_query_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  `message` text NOT NULL,
  `amount` varchar(100) NOT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL COMMENT '0: intitated 1: completed 2 : closed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pages_styles_preview`
--

CREATE TABLE tbl_pages_styles_preview (
  id bigint NOT NULL PRIMARY KEY AUTO_INCREMENT,
  theme_id int DEFAULT NULL,
  preview_id varchar(100) DEFAULT NULL,
  template_id int DEFAULT NULL,
  page_id bigint NOT NULL,
  page_slug varchar(100) NOT NULL,
  device_type enum('m','d','t') NOT NULL DEFAULT 'd',
  page_style text NOT NULL,
  status enum('0','1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
-- --------------------------------------------------------

--
-- Table structure for table `tbl_page_sections`
--

CREATE TABLE `tbl_page_sections` (
  `id` bigint NOT NULL,
  `theme_id` int DEFAULT NULL,
  `template_id` int DEFAULT NULL,
  `page_id` int DEFAULT NULL,
  `device_type` enum('m','d','t') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'd' COMMENT 'm: mobile d : device t : tablet',
  `section_id` varchar(100) DEFAULT NULL,
  `section_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `section_width` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `section_index` int DEFAULT NULL,
  `page_slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `var_value` text,
  `is_visible` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'y',
  `status` enum('0','1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_page_sections_preview`
--

CREATE TABLE `tbl_page_sections_preview` (
  `view_id` bigint NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `theme_id` int DEFAULT NULL,
  `template_id` int DEFAULT NULL,
  `page_id` int DEFAULT NULL,
  `preview_id` varchar(255) DEFAULT NULL,
  `device_type` enum('m','d','t') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'd' COMMENT 'm: mobile d : device t : tablet',
  `section_id` varchar(100) DEFAULT NULL,
  `section_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `section_width` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `section_index` int DEFAULT NULL,
  `page_slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `var_value` text,
  `is_visible` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'y',
  `status` enum('0','1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_plan_feature_with_values`
--

CREATE TABLE `tbl_plan_feature_with_values` (
  `id` bigint NOT NULL,
  `feature_id` int DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  `feature_name_slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `feature_type` enum('g','w','p') DEFAULT 'g' COMMENT 'g: general w : widget p : plugin',
  `feature_value` text,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_plugins`
--

CREATE TABLE `tbl_plugins` (
  `plugin_id` bigint NOT NULL,
  `core_plugin_id` bigint DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `uninstalled_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '1',
  `plugin_type` varchar(255) DEFAULT NULL,
  `is_default` enum('y','n') NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `product_id` bigint NOT NULL,
  `category_id` varchar(50) DEFAULT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `brand_id` bigint DEFAULT NULL,
  `model_number` varchar(255) DEFAULT NULL,
  `hsn_number` varchar(255) DEFAULT NULL,
  `parent_id` bigint DEFAULT '0',
  `product_name` varchar(255) DEFAULT NULL,
  `handle_name` varchar(255) DEFAULT NULL,
  `product_type` enum('p','v','i','c') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'i' COMMENT 'p: parent v :variant i : individual c: combo',
  `product_option` enum('d','p') NOT NULL DEFAULT 'p' COMMENT 'd: digital p : physical',
  `is_default` enum('y','n') NOT NULL DEFAULT 'n',
  `product_name_slug` varchar(255) DEFAULT NULL,
  `product_short_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `product_long_desc` text,
  `product_image` varchar(255) DEFAULT NULL,
  `product_other_images` text,
  `product_files` varchar(255) DEFAULT NULL,
  `product_qty` int DEFAULT NULL,
  `product_unlimited` enum('y','n') DEFAULT NULL,
  `price_mrp` varchar(100) DEFAULT NULL,
  `price_base` varchar(100) DEFAULT NULL,
  `price_sell` varchar(50) DEFAULT NULL,
  `tax_amount` varchar(50) DEFAULT NULL,
  `product_weight` varchar(50) DEFAULT NULL,
  `shipping_zone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `country_of_origin` bigint DEFAULT NULL,
  `total_rating` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `total_reviews` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `final_rating` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `rating_1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `rating_2` varchar(100) NOT NULL DEFAULT '0',
  `rating_3` varchar(100) NOT NULL DEFAULT '0',
  `rating_4` varchar(100) NOT NULL DEFAULT '0',
  `rating_5` varchar(100) NOT NULL DEFAULT '0',
  `inserted_date` varchar(100) DEFAULT NULL,
  `updated_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT NULL COMMENT '0:inactive; 1: active; 2 : logical delete',
  `product_tags` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_categories`
--

CREATE TABLE `tbl_product_categories` (
  `category_id` bigint NOT NULL,
  `parent_category_id` bigint DEFAULT '0',
  `category_name` varchar(255) DEFAULT NULL,
  `category_slug` varchar(255) DEFAULT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT NULL COMMENT '0: inactive 1 : active 2 : logical delete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_notify_request`
--

CREATE TABLE `tbl_product_notify_request` (
  `notify_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `notification_sent` varchar(50) DEFAULT 'false',
  `inserted_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_reviews`
--

CREATE TABLE `tbl_product_reviews` (
  `id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `comment_msg` text,
  `rating_value` varchar(10) DEFAULT NULL,
  `rating_media` text,
  `status` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '0: inactive 1 active 2 : logical delete',
  `inserted_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_settings`
--

CREATE TABLE `tbl_product_settings` (
  `id` bigint NOT NULL,
  `core_plugin_id` bigint DEFAULT NULL,
  `var_name` varchar(255) NOT NULL,
  `var_value` text NOT NULL,
  `status` enum('0','1','2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_product_settings`
--

INSERT INTO `tbl_product_settings` (`id`, `core_plugin_id`, `var_name`, `var_value`, `status`) VALUES
(2, 55, 'min_product_qty', '3', '1'),
(3, 55, 'max_product_qty', '5', '1'),
(4, 55, 'min_max_product_type', 'a', '1'),
(10, 0, 'show_all_coupon_codes', 'true', '1'),
(11, 50, 'show_compareproducts', 'true', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_recent_visited_products`
--

CREATE TABLE `tbl_recent_visited_products` (
  `id` bigint NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `updated_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_saved_otp`
--

CREATE TABLE `tbl_saved_otp` (
  `otp_id` bigint NOT NULL,
  `otp_receiver` varchar(50) DEFAULT NULL,
  `otp_number` varchar(50) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shipping_rates`
--

CREATE TABLE `tbl_shipping_rates` (
  `rate_id` bigint NOT NULL,
  `zone_id` bigint DEFAULT NULL,
  `rate_name` varchar(255) DEFAULT NULL,
  `rate_price` varchar(100) DEFAULT NULL,
  `price_based_on` enum('w','p') DEFAULT 'w' COMMENT 'w: wieght , p : price',
  `min_unit` varchar(50) DEFAULT NULL,
  `max_unit` varchar(50) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sliders`
--

CREATE TABLE `tbl_sliders` (
  `slider_id` bigint NOT NULL,
  `slider_name` varchar(255) DEFAULT NULL,
  `slider_slug` varchar(100) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sliders_media`
--

CREATE TABLE `tbl_sliders_media` (
  `id` bigint NOT NULL,
  `slider_id` bigint DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slide_option` text,
  `alt_title` varchar(255) DEFAULT NULL,
  `media_type` enum('i','v') NOT NULL DEFAULT 'i' COMMENT 'i : image v : video',
  `media_name` varchar(255) DEFAULT NULL,
  `order_number` int DEFAULT NULL,
  `media_link` varchar(255) DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_smtp`
--

CREATE TABLE `tbl_smtp` (
  `smtp_id` int NOT NULL,
  `email_template_id` bigint DEFAULT NULL,
  `apply_all` enum('y','n') NOT NULL DEFAULT 'y',
  `host_slug` varchar(50) DEFAULT NULL,
  `host_name` varchar(50) DEFAULT NULL,
  `smtp_auth` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `smtp_secure` varchar(50) DEFAULT NULL,
  `smtp_port` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_smtp`
--

INSERT INTO `tbl_smtp` (`smtp_id`, `email_template_id`, `apply_all`, `host_slug`, `host_name`, `smtp_auth`, `username`, `password`, `smtp_secure`, `smtp_port`) VALUES
(1, NULL, 'n', 'default', 'smtp.example.com', 'true', 'support@example.com', 'yvza awpn juwu gjdv', 'ssl', 465);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_social_links`
--

CREATE TABLE `tbl_social_links` (
  `social_id` bigint NOT NULL,
  `social_slug` varchar(100) DEFAULT NULL,
  `media_id` bigint DEFAULT NULL,
  `social_link` text,
  `is_selected` varchar(50) DEFAULT 'false',
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff_information`
--

CREATE TABLE `tbl_staff_information` (
  `id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` enum('m','f','o') DEFAULT 'm' COMMENT 'm: male f: female o : other',
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff_permissions`
--

CREATE TABLE `tbl_staff_permissions` (
  `permssion_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `module_id` int DEFAULT NULL,
  `can_add` enum('y','n') NOT NULL DEFAULT 'n',
  `can_edit` enum('y','n') NOT NULL DEFAULT 'n',
  `can_delete` enum('y','n') NOT NULL DEFAULT 'n',
  `can_view` enum('y','n') NOT NULL DEFAULT 'n',
  `can_send` enum('y','n') NOT NULL DEFAULT 'n',
  `can_download` enum('y','n') NOT NULL DEFAULT 'n',
  `can_import` enum('y','n') NOT NULL DEFAULT 'n',
  `can_export` enum('y','n') NOT NULL DEFAULT 'n',
  `updated_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_store_close_settings`
--

CREATE TABLE `tbl_store_close_settings` (
  `id` int NOT NULL,
  `is_open` enum('y','n') NOT NULL,
  `from_time` varchar(100) DEFAULT NULL,
  `to_time` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_store_close_settings`
--

INSERT INTO `tbl_store_close_settings` (`id`, `is_open`, `from_time`, `to_time`) VALUES
(1, 'y', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_store_media_setting_types`
--

CREATE TABLE `tbl_store_media_setting_types` (
  `id` int NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `media_type` enum('i','m','o') NOT NULL DEFAULT 'i',
  `var_name` varchar(50) NOT NULL,
  `var_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tax`
--

CREATE TABLE `tbl_tax` (
  `id` int NOT NULL,
  `tax_including` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tax_number` varchar(50) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT NULL COMMENT '0: inactive 1 : active 2 : logical delete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_tax`
--

INSERT INTO `tbl_tax` (`id`, `tax_including`, `tax_number`, `status`) VALUES
(3, 'false', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_testimonials`
--

CREATE TABLE `tbl_testimonials` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `testimonial_text` text NOT NULL,
  `testimonial_video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_themes`
--

CREATE TABLE `tbl_themes` (
  `theme_id` bigint NOT NULL,
  `core_theme_id` bigint NOT NULL DEFAULT '0',
  `theme_name` varchar(200) DEFAULT NULL,
  `theme_slug_name` varchar(200) DEFAULT NULL,
  `device_type` enum('m','d') NOT NULL DEFAULT 'd' COMMENT 'm : mobile d : desktop',
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_themes_page_settings`
--

CREATE TABLE `tbl_themes_page_settings` (
  `id` bigint NOT NULL,
  `theme_id` int DEFAULT NULL,
  `template_id` int DEFAULT NULL,
  `device_type` enum('m','d','t') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'd' COMMENT 'm: mobile d : device t : tablet',
  `page_slug` varchar(100) DEFAULT NULL,
  `var_name` varchar(255) DEFAULT NULL,
  `var_value` text,
  `is_visible` enum('y','n') DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transactions`
--

CREATE TABLE `tbl_transactions` (
  `transaction_id` bigint NOT NULL,
  `payment_transaction_id` bigint DEFAULT NULL,
  `transaction_token` varchar(255) DEFAULT NULL,
  `transaction_amount` varchar(50) DEFAULT NULL,
  `order_id` varchar(100) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `transaction_status` varchar(50) DEFAULT NULL,
  `transaction_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `transaction_time` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` bigint NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_type` enum('1','2','3','4','5','6') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '3' COMMENT '1: superadmin 2 : subadmin 3: shopowners 4 : staff  5: customer  6 : vendors',
  `registered_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1' COMMENT '0: inactive 1: active 2 : logical delete 3: Block',
  `is_guest` enum('y','n') NOT NULL DEFAULT 'n',
  `referral_id` varchar(50) DEFAULT NULL,
  `referral_by` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `username`, `email`, `country_code`, `phone`, `password`, `user_type`, `registered_date`, `status`, `is_guest`, `referral_id`, `referral_by`) VALUES
(1, 'superadmin', 'vipul@gmail.com', NULL, '', '$2a$08$u5QrHEGO0zCS95ZaA24C8O6jr.dLGpn.wmh2joJbZGVGYiFdS4uru', '1', '2022-05-02 08:29:43', '1', 'n', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_weight_unit`
--

CREATE TABLE `tbl_weight_unit` (
  `unit_id` bigint NOT NULL,
  `unit_name` varchar(100) NOT NULL,
  `status` enum('0','1','2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_weight_unit`
--

INSERT INTO `tbl_weight_unit` (`unit_id`, `unit_name`, `status`) VALUES
(1, 'kg', '1'),
(2, 'gram', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wishlist`
--

CREATE TABLE `tbl_wishlist` (
  `id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `inserted_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_zones`
--

CREATE TABLE `tbl_zones` (
  `zone_id` bigint NOT NULL,
  `zone_type` enum('i','d') NOT NULL DEFAULT 'd',
  `zone_name` varchar(255) DEFAULT NULL,
  `zone_location_id` text,
  `inserted_date` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders_ship_tracking`
--
ALTER TABLE `orders_ship_tracking`
  ADD PRIMARY KEY (`ship_tracking_id`);

--
-- Indexes for table `order_pickup_details`
--
ALTER TABLE `order_pickup_details`
  ADD PRIMARY KEY (`pickup_id`);

--
-- Indexes for table `tbl_address`
--
ALTER TABLE `tbl_address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `tbl_blogs`
--
ALTER TABLE `tbl_blogs`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indexes for table `tbl_blogs_comment`
--
ALTER TABLE `tbl_blogs_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `tbl_blogs_likes`
--
ALTER TABLE `tbl_blogs_likes`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexes for table `tbl_brands`
--
ALTER TABLE `tbl_brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cart_settings`
--
ALTER TABLE `tbl_cart_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cmspages`
--
ALTER TABLE `tbl_cmspages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `tbl_contact_us_queries`
--
ALTER TABLE `tbl_contact_us_queries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_coupons`
--
ALTER TABLE `tbl_coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `tbl_coupons_applied`
--
ALTER TABLE `tbl_coupons_applied`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer_information`
--
ALTER TABLE `tbl_customer_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_email_templates`
--
ALTER TABLE `tbl_email_templates`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  ADD PRIMARY KEY (`faq_id`);

--
-- Indexes for table `tbl_faq_categories`
--
ALTER TABLE `tbl_faq_categories`
  ADD PRIMARY KEY (`faq_category_id`);

--
-- Indexes for table `tbl_forgotpass_request`
--
ALTER TABLE `tbl_forgotpass_request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `tbl_login_history`
--
ALTER TABLE `tbl_login_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `tbl_media`
--
ALTER TABLE `tbl_media`
  ADD PRIMARY KEY (`media_id`);

--
-- Indexes for table `tbl_menus`
--
ALTER TABLE `tbl_menus`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `tbl_menus_items`
--
ALTER TABLE `tbl_menus_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `tbl_newsletter_subscribers`
--
ALTER TABLE `tbl_newsletter_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_newsletter_templates`
--
ALTER TABLE `tbl_newsletter_templates`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `tbl_notification_settings`
--
ALTER TABLE `tbl_notification_settings`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `tbl_options`
--
ALTER TABLE `tbl_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_orders_cancel_reason`
--
ALTER TABLE `tbl_orders_cancel_reason`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_orders_cancel_reqests`
--
ALTER TABLE `tbl_orders_cancel_reqests`
  ADD PRIMARY KEY (`order_request_id`);

--
-- Indexes for table `tbl_orders_information`
--
ALTER TABLE `tbl_orders_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_orders_payment_information`
--
ALTER TABLE `tbl_orders_payment_information`
  ADD PRIMARY KEY (`order_payment_info_id`);

--
-- Indexes for table `tbl_orders_settings`
--
ALTER TABLE `tbl_orders_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order_address`
--
ALTER TABLE `tbl_order_address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `tbl_order_amount_refunded`
--
ALTER TABLE `tbl_order_amount_refunded`
  ADD PRIMARY KEY (`refund_id`);

--
-- Indexes for table `tbl_page_sections`
--
ALTER TABLE `tbl_page_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_plan_feature_with_values`
--
ALTER TABLE `tbl_plan_feature_with_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_plugins`
--
ALTER TABLE `tbl_plugins`
  ADD PRIMARY KEY (`plugin_id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_name` (`product_name`),
  ADD KEY `product_name_slug` (`product_name_slug`);

--
-- Indexes for table `tbl_product_categories`
--
ALTER TABLE `tbl_product_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_name` (`category_name`),
  ADD KEY `category_slug` (`category_slug`);

--
-- Indexes for table `tbl_product_notify_request`
--
ALTER TABLE `tbl_product_notify_request`
  ADD PRIMARY KEY (`notify_id`);

--
-- Indexes for table `tbl_product_reviews`
--
ALTER TABLE `tbl_product_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product_settings`
--
ALTER TABLE `tbl_product_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_recent_visited_products`
--
ALTER TABLE `tbl_recent_visited_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_saved_otp`
--
ALTER TABLE `tbl_saved_otp`
  ADD PRIMARY KEY (`otp_id`);

--
-- Indexes for table `tbl_shipping_rates`
--
ALTER TABLE `tbl_shipping_rates`
  ADD PRIMARY KEY (`rate_id`);

--
-- Indexes for table `tbl_sliders`
--
ALTER TABLE `tbl_sliders`
  ADD PRIMARY KEY (`slider_id`);

--
-- Indexes for table `tbl_sliders_media`
--
ALTER TABLE `tbl_sliders_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_smtp`
--
ALTER TABLE `tbl_smtp`
  ADD PRIMARY KEY (`smtp_id`);

--
-- Indexes for table `tbl_social_links`
--
ALTER TABLE `tbl_social_links`
  ADD PRIMARY KEY (`social_id`);

--
-- Indexes for table `tbl_staff_information`
--
ALTER TABLE `tbl_staff_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_staff_permissions`
--
ALTER TABLE `tbl_staff_permissions`
  ADD PRIMARY KEY (`permssion_id`);

--
-- Indexes for table `tbl_store_close_settings`
--
ALTER TABLE `tbl_store_close_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_store_media_setting_types`
--
ALTER TABLE `tbl_store_media_setting_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_tax`
--
ALTER TABLE `tbl_tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_testimonials`
--
ALTER TABLE `tbl_testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_themes`
--
ALTER TABLE `tbl_themes`
  ADD PRIMARY KEY (`theme_id`);

--
-- Indexes for table `tbl_themes_page_settings`
--
ALTER TABLE `tbl_themes_page_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `var_name` (`var_name`);

--
-- Indexes for table `tbl_transactions`
--
ALTER TABLE `tbl_transactions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_weight_unit`
--
ALTER TABLE `tbl_weight_unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indexes for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_zones`
--
ALTER TABLE `tbl_zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders_ship_tracking`
--
ALTER TABLE `orders_ship_tracking`
  MODIFY `ship_tracking_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_pickup_details`
--
ALTER TABLE `order_pickup_details`
  MODIFY `pickup_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_address`
--
ALTER TABLE `tbl_address`
  MODIFY `address_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_blogs`
--
ALTER TABLE `tbl_blogs`
  MODIFY `blog_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `tbl_blogs_comment`
--
ALTER TABLE `tbl_blogs_comment`
  MODIFY `comment_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `tbl_blogs_likes`
--
ALTER TABLE `tbl_blogs_likes`
  MODIFY `like_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `tbl_brands`
--
ALTER TABLE `tbl_brands`
  MODIFY `brand_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=478;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cart_settings`
--
ALTER TABLE `tbl_cart_settings`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_cmspages`
--
ALTER TABLE `tbl_cmspages`
  MODIFY `page_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `tbl_contact_us_queries`
--
ALTER TABLE `tbl_contact_us_queries`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_coupons`
--
ALTER TABLE `tbl_coupons`
  MODIFY `coupon_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_coupons_applied`
--
ALTER TABLE `tbl_coupons_applied`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_customer_information`
--
ALTER TABLE `tbl_customer_information`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_email_templates`
--
ALTER TABLE `tbl_email_templates`
  MODIFY `template_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  MODIFY `faq_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `tbl_faq_categories`
--
ALTER TABLE `tbl_faq_categories`
  MODIFY `faq_category_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `tbl_forgotpass_request`
--
ALTER TABLE `tbl_forgotpass_request`
  MODIFY `request_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_login_history`
--
ALTER TABLE `tbl_login_history`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_media`
--
ALTER TABLE `tbl_media`
  MODIFY `media_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_menus`
--
ALTER TABLE `tbl_menus`
  MODIFY `menu_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `tbl_menus_items`
--
ALTER TABLE `tbl_menus_items`
  MODIFY `item_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_newsletter_subscribers`
--
ALTER TABLE `tbl_newsletter_subscribers`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `tbl_newsletter_templates`
--
ALTER TABLE `tbl_newsletter_templates`
  MODIFY `template_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `tbl_notification_settings`
--
ALTER TABLE `tbl_notification_settings`
  MODIFY `notification_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_options`
--
ALTER TABLE `tbl_options`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `order_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_orders_cancel_reason`
--
ALTER TABLE `tbl_orders_cancel_reason`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_orders_cancel_reqests`
--
ALTER TABLE `tbl_orders_cancel_reqests`
  MODIFY `order_request_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_orders_information`
--
ALTER TABLE `tbl_orders_information`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_orders_payment_information`
--
ALTER TABLE `tbl_orders_payment_information`
  MODIFY `order_payment_info_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_orders_settings`
--
ALTER TABLE `tbl_orders_settings`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_order_address`
--
ALTER TABLE `tbl_order_address`
  MODIFY `address_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_order_amount_refunded`
--
ALTER TABLE `tbl_order_amount_refunded`
  MODIFY `refund_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `tbl_page_sections`
--
ALTER TABLE `tbl_page_sections`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_plan_feature_with_values`
--
ALTER TABLE `tbl_plan_feature_with_values`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_plugins`
--
ALTER TABLE `tbl_plugins`
  MODIFY `plugin_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `product_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_product_categories`
--
ALTER TABLE `tbl_product_categories`
  MODIFY `category_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_product_notify_request`
--
ALTER TABLE `tbl_product_notify_request`
  MODIFY `notify_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tbl_product_reviews`
--
ALTER TABLE `tbl_product_reviews`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `tbl_product_settings`
--
ALTER TABLE `tbl_product_settings`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_recent_visited_products`
--
ALTER TABLE `tbl_recent_visited_products`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_saved_otp`
--
ALTER TABLE `tbl_saved_otp`
  MODIFY `otp_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_shipping_rates`
--
ALTER TABLE `tbl_shipping_rates`
  MODIFY `rate_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `tbl_sliders`
--
ALTER TABLE `tbl_sliders`
  MODIFY `slider_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- AUTO_INCREMENT for table `tbl_sliders_media`
--
ALTER TABLE `tbl_sliders_media`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=956;

--
-- AUTO_INCREMENT for table `tbl_smtp`
--
ALTER TABLE `tbl_smtp`
  MODIFY `smtp_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_social_links`
--
ALTER TABLE `tbl_social_links`
  MODIFY `social_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `tbl_staff_information`
--
ALTER TABLE `tbl_staff_information`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `tbl_staff_permissions`
--
ALTER TABLE `tbl_staff_permissions`
  MODIFY `permssion_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_store_close_settings`
--
ALTER TABLE `tbl_store_close_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_store_media_setting_types`
--
ALTER TABLE `tbl_store_media_setting_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_tax`
--
ALTER TABLE `tbl_tax`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_testimonials`
--
ALTER TABLE `tbl_testimonials`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `tbl_themes`
--
ALTER TABLE `tbl_themes`
  MODIFY `theme_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_themes_page_settings`
--
ALTER TABLE `tbl_themes_page_settings`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7030;

--
-- AUTO_INCREMENT for table `tbl_transactions`
--
ALTER TABLE `tbl_transactions`
  MODIFY `transaction_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_weight_unit`
--
ALTER TABLE `tbl_weight_unit`
  MODIFY `unit_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1499;

--
-- AUTO_INCREMENT for table `tbl_zones`
--
ALTER TABLE `tbl_zones`
  MODIFY `zone_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;
COMMIT;

ALTER TABLE tbl_products ADD product_label VARCHAR(50) NULL DEFAULT NULL AFTER product_tags;

CREATE TABLE tbl_pages_styles (
  id bigint NOT NULL PRIMARY KEY AUTO_INCREMENT,
  theme_id int DEFAULT NULL,
  template_id int DEFAULT NULL,
  page_id bigint NOT NULL,
  page_slug varchar(100) NOT NULL,
  device_type enum('m','d','t') NOT NULL DEFAULT 'd',
  page_style text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
