CREATE TABLE `admin_menber` (
  `adminid` varchar(20) NOT NULL,
  `adminname` varchar(20) NOT NULL,
  `adminpwd` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `joindate` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;