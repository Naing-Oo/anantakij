

CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO accounts VALUES("1","11111","Sales Account","1000","1000","this is first account","1","1","2018-12-18 09:58:02","2019-01-20 16:59:06");
INSERT INTO accounts VALUES("3","21211","Sa","","0","","0","1","2018-12-18 09:58:56","2019-01-20 16:59:06");



CREATE TABLE `adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO adjustments VALUES("11","adr-20220202-032325","1","","8","1","","2022-02-02 15:23:25","2022-02-02 15:38:58");



CREATE TABLE `attendances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO attendances VALUES("1","2019-01-02","1","1","10:00am","6:30pm","1","","2019-01-02 10:30:50","2019-01-02 10:30:50");
INSERT INTO attendances VALUES("3","2019-01-02","3","1","10:15am","6:30pm","0","","2019-01-02 10:57:12","2019-01-02 10:57:12");
INSERT INTO attendances VALUES("6","2020-02-03","1","1","11:30am","6:00pm","0","","2020-02-03 16:57:30","2020-02-03 16:57:30");



CREATE TABLE `billers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO billers VALUES("1","yousuf","aks.jpg","aks","31123","yousuf@kds.com","442343324","halishahar","chittagong","","","sdgs","1","2018-05-13 04:49:30","2019-03-02 12:20:38");
INSERT INTO billers VALUES("2","tariq","","big tree","","tariq@bigtree.com","321312","khulshi","chittagong","","","","1","2018-05-13 04:57:54","2018-06-15 07:07:11");
INSERT INTO billers VALUES("3","test","","test","","test@test.com","3211","erewrwqre","afsf","","","","0","2018-05-30 09:38:58","2018-05-30 09:39:57");
INSERT INTO billers VALUES("5","modon","mogaTel.jpg","mogaTel","","modon@gmail.com","32321","nasirabad","chittagong","","","bd","1","2018-09-01 10:59:54","2018-10-07 09:35:51");
INSERT INTO billers VALUES("6","a","","a","","a@a.com","q","q","q","","","","0","2018-10-07 09:33:39","2018-10-07 09:34:18");
INSERT INTO billers VALUES("7","a","","a","","a@a.com","a","a","a","","","","0","2018-10-07 09:34:36","2018-10-07 09:36:07");
INSERT INTO billers VALUES("8","x","x.png","x","","x@x.com","x","x","x","","","","1","2019-03-18 18:02:42","2019-12-21 18:01:24");



CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO brands VALUES("3","HP","HP.jpg","1","2018-05-12 16:06:14","2019-03-02 12:32:21");
INSERT INTO brands VALUES("4","samsung","samsung.jpg","1","2018-05-12 16:08:41","2018-07-04 10:38:37");
INSERT INTO brands VALUES("5","Apple","Apple.jpg","1","2018-09-01 06:34:49","2018-12-06 10:05:38");
INSERT INTO brands VALUES("7","Lotto","","1","2020-11-16 11:13:41","2020-11-16 11:13:41");



CREATE TABLE `cash_registers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cash_in_hand` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO cash_registers VALUES("1","100","9","1","0","2020-10-13 14:32:54","2020-10-24 07:27:42");
INSERT INTO cash_registers VALUES("2","50","9","1","1","2020-10-13 22:25:26","2020-10-13 22:25:26");
INSERT INTO cash_registers VALUES("3","200","1","1","0","2020-10-22 14:53:07","2021-06-19 11:52:48");
INSERT INTO cash_registers VALUES("4","100","1","2","1","2020-10-24 08:04:39","2020-10-24 08:04:39");
INSERT INTO cash_registers VALUES("5","1000","1","1","1","2021-06-19 11:53:22","2021-06-19 11:53:22");



CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO categories VALUES("9","food","","","1","2018-06-25 08:21:40","2018-09-03 10:41:28");



CREATE TABLE `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  `expired_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO coupons VALUES("1","sonar bangla","percentage","20","0","100","4","2020-11-19","1","1","2018-10-26 05:38:50","2020-11-18 07:52:39");
INSERT INTO coupons VALUES("2","i love bangladesh","fixed","200","1000","50","1","2018-12-31","1","1","2018-10-27 09:59:26","2019-03-02 12:46:48");



CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO currencies VALUES("1","US Dollar","USD","35","2020-11-01 07:22:58","2022-01-20 12:10:49");
INSERT INTO currencies VALUES("2","Euro","Euro","40","2020-11-01 08:29:12","2022-01-20 12:11:01");
INSERT INTO currencies VALUES("3","Thai Bath","THB","1","2022-01-20 12:10:38","2022-01-20 12:10:38");



CREATE TABLE `customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customer_groups VALUES("1","general","0","1","2018-05-12 15:09:36","2022-01-20 11:20:34");
INSERT INTO customer_groups VALUES("2","distributor","0","1","2018-05-12 15:12:14","2019-03-02 13:02:12");
INSERT INTO customer_groups VALUES("3","reseller","0","1","2018-05-12 15:12:26","2018-05-30 08:18:14");
INSERT INTO customer_groups VALUES("7","buyller","0","1","2022-01-20 11:23:03","2022-01-20 11:23:03");



CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `points` double DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `expense` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customers VALUES("28","1","","naing oo","orange","naingoo123448@gmail.com","0910911857","123456789123","Bangkok, Thailand","Bangkok","","12345","Thailand","11","","","1","","2022-02-06 21:46:51");
INSERT INTO customers VALUES("29","1","30","K.Nu","UNITED INDUSTRIAL GASES CO.,LTD.","nu@united.co.th","09896063617","0115528000620","29/3 MOO5,BANGNA-TRAD ROAD, TAMBOL BANGSAOTONG,AMPHUR BANGSAOTONG","SAMUTPRAKARN","","10570","THAILAND","","","","1","2022-02-04 10:20:40","2022-02-04 10:20:40");



CREATE TABLE `deliveries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivered_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recieved_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO deliveries VALUES("5","dr-20220203-102855","360","1","mohammadpur dhaka","night","merry","","xxxx","2","2022-02-03 10:29:38","2022-02-03 12:15:59");



CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO departments VALUES("1","Sale","1","2018-12-27 12:16:47","2018-12-27 17:40:23");
INSERT INTO departments VALUES("2","xyz","1","2018-12-27 17:28:47","2018-12-27 17:28:47");



CREATE TABLE `deposits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO deposits VALUES("1","90","1","1","first deposit","2018-08-26 05:48:23","2018-08-26 08:18:55");
INSERT INTO deposits VALUES("3","100","2","1","","2018-08-26 07:53:16","2018-08-27 04:42:39");
INSERT INTO deposits VALUES("4","50","1","1","","2018-09-05 05:56:19","2018-09-05 05:56:19");
INSERT INTO deposits VALUES("5","50","1","1","","2018-09-10 07:08:40","2018-09-10 07:08:40");
INSERT INTO deposits VALUES("6","5000","27","1","deposit for rebill","2022-01-12 09:34:50","2022-01-12 09:34:50");



CREATE TABLE `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO employees VALUES("1","john","john@gmail.com","10001","2","12","johngmailcom.jpg","GEC","chittagong","Bangladesh","1","2018-12-30 07:48:37","2019-03-02 13:50:23");
INSERT INTO employees VALUES("3","tests","test@test.com","111","1","","","","","","1","2018-12-31 05:20:51","2019-01-03 07:03:54");



CREATE TABLE `expense_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO expense_categories VALUES("1","16718342","washing","1","2018-08-16 07:32:48","2019-03-02 14:02:07");
INSERT INTO expense_categories VALUES("2","60128975","electric bill","1","2018-08-16 07:39:18","2018-08-16 07:39:18");
INSERT INTO expense_categories VALUES("3","83954970","test","0","2018-08-16 07:50:28","2018-08-16 07:51:40");
INSERT INTO expense_categories VALUES("4","1234","snacks","1","2018-09-01 09:40:04","2018-09-01 09:40:04");



CREATE TABLE `expenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO expenses VALUES("2","er-20180817-012254","1","2","1","1","","150","first expense...","2018-08-17 14:22:54","2018-08-17 14:44:13");
INSERT INTO expenses VALUES("3","er-20180817-014241","1","1","1","1","","125","second expense...","2018-08-17 14:42:41","2018-08-17 14:43:50");
INSERT INTO expenses VALUES("4","er-20181022-043609","2","1","1","1","","1000","","2018-10-22 17:36:09","2018-10-22 17:36:09");
INSERT INTO expenses VALUES("5","er-20181101-050207","2","2","1","1","","1000","","2018-11-01 06:02:07","2018-11-01 06:02:07");
INSERT INTO expenses VALUES("6","er-20181101-050231","2","1","1","1","","550","","2018-11-01 06:02:31","2018-11-01 06:02:31");
INSERT INTO expenses VALUES("7","er-20181105-091913","1","1","1","1","","2000","","2018-11-05 10:19:13","2018-11-05 10:19:13");
INSERT INTO expenses VALUES("8","er-20181105-091929","2","2","1","1","","1000","","2018-11-05 10:19:29","2018-11-05 10:19:29");
INSERT INTO expenses VALUES("9","er-20190101-063342","2","1","1","1","","100","","2019-01-01 07:33:42","2019-01-01 07:33:42");
INSERT INTO expenses VALUES("10","er-20190103-070018","2","2","1","9","","2000","","2019-01-03 08:00:18","2019-01-03 08:00:18");
INSERT INTO expenses VALUES("11","er-20190209-104656","2","2","1","1","","500","","2019-02-09 11:46:56","2019-02-09 11:46:56");
INSERT INTO expenses VALUES("12","er-20190209-104716","2","1","1","1","","400","","2019-02-09 11:47:16","2019-02-09 11:47:16");
INSERT INTO expenses VALUES("14","er-20190303-104142","2","2","1","1","","250","jjj","2019-03-03 11:41:42","2019-03-20 16:17:16");
INSERT INTO expenses VALUES("15","er-20190404-095645","2","1","1","1","","200","","2019-04-04 10:56:45","2019-04-04 10:56:45");
INSERT INTO expenses VALUES("16","er-20190528-103306","2","1","1","1","","560","","2019-05-28 11:33:06","2019-05-28 11:33:06");
INSERT INTO expenses VALUES("17","er-20190528-103325","2","2","1","1","","600","","2019-05-28 11:33:25","2019-05-28 11:33:25");
INSERT INTO expenses VALUES("19","er-20190613-101955","2","2","1","1","","800","","2019-06-13 11:19:55","2019-06-13 11:19:55");
INSERT INTO expenses VALUES("20","er-20191019-033149","2","1","1","1","","300","","2019-10-19 16:31:49","2019-10-19 16:31:49");
INSERT INTO expenses VALUES("21","er-20191222-023508","2","1","1","1","","550","","2019-12-22 15:35:08","2019-12-22 15:35:08");
INSERT INTO expenses VALUES("22","er-20200101-022304","2","2","1","1","","500","","2020-01-01 15:23:04","2020-01-01 15:23:04");
INSERT INTO expenses VALUES("23","er-20200204-105938","1","1","1","1","","400","","2020-02-04 23:59:38","2020-02-04 23:59:38");
INSERT INTO expenses VALUES("24","er-20200204-105957","1","2","1","1","","350","","2020-02-04 23:59:57","2020-02-04 23:59:57");
INSERT INTO expenses VALUES("25","er-20200406-075239","2","2","1","1","","750","","2020-04-06 20:52:39","2020-04-06 20:52:39");
INSERT INTO expenses VALUES("26","er-20200506-110112","2","2","1","1","","1260","","2020-05-07 00:01:12","2020-05-07 00:01:12");
INSERT INTO expenses VALUES("27","er-20200609-124344","2","1","1","1","","500","","2020-06-09 13:43:44","2020-06-09 13:43:44");
INSERT INTO expenses VALUES("28","er-20200609-124406","2","2","1","1","","1000","","2020-06-09 13:44:06","2020-06-09 13:44:06");
INSERT INTO expenses VALUES("29","er-20200703-064005","2","2","1","1","","630","","2020-07-03 19:40:05","2020-07-03 19:40:05");
INSERT INTO expenses VALUES("30","er-20200812-062947","1","2","1","1","","320","","2020-08-12 19:29:47","2020-08-12 19:29:47");
INSERT INTO expenses VALUES("31","er-20200812-063010","2","2","1","1","","730","","2020-08-12 19:30:10","2020-08-12 19:30:10");
INSERT INTO expenses VALUES("32","er-20201018-124438","2","1","1","9","2","100","","2020-10-18 13:44:38","2020-10-18 13:44:38");
INSERT INTO expenses VALUES("33","er-20201101-072257","1","2","1","1","4","50","","2020-11-01 08:22:57","2020-11-01 08:22:57");
INSERT INTO expenses VALUES("34","er-20201118-062500","4","1","1","1","3","200","","2020-11-18 07:25:00","2020-11-18 07:25:00");
INSERT INTO expenses VALUES("37","er-20210114-065938","2","2","1","1","4","25.5","","2021-01-14 07:59:38","2021-01-14 07:59:38");
INSERT INTO expenses VALUES("38","er-20210601-075909","2","1","1","1","3","100","","2021-06-01 20:59:09","2021-06-01 20:59:09");
INSERT INTO expenses VALUES("39","er-20211208-115635","2","2","1","1","4","200","","2021-12-08 12:56:35","2021-12-08 12:56:35");



CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `general_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_rtl` tinyint(1) DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_access` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `developed_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO general_settings VALUES("1","Anantakij","20220130043831.jpg","0","3","own","d/m/Y","Night","standard","1","default.css","2018-07-06 13:13:11","2022-01-30 16:38:31","prefix");



CREATE TABLE `gift_card_recharges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gift_card_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gift_card_recharges VALUES("1","2","100","1","2018-08-25 06:08:29","2018-08-25 06:08:29");
INSERT INTO gift_card_recharges VALUES("2","1","200","1","2018-08-25 06:08:50","2018-08-25 06:08:50");
INSERT INTO gift_card_recharges VALUES("3","1","100","1","2018-09-05 06:50:41","2018-09-05 06:50:41");
INSERT INTO gift_card_recharges VALUES("4","1","50","1","2018-09-05 06:51:38","2018-09-05 06:51:38");
INSERT INTO gift_card_recharges VALUES("5","1","50","1","2018-09-05 06:53:36","2018-09-05 06:53:36");
INSERT INTO gift_card_recharges VALUES("6","2","50","1","2018-09-05 06:54:34","2018-09-05 06:54:34");
INSERT INTO gift_card_recharges VALUES("7","5","10","1","2018-09-30 07:19:48","2018-09-30 07:19:48");
INSERT INTO gift_card_recharges VALUES("8","5","10","1","2018-09-30 07:20:04","2018-09-30 07:20:04");
INSERT INTO gift_card_recharges VALUES("9","2","100","1","2018-10-07 10:13:05","2018-10-07 10:13:05");
INSERT INTO gift_card_recharges VALUES("10","1","200","1","2018-10-07 10:13:39","2018-10-07 10:13:39");
INSERT INTO gift_card_recharges VALUES("11","1","300","1","2018-10-23 07:22:49","2018-10-23 07:22:49");
INSERT INTO gift_card_recharges VALUES("12","2","130","1","2021-02-11 14:36:01","2021-02-11 14:36:01");



CREATE TABLE `gift_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `card_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gift_cards VALUES("1","3571097513020486","1400","450","1","","2020-12-31","1","1","2018-08-18 08:57:40","2020-10-18 12:14:26");
INSERT INTO gift_cards VALUES("2","0452297501931931","500","100","2","","2021-12-31","1","1","2018-08-18 09:46:43","2021-02-11 14:36:01");
INSERT INTO gift_cards VALUES("3","123","13123","0","1","","2018-08-19","1","0","2018-08-19 05:38:21","2018-08-19 05:38:28");
INSERT INTO gift_cards VALUES("4","1862381252690499","100","0","","1","2018-10-04","1","0","2018-09-30 07:16:28","2018-09-30 07:17:21");
INSERT INTO gift_cards VALUES("5","2300813717254199","143","0","","1","2018-10-04","1","0","2018-09-30 07:18:49","2018-09-30 07:20:20");
INSERT INTO gift_cards VALUES("6","8327019475026421","1","0","1","","2018-10-07","1","0","2018-10-07 10:12:41","2018-10-07 10:12:55");
INSERT INTO gift_cards VALUES("7","2063379780590151","1","0","1","","2018-10-23","1","0","2018-10-23 07:23:22","2018-10-23 07:23:39");



CREATE TABLE `holidays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `hrm_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `checkin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO hrm_settings VALUES("1","10:00am","6:00pm","2019-01-02 09:20:08","2019-01-02 11:20:53");



CREATE TABLE `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO languages VALUES("1","en","2018-07-08 05:59:17","2019-12-25 00:34:20");



CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES("1","2014_10_12_000000_create_users_table","1");
INSERT INTO migrations VALUES("2","2014_10_12_100000_create_password_resets_table","1");
INSERT INTO migrations VALUES("3","2018_02_17_060412_create_categories_table","1");
INSERT INTO migrations VALUES("4","2018_02_20_035727_create_brands_table","1");
INSERT INTO migrations VALUES("5","2018_02_25_100635_create_suppliers_table","1");
INSERT INTO migrations VALUES("6","2018_02_27_101619_create_warehouse_table","1");
INSERT INTO migrations VALUES("7","2018_03_03_040448_create_units_table","1");
INSERT INTO migrations VALUES("8","2018_03_04_041317_create_taxes_table","1");
INSERT INTO migrations VALUES("9","2018_03_10_061915_create_customer_groups_table","1");
INSERT INTO migrations VALUES("10","2018_03_10_090534_create_customers_table","1");
INSERT INTO migrations VALUES("11","2018_03_11_095547_create_billers_table","1");
INSERT INTO migrations VALUES("12","2018_04_05_054401_create_products_table","1");
INSERT INTO migrations VALUES("13","2018_04_06_133606_create_purchases_table","1");
INSERT INTO migrations VALUES("14","2018_04_06_154600_create_product_purchases_table","1");
INSERT INTO migrations VALUES("15","2018_04_06_154915_create_product_warhouse_table","1");
INSERT INTO migrations VALUES("16","2018_04_10_085927_create_sales_table","1");
INSERT INTO migrations VALUES("17","2018_04_10_090133_create_product_sales_table","1");
INSERT INTO migrations VALUES("18","2018_04_10_090254_create_payments_table","1");
INSERT INTO migrations VALUES("19","2018_04_10_090341_create_payment_with_cheque_table","1");
INSERT INTO migrations VALUES("20","2018_04_10_090509_create_payment_with_credit_card_table","1");
INSERT INTO migrations VALUES("21","2018_04_13_121436_create_quotation_table","1");
INSERT INTO migrations VALUES("22","2018_04_13_122324_create_product_quotation_table","1");
INSERT INTO migrations VALUES("23","2018_04_14_121802_create_transfers_table","1");
INSERT INTO migrations VALUES("24","2018_04_14_121913_create_product_transfer_table","1");
INSERT INTO migrations VALUES("25","2018_05_13_082847_add_payment_id_and_change_sale_id_to_payments_table","2");
INSERT INTO migrations VALUES("26","2018_05_13_090906_change_customer_id_to_payment_with_credit_card_table","3");
INSERT INTO migrations VALUES("27","2018_05_20_054532_create_adjustments_table","4");
INSERT INTO migrations VALUES("28","2018_05_20_054859_create_product_adjustments_table","4");
INSERT INTO migrations VALUES("29","2018_05_21_163419_create_returns_table","5");
INSERT INTO migrations VALUES("30","2018_05_21_163443_create_product_returns_table","5");
INSERT INTO migrations VALUES("31","2018_06_02_050905_create_roles_table","6");
INSERT INTO migrations VALUES("32","2018_06_02_073430_add_columns_to_users_table","7");
INSERT INTO migrations VALUES("33","2018_06_03_053738_create_permission_tables","8");
INSERT INTO migrations VALUES("36","2018_06_21_063736_create_pos_setting_table","9");
INSERT INTO migrations VALUES("37","2018_06_21_094155_add_user_id_to_sales_table","10");
INSERT INTO migrations VALUES("38","2018_06_21_101529_add_user_id_to_purchases_table","11");
INSERT INTO migrations VALUES("39","2018_06_21_103512_add_user_id_to_transfers_table","12");
INSERT INTO migrations VALUES("40","2018_06_23_061058_add_user_id_to_quotations_table","13");
INSERT INTO migrations VALUES("41","2018_06_23_082427_add_is_deleted_to_users_table","14");
INSERT INTO migrations VALUES("42","2018_06_25_043308_change_email_to_users_table","15");
INSERT INTO migrations VALUES("43","2018_07_06_115449_create_general_settings_table","16");
INSERT INTO migrations VALUES("44","2018_07_08_043944_create_languages_table","17");
INSERT INTO migrations VALUES("45","2018_07_11_102144_add_user_id_to_returns_table","18");
INSERT INTO migrations VALUES("46","2018_07_11_102334_add_user_id_to_payments_table","18");
INSERT INTO migrations VALUES("47","2018_07_22_130541_add_digital_to_products_table","19");
INSERT INTO migrations VALUES("49","2018_07_24_154250_create_deliveries_table","20");
INSERT INTO migrations VALUES("50","2018_08_16_053336_create_expense_categories_table","21");
INSERT INTO migrations VALUES("51","2018_08_17_115415_create_expenses_table","22");
INSERT INTO migrations VALUES("55","2018_08_18_050418_create_gift_cards_table","23");
INSERT INTO migrations VALUES("56","2018_08_19_063119_create_payment_with_gift_card_table","24");
INSERT INTO migrations VALUES("57","2018_08_25_042333_create_gift_card_recharges_table","25");
INSERT INTO migrations VALUES("58","2018_08_25_101354_add_deposit_expense_to_customers_table","26");
INSERT INTO migrations VALUES("59","2018_08_26_043801_create_deposits_table","27");
INSERT INTO migrations VALUES("60","2018_09_02_044042_add_keybord_active_to_pos_setting_table","28");
INSERT INTO migrations VALUES("61","2018_09_09_092713_create_payment_with_paypal_table","29");
INSERT INTO migrations VALUES("62","2018_09_10_051254_add_currency_to_general_settings_table","30");
INSERT INTO migrations VALUES("63","2018_10_22_084118_add_biller_and_store_id_to_users_table","31");
INSERT INTO migrations VALUES("65","2018_10_26_034927_create_coupons_table","32");
INSERT INTO migrations VALUES("66","2018_10_27_090857_add_coupon_to_sales_table","33");
INSERT INTO migrations VALUES("67","2018_11_07_070155_add_currency_position_to_general_settings_table","34");
INSERT INTO migrations VALUES("68","2018_11_19_094650_add_combo_to_products_table","35");
INSERT INTO migrations VALUES("69","2018_12_09_043712_create_accounts_table","36");
INSERT INTO migrations VALUES("70","2018_12_17_112253_add_is_default_to_accounts_table","37");
INSERT INTO migrations VALUES("71","2018_12_19_103941_add_account_id_to_payments_table","38");
INSERT INTO migrations VALUES("72","2018_12_20_065900_add_account_id_to_expenses_table","39");
INSERT INTO migrations VALUES("73","2018_12_20_082753_add_account_id_to_returns_table","40");
INSERT INTO migrations VALUES("74","2018_12_26_064330_create_return_purchases_table","41");
INSERT INTO migrations VALUES("75","2018_12_26_144210_create_purchase_product_return_table","42");
INSERT INTO migrations VALUES("76","2018_12_26_144708_create_purchase_product_return_table","43");
INSERT INTO migrations VALUES("77","2018_12_27_110018_create_departments_table","44");
INSERT INTO migrations VALUES("78","2018_12_30_054844_create_employees_table","45");
INSERT INTO migrations VALUES("79","2018_12_31_125210_create_payrolls_table","46");
INSERT INTO migrations VALUES("80","2018_12_31_150446_add_department_id_to_employees_table","47");
INSERT INTO migrations VALUES("81","2019_01_01_062708_add_user_id_to_expenses_table","48");
INSERT INTO migrations VALUES("82","2019_01_02_075644_create_hrm_settings_table","49");
INSERT INTO migrations VALUES("83","2019_01_02_090334_create_attendances_table","50");
INSERT INTO migrations VALUES("84","2019_01_27_160956_add_three_columns_to_general_settings_table","51");
INSERT INTO migrations VALUES("85","2019_02_15_183303_create_stock_counts_table","52");
INSERT INTO migrations VALUES("86","2019_02_17_101604_add_is_adjusted_to_stock_counts_table","53");
INSERT INTO migrations VALUES("87","2019_04_13_101707_add_tax_no_to_customers_table","54");
INSERT INTO migrations VALUES("89","2019_10_14_111455_create_holidays_table","55");
INSERT INTO migrations VALUES("90","2019_11_13_145619_add_is_variant_to_products_table","56");
INSERT INTO migrations VALUES("91","2019_11_13_150206_create_product_variants_table","57");
INSERT INTO migrations VALUES("92","2019_11_13_153828_create_variants_table","57");
INSERT INTO migrations VALUES("93","2019_11_25_134041_add_qty_to_product_variants_table","58");
INSERT INTO migrations VALUES("94","2019_11_25_134922_add_variant_id_to_product_purchases_table","58");
INSERT INTO migrations VALUES("95","2019_11_25_145341_add_variant_id_to_product_warehouse_table","58");
INSERT INTO migrations VALUES("96","2019_11_29_182201_add_variant_id_to_product_sales_table","59");
INSERT INTO migrations VALUES("97","2019_12_04_121311_add_variant_id_to_product_quotation_table","60");
INSERT INTO migrations VALUES("98","2019_12_05_123802_add_variant_id_to_product_transfer_table","61");
INSERT INTO migrations VALUES("100","2019_12_08_114954_add_variant_id_to_product_returns_table","62");
INSERT INTO migrations VALUES("101","2019_12_08_203146_add_variant_id_to_purchase_product_return_table","63");
INSERT INTO migrations VALUES("102","2020_02_28_103340_create_money_transfers_table","64");
INSERT INTO migrations VALUES("103","2020_07_01_193151_add_image_to_categories_table","65");
INSERT INTO migrations VALUES("105","2020_09_26_130426_add_user_id_to_deliveries_table","66");
INSERT INTO migrations VALUES("107","2020_10_11_125457_create_cash_registers_table","67");
INSERT INTO migrations VALUES("108","2020_10_13_155019_add_cash_register_id_to_sales_table","68");
INSERT INTO migrations VALUES("109","2020_10_13_172624_add_cash_register_id_to_returns_table","69");
INSERT INTO migrations VALUES("110","2020_10_17_212338_add_cash_register_id_to_payments_table","70");
INSERT INTO migrations VALUES("111","2020_10_18_124200_add_cash_register_id_to_expenses_table","71");
INSERT INTO migrations VALUES("112","2020_10_21_121632_add_developed_by_to_general_settings_table","72");
INSERT INTO migrations VALUES("113","2019_08_19_000000_create_failed_jobs_table","73");
INSERT INTO migrations VALUES("114","2020_10_30_135557_create_notifications_table","73");
INSERT INTO migrations VALUES("115","2020_11_01_044954_create_currencies_table","74");
INSERT INTO migrations VALUES("116","2020_11_01_140736_add_price_to_product_warehouse_table","75");
INSERT INTO migrations VALUES("117","2020_11_02_050633_add_is_diff_price_to_products_table","76");
INSERT INTO migrations VALUES("118","2020_11_09_055222_add_user_id_to_customers_table","77");
INSERT INTO migrations VALUES("119","2020_11_17_054806_add_invoice_format_to_general_settings_table","78");
INSERT INTO migrations VALUES("120","2021_02_10_074859_add_variant_id_to_product_adjustments_table","79");
INSERT INTO migrations VALUES("121","2021_03_07_093606_create_product_batches_table","80");
INSERT INTO migrations VALUES("122","2021_03_07_093759_add_product_batch_id_to_product_warehouse_table","80");
INSERT INTO migrations VALUES("123","2021_03_07_093900_add_product_batch_id_to_product_purchases_table","80");
INSERT INTO migrations VALUES("124","2021_03_11_132603_add_product_batch_id_to_product_sales_table","81");
INSERT INTO migrations VALUES("127","2021_03_25_125421_add_is_batch_to_products_table","82");
INSERT INTO migrations VALUES("128","2021_05_19_120127_add_product_batch_id_to_product_returns_table","82");
INSERT INTO migrations VALUES("130","2021_05_22_105611_add_product_batch_id_to_purchase_product_return_table","83");
INSERT INTO migrations VALUES("131","2021_05_23_124848_add_product_batch_id_to_product_transfer_table","84");
INSERT INTO migrations VALUES("132","2021_05_26_153106_add_product_batch_id_to_product_quotation_table","85");
INSERT INTO migrations VALUES("133","2021_06_08_213007_create_reward_point_settings_table","86");
INSERT INTO migrations VALUES("134","2021_06_16_104155_add_points_to_customers_table","87");
INSERT INTO migrations VALUES("135","2021_06_17_101057_add_used_points_to_payments_table","88");
INSERT INTO migrations VALUES("136","2021_07_06_132716_add_variant_list_to_products_table","89");
INSERT INTO migrations VALUES("137","2021_09_27_161141_add_is_imei_to_products_table","90");
INSERT INTO migrations VALUES("138","2021_09_28_170052_add_imei_number_to_product_warehouse_table","91");
INSERT INTO migrations VALUES("139","2021_09_28_170126_add_imei_number_to_product_purchases_table","91");
INSERT INTO migrations VALUES("140","2021_10_03_170652_add_imei_number_to_product_sales_table","92");
INSERT INTO migrations VALUES("141","2021_10_10_145214_add_imei_number_to_product_returns_table","93");
INSERT INTO migrations VALUES("142","2021_10_11_104504_add_imei_number_to_product_transfer_table","94");
INSERT INTO migrations VALUES("143","2021_10_12_160107_add_imei_number_to_purchase_product_return_table","95");
INSERT INTO migrations VALUES("144","2021_10_12_205146_add_is_rtl_to_general_settings_table","96");



CREATE TABLE `money_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO money_transfers VALUES("2","mtr-20200228-071852","1","3","100","2020-02-28 20:18:52","2020-02-28 20:18:52");



CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO notifications VALUES("249beded-5431-40a3-ba1e-d255ffb047a3","App\Notifications\SendNotification","App\User","9","{"message":"Please delete all pending purchase."}","2020-11-01 08:33:32","2020-11-01 08:33:07","2020-11-01 08:33:32");



CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_cheque` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `cheque_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_with_cheque VALUES("1","19","23425235235","2018-07-01 10:09:48","2018-07-01 10:09:48");
INSERT INTO payment_with_cheque VALUES("2","24","3123123123","2018-07-10 08:21:32","2018-07-10 08:21:32");
INSERT INTO payment_with_cheque VALUES("3","31","767867678","2018-08-08 17:36:22","2018-08-08 17:36:22");
INSERT INTO payment_with_cheque VALUES("4","34","3123412","2018-08-09 06:55:54","2018-08-09 06:55:54");
INSERT INTO payment_with_cheque VALUES("5","35","7765","2018-08-09 07:32:14","2018-08-09 07:32:14");
INSERT INTO payment_with_cheque VALUES("6","44","3124142412","2018-08-30 10:07:18","2018-08-30 10:07:18");
INSERT INTO payment_with_cheque VALUES("7","51","6576764646","2018-09-03 11:08:21","2018-09-03 11:08:21");
INSERT INTO payment_with_cheque VALUES("8","53","111111111","2018-09-03 11:15:24","2018-09-03 11:15:24");
INSERT INTO payment_with_cheque VALUES("9","79","1111","2018-10-06 07:51:55","2018-10-06 07:51:55");
INSERT INTO payment_with_cheque VALUES("10","147","221133","2018-12-04 07:58:35","2018-12-04 07:58:35");
INSERT INTO payment_with_cheque VALUES("11","175","1111","2019-02-07 13:38:23","2019-02-07 13:38:23");
INSERT INTO payment_with_cheque VALUES("12","176","1111","2019-02-07 13:54:59","2019-02-07 13:54:59");
INSERT INTO payment_with_cheque VALUES("13","178","420","2019-02-07 14:07:04","2019-02-07 14:07:04");
INSERT INTO payment_with_cheque VALUES("14","216","12344321","2019-11-11 11:39:11","2019-11-11 11:39:11");
INSERT INTO payment_with_cheque VALUES("15","295","111122222","2020-10-18 12:17:24","2020-10-18 12:17:24");



CREATE TABLE `payment_with_credit_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_with_credit_card VALUES("4","294","1","cus_IDw8z9yJZn4qH3","ch_1HdUGJKwOmA8HLXePiqphlky","2020-10-18 12:16:55","2020-10-18 12:16:55");



CREATE TABLE `payment_with_gift_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_with_gift_card VALUES("1","36","2","2018-08-25 04:48:36","2018-08-25 07:57:35");
INSERT INTO payment_with_gift_card VALUES("4","39","1","2018-08-25 09:36:34","2018-08-25 09:36:34");
INSERT INTO payment_with_gift_card VALUES("6","50","1","2018-09-03 06:01:38","2018-09-03 06:01:38");
INSERT INTO payment_with_gift_card VALUES("8","293","1","2020-10-18 12:14:26","2020-10-18 12:14:26");



CREATE TABLE `payment_with_paypal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `used_points` double DEFAULT NULL,
  `change` double NOT NULL,
  `paying_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payments VALUES("33","spr-20180809-055453","1","","2","","1","1000","","0","Cash","","2018-08-09 06:54:53","2018-08-09 06:54:53");
INSERT INTO payments VALUES("34","spr-20180809-055553","1","","2","","1","1200","","0","Cheque","","2018-08-09 06:55:53","2018-08-09 06:56:36");
INSERT INTO payments VALUES("35","spr-20180809-063214","1","","3","","1","897","","0","Cheque","","2018-08-09 07:32:14","2018-08-09 07:32:14");
INSERT INTO payments VALUES("36","spr-20180825-034836","1","","4","","1","100","","0","Gift Card","100 bucks paid...","2018-08-25 04:48:36","2018-08-25 07:57:35");
INSERT INTO payments VALUES("39","spr-20180825-083634","1","","4","","1","200","","0","Gift Card","","2018-08-25 09:36:34","2018-08-25 09:36:34");
INSERT INTO payments VALUES("41","spr-20180826-094836","1","","6","","1","20","","0","Deposit","20 bucks paid","2018-08-26 10:48:36","2018-08-27 04:42:13");
INSERT INTO payments VALUES("42","spr-20180827-073545","1","","7","","1","880","","0","Cash","","2018-08-27 08:35:45","2018-08-27 08:35:45");
INSERT INTO payments VALUES("43","ppr-20180830-071637","1","13","","","1","100","","0","Cash","100 bucks paid...","2018-08-30 08:16:37","2018-08-30 08:16:37");
INSERT INTO payments VALUES("44","ppr-20180830-090718","1","13","","","1","200","","0","Cheque","","2018-08-30 10:07:18","2018-08-30 10:07:18");
INSERT INTO payments VALUES("46","spr-20180902-053954","1","","8","","1","3529.8","","0","Cash","fully paid","2018-09-02 06:39:54","2018-09-02 06:39:54");
INSERT INTO payments VALUES("49","spr-20180903-033314","1","","9","","1","20","","0","Deposit","fully paid","2018-09-03 04:33:14","2018-09-03 04:33:14");
INSERT INTO payments VALUES("50","spr-20180903-050138","1","","10","","1","200","","0","Gift Card","50 bucks due...","2018-09-03 06:01:38","2018-09-10 04:40:28");
INSERT INTO payments VALUES("51","spr-20180903-100821","1","","11","","1","5500","","0","Cheque","","2018-09-03 11:08:21","2018-09-03 11:08:21");
INSERT INTO payments VALUES("53","ppr-20180903-101524","1","16","","","1","1750","","0","Cheque","","2018-09-03 11:15:24","2018-10-06 08:09:20");
INSERT INTO payments VALUES("78","spr-20180926-092105","1","","31","","1","560","","0","Cash","","2018-09-26 10:21:05","2018-09-26 10:21:05");
INSERT INTO payments VALUES("79","spr-20181006-065017","1","","30","","1","100","","0","Cheque","","2018-10-06 07:50:17","2018-10-06 07:51:55");
INSERT INTO payments VALUES("80","spr-20181006-065222","1","","30","","1","20","","0","Cash","","2018-10-06 07:52:22","2018-10-06 07:52:22");
INSERT INTO payments VALUES("82","ppr-20181006-070935","1","16","","","1","1600","","0","Cash","","2018-10-06 08:09:35","2018-10-06 08:09:35");
INSERT INTO payments VALUES("83","spr-20181010-041636","1","","41","","1","461","","0","Cash","","2018-10-10 05:16:36","2018-10-10 05:16:36");
INSERT INTO payments VALUES("84","spr-20181010-053456","1","","42","","1","440","","0","Cash","","2018-10-10 06:34:56","2018-10-10 06:34:56");
INSERT INTO payments VALUES("91","spr-20181021-065338","1","","55","","1","250","","0","Cash","","2018-10-21 07:53:38","2018-10-21 07:53:38");
INSERT INTO payments VALUES("92","spr-20181021-082618","1","","57","","1","575.2","","0","Cash","","2018-10-21 09:26:18","2018-10-21 09:26:18");
INSERT INTO payments VALUES("93","spr-20181022-032730","1","","58","","1","1220","","0","Cash","","2018-10-22 16:27:30","2018-10-22 16:27:30");
INSERT INTO payments VALUES("104","spr-20181023-071548","11","","73","","1","5500","","0","Cash","","2018-10-23 08:15:48","2018-10-23 08:15:48");
INSERT INTO payments VALUES("105","spr-20181023-071648","1","","74","","1","2320","","0","Cash","","2018-10-23 08:16:48","2018-10-23 08:16:48");
INSERT INTO payments VALUES("126","spr-20181101-050033","1","","75","","1","7678","","0","Cash","","2018-11-01 06:00:33","2018-11-01 06:00:33");
INSERT INTO payments VALUES("127","spr-20181101-050130","1","","76","","1","1424","","0","Cash","","2018-11-01 06:01:30","2018-11-08 10:44:51");
INSERT INTO payments VALUES("129","spr-20181105-091523","1","","79","","1","14454","","0","Cash","","2018-11-05 10:15:23","2018-11-05 10:15:23");
INSERT INTO payments VALUES("130","spr-20181105-092002","1","","80","","1","2500","","0","Cash","","2018-11-05 10:20:02","2018-11-05 10:20:02");
INSERT INTO payments VALUES("131","ppr-20181105-092128","1","24","","","1","15950","","0","Cash","","2018-11-05 10:21:28","2018-11-05 10:21:28");
INSERT INTO payments VALUES("137","spr-20181105-095952","1","","86","","1","1100","","0","Cash","","2018-11-05 10:59:52","2018-11-05 10:59:52");
INSERT INTO payments VALUES("138","spr-20181105-100310","1","","88","","1","1100","","0","Cash","","2018-11-05 11:03:10","2018-11-05 11:03:10");
INSERT INTO payments VALUES("139","spr-20181126-020534","1","","94","","1","120","","0","Cash","","2018-11-26 15:05:34","2018-11-26 15:05:34");
INSERT INTO payments VALUES("140","spr-20181128-071515","1","","96","","1","132","","0","Cash","","2018-11-28 08:15:15","2018-11-28 08:15:15");
INSERT INTO payments VALUES("141","spr-20181201-060524","1","","97","","1","200","","300","Cash","","2018-12-01 07:05:24","2018-12-04 07:21:05");
INSERT INTO payments VALUES("148","ppr-20181204-065932","1","23","","","1","500","","500","Cash","","2018-12-04 07:59:32","2018-12-04 07:59:44");
INSERT INTO payments VALUES("149","ppr-20181205-053443","1","25","","","1","4450","","550","Cash","","2018-12-05 06:34:43","2018-12-05 06:34:43");
INSERT INTO payments VALUES("150","spr-20181205-053608","1","","98","","1","800","","200","Cash","","2018-12-05 06:36:08","2018-12-05 06:36:08");
INSERT INTO payments VALUES("151","spr-20181205-053724","1","","99","","1","800","","0","Cash","","2018-12-05 06:37:24","2018-12-05 06:37:24");
INSERT INTO payments VALUES("152","spr-20181208-062032","1","","101","","1","100","","400","Cash","","2018-12-08 07:20:32","2018-12-11 10:19:39");
INSERT INTO payments VALUES("157","ppr-20181220-063439","1","27","","","1","10","","0","Cash","","2018-12-20 07:34:39","2018-12-20 07:35:01");
INSERT INTO payments VALUES("159","spr-20181224-045832","1","","103","","1","120","","0","Cash","","2018-12-24 05:58:32","2018-12-24 05:58:32");
INSERT INTO payments VALUES("160","spr-20190101-054544","1","","105","","1","21","","0","Cash","","2019-01-01 06:45:44","2019-01-01 06:45:44");
INSERT INTO payments VALUES("161","spr-20190101-091040","1","","106","","1","860","","0","Cash","","2019-01-01 10:10:40","2019-01-01 10:10:40");
INSERT INTO payments VALUES("162","spr-20190103-065627","1","","107","","1","5040","","960","Cash","","2019-01-03 07:56:27","2019-01-03 07:56:27");
INSERT INTO payments VALUES("163","spr-20190120-035824","1","","108","","1","120","","0","Cash","","2019-01-20 16:58:24","2019-01-20 16:58:24");
INSERT INTO payments VALUES("164","ppr-20190129-100302","9","36","","","1","650","","350","Cash","","2019-01-29 11:03:02","2019-01-29 11:03:02");
INSERT INTO payments VALUES("165","ppr-20190129-100324","9","34","","","1","2860","","140","Cash","","2019-01-29 11:03:24","2019-01-29 11:03:24");
INSERT INTO payments VALUES("166","spr-20190129-101451","9","","109","","1","540","","460","Cash","","2019-01-29 11:14:51","2019-01-29 11:14:51");
INSERT INTO payments VALUES("167","spr-20190129-115048","9","","110","","1","1700","","300","Cash","","2019-01-29 12:50:48","2019-01-29 12:50:48");
INSERT INTO payments VALUES("168","spr-20190131-110839","9","","111","","1","271","","0","Cash","","2019-01-31 12:08:39","2019-01-31 12:08:39");
INSERT INTO payments VALUES("169","spr-20190202-104045","1","","112","","1","440","","0","Cash","","2019-02-02 11:40:45","2019-02-02 11:40:45");
INSERT INTO payments VALUES("170","spr-20190202-114117","1","","113","","1","350","","0","Cash","","2019-02-02 12:41:17","2019-02-02 12:41:17");
INSERT INTO payments VALUES("171","spr-20190205-030454","1","","114","","1","440","","0","Cash","","2019-02-05 16:04:54","2019-02-05 16:04:54");
INSERT INTO payments VALUES("176","ppr-20190207-125418","1","35","","","1","50","","50","Cash","","2019-02-07 13:54:18","2019-02-07 14:05:23");
INSERT INTO payments VALUES("178","ppr-20190207-010640","1","35","","","1","50","","50","Cheque","","2019-02-07 14:06:40","2019-02-07 14:07:04");
INSERT INTO payments VALUES("179","spr-20190207-010915","1","","120","","1","50","","50","Cash","","2019-02-07 14:09:15","2019-02-07 14:09:15");
INSERT INTO payments VALUES("180","spr-20190209-104816","1","","121","","1","1272","","728","Cash","","2019-02-09 11:48:16","2019-02-09 11:48:16");
INSERT INTO payments VALUES("181","ppr-20190209-104940","1","38","","","1","1660","","0","Cash","","2019-02-09 11:49:40","2019-02-09 11:49:40");
INSERT INTO payments VALUES("182","ppr-20190209-104959","1","39","","","1","973.5","","0","Cash","","2019-02-09 11:49:59","2019-02-09 11:49:59");
INSERT INTO payments VALUES("183","spr-20190219-023214","1","","123","","1","440","","0","Cash","","2019-02-19 15:32:14","2019-02-19 15:32:14");
INSERT INTO payments VALUES("189","spr-20190303-104010","1","","127","","1","2500","","0","Cash","","2019-03-03 11:40:10","2019-03-03 11:40:10");
INSERT INTO payments VALUES("190","ppr-20190303-104046","1","40","","","1","100","","0","Cash","","2019-03-03 11:40:46","2019-03-03 11:40:46");
INSERT INTO payments VALUES("191","ppr-20190303-104222","1","37","","","1","4000","","0","Cash","","2019-03-03 11:42:22","2019-03-03 11:42:22");
INSERT INTO payments VALUES("192","ppr-20190303-104414","1","41","","","1","1000","","0","Cash","","2019-03-03 11:44:14","2019-03-03 11:44:14");
INSERT INTO payments VALUES("193","spr-20190404-095555","1","","128","","1","560","","0","Cash","","2019-04-04 10:55:55","2019-04-04 10:55:55");
INSERT INTO payments VALUES("194","ppr-20190404-095910","1","42","","","1","300","","200","Cash","","2019-04-04 10:59:10","2019-04-13 17:52:38");
INSERT INTO payments VALUES("195","spr-20190404-095937","1","","129","","1","120","","0","Cash","","2019-04-04 10:59:37","2019-04-04 10:59:37");
INSERT INTO payments VALUES("196","spr-20190421-122124","1","","130","","1","586","","0","Cash","","2019-04-21 13:21:24","2019-04-21 13:21:24");
INSERT INTO payments VALUES("197","spr-20190528-103229","1","","131","","1","2890","","0","Cash","","2019-05-28 11:32:29","2019-05-28 11:32:29");
INSERT INTO payments VALUES("198","ppr-20190613-101351","1","37","","","1","2390","","0","Cash","","2019-06-13 11:13:51","2019-06-13 11:13:51");
INSERT INTO payments VALUES("199","spr-20190613-101637","1","","132","","1","840","","0","Cash","","2019-06-13 11:16:37","2019-06-13 11:16:37");
INSERT INTO payments VALUES("200","ppr-20190613-101713","1","43","","","1","1000","","0","Cash","","2019-06-13 11:17:13","2019-06-13 11:17:13");
INSERT INTO payments VALUES("201","spr-20190613-101752","1","","133","","1","2700","","0","Cash","","2019-06-13 11:17:52","2019-06-13 11:17:52");
INSERT INTO payments VALUES("202","ppr-20191019-032925","1","43","","","1","3290","","710","Cash","","2019-10-19 16:29:25","2019-10-19 16:29:25");
INSERT INTO payments VALUES("203","spr-20191019-033028","1","","134","","1","2940","","60","Cash","","2019-10-19 16:30:28","2019-10-19 16:30:28");
INSERT INTO payments VALUES("205","spr-20191103-114044","1","","139","","1","488","","12","Cash","","2019-11-03 12:40:44","2019-11-03 12:40:44");
INSERT INTO payments VALUES("206","ppr-20191103-114222","1","46","","","1","200","","0","Cash","","2019-11-03 12:42:22","2019-11-03 12:42:22");
INSERT INTO payments VALUES("211","spr-20191109-074131","1","","144","","1","1220","","0","Cash","","2019-11-09 20:41:31","2019-11-09 20:41:31");
INSERT INTO payments VALUES("216","ppr-20191111-103911","1","49","","","1","5000","","0","Cheque","","2019-11-11 11:39:11","2019-11-11 11:39:11");
INSERT INTO payments VALUES("217","spr-20191111-104008","1","","147","","1","2220","","780","Cash","","2019-11-11 11:40:08","2019-11-11 11:40:08");
INSERT INTO payments VALUES("222","spr-20191203-115128","1","","163","","1","3","","0","Cash","","2019-12-03 12:51:28","2019-12-03 12:51:28");
INSERT INTO payments VALUES("227","ppr-20191204-111124","1","57","","","1","220","","280","Cash","","2019-12-05 00:11:24","2019-12-05 00:11:24");
INSERT INTO payments VALUES("228","spr-20191205-092712","1","","173","","1","621","","0","Cash","","2019-12-05 10:27:12","2019-12-05 10:27:12");
INSERT INTO payments VALUES("239","spr-20191222-104058","1","","187","","1","288","","212","Cash","","2019-12-22 11:40:58","2019-12-22 11:40:58");
INSERT INTO payments VALUES("241","spr-20191223-125946","1","","190","","1","1100","","400","Cash","","2019-12-23 13:59:46","2019-12-23 13:59:46");
INSERT INTO payments VALUES("244","ppr-20200101-010750","1","61","","","1","60","","0","Cash","","2020-01-01 14:07:50","2020-01-01 14:07:50");
INSERT INTO payments VALUES("246","spr-20200101-022028","1","","193","","1","1100","","400","Cash","","2020-01-01 15:20:28","2020-01-01 15:20:28");
INSERT INTO payments VALUES("247","ppr-20200101-022131","1","59","","","1","6","","0","Cash","","2020-01-01 15:21:31","2020-01-01 15:21:31");
INSERT INTO payments VALUES("248","ppr-20200101-022137","1","58","","","1","4","","0","Cash","","2020-01-01 15:21:37","2020-01-01 15:21:37");
INSERT INTO payments VALUES("249","ppr-20200101-022144","1","56","","","1","2","","0","Cash","","2020-01-01 15:21:44","2020-01-01 15:21:44");
INSERT INTO payments VALUES("250","ppr-20200101-022152","1","55","","","1","4","","0","Cash","","2020-01-01 15:21:52","2020-01-01 15:21:52");
INSERT INTO payments VALUES("251","ppr-20200101-022225","1","49","","","1","2000","","0","Cash","","2020-01-01 15:22:25","2020-01-01 15:22:25");
INSERT INTO payments VALUES("252","spr-20200102-043947","1","","194","","1","892","","108","Cash","","2020-01-02 17:39:47","2020-01-02 17:39:47");
INSERT INTO payments VALUES("258","spr-20200203-035256","1","","201","","1","120","","880","Cash","","2020-02-03 16:52:56","2020-02-03 16:52:56");
INSERT INTO payments VALUES("259","spr-20200204-105853","1","","202","","1","1400","","100","Cash","","2020-02-04 23:58:53","2020-02-04 23:58:53");
INSERT INTO payments VALUES("260","ppr-20200204-110050","1","67","","","1","300","","0","Cash","","2020-02-05 00:00:50","2020-02-05 00:00:50");
INSERT INTO payments VALUES("261","spr-20200302-115414","1","","203","","1","350","","150","Cash","","2020-03-02 12:54:14","2020-03-02 12:54:14");
INSERT INTO payments VALUES("262","spr-20200302-115741","1","","204","","1","40","","10","Cash","","2020-03-02 12:57:41","2020-03-02 12:57:41");
INSERT INTO payments VALUES("263","ppr-20200302-115811","1","70","","","1","50","","0","Cash","","2020-03-02 12:58:11","2020-03-02 12:58:11");
INSERT INTO payments VALUES("264","ppr-20200302-115820","1","69","","","1","50","","0","Cash","","2020-03-02 12:58:20","2020-03-02 12:58:20");
INSERT INTO payments VALUES("265","spr-20200311-044642","1","","205","","1","352","","148","Cash","","2020-03-11 17:46:42","2020-03-11 17:46:42");
INSERT INTO payments VALUES("266","ppr-20200406-073823","1","71","","","1","2000","","1000","Cash","First Payment","2020-04-06 20:38:23","2020-04-06 20:38:55");
INSERT INTO payments VALUES("267","spr-20200406-074024","1","","207","","1","500","","500","Cash","","2020-04-06 20:40:24","2020-04-06 20:40:24");
INSERT INTO payments VALUES("268","spr-20200406-074201","1","","207","","1","144","","56","Cash","","2020-04-06 20:42:01","2020-04-06 20:42:01");
INSERT INTO payments VALUES("269","spr-20200506-105950","1","","208","","1","1540","","460","Cash","","2020-05-06 23:59:50","2020-05-06 23:59:50");
INSERT INTO payments VALUES("270","spr-20200609-124248","1","","209","","1","1220","","780","Cash","","2020-06-09 13:42:48","2020-06-09 13:42:48");
INSERT INTO payments VALUES("273","spr-20200703-063914","1","","212","","1","2585","","415","Cash","","2020-07-03 19:39:14","2020-07-03 19:39:14");
INSERT INTO payments VALUES("274","spr-20200712-095153","1","","213","","1","13","","37","Cash","","2020-07-12 22:51:53","2020-07-12 22:51:53");
INSERT INTO payments VALUES("276","spr-20200727-083808","1","","217","","1","385","","0","Cash","","2020-07-27 21:38:08","2020-07-27 21:38:08");
INSERT INTO payments VALUES("277","spr-20200727-084024","1","","218","","1","385","","0","Cash","","2020-07-27 21:40:24","2020-07-27 21:40:24");
INSERT INTO payments VALUES("278","spr-20200727-084645","1","","219","","1","385","","0","Cash","","2020-07-27 21:46:45","2020-07-27 21:46:45");
INSERT INTO payments VALUES("279","spr-20200812-062806","1","","220","","1","760","","240","Cash","","2020-08-12 19:28:06","2020-08-12 19:28:06");
INSERT INTO payments VALUES("280","ppr-20200812-062853","1","62","","","1","1650","","0","Cash","","2020-08-12 19:28:53","2020-08-12 19:28:53");
INSERT INTO payments VALUES("281","spr-20200812-063035","1","","221","","1","1100","","0","Cash","","2020-08-12 19:30:35","2020-08-12 19:30:35");
INSERT INTO payments VALUES("282","spr-20200816-100426","1","","222","","1","23000","","2000","Cash","","2020-08-16 23:04:26","2020-08-16 23:04:26");
INSERT INTO payments VALUES("283","spr-20200816-100523","1","","223","","1","300","","200","Cash","","2020-08-16 23:05:23","2020-08-16 23:05:23");
INSERT INTO payments VALUES("284","spr-20200816-100632","1","","223","","1","100","","0","Cash","","2020-08-16 23:06:32","2020-08-16 23:06:32");
INSERT INTO payments VALUES("285","spr-20200816-100735","1","","223","","1","40","","0","Cash","","2020-08-16 23:07:35","2020-08-16 23:07:35");
INSERT INTO payments VALUES("290","spr-20201017-092854","9","","230","2","1","200","","0","Cash","","2020-10-17 22:28:54","2020-10-18 11:48:54");
INSERT INTO payments VALUES("291","spr-20201018-105138","9","","230","2","1","50","","0","Cash","","2020-10-18 11:51:38","2020-10-18 11:51:38");
INSERT INTO payments VALUES("292","spr-20201018-111333","9","","231","2","1","100","","0","Cash","","2020-10-18 12:13:33","2020-10-18 12:13:33");
INSERT INTO payments VALUES("293","spr-20201018-111426","9","","231","2","1","50","","0","Gift Card","","2020-10-18 12:14:26","2020-10-18 12:14:26");
INSERT INTO payments VALUES("294","spr-20201018-111651","9","","231","2","1","50","","0","Credit Card","","2020-10-18 12:16:51","2020-10-18 12:16:51");
INSERT INTO payments VALUES("295","spr-20201018-111724","9","","231","2","1","50","","0","Cheque","","2020-10-18 12:17:24","2020-10-18 12:17:24");
INSERT INTO payments VALUES("296","spr-20201022-013018","9","","232","2","1","100","","0","Cash","","2020-10-22 14:30:18","2020-10-22 14:30:18");
INSERT INTO payments VALUES("297","spr-20201022-015606","1","","233","3","1","250","","0","Cash","","2020-10-22 14:56:06","2020-10-22 14:56:06");
INSERT INTO payments VALUES("298","spr-20201024-070508","1","","234","4","1","11500","","0","Cash","","2020-10-24 08:05:08","2020-10-24 08:05:08");
INSERT INTO payments VALUES("299","spr-20201024-070753","1","","235","4","1","250","","0","Cash","","2020-10-24 08:07:53","2020-10-24 08:07:53");
INSERT INTO payments VALUES("300","spr-20201024-034619","1","","237","4","1","61900","","0","Cash","","2020-10-24 16:46:19","2020-10-24 16:46:19");
INSERT INTO payments VALUES("302","spr-20201027-054004","1","","239","3","1","2","","0","Cash","","2020-10-27 06:40:04","2020-10-27 06:40:04");
INSERT INTO payments VALUES("303","spr-20201027-054207","1","","240","3","1","6","","0","Cash","","2020-10-27 06:42:07","2020-10-27 06:42:07");
INSERT INTO payments VALUES("304","spr-20201027-063202","1","","241","4","1","250","","0","Cash","","2020-10-27 07:32:02","2020-10-27 07:32:02");
INSERT INTO payments VALUES("305","spr-20201029-073033","1","","242","4","1","250","","0","Cash","","2020-10-29 08:30:33","2020-10-29 08:30:33");
INSERT INTO payments VALUES("306","spr-20201101-072115","1","","243","4","1","250","","0","Cash","","2020-11-01 08:21:15","2020-11-01 08:21:15");
INSERT INTO payments VALUES("307","spr-20201101-074225","1","","245","3","1","1130","","0","Cash","","2020-11-01 08:42:25","2020-11-01 08:42:25");
INSERT INTO payments VALUES("308","spr-20201101-075019","1","","246","4","1","440","","0","Cash","","2020-11-01 08:50:19","2020-11-01 08:50:19");
INSERT INTO payments VALUES("310","spr-20201106-013042","1","","250","4","1","378.4","","0","Cash","","2020-11-06 14:30:42","2020-11-06 14:30:42");
INSERT INTO payments VALUES("311","spr-20201109-011527","1","","251","4","1","500","","0","Cash","","2020-11-09 14:15:27","2020-11-09 14:15:27");
INSERT INTO payments VALUES("312","spr-20201111-055902","1","","252","3","1","229.5","","0","Cash","","2020-11-11 06:59:02","2020-11-11 06:59:02");
INSERT INTO payments VALUES("313","spr-20201114-064739","1","","253","4","1","10242.5","","0","Cash","","2020-11-14 07:47:39","2020-11-14 07:47:39");
INSERT INTO payments VALUES("316","spr-20201117-064751","1","","256","4","1","715","","0","Cash","","2020-11-17 07:47:51","2020-11-17 07:47:51");
INSERT INTO payments VALUES("317","spr-20201117-070920","1","","257","4","1","250","","0","Cash","","2020-11-17 08:09:20","2020-11-17 08:09:20");
INSERT INTO payments VALUES("320","ppr-20201118-062036","1","90","","","1","33000","","0","Cash","","2020-11-18 07:20:36","2020-11-18 07:20:36");
INSERT INTO payments VALUES("321","spr-20201118-065242","1","","258","4","1","27200","","0","Cash","","2020-11-18 07:52:42","2020-11-18 07:52:42");
INSERT INTO payments VALUES("324","spr-20201208-094000","1","","263","4","1","300","","200","Cash","","2020-12-08 10:40:00","2020-12-08 10:40:00");
INSERT INTO payments VALUES("325","spr-20210106-022350","1","","263","4","1","50","","0","Cash","","2021-01-06 15:23:50","2021-01-06 15:23:50");
INSERT INTO payments VALUES("330","spr-20210111-021625","1","","271","3","1","1274","","0","Cash","","2021-01-11 15:16:25","2021-01-11 15:16:25");
INSERT INTO payments VALUES("332","spr-20210113-070243","1","","274","4","1","1556","","0","Cash","","2021-01-13 08:02:43","2021-01-13 08:02:43");
INSERT INTO payments VALUES("333","spr-20210201-023748","1","","275","4","1","484","","0","Cash","","2021-02-01 15:37:48","2021-02-01 15:37:48");
INSERT INTO payments VALUES("335","spr-20210216-070948","1","","277","4","1","15156","","0","Cash","","2021-02-16 08:09:48","2021-02-16 08:09:48");
INSERT INTO payments VALUES("336","spr-20210217-073238","1","","278","4","1","26949.9","","0","Cash","","2021-02-17 08:32:38","2021-02-17 08:32:38");
INSERT INTO payments VALUES("338","spr-20210524-074506","1","","290","3","1","250","","0","Cash","","2021-05-24 20:45:06","2021-05-24 20:45:06");
INSERT INTO payments VALUES("339","spr-20210524-074647","1","","290","3","1","-130","","0","Cash","","2021-05-24 20:46:47","2021-05-24 20:46:47");
INSERT INTO payments VALUES("341","spr-20210601-123530","1","","294","4","1","440","","0","Cash","","2021-06-01 13:35:30","2021-06-01 13:35:30");
INSERT INTO payments VALUES("342","spr-20210601-032209","1","","295","3","1","2","","0","Cash","","2021-06-01 16:22:09","2021-06-01 16:22:09");
INSERT INTO payments VALUES("343","spr-20210601-034624","1","","296","3","1","2","","0","Cash","","2021-06-01 16:46:24","2021-06-01 16:46:24");
INSERT INTO payments VALUES("344","spr-20210601-074150","9","","297","2","1","250","","0","Cash","","2021-06-01 20:41:50","2021-06-01 20:41:50");
INSERT INTO payments VALUES("345","spr-20210601-075547","9","","298","2","1","2","","0","Cash","","2021-06-01 20:55:47","2021-06-01 20:55:47");
INSERT INTO payments VALUES("346","spr-20210616-105325","1","","299","4","1","1100","","0","Cash","","2021-06-16 11:53:25","2021-06-16 11:53:25");
INSERT INTO payments VALUES("347","spr-20210616-111044","1","","300","4","1","440","","0","Cash","","2021-06-16 12:10:44","2021-06-16 12:10:44");
INSERT INTO payments VALUES("348","spr-20210616-111120","1","","301","4","1","2200","","0","Cash","","2021-06-16 12:11:20","2021-06-16 12:11:20");
INSERT INTO payments VALUES("349","spr-20210616-080543","1","","303","4","1","440","2","0","Points","","2021-06-16 21:05:43","2021-06-16 21:05:43");
INSERT INTO payments VALUES("351","spr-20210616-082851","1","","305","4","1","440","","0","Cash","","2021-06-16 21:28:51","2021-06-16 21:28:51");
INSERT INTO payments VALUES("352","spr-20210617-115553","1","","306","3","1","1100","4","0","Points","","2021-06-17 12:55:53","2021-06-17 12:55:53");
INSERT INTO payments VALUES("353","spr-20210617-121359","1","","304","4","1","440","2","0","Points","","2021-06-17 13:13:59","2021-06-17 13:13:59");
INSERT INTO payments VALUES("354","spr-20210617-030013","1","","307","3","1","100","","0","Cash","","2021-06-17 16:00:13","2021-06-17 16:00:13");
INSERT INTO payments VALUES("355","ppr-20210618-082857","1","115","","","1","101","","0","Cash","","2021-06-18 21:28:57","2021-06-18 21:28:57");
INSERT INTO payments VALUES("356","spr-20210618-083127","1","","308","4","1","1608","","392","Cash","","2021-06-18 21:31:27","2021-06-18 21:31:27");
INSERT INTO payments VALUES("357","spr-20210618-083254","1","","309","3","1","2","","0","Cash","","2021-06-18 21:32:54","2021-06-18 21:32:54");
INSERT INTO payments VALUES("358","ppr-20210619-104903","1","116","","","1","101","","0","Cash","","2021-06-19 11:49:03","2021-06-19 11:49:03");
INSERT INTO payments VALUES("359","spr-20210619-105121","1","","310","4","1","958","","42","Cash","","2021-06-19 11:51:21","2021-06-19 11:51:21");
INSERT INTO payments VALUES("360","spr-20210619-110231","1","","312","4","1","440","2","0","Points","","2021-06-19 12:02:31","2021-06-19 12:02:31");
INSERT INTO payments VALUES("361","spr-20210619-110638","1","","313","4","1","250","1","0","Points","","2021-06-19 12:06:38","2021-06-19 12:06:38");
INSERT INTO payments VALUES("362","spr-20210627-124247","1","","314","4","1","1100","","0","Cash","","2021-06-27 13:42:47","2021-06-27 13:42:47");
INSERT INTO payments VALUES("364","spr-20210707-103455","1","","317","4","1","18","","0","Cash","","2021-07-07 11:34:55","2021-07-07 11:34:55");
INSERT INTO payments VALUES("367","spr-20210814-092805","1","","325","4","1","1250","","0","Cash","","2021-08-14 22:28:05","2021-08-14 22:28:05");
INSERT INTO payments VALUES("371","spr-20210921-010722","1","","333","4","1","2","","0","Cash","","2021-09-21 14:07:22","2021-09-21 14:07:22");
INSERT INTO payments VALUES("372","spr-20210921-035020","1","","334","4","1","120","","0","Cash","","2021-09-21 16:50:20","2021-09-21 16:50:20");
INSERT INTO payments VALUES("373","spr-20210923-024704","1","","335","4","1","11","","0","Cash","","2021-09-23 15:47:04","2021-09-23 15:47:04");
INSERT INTO payments VALUES("374","spr-20211003-051829","1","","336","4","1","1220","","0","Cash","","2021-10-03 18:18:29","2021-10-03 18:18:29");
INSERT INTO payments VALUES("376","spr-20211003-054404","1","","338","4","1","1100","","0","Cash","","2021-10-03 18:44:04","2021-10-03 18:44:04");
INSERT INTO payments VALUES("378","spr-20211007-025229","1","","340","4","1","1100","","0","Cash","","2021-10-07 15:52:29","2021-10-07 15:52:29");
INSERT INTO payments VALUES("379","spr-20211007-033840","1","","341","4","1","1100","","0","Cash","","2021-10-07 16:38:40","2021-10-07 16:38:40");
INSERT INTO payments VALUES("384","spr-20211014-035825","1","","348","4","1","1100","","0","Cash","","2021-10-14 16:58:25","2021-10-14 16:58:25");
INSERT INTO payments VALUES("385","spr-20211020-011209","1","","349","4","1","102","","0","Cash","","2021-10-20 14:12:09","2021-10-20 14:12:09");
INSERT INTO payments VALUES("386","spr-20211114-013929","1","","353","4","1","374","","0","Cash","","2021-11-14 14:39:29","2021-11-14 14:39:29");
INSERT INTO payments VALUES("387","spr-20211124-062858","1","","355","4","1","3161","","0","Cash","","2021-11-24 19:28:58","2021-11-24 19:28:58");
INSERT INTO payments VALUES("388","spr-20211207-070932","1","","356","4","1","573","","0","Cash","","2021-12-07 20:09:32","2021-12-07 20:09:32");



CREATE TABLE `payrolls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payrolls VALUES("8","payroll-20190101-055231","1","1","1","100","0","","2019-01-01 06:52:31","2019-01-01 06:52:31");
INSERT INTO payrolls VALUES("9","payroll-20191204-113802","1","1","1","10000","0","","2019-12-05 00:38:02","2019-12-05 00:38:02");
INSERT INTO payrolls VALUES("10","payroll-20210619-123706","1","1","1","200","0","","2021-06-19 13:37:06","2021-06-19 13:37:06");



CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES("4","products-edit","web","2018-06-03 08:00:09","2018-06-03 08:00:09");
INSERT INTO permissions VALUES("5","products-delete","web","2018-06-04 05:54:22","2018-06-04 05:54:22");
INSERT INTO permissions VALUES("6","products-add","web","2018-06-04 07:34:14","2018-06-04 07:34:14");
INSERT INTO permissions VALUES("7","products-index","web","2018-06-04 10:34:27","2018-06-04 10:34:27");
INSERT INTO permissions VALUES("8","purchases-index","web","2018-06-04 15:03:19","2018-06-04 15:03:19");
INSERT INTO permissions VALUES("9","purchases-add","web","2018-06-04 15:12:25","2018-06-04 15:12:25");
INSERT INTO permissions VALUES("10","purchases-edit","web","2018-06-04 16:47:36","2018-06-04 16:47:36");
INSERT INTO permissions VALUES("11","purchases-delete","web","2018-06-04 16:47:36","2018-06-04 16:47:36");
INSERT INTO permissions VALUES("12","sales-index","web","2018-06-04 17:49:08","2018-06-04 17:49:08");
INSERT INTO permissions VALUES("13","sales-add","web","2018-06-04 17:49:52","2018-06-04 17:49:52");
INSERT INTO permissions VALUES("14","sales-edit","web","2018-06-04 17:49:52","2018-06-04 17:49:52");
INSERT INTO permissions VALUES("15","sales-delete","web","2018-06-04 17:49:53","2018-06-04 17:49:53");
INSERT INTO permissions VALUES("16","quotes-index","web","2018-06-05 05:05:10","2018-06-05 05:05:10");
INSERT INTO permissions VALUES("17","quotes-add","web","2018-06-05 05:05:10","2018-06-05 05:05:10");
INSERT INTO permissions VALUES("18","quotes-edit","web","2018-06-05 05:05:10","2018-06-05 05:05:10");
INSERT INTO permissions VALUES("19","quotes-delete","web","2018-06-05 05:05:10","2018-06-05 05:05:10");
INSERT INTO permissions VALUES("20","transfers-index","web","2018-06-05 05:30:03","2018-06-05 05:30:03");
INSERT INTO permissions VALUES("21","transfers-add","web","2018-06-05 05:30:03","2018-06-05 05:30:03");
INSERT INTO permissions VALUES("22","transfers-edit","web","2018-06-05 05:30:03","2018-06-05 05:30:03");
INSERT INTO permissions VALUES("23","transfers-delete","web","2018-06-05 05:30:03","2018-06-05 05:30:03");
INSERT INTO permissions VALUES("24","returns-index","web","2018-06-05 05:50:24","2018-06-05 05:50:24");
INSERT INTO permissions VALUES("25","returns-add","web","2018-06-05 05:50:24","2018-06-05 05:50:24");
INSERT INTO permissions VALUES("26","returns-edit","web","2018-06-05 05:50:25","2018-06-05 05:50:25");
INSERT INTO permissions VALUES("27","returns-delete","web","2018-06-05 05:50:25","2018-06-05 05:50:25");
INSERT INTO permissions VALUES("28","customers-index","web","2018-06-05 06:15:54","2018-06-05 06:15:54");
INSERT INTO permissions VALUES("29","customers-add","web","2018-06-05 06:15:55","2018-06-05 06:15:55");
INSERT INTO permissions VALUES("30","customers-edit","web","2018-06-05 06:15:55","2018-06-05 06:15:55");
INSERT INTO permissions VALUES("31","customers-delete","web","2018-06-05 06:15:55","2018-06-05 06:15:55");
INSERT INTO permissions VALUES("32","suppliers-index","web","2018-06-05 06:40:12","2018-06-05 06:40:12");
INSERT INTO permissions VALUES("33","suppliers-add","web","2018-06-05 06:40:12","2018-06-05 06:40:12");
INSERT INTO permissions VALUES("34","suppliers-edit","web","2018-06-05 06:40:12","2018-06-05 06:40:12");
INSERT INTO permissions VALUES("35","suppliers-delete","web","2018-06-05 06:40:12","2018-06-05 06:40:12");
INSERT INTO permissions VALUES("36","product-report","web","2018-06-25 06:05:33","2018-06-25 06:05:33");
INSERT INTO permissions VALUES("37","purchase-report","web","2018-06-25 06:24:56","2018-06-25 06:24:56");
INSERT INTO permissions VALUES("38","sale-report","web","2018-06-25 06:33:13","2018-06-25 06:33:13");
INSERT INTO permissions VALUES("39","customer-report","web","2018-06-25 06:36:51","2018-06-25 06:36:51");
INSERT INTO permissions VALUES("40","due-report","web","2018-06-25 06:39:52","2018-06-25 06:39:52");
INSERT INTO permissions VALUES("41","users-index","web","2018-06-25 07:00:10","2018-06-25 07:00:10");
INSERT INTO permissions VALUES("42","users-add","web","2018-06-25 07:00:10","2018-06-25 07:00:10");
INSERT INTO permissions VALUES("43","users-edit","web","2018-06-25 07:01:30","2018-06-25 07:01:30");
INSERT INTO permissions VALUES("44","users-delete","web","2018-06-25 07:01:30","2018-06-25 07:01:30");
INSERT INTO permissions VALUES("45","profit-loss","web","2018-07-15 04:50:05","2018-07-15 04:50:05");
INSERT INTO permissions VALUES("46","best-seller","web","2018-07-15 05:01:38","2018-07-15 05:01:38");
INSERT INTO permissions VALUES("47","daily-sale","web","2018-07-15 05:24:21","2018-07-15 05:24:21");
INSERT INTO permissions VALUES("48","monthly-sale","web","2018-07-15 05:30:41","2018-07-15 05:30:41");
INSERT INTO permissions VALUES("49","daily-purchase","web","2018-07-15 05:36:46","2018-07-15 05:36:46");
INSERT INTO permissions VALUES("50","monthly-purchase","web","2018-07-15 05:48:17","2018-07-15 05:48:17");
INSERT INTO permissions VALUES("51","payment-report","web","2018-07-15 06:10:41","2018-07-15 06:10:41");
INSERT INTO permissions VALUES("52","warehouse-stock-report","web","2018-07-15 06:16:55","2018-07-15 06:16:55");
INSERT INTO permissions VALUES("53","product-qty-alert","web","2018-07-15 06:33:21","2018-07-15 06:33:21");
INSERT INTO permissions VALUES("54","supplier-report","web","2018-07-30 10:00:01","2018-07-30 10:00:01");
INSERT INTO permissions VALUES("55","expenses-index","web","2018-09-05 08:07:10","2018-09-05 08:07:10");
INSERT INTO permissions VALUES("56","expenses-add","web","2018-09-05 08:07:10","2018-09-05 08:07:10");
INSERT INTO permissions VALUES("57","expenses-edit","web","2018-09-05 08:07:10","2018-09-05 08:07:10");
INSERT INTO permissions VALUES("58","expenses-delete","web","2018-09-05 08:07:11","2018-09-05 08:07:11");
INSERT INTO permissions VALUES("59","general_setting","web","2018-10-20 06:10:04","2018-10-20 06:10:04");
INSERT INTO permissions VALUES("60","mail_setting","web","2018-10-20 06:10:04","2018-10-20 06:10:04");
INSERT INTO permissions VALUES("61","pos_setting","web","2018-10-20 06:10:04","2018-10-20 06:10:04");
INSERT INTO permissions VALUES("62","hrm_setting","web","2019-01-02 17:30:23","2019-01-02 17:30:23");
INSERT INTO permissions VALUES("63","purchase-return-index","web","2019-01-03 04:45:14","2019-01-03 04:45:14");
INSERT INTO permissions VALUES("64","purchase-return-add","web","2019-01-03 04:45:14","2019-01-03 04:45:14");
INSERT INTO permissions VALUES("65","purchase-return-edit","web","2019-01-03 04:45:14","2019-01-03 04:45:14");
INSERT INTO permissions VALUES("66","purchase-return-delete","web","2019-01-03 04:45:14","2019-01-03 04:45:14");
INSERT INTO permissions VALUES("67","account-index","web","2019-01-03 05:06:13","2019-01-03 05:06:13");
INSERT INTO permissions VALUES("68","balance-sheet","web","2019-01-03 05:06:14","2019-01-03 05:06:14");
INSERT INTO permissions VALUES("69","account-statement","web","2019-01-03 05:06:14","2019-01-03 05:06:14");
INSERT INTO permissions VALUES("70","department","web","2019-01-03 05:30:01","2019-01-03 05:30:01");
INSERT INTO permissions VALUES("71","attendance","web","2019-01-03 05:30:01","2019-01-03 05:30:01");
INSERT INTO permissions VALUES("72","payroll","web","2019-01-03 05:30:01","2019-01-03 05:30:01");
INSERT INTO permissions VALUES("73","employees-index","web","2019-01-03 05:52:19","2019-01-03 05:52:19");
INSERT INTO permissions VALUES("74","employees-add","web","2019-01-03 05:52:19","2019-01-03 05:52:19");
INSERT INTO permissions VALUES("75","employees-edit","web","2019-01-03 05:52:19","2019-01-03 05:52:19");
INSERT INTO permissions VALUES("76","employees-delete","web","2019-01-03 05:52:19","2019-01-03 05:52:19");
INSERT INTO permissions VALUES("77","user-report","web","2019-01-16 13:48:18","2019-01-16 13:48:18");
INSERT INTO permissions VALUES("78","stock_count","web","2019-02-17 17:32:01","2019-02-17 17:32:01");
INSERT INTO permissions VALUES("79","adjustment","web","2019-02-17 17:32:02","2019-02-17 17:32:02");
INSERT INTO permissions VALUES("80","sms_setting","web","2019-02-22 12:18:03","2019-02-22 12:18:03");
INSERT INTO permissions VALUES("81","create_sms","web","2019-02-22 12:18:03","2019-02-22 12:18:03");
INSERT INTO permissions VALUES("82","print_barcode","web","2019-03-07 12:02:19","2019-03-07 12:02:19");
INSERT INTO permissions VALUES("83","empty_database","web","2019-03-07 12:02:19","2019-03-07 12:02:19");
INSERT INTO permissions VALUES("84","customer_group","web","2019-03-07 12:37:15","2019-03-07 12:37:15");
INSERT INTO permissions VALUES("85","unit","web","2019-03-07 12:37:15","2019-03-07 12:37:15");
INSERT INTO permissions VALUES("86","tax","web","2019-03-07 12:37:15","2019-03-07 12:37:15");
INSERT INTO permissions VALUES("87","gift_card","web","2019-03-07 13:29:38","2019-03-07 13:29:38");
INSERT INTO permissions VALUES("88","coupon","web","2019-03-07 13:29:38","2019-03-07 13:29:38");
INSERT INTO permissions VALUES("89","holiday","web","2019-10-19 15:57:15","2019-10-19 15:57:15");
INSERT INTO permissions VALUES("90","warehouse-report","web","2019-10-22 13:00:23","2019-10-22 13:00:23");
INSERT INTO permissions VALUES("91","warehouse","web","2020-02-26 13:47:32","2020-02-26 13:47:32");
INSERT INTO permissions VALUES("92","brand","web","2020-02-26 13:59:59","2020-02-26 13:59:59");
INSERT INTO permissions VALUES("93","billers-index","web","2020-02-26 14:11:15","2020-02-26 14:11:15");
INSERT INTO permissions VALUES("94","billers-add","web","2020-02-26 14:11:15","2020-02-26 14:11:15");
INSERT INTO permissions VALUES("95","billers-edit","web","2020-02-26 14:11:15","2020-02-26 14:11:15");
INSERT INTO permissions VALUES("96","billers-delete","web","2020-02-26 14:11:15","2020-02-26 14:11:15");
INSERT INTO permissions VALUES("97","money-transfer","web","2020-03-02 12:41:48","2020-03-02 12:41:48");
INSERT INTO permissions VALUES("98","category","web","2020-07-13 19:13:16","2020-07-13 19:13:16");
INSERT INTO permissions VALUES("99","delivery","web","2020-07-13 19:13:16","2020-07-13 19:13:16");
INSERT INTO permissions VALUES("100","send_notification","web","2020-10-31 13:21:31","2020-10-31 13:21:31");
INSERT INTO permissions VALUES("101","today_sale","web","2020-10-31 13:57:04","2020-10-31 13:57:04");
INSERT INTO permissions VALUES("102","today_profit","web","2020-10-31 13:57:04","2020-10-31 13:57:04");
INSERT INTO permissions VALUES("103","currency","web","2020-11-09 07:23:11","2020-11-09 07:23:11");
INSERT INTO permissions VALUES("104","backup_database","web","2020-11-15 07:16:55","2020-11-15 07:16:55");
INSERT INTO permissions VALUES("105","reward_point_setting","web","2021-06-27 11:34:42","2021-06-27 11:34:42");



CREATE TABLE `pos_setting` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `product_number` int(11) NOT NULL,
  `keybord_active` tinyint(1) NOT NULL,
  `stripe_public_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `pos_setting_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO pos_setting VALUES("1","11","2","1","4","0","pk_test_ITN7KOYiIsHSCQ0UMRcgaYUB","sk_test_TtQQaawhEYRwa3mU9CzttrEy","2018-09-02 10:17:04","2020-04-17 20:59:54");



CREATE TABLE `product_adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_adjustments VALUES("15","11","109","","8","+","2022-02-02 15:23:25","2022-02-02 15:38:58");



CREATE TABLE `product_batches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `batch_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_date` date NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_batches VALUES("1","71","1001","2023-05-31","16","2021-03-07 15:14:05","2021-12-07 20:41:55");
INSERT INTO product_batches VALUES("2","71","1002","2023-05-31","6","2021-03-07 15:55:06","2021-06-18 21:32:54");
INSERT INTO product_batches VALUES("3","71","1003","2023-09-30","2","2021-03-09 16:42:13","2021-09-21 16:49:37");
INSERT INTO product_batches VALUES("4","22","10001","2021-11-30","1","2021-10-20 14:47:09","2021-10-20 14:47:09");



CREATE TABLE `product_purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_purchases VALUES("368","133","82","","","","20","20","7","90","0","0","0","1800","2022-01-31 04:31:00","2022-01-31 04:31:00");
INSERT INTO product_purchases VALUES("369","133","81","","","","10","10","7","110","0","0","0","1100","2022-01-31 04:31:00","2022-01-31 04:31:00");
INSERT INTO product_purchases VALUES("373","142","108","","","","3","3","7","100","0","0","0","300","2022-02-02 10:28:27","2022-02-02 10:28:27");
INSERT INTO product_purchases VALUES("374","142","109","","","","4","4","7","100","0","0","0","400","2022-02-02 10:28:27","2022-02-02 10:28:27");
INSERT INTO product_purchases VALUES("375","143","103","","","","100","100","7","100","0","0","0","10000","2022-02-06 21:28:58","2022-02-06 21:28:58");
INSERT INTO product_purchases VALUES("376","143","109","","","","100","100","7","100","0","0","0","10000","2022-02-06 21:28:59","2022-02-06 21:28:59");



CREATE TABLE `product_quotation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_quotation VALUES("2","1","1","","","1","2","5030","10","15","754.5","5784.5","2018-08-09 06:52:50","2018-08-28 07:09:57");
INSERT INTO product_quotation VALUES("3","1","4","","","50","1","1.5","25","10","7.5","82.5","2018-08-09 06:53:25","2018-08-28 07:34:36");
INSERT INTO product_quotation VALUES("4","1","2","","","6","1","9.55","0","10","5.73","63","2018-08-28 08:03:48","2018-08-28 08:07:07");
INSERT INTO product_quotation VALUES("5","2","10","","","2.5","7","22","0","0","0","55","2018-09-04 05:02:58","2018-09-20 17:37:41");
INSERT INTO product_quotation VALUES("6","2","13","","","1","0","21","0","0","0","21","2018-09-04 05:02:58","2018-09-04 05:02:58");
INSERT INTO product_quotation VALUES("7","3","1","","","1","1","400","0","10","40","440","2018-10-23 07:12:49","2019-12-21 13:41:37");
INSERT INTO product_quotation VALUES("19","3","48","","2","1","1","13","0","0","0","13","2019-12-07 15:50:02","2019-12-21 13:41:37");
INSERT INTO product_quotation VALUES("27","11","61","","","2","1","10000","0","15","3000","23000","2020-10-24 10:08:14","2020-10-24 10:28:35");
INSERT INTO product_quotation VALUES("28","12","3","","","10","1","250","0","0","0","2500","2020-12-10 06:34:01","2020-12-10 06:34:01");
INSERT INTO product_quotation VALUES("29","12","22","","","5","1","1200","0","10","600","6600","2020-12-10 06:34:01","2020-12-10 06:34:01");
INSERT INTO product_quotation VALUES("30","13","2","","","10","1","10.43","0","15","15.65","120","2021-01-12 13:58:03","2021-01-12 13:59:15");
INSERT INTO product_quotation VALUES("32","13","1","","","1","1","400","0","10","40","440","2021-01-12 13:58:03","2021-01-12 13:59:15");
INSERT INTO product_quotation VALUES("33","13","22","","","1","1","1000","0","10","100","1100","2021-01-12 13:59:15","2021-01-12 13:59:15");
INSERT INTO product_quotation VALUES("37","15","71","1","","1","1","2","0","0","0","2","2021-05-29 11:53:56","2021-05-30 15:04:07");
INSERT INTO product_quotation VALUES("38","15","1","","","1","1","400","0","10","40","440","2021-05-29 11:53:56","2021-05-30 15:04:07");



CREATE TABLE `product_returns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_returns VALUES("3","2","4","","","","20","1","2","0","0","0","40","","");
INSERT INTO product_returns VALUES("4","3","10","","","","2","7","22","0","0","0","44","","2018-10-07 09:19:40");
INSERT INTO product_returns VALUES("6","5","3","","","","1","1","250","0","0","0","250","","2018-12-26 05:16:08");
INSERT INTO product_returns VALUES("12","6","1","","","","1","1","400","0","10","40","440","","");
INSERT INTO product_returns VALUES("23","11","13","","","","1","0","21","0","0","0","21","2019-12-24 12:20:29","2019-12-24 12:20:29");
INSERT INTO product_returns VALUES("26","13","61","","","","1","1","10000","0","15","1500","11500","2020-08-16 23:25:02","2020-08-16 23:25:02");
INSERT INTO product_returns VALUES("27","14","1","","","","1","1","400","0","10","40","440","2020-10-13 18:39:54","2020-10-13 18:39:54");
INSERT INTO product_returns VALUES("31","18","61","","","","1","1","10000","0","15","1500","11500","2020-11-18 08:02:18","2020-11-18 08:02:18");
INSERT INTO product_returns VALUES("32","19","3","","","","1","1","250","0","0","0","250","2020-12-10 07:40:25","2020-12-10 07:40:25");
INSERT INTO product_returns VALUES("43","25","71","1","","","1","1","2","0","0","0","2","2021-05-24 20:39:50","2021-05-24 20:39:50");



CREATE TABLE `product_sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=589 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_sales VALUES("584","360","82","","","","5","7","120","0","0","0","600","2022-01-31 03:47:36","2022-01-31 03:47:36");
INSERT INTO product_sales VALUES("586","362","82","","","","6","7","120","0","0","0","720","2022-02-04 09:39:32","2022-02-04 09:39:32");
INSERT INTO product_sales VALUES("587","363","103","","","","20","7","120","0","0","0","2400","2022-02-06 21:46:51","2022-02-06 21:46:51");
INSERT INTO product_sales VALUES("588","363","109","","","","10","7","100","0","0","0","1000","2022-02-06 21:46:51","2022-02-06 21:46:51");



CREATE TABLE `product_transfer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_transfer VALUES("1","1","4","","","","100","1","1","0","0","100","2018-08-08 18:17:10","2018-12-25 05:16:55");
INSERT INTO product_transfer VALUES("7","6","48","","3","","1","1","2","0","0","2","2019-12-05 20:55:04","2019-12-05 21:09:42");
INSERT INTO product_transfer VALUES("11","8","5","","","","10","1","100","0","0","1000","2020-01-22 13:30:59","2020-01-22 13:30:59");
INSERT INTO product_transfer VALUES("13","10","1","","","","1","1","320","10","32","352","2020-10-08 14:27:35","2020-10-08 14:29:35");
INSERT INTO product_transfer VALUES("14","11","62","","12","","1","1","1","0","0","1","2020-10-18 19:17:08","2020-10-18 19:17:08");
INSERT INTO product_transfer VALUES("15","12","61","","","","10","1","3000","15","4500","34500","2020-10-24 10:01:46","2020-10-24 10:01:46");



CREATE TABLE `product_variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `item_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_variants VALUES("3","48","3","1","S-93475396","","12","2019-11-21 14:03:04","2021-07-15 19:25:45");
INSERT INTO product_variants VALUES("5","48","5","3","L-93475396","50","11","2019-11-24 13:07:20","2021-12-07 20:01:11");
INSERT INTO product_variants VALUES("6","48","2","2","M-93475396","10","10","2019-11-24 14:17:07","2022-01-20 08:58:54");
INSERT INTO product_variants VALUES("10","60","9","1","a-32081679","","1","2020-05-18 23:44:14","2020-10-27 06:42:06");
INSERT INTO product_variants VALUES("11","60","11","2","b-32081679","","0","2020-05-18 23:58:31","2020-05-18 23:58:31");
INSERT INTO product_variants VALUES("12","62","12","1","variant 1-81145830","","3","2020-09-27 13:08:27","2021-02-11 08:28:16");
INSERT INTO product_variants VALUES("13","62","13","2","variant 2-81145830","","0","2020-09-27 13:08:27","2020-09-27 13:08:27");



CREATE TABLE `product_warehouse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_warehouse VALUES("10","1","","","","1","133.5","","2018-08-08 15:30:12","2021-11-29 14:29:18");
INSERT INTO product_warehouse VALUES("11","2","","","","1","1008","","2018-08-08 15:30:12","2022-01-20 10:03:28");
INSERT INTO product_warehouse VALUES("12","3","","","","1","102","","2018-08-08 15:30:13","2021-11-29 14:29:18");
INSERT INTO product_warehouse VALUES("13","5","","","","1","79","","2018-08-08 15:30:13","2021-12-07 20:01:11");
INSERT INTO product_warehouse VALUES("14","4","","","","1","171","","2018-08-08 16:16:09","2020-03-02 12:56:03");
INSERT INTO product_warehouse VALUES("15","4","","","","2","119","","2018-08-08 18:16:15","2021-07-15 19:25:45");
INSERT INTO product_warehouse VALUES("16","2","","","","2","1789","","2018-08-08 18:26:49","2021-07-15 19:25:45");
INSERT INTO product_warehouse VALUES("17","1","","","","2","42.5","","2018-08-08 18:33:33","2022-01-20 08:58:54");
INSERT INTO product_warehouse VALUES("18","3","","","","2","47","","2018-08-09 06:47:23","2021-12-07 20:14:25");
INSERT INTO product_warehouse VALUES("19","5","","","","2","52","","2018-08-09 06:48:36","2022-01-20 08:58:54");
INSERT INTO product_warehouse VALUES("20","10","","","","1","50","","2018-08-09 06:49:29","2019-12-04 12:49:14");
INSERT INTO product_warehouse VALUES("21","10","","","","2","60.5","","2018-08-09 06:49:55","2021-09-23 15:47:04");
INSERT INTO product_warehouse VALUES("22","22","","","7001,11101,11102,11103,","1","29","","2018-09-03 11:06:09","2021-12-07 20:01:11");
INSERT INTO product_warehouse VALUES("23","22","","","","2","13","","2018-09-03 11:07:14","2021-11-29 14:22:53");
INSERT INTO product_warehouse VALUES("24","24","","","","2","0","","2018-09-16 04:49:30","2018-09-16 04:50:49");
INSERT INTO product_warehouse VALUES("25","25","","","","1","14","","2018-10-23 08:14:21","2019-03-02 17:06:10");
INSERT INTO product_warehouse VALUES("26","25","","","","2","5","","2018-10-23 08:14:41","2021-12-07 20:14:26");
INSERT INTO product_warehouse VALUES("27","31","","","","1","14","","2018-12-05 06:34:30","2021-01-10 08:04:28");
INSERT INTO product_warehouse VALUES("28","30","","","","1","14","","2018-12-05 06:34:30","2020-10-22 14:30:14");
INSERT INTO product_warehouse VALUES("29","31","","","","2","11","","2018-12-05 06:35:08","2021-07-15 19:25:45");
INSERT INTO product_warehouse VALUES("30","30","","","","2","10","","2018-12-05 06:35:08","2021-07-15 19:25:45");
INSERT INTO product_warehouse VALUES("31","32","","","","1","10","","2018-12-19 06:57:16","2019-02-09 11:45:23");
INSERT INTO product_warehouse VALUES("32","32","","","","2","19","","2018-12-19 06:57:41","2021-07-15 19:25:45");
INSERT INTO product_warehouse VALUES("33","33","","","","1","16","","2018-12-24 07:38:40","2019-03-03 11:39:17");
INSERT INTO product_warehouse VALUES("34","33","","","","2","22","","2019-02-09 11:21:38","2021-07-15 19:25:45");
INSERT INTO product_warehouse VALUES("35","48","","3","","1","2","","2019-11-25 21:23:02","2021-02-11 08:26:56");
INSERT INTO product_warehouse VALUES("36","48","","2","","1","4","","2019-11-26 13:47:42","2021-10-03 14:06:21");
INSERT INTO product_warehouse VALUES("37","48","","3","","2","9","","2019-11-26 15:12:08","2021-07-15 19:25:45");
INSERT INTO product_warehouse VALUES("38","48","","2","","2","6","","2019-11-26 15:12:08","2022-01-20 08:58:54");
INSERT INTO product_warehouse VALUES("39","48","","5","","1","2","","2019-12-21 17:18:51","2021-12-07 20:01:11");
INSERT INTO product_warehouse VALUES("40","48","","5","","2","9","","2019-12-22 15:36:39","2021-07-15 19:25:45");
INSERT INTO product_warehouse VALUES("45","61","","","","2","8","","2020-08-16 23:02:07","2021-07-15 19:25:45");
INSERT INTO product_warehouse VALUES("46","62","","12","","1","2","","2020-09-27 13:55:33","2020-11-16 16:01:45");
INSERT INTO product_warehouse VALUES("47","62","","12","","2","1","","2020-10-18 19:17:08","2021-02-11 08:28:16");
INSERT INTO product_warehouse VALUES("48","61","","","","1","8","","2020-10-24 10:01:46","2020-11-29 06:21:30");
INSERT INTO product_warehouse VALUES("49","60","","9","","1","1","","2020-10-26 17:34:05","2020-10-27 06:42:06");
INSERT INTO product_warehouse VALUES("51","71","1","","","1","19","","2021-03-07 15:14:05","2021-06-19 11:48:22");
INSERT INTO product_warehouse VALUES("52","71","1","","","2","4","","2021-03-07 15:21:16","2021-12-07 20:41:55");
INSERT INTO product_warehouse VALUES("53","71","2","","","1","3","","2021-03-07 15:55:06","2021-06-18 21:32:54");
INSERT INTO product_warehouse VALUES("54","71","3","","","1","2","","2021-03-09 16:42:13","2021-09-21 16:49:37");
INSERT INTO product_warehouse VALUES("55","71","2","","","2","0","","2021-05-23 14:09:03","2021-05-26 14:38:06");
INSERT INTO product_warehouse VALUES("56","72","","","","1","5","","2021-07-06 14:10:42","2021-07-06 14:10:42");
INSERT INTO product_warehouse VALUES("57","72","","","","2","4","","2021-07-06 14:11:07","2021-07-15 19:25:45");
INSERT INTO product_warehouse VALUES("58","22","4","","","1","1","","2021-10-20 14:47:09","2021-10-20 14:47:09");
INSERT INTO product_warehouse VALUES("59","82","","","","1","9","","2022-01-31 03:40:46","2022-02-04 09:39:32");
INSERT INTO product_warehouse VALUES("60","81","","","","1","10","","2022-01-31 03:40:46","2022-01-31 04:31:00");
INSERT INTO product_warehouse VALUES("61","107","","","","1","0","","2022-02-01 10:55:45","2022-02-02 10:31:58");
INSERT INTO product_warehouse VALUES("62","108","","","","1","3","","2022-02-02 10:28:27","2022-02-02 10:28:27");
INSERT INTO product_warehouse VALUES("63","109","","","","1","12","","2022-02-02 10:28:27","2022-02-03 10:27:33");
INSERT INTO product_warehouse VALUES("64","103","","","","2","80","","2022-02-06 21:28:58","2022-02-06 21:46:51");
INSERT INTO product_warehouse VALUES("65","109","","","","2","90","","2022-02-06 21:28:58","2022-02-06 21:46:51");



CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_symbology` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `cost` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `promotion` tinyint(4) DEFAULT NULL,
  `promotion_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_date` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `tax_method` int(11) DEFAULT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_variant` tinyint(1) DEFAULT NULL,
  `is_batch` tinyint(1) DEFAULT NULL,
  `is_diffPrice` tinyint(1) DEFAULT NULL,
  `is_imei` tinyint(1) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `product_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO products VALUES("10","potato","212132","standard","C128","","9","7","7","7","10","22","110.5","","","","","","","1","potato.jpeg","","","1","","","","","","","","","0","2018-06-25 08:34:53","2022-01-30 16:19:05");
INSERT INTO products VALUES("14","ni","40237871","standard","C128","","9","8","8","8","55","56","0","","","","","","","1","","","","1","","","","","","","","","0","2018-08-01 05:36:51","2018-08-01 05:41:48");
INSERT INTO products VALUES("24","chocolate","84802317","standard","C128","","9","1","1","1","1","2","0","","","","","","","1","","","","","","","1","","","","","","0","2018-09-16 04:42:01","2018-09-16 05:10:43");
INSERT INTO products VALUES("27","mixed fruit juice","24805187","combo","C128","","9","0","0","0","0","16","0","","","","","","","1","zummXD2dvAtI.png","","","","","","","4,2","","3,1","2,10","","0","2018-11-19 16:39:26","2018-11-25 05:35:51");
INSERT INTO products VALUES("81","กุ้งโก๋เล็ก","01822","standard","C128","","9","7","7","7","100","100","10","100","","","","","","1","zummXD2dvAtI.png","","","1","0","","0","","","","","<p>7 Piece / KG</p>","1","2022-01-30 14:41:13","2022-01-31 04:31:00");
INSERT INTO products VALUES("82","กุ้งโก๋โบ้","01823","standard","C128","","9","7","7","7","100","120","9","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>7 Piece / KG</p>","1","2022-01-30 15:13:03","2022-02-04 09:39:32");
INSERT INTO products VALUES("83","กุ้งนาง 50-60 ตัว","0212189","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:01:16");
INSERT INTO products VALUES("84","กุ้งขาวนิ่ม 00000","100011","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:01:44");
INSERT INTO products VALUES("85","กุ้งขาวนิ่ม 0000","100012","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:02:05");
INSERT INTO products VALUES("86","กุ้งขาวนิ่ม เบอร์ 1","10007","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:02:26");
INSERT INTO products VALUES("87","กุ้งขาวนิ่ม เบอร์ 2","10008","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:02:45");
INSERT INTO products VALUES("88","กุ้งขาวนิ่ม เบอร์ 0","10009","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:03:10");
INSERT INTO products VALUES("89","กุ้งขาวนิ่ม  ( กล่อง 30 กิโล )","10009-1","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>30 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:03:47");
INSERT INTO products VALUES("90","กุ้งขาว #120ตัว","10120","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:06:25");
INSERT INTO products VALUES("91","กุ้งขาว #120ตัว ( กล่อง 30 กิโล )","10120-1","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>30 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:06:04");
INSERT INTO products VALUES("92","กุ้งขาว #2","10222","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:09:36");
INSERT INTO products VALUES("93","กุ้งขาว #2 พิเศษ","102222","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:09:57");
INSERT INTO products VALUES("94","กุ้งขาว #3","10333","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:10:18");
INSERT INTO products VALUES("95","กุ้งขาว #4","10444","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:10:38");
INSERT INTO products VALUES("96","กุ้งเรียงถาด แพ็ค","10487-2","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:11:03");
INSERT INTO products VALUES("97","กุ้งขาวแกะไว้หาง กล่อง 0.5 กก.","10488","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:11:22");
INSERT INTO products VALUES("98","กุ้งกุลาแกะไว้หาง 3XL กล่อง","10489","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:11:43");
INSERT INTO products VALUES("99","กุ้งกุลาแกะไว้หาง XL กล่อง","10490","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:12:09");
INSERT INTO products VALUES("100","กุ้งกุลาแกะไว้หาง 4XL กล่อง","10491","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:12:29");
INSERT INTO products VALUES("101","กุ้งขาวแกะไว้หาง เบอร์ 0  กล่อง 0.5 กก.","10499","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:12:53");
INSERT INTO products VALUES("102","กุ้งขาวแกะ 90ตัว แพ็ค","10500","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>1 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:14:36");
INSERT INTO products VALUES("103","คางกุ้งแพ็ค 1 กก.","10502","standard","C128","","9","7","7","7","100","120","80","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-02-06 21:46:51");
INSERT INTO products VALUES("104","ลูกชิ้นกุ้งแพ็ค 400 กรัม","10503","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>4 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:16:18");
INSERT INTO products VALUES("105","กุ้งขาวแกะ 4XL","10504","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:16:55");
INSERT INTO products VALUES("106","ก้งก้ามกราม เบอร์ 0 ( 12 ตัว) กก.","11610-1","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>10 Piece / KG</p>","1","2022-01-30 15:13:03","2022-01-30 16:17:51");
INSERT INTO products VALUES("107","ก้งก้ามกราม เบอร์ 0 ( 8 ตัว) กก.","116100","standard","C128","","9","7","7","7","100","120","0","","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","<p>7 Piece / KG</p>","1","2022-01-30 15:13:03","2022-02-02 10:31:58");
INSERT INTO products VALUES("108","กุ้งขาวนิ่ม  เบอร์ 3","10009-3","standard","C128","","9","7","7","7","100","100","3","10","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","","1","2022-01-30 16:20:15","2022-02-02 10:28:27");
INSERT INTO products VALUES("109","หัวกุ้งแพ็ค 1 กก.","10501","standard","C128","","9","7","7","7","100","100","102","10","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","","1","2022-01-30 16:20:49","2022-02-06 21:46:51");



CREATE TABLE `purchase_product_return` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO purchases VALUES("133","pr-20220131-034046","1","1","1","2","30","0","0","2900","0","0","0","0","2900","0","1","1","","","2022-01-31 03:40:46","2022-01-31 04:31:00");
INSERT INTO purchases VALUES("142","pr-20220202-102827","1","1","1","2","7","0","0","700","0","0","","","700","0","1","1","","","2022-02-02 10:28:27","2022-02-02 10:28:27");
INSERT INTO purchases VALUES("143","PR-20220206-092858","1","2","3","2","200","0","0","20000","0","0","","","20000","0","1","1","","","2022-02-06 21:28:58","2022-02-06 21:28:58");



CREATE TABLE `quotations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `quotation_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO quotations VALUES("1","qr-20180809-055250","1","1","3","3","1","3","57","35","767.73","5930","10","583","100","500","6913","2","","first quotation...","2018-08-09 06:52:50","2018-09-04 10:32:16");
INSERT INTO quotations VALUES("2","qr-20180904-040257","1","1","","1","1","2","3.5","0","0","76","0","0","1.6","2.7","77.1","1","","","2018-09-04 05:02:57","2018-09-21 14:05:57");
INSERT INTO quotations VALUES("3","qr-20181023-061249","9","1","3","11","1","2","2","0","40","453","0","0","0","0","453","2","","","2018-10-23 07:12:49","2019-12-21 13:41:36");
INSERT INTO quotations VALUES("11","qr-20201024-090814","1","1","","1","1","1","2","0","3000","23000","0","0","0","0","23000","1","","","2020-10-24 10:08:14","2020-10-24 10:28:35");
INSERT INTO quotations VALUES("12","qr-20201210-053401","1","1","1","19","2","2","15","0","600","9100","0","0","100","500","9500","1","","","2020-12-10 06:34:01","2020-12-10 06:34:01");
INSERT INTO quotations VALUES("13","qr-20210112-125803","1","1","","11","1","3","12","0","155.65","1660","0","0","0","0","1660","1","","","2021-01-12 13:58:03","2021-01-12 13:59:14");
INSERT INTO quotations VALUES("15","qr-20210529-105356","1","1","","11","2","2","2","0","40","442","0","0","0","0","442","1","","","2021-05-29 11:53:56","2021-05-30 15:04:07");



CREATE TABLE `return_purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO return_purchases VALUES("1","prr-20190101-090759","3","1","1","1","1","1","0","0","200","0","0","200","","","","2019-01-01 10:07:59","2019-12-07 18:19:03");



CREATE TABLE `returns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO returns VALUES("2","rr-20180809-055834","1","","1","1","1","1","1","20","0","0","40","10","4","44","","","","2018-08-09 06:58:34","2018-08-09 06:58:34");
INSERT INTO returns VALUES("3","rr-20180828-045527","1","","1","2","1","1","1","2","0","0","44","0","0","44","","","","2018-08-28 05:55:27","2018-09-20 18:03:47");
INSERT INTO returns VALUES("5","rr-20181007-082129","1","","11","2","2","1","1","1","0","0","250","0","0","250","","","","2018-10-07 09:21:29","2018-12-26 05:16:08");
INSERT INTO returns VALUES("6","rr-20190101-090630","9","","1","1","1","1","1","1","0","40","440","0","0","440","","","","2019-01-01 10:06:30","2019-01-01 10:06:30");
INSERT INTO returns VALUES("13","rr-20200816-102502","1","","1","2","2","1","1","1","0","1500","11500","0","0","11500","","","","2020-08-16 23:25:02","2020-08-16 23:25:02");
INSERT INTO returns VALUES("14","rr-20201013-053954","9","1","1","1","1","1","1","1","0","40","440","0","0","440","","","","2020-10-13 18:39:54","2020-10-13 18:39:54");
INSERT INTO returns VALUES("18","rr-20201118-070218","1","4","1","2","1","1","1","1","0","1500","11500","0","0","11500","","","","2020-11-18 08:02:18","2020-11-18 08:02:18");
INSERT INTO returns VALUES("19","rr-20201210-064025","1","3","19","1","1","1","1","1","0","0","250","0","0","250","","","","2020-12-10 07:40:25","2020-12-10 07:40:25");
INSERT INTO returns VALUES("25","rr-20210524-073950","1","3","1","1","1","1","1","1","0","0","2","0","0","2","","","","2021-05-24 20:39:50","2021-05-24 20:39:50");



CREATE TABLE `reward_point_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `per_point_amount` double NOT NULL,
  `minimum_amount` double NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO reward_point_settings VALUES("1","300","1000","1","Year","1","2021-06-08 22:40:15","2021-06-27 12:20:55");



CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO role_has_permissions VALUES("4","1");
INSERT INTO role_has_permissions VALUES("4","2");
INSERT INTO role_has_permissions VALUES("4","4");
INSERT INTO role_has_permissions VALUES("5","1");
INSERT INTO role_has_permissions VALUES("5","2");
INSERT INTO role_has_permissions VALUES("6","1");
INSERT INTO role_has_permissions VALUES("6","2");
INSERT INTO role_has_permissions VALUES("6","4");
INSERT INTO role_has_permissions VALUES("7","1");
INSERT INTO role_has_permissions VALUES("7","2");
INSERT INTO role_has_permissions VALUES("7","4");
INSERT INTO role_has_permissions VALUES("8","1");
INSERT INTO role_has_permissions VALUES("8","2");
INSERT INTO role_has_permissions VALUES("8","4");
INSERT INTO role_has_permissions VALUES("9","1");
INSERT INTO role_has_permissions VALUES("9","2");
INSERT INTO role_has_permissions VALUES("9","4");
INSERT INTO role_has_permissions VALUES("10","1");
INSERT INTO role_has_permissions VALUES("10","2");
INSERT INTO role_has_permissions VALUES("11","1");
INSERT INTO role_has_permissions VALUES("11","2");
INSERT INTO role_has_permissions VALUES("12","1");
INSERT INTO role_has_permissions VALUES("12","2");
INSERT INTO role_has_permissions VALUES("12","4");
INSERT INTO role_has_permissions VALUES("13","1");
INSERT INTO role_has_permissions VALUES("13","2");
INSERT INTO role_has_permissions VALUES("13","4");
INSERT INTO role_has_permissions VALUES("14","1");
INSERT INTO role_has_permissions VALUES("14","2");
INSERT INTO role_has_permissions VALUES("15","1");
INSERT INTO role_has_permissions VALUES("15","2");
INSERT INTO role_has_permissions VALUES("16","1");
INSERT INTO role_has_permissions VALUES("16","2");
INSERT INTO role_has_permissions VALUES("17","1");
INSERT INTO role_has_permissions VALUES("17","2");
INSERT INTO role_has_permissions VALUES("18","1");
INSERT INTO role_has_permissions VALUES("18","2");
INSERT INTO role_has_permissions VALUES("19","1");
INSERT INTO role_has_permissions VALUES("19","2");
INSERT INTO role_has_permissions VALUES("20","1");
INSERT INTO role_has_permissions VALUES("20","2");
INSERT INTO role_has_permissions VALUES("20","4");
INSERT INTO role_has_permissions VALUES("21","1");
INSERT INTO role_has_permissions VALUES("21","2");
INSERT INTO role_has_permissions VALUES("21","4");
INSERT INTO role_has_permissions VALUES("22","1");
INSERT INTO role_has_permissions VALUES("22","2");
INSERT INTO role_has_permissions VALUES("22","4");
INSERT INTO role_has_permissions VALUES("23","1");
INSERT INTO role_has_permissions VALUES("23","2");
INSERT INTO role_has_permissions VALUES("24","1");
INSERT INTO role_has_permissions VALUES("24","2");
INSERT INTO role_has_permissions VALUES("24","4");
INSERT INTO role_has_permissions VALUES("25","1");
INSERT INTO role_has_permissions VALUES("25","2");
INSERT INTO role_has_permissions VALUES("25","4");
INSERT INTO role_has_permissions VALUES("26","1");
INSERT INTO role_has_permissions VALUES("26","2");
INSERT INTO role_has_permissions VALUES("27","1");
INSERT INTO role_has_permissions VALUES("27","2");
INSERT INTO role_has_permissions VALUES("28","1");
INSERT INTO role_has_permissions VALUES("28","2");
INSERT INTO role_has_permissions VALUES("28","4");
INSERT INTO role_has_permissions VALUES("29","1");
INSERT INTO role_has_permissions VALUES("29","2");
INSERT INTO role_has_permissions VALUES("29","4");
INSERT INTO role_has_permissions VALUES("30","1");
INSERT INTO role_has_permissions VALUES("30","2");
INSERT INTO role_has_permissions VALUES("31","1");
INSERT INTO role_has_permissions VALUES("31","2");
INSERT INTO role_has_permissions VALUES("32","1");
INSERT INTO role_has_permissions VALUES("32","2");
INSERT INTO role_has_permissions VALUES("33","1");
INSERT INTO role_has_permissions VALUES("33","2");
INSERT INTO role_has_permissions VALUES("34","1");
INSERT INTO role_has_permissions VALUES("34","2");
INSERT INTO role_has_permissions VALUES("35","1");
INSERT INTO role_has_permissions VALUES("35","2");
INSERT INTO role_has_permissions VALUES("36","1");
INSERT INTO role_has_permissions VALUES("36","2");
INSERT INTO role_has_permissions VALUES("37","1");
INSERT INTO role_has_permissions VALUES("37","2");
INSERT INTO role_has_permissions VALUES("38","1");
INSERT INTO role_has_permissions VALUES("38","2");
INSERT INTO role_has_permissions VALUES("39","1");
INSERT INTO role_has_permissions VALUES("39","2");
INSERT INTO role_has_permissions VALUES("40","1");
INSERT INTO role_has_permissions VALUES("40","2");
INSERT INTO role_has_permissions VALUES("41","1");
INSERT INTO role_has_permissions VALUES("41","2");
INSERT INTO role_has_permissions VALUES("42","1");
INSERT INTO role_has_permissions VALUES("42","2");
INSERT INTO role_has_permissions VALUES("43","1");
INSERT INTO role_has_permissions VALUES("43","2");
INSERT INTO role_has_permissions VALUES("44","1");
INSERT INTO role_has_permissions VALUES("44","2");
INSERT INTO role_has_permissions VALUES("45","1");
INSERT INTO role_has_permissions VALUES("45","2");
INSERT INTO role_has_permissions VALUES("46","1");
INSERT INTO role_has_permissions VALUES("46","2");
INSERT INTO role_has_permissions VALUES("47","1");
INSERT INTO role_has_permissions VALUES("47","2");
INSERT INTO role_has_permissions VALUES("48","1");
INSERT INTO role_has_permissions VALUES("48","2");
INSERT INTO role_has_permissions VALUES("49","1");
INSERT INTO role_has_permissions VALUES("49","2");
INSERT INTO role_has_permissions VALUES("50","1");
INSERT INTO role_has_permissions VALUES("50","2");
INSERT INTO role_has_permissions VALUES("51","1");
INSERT INTO role_has_permissions VALUES("51","2");
INSERT INTO role_has_permissions VALUES("52","1");
INSERT INTO role_has_permissions VALUES("52","2");
INSERT INTO role_has_permissions VALUES("53","1");
INSERT INTO role_has_permissions VALUES("53","2");
INSERT INTO role_has_permissions VALUES("54","1");
INSERT INTO role_has_permissions VALUES("54","2");
INSERT INTO role_has_permissions VALUES("55","1");
INSERT INTO role_has_permissions VALUES("55","2");
INSERT INTO role_has_permissions VALUES("55","4");
INSERT INTO role_has_permissions VALUES("56","1");
INSERT INTO role_has_permissions VALUES("56","2");
INSERT INTO role_has_permissions VALUES("56","4");
INSERT INTO role_has_permissions VALUES("57","1");
INSERT INTO role_has_permissions VALUES("57","2");
INSERT INTO role_has_permissions VALUES("57","4");
INSERT INTO role_has_permissions VALUES("58","1");
INSERT INTO role_has_permissions VALUES("58","2");
INSERT INTO role_has_permissions VALUES("59","1");
INSERT INTO role_has_permissions VALUES("59","2");
INSERT INTO role_has_permissions VALUES("60","1");
INSERT INTO role_has_permissions VALUES("60","2");
INSERT INTO role_has_permissions VALUES("61","1");
INSERT INTO role_has_permissions VALUES("61","2");
INSERT INTO role_has_permissions VALUES("62","1");
INSERT INTO role_has_permissions VALUES("62","2");
INSERT INTO role_has_permissions VALUES("63","1");
INSERT INTO role_has_permissions VALUES("63","2");
INSERT INTO role_has_permissions VALUES("63","4");
INSERT INTO role_has_permissions VALUES("64","1");
INSERT INTO role_has_permissions VALUES("64","2");
INSERT INTO role_has_permissions VALUES("64","4");
INSERT INTO role_has_permissions VALUES("65","1");
INSERT INTO role_has_permissions VALUES("65","2");
INSERT INTO role_has_permissions VALUES("66","1");
INSERT INTO role_has_permissions VALUES("66","2");
INSERT INTO role_has_permissions VALUES("67","1");
INSERT INTO role_has_permissions VALUES("67","2");
INSERT INTO role_has_permissions VALUES("68","1");
INSERT INTO role_has_permissions VALUES("68","2");
INSERT INTO role_has_permissions VALUES("69","1");
INSERT INTO role_has_permissions VALUES("69","2");
INSERT INTO role_has_permissions VALUES("70","1");
INSERT INTO role_has_permissions VALUES("70","2");
INSERT INTO role_has_permissions VALUES("71","1");
INSERT INTO role_has_permissions VALUES("71","2");
INSERT INTO role_has_permissions VALUES("72","1");
INSERT INTO role_has_permissions VALUES("72","2");
INSERT INTO role_has_permissions VALUES("73","1");
INSERT INTO role_has_permissions VALUES("73","2");
INSERT INTO role_has_permissions VALUES("74","1");
INSERT INTO role_has_permissions VALUES("74","2");
INSERT INTO role_has_permissions VALUES("75","1");
INSERT INTO role_has_permissions VALUES("75","2");
INSERT INTO role_has_permissions VALUES("76","1");
INSERT INTO role_has_permissions VALUES("76","2");
INSERT INTO role_has_permissions VALUES("77","1");
INSERT INTO role_has_permissions VALUES("77","2");
INSERT INTO role_has_permissions VALUES("78","1");
INSERT INTO role_has_permissions VALUES("78","2");
INSERT INTO role_has_permissions VALUES("79","1");
INSERT INTO role_has_permissions VALUES("79","2");
INSERT INTO role_has_permissions VALUES("80","1");
INSERT INTO role_has_permissions VALUES("80","2");
INSERT INTO role_has_permissions VALUES("81","1");
INSERT INTO role_has_permissions VALUES("81","2");
INSERT INTO role_has_permissions VALUES("82","1");
INSERT INTO role_has_permissions VALUES("82","2");
INSERT INTO role_has_permissions VALUES("83","1");
INSERT INTO role_has_permissions VALUES("83","2");
INSERT INTO role_has_permissions VALUES("84","1");
INSERT INTO role_has_permissions VALUES("84","2");
INSERT INTO role_has_permissions VALUES("85","1");
INSERT INTO role_has_permissions VALUES("85","2");
INSERT INTO role_has_permissions VALUES("86","1");
INSERT INTO role_has_permissions VALUES("86","2");
INSERT INTO role_has_permissions VALUES("87","1");
INSERT INTO role_has_permissions VALUES("87","2");
INSERT INTO role_has_permissions VALUES("88","1");
INSERT INTO role_has_permissions VALUES("88","2");
INSERT INTO role_has_permissions VALUES("89","1");
INSERT INTO role_has_permissions VALUES("89","2");
INSERT INTO role_has_permissions VALUES("90","1");
INSERT INTO role_has_permissions VALUES("90","2");
INSERT INTO role_has_permissions VALUES("91","1");
INSERT INTO role_has_permissions VALUES("91","2");
INSERT INTO role_has_permissions VALUES("92","1");
INSERT INTO role_has_permissions VALUES("92","2");
INSERT INTO role_has_permissions VALUES("93","1");
INSERT INTO role_has_permissions VALUES("93","2");
INSERT INTO role_has_permissions VALUES("94","1");
INSERT INTO role_has_permissions VALUES("94","2");
INSERT INTO role_has_permissions VALUES("95","1");
INSERT INTO role_has_permissions VALUES("95","2");
INSERT INTO role_has_permissions VALUES("96","1");
INSERT INTO role_has_permissions VALUES("96","2");
INSERT INTO role_has_permissions VALUES("97","1");
INSERT INTO role_has_permissions VALUES("97","2");
INSERT INTO role_has_permissions VALUES("98","1");
INSERT INTO role_has_permissions VALUES("98","2");
INSERT INTO role_has_permissions VALUES("99","1");
INSERT INTO role_has_permissions VALUES("99","2");
INSERT INTO role_has_permissions VALUES("100","1");
INSERT INTO role_has_permissions VALUES("100","2");
INSERT INTO role_has_permissions VALUES("101","1");
INSERT INTO role_has_permissions VALUES("101","2");
INSERT INTO role_has_permissions VALUES("102","1");
INSERT INTO role_has_permissions VALUES("102","2");
INSERT INTO role_has_permissions VALUES("103","1");
INSERT INTO role_has_permissions VALUES("103","2");
INSERT INTO role_has_permissions VALUES("104","1");
INSERT INTO role_has_permissions VALUES("104","2");
INSERT INTO role_has_permissions VALUES("105","1");
INSERT INTO role_has_permissions VALUES("105","2");



CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES("1","Admin","admin can access all data...","web","1","2018-06-02 06:46:44","2018-06-03 06:13:05");
INSERT INTO roles VALUES("2","Owner","Owner of shop...","web","1","2018-10-22 09:38:13","2018-10-22 09:38:13");
INSERT INTO roles VALUES("4","staff","staff has specific acess...","web","1","2018-06-02 07:05:27","2018-06-02 07:05:27");
INSERT INTO roles VALUES("5","Customer","","web","1","2020-11-05 13:43:16","2020-11-15 07:24:15");



CREATE TABLE `sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `sale_status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO sales VALUES("362","SR-20220204-093932","1","5","28","1","1","1","6","0","0","720","720","0","0","","","","","1","1","","","sasasa","sasas","2022-02-04 09:39:32","2022-02-04 09:39:32");
INSERT INTO sales VALUES("363","SR-20220206-094651","1","4","28","2","1","2","30","0","0","3400","3400","0","0","","","","","1","1","","","","","2022-02-06 21:46:51","2022-02-06 21:46:51");



CREATE TABLE `stock_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_adjusted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO stock_counts VALUES("1","scr-20190228-124939","2","","","1","full","20190228-124939.csv","","","0","2019-02-28 13:49:39","2019-02-28 13:49:39");
INSERT INTO stock_counts VALUES("2","SCR-20220203-034642","1","","","1","full","20220203-034642.csv","","","0","2022-02-03 03:46:42","2022-02-03 03:46:42");
INSERT INTO stock_counts VALUES("3","SCR-20220203-035110","1","","","1","full","20220203-035110.xlsx","20220203-071955.csv","035110","1","2022-02-03 03:51:10","2022-02-03 07:20:01");



CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO suppliers VALUES("1","abdullah","globaltouch.jpg","global touch","","abdullah@globaltouch.com","231231","fsdfs","fsdfs","","","bd","1","2018-05-13 05:06:34","2019-12-21 17:58:47");
INSERT INTO suppliers VALUES("2","test","lion.jpg","lion","","lion@gmail.com","242","gfdg","fgd","","","","0","2018-05-30 06:59:41","2018-05-30 07:00:06");
INSERT INTO suppliers VALUES("3","ismail","","techbd","","ismail@test.com","23123123","mohammadpur","dhaka","","","bangladesh","1","2018-07-20 11:34:17","2018-07-20 11:34:17");
INSERT INTO suppliers VALUES("4","modon","mogaFruit.jpg","mogaFruit","","modon@gmail.com","32321","nasirabad","chittagong","","","bd","0","2018-09-01 11:30:07","2018-09-01 11:37:20");
INSERT INTO suppliers VALUES("5","sadman","","anda boda","dsa","asd@dsa.com","3212313","dadas","sdad","Other","1312","Australia","0","2020-06-22 16:48:33","2020-06-22 16:48:52");



CREATE TABLE `taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO taxes VALUES("1","vat@10","10","1","2018-05-12 16:58:30","2019-03-02 18:46:10");
INSERT INTO taxes VALUES("2","vat@15","15","1","2018-05-12 16:58:43","2018-05-28 06:35:05");
INSERT INTO taxes VALUES("3","test","6","0","2018-05-28 06:32:54","2018-05-28 06:34:44");
INSERT INTO taxes VALUES("4","vat 20","20","0","2018-09-01 07:58:57","2022-01-20 16:13:06");
INSERT INTO taxes VALUES("5","STD","7","1","2022-01-20 16:10:57","2022-01-20 16:10:57");
INSERT INTO taxes VALUES("6","ZER","0","1","2022-01-20 16:12:08","2022-01-20 16:13:18");
INSERT INTO taxes VALUES("7","ADV","0","1","2022-01-20 16:12:08","2022-01-20 16:12:08");



CREATE TABLE `transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `from_warehouse_id` int(11) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO transfers VALUES("1","tr-20180808-051710","1","1","2","1","1","100","0","100","0","100","","","2018-08-08 18:17:10","2018-12-25 05:16:55");
INSERT INTO transfers VALUES("6","tr-20191205-075504","1","1","1","2","1","1","0","2","0","2","","","2019-12-05 20:55:04","2019-12-05 21:09:42");
INSERT INTO transfers VALUES("8","tr-20200122-123058","1","1","1","2","1","10","0","1000","","1000","","","2020-01-22 13:30:58","2020-01-22 13:30:58");
INSERT INTO transfers VALUES("10","tr-20201008-012735","9","1","1","2","1","1","32","352","0","352","","","2020-10-08 14:27:35","2020-10-08 14:29:35");
INSERT INTO transfers VALUES("11","tr-20201018-061708","9","1","1","2","1","1","0","1","","1","","","2020-10-18 19:17:08","2020-10-18 19:17:08");
INSERT INTO transfers VALUES("12","tr-20201024-090146","1","1","2","1","1","10","4500","34500","","34500","","","2020-10-24 10:01:46","2020-10-24 10:01:46");



CREATE TABLE `units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO units VALUES("1","pc","Piece","","*","1","1","2018-05-12 09:27:46","2018-08-18 04:41:53");
INSERT INTO units VALUES("2","dozen","dozen box","1","*","12","1","2018-05-12 16:57:05","2018-05-12 16:57:05");
INSERT INTO units VALUES("3","cartoon","cartoon box","1","*","24","1","2018-05-12 16:57:45","2020-03-11 17:36:59");
INSERT INTO units VALUES("4","m","meter","","*","1","1","2018-05-12 16:58:07","2018-05-28 06:20:57");
INSERT INTO units VALUES("6","test","test","","*","1","0","2018-05-28 06:20:20","2018-05-28 06:20:25");
INSERT INTO units VALUES("7","kg","kilogram","","*","1","1","2018-06-25 07:49:26","2018-06-25 07:49:26");
INSERT INTO units VALUES("8","20","ni33","8","*","1","0","2018-08-01 05:35:51","2018-08-01 05:40:54");
INSERT INTO units VALUES("9","gm","gram","7","/","1000","1","2018-09-01 07:06:28","2018-09-01 07:06:28");
INSERT INTO units VALUES("10","gz","goz","","*","1","0","2018-11-29 10:40:29","2019-03-02 18:53:29");
INSERT INTO units VALUES("11","lb","paung","","*","1","0","2022-01-20 12:02:45","2022-01-20 12:02:53");
INSERT INTO units VALUES("12","lb","paund","","*","1","0","2022-01-20 12:03:14","2022-01-20 12:03:20");



CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("1","Night","admin@gmail.com","$2y$10$DWAHTfjcvwCpOCXaJg11MOhsqns03uvlwiSUOQwkHL2YYrtrXPcL6","OTWJ36hYN1wOfk70pFL7yhU1rkqewcOPcwsFjQgU60gbtOWlDochxQ2AAHkw","0910911857","Orange Tech Company","1","","","1","0","2018-06-02 10:24:15","2022-01-21 03:04:18");
INSERT INTO users VALUES("3","dhiman da","dhiman@gmail.com","$2y$10$Fef6vu5E67nm11hX7V5a2u1ThNCQ6n9DRCvRF9TD7stk.Pmt2R6O.","5ehQM6JIfiQfROgTbB5let0Z93vjLHS7rd9QD5RPNgOxli3xdo7fykU7vtTt","212","lioncoders","1","","","0","1","2018-06-14 05:00:31","2020-11-05 14:06:51");
INSERT INTO users VALUES("6","test","test@gmail.com","$2y$10$TDAeHcVqHyCmurki0wjLZeIl1SngKX3WLOhyTiCoZG3souQfqv.LS","KpW1gYYlOFacumklO2IcRfSsbC3KcWUZzOI37gqoqM388Xie6KdhaOHIFEYm","1234","212312","4","","","0","1","2018-06-23 10:05:33","2018-06-23 10:13:45");
INSERT INTO users VALUES("8","test","test@yahoo.com","$2y$10$hlMigidZV0j2/IPkgE/xsOSb8WM2IRlsMv.1hg1NM7kfyd6bGX3hC","","31231","","4","","","0","1","2018-06-25 05:35:49","2018-07-02 08:07:39");
INSERT INTO users VALUES("9","staff","anda@gmail.com","$2y$10$kxDbnynB6mB1e1w3pmtbSOlSxy/WwbLPY5TJpMi0Opao5ezfuQjQm","dLNcktdks0IxKepKusPC61sjhCPt6UXBhYwXwxbQe89o2ZOQBJo5YZ9oteEA","3123","","4","5","1","1","0","2018-07-02 08:08:08","2018-10-24 04:41:13");
INSERT INTO users VALUES("10","abul","abul@alpha.com","$2y$10$5zgB2OOMyNBNVAd.QOQIju5a9fhNnTqPx5H6s4oFlXhNiF6kXEsPq","x7HlttI5bM0vSKViqATaowHFJkLS3PHwfvl7iJdFl5Z1SsyUgWCVbLSgAoi0","1234","anda","1","","","0","0","2018-09-08 06:44:48","2022-01-12 08:22:45");
INSERT INTO users VALUES("11","teststaff","a@a.com","$2y$10$5KNBIIhZzvvZEQEhkHaZGu.Q8bbQNfqYvYgL5N55B8Pb4P5P/b/Li","DkHDEcCA0QLfsKPkUK0ckL0CPM6dPiJytNa0k952gyTbeAyMthW3vi7IRitp","111","aa","4","5","1","0","1","2018-10-22 09:47:56","2018-10-23 09:10:56");
INSERT INTO users VALUES("12","john","john@gmail.com","$2y$10$P/pN2J/uyTYNzQy2kRqWwuSv7P2f6GE/ykBwtHdda7yci3XsfOKWe","O0f1WJBVjT5eKYl3Js5l1ixMMtoU6kqrH7hbHDx9I1UCcD9CmiSmCBzHbQZg","10001","","4","2","2","0","1","2018-12-30 07:48:37","2019-03-06 11:59:49");
INSERT INTO users VALUES("13","jjj","test@test.com","$2y$10$/Qx3gHWYWUhlF1aPfzXaCeZA7fRzfSEyCIOnk/dcC4ejO8PsoaalG","","1213","","1","","","0","1","2019-01-03 07:08:31","2019-03-03 11:02:29");
INSERT INTO users VALUES("19","shakalaka","shakalaka@gmail.com","$2y$10$ketLWT0Ib/JXpo00eJlxoeSw.7leS8V1CUGInfbyOWT4F5.Xuo7S2","","1212","Digital image","5","","","1","0","2020-11-09 07:07:16","2020-11-09 07:07:16");
INSERT INTO users VALUES("21","modon","modon@gmail.com","$2y$10$7VpoeGMkP8QCvL5zLwFW..6MYJ5MRumDLDoX.TTQtClS561rpFHY.","","2222","modon company","5","","","1","0","2020-11-13 14:12:08","2020-11-13 14:12:08");
INSERT INTO users VALUES("22","dhiman","dhiman@gmail.com","$2y$10$3mPygsC6wwnDtw/Sg85IpuExtUhgaHx52Lwp7Rz0.FNfuFdfKVpRq","","+8801111111101","lioncoders","5","","","1","0","2020-11-15 13:14:58","2020-11-15 13:14:58");
INSERT INTO users VALUES("29","naing oo","naingoo123448@gmail.com","$2y$10$0N.AN1d/xhOdpNRMIthSwei.vTGnOq7OUpK.qJhKQ.Z7Zorhbji9C","","09791029356","Orange Tech Company","5","1","1","1","0","2022-01-12 07:58:49","2022-01-30 16:33:20");
INSERT INTO users VALUES("30","knu","nu@united.co.th","$2y$10$sG/Pn3oaEnIKe.I0KP95WOjpkeuKkNJ5M/TMcI.hLjh58J0unhIlO","","09896063617","UNITED INDUSTRIAL GASES CO.,LTD.","5","","","1","0","2022-02-04 10:20:40","2022-02-04 10:20:40");



CREATE TABLE `variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO variants VALUES("2","Medium","2019-11-21 14:03:04","2019-11-24 15:43:52");
INSERT INTO variants VALUES("3","Small","2019-11-21 14:03:04","2019-11-24 15:43:52");
INSERT INTO variants VALUES("5","Large","2019-11-24 13:07:20","2019-11-24 15:44:56");
INSERT INTO variants VALUES("9","a","2020-05-18 23:44:14","2020-05-18 23:44:14");
INSERT INTO variants VALUES("11","b","2020-05-18 23:53:49","2020-05-18 23:53:49");
INSERT INTO variants VALUES("12","variant 1","2020-09-27 13:08:27","2020-09-27 13:08:27");
INSERT INTO variants VALUES("13","variant 2","2020-09-27 13:08:27","2020-09-27 13:08:27");
INSERT INTO variants VALUES("15","S","2020-11-16 13:09:33","2020-11-16 13:09:33");
INSERT INTO variants VALUES("16","M","2020-11-16 13:09:33","2020-11-16 13:09:33");
INSERT INTO variants VALUES("17","L","2020-11-16 13:09:33","2020-11-16 13:09:33");



CREATE TABLE `warehouses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO warehouses VALUES("1","warehouse 1","2312121","war1@lion.com","khatungonj, chittagong","1","2018-05-12 14:51:44","2019-03-02 22:40:17");
INSERT INTO warehouses VALUES("2","warehouse 2","1234","","boropul, chittagong","1","2018-05-12 15:09:03","2018-06-20 05:30:38");
INSERT INTO warehouses VALUES("3","test","","","dqwdeqw","0","2018-05-30 07:14:23","2018-05-30 07:14:47");
INSERT INTO warehouses VALUES("6","gudam","2121","","gazipur","0","2018-09-01 05:53:26","2018-09-01 05:54:48");
INSERT INTO warehouses VALUES("7","warehouse 3","09791029356","naingoo123448@gmail.com","Sathon, Bangkok, Thailand","0","2022-01-20 11:03:42","2022-01-20 11:10:45");
INSERT INTO warehouses VALUES("8","warehouse 4","0910911857","warehouse4@gmail.com","Choburi, Thailand","0","2022-01-20 11:09:54","2022-01-20 11:11:01");
INSERT INTO warehouses VALUES("9","warehouse 4","0910911857","warehouse4@gmail.com","Choburi, Thailand","1","2022-01-20 11:11:13","2022-01-20 11:11:22");

