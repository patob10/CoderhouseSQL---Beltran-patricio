CREATE SCHEMA `sap` ;

Use sap;

CREATE TABLE `modules` (
  `id_module` int NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `description_module` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `roles` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `description_role` varchar(100) DEFAULT NULL,
  `id_module` int DEFAULT NULL,
  PRIMARY KEY (`id_role`),
  KEY `fk_roles_modules` (`id_module`),
  CONSTRAINT `fk_roles_modules` FOREIGN KEY (`id_module`) REFERENCES `modules` (`id_module`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `transactions` (
  `id_transaction` int NOT NULL AUTO_INCREMENT,
  `transaction_name` varchar(50) NOT NULL,
  `description_transaction` varchar(100) DEFAULT NULL,
  `id_module` int DEFAULT NULL,
  PRIMARY KEY (`id_transaction`),
  KEY `fk_transactions_modules` (`id_module`),
  CONSTRAINT `fk_transactions_modules` FOREIGN KEY (`id_module`) REFERENCES `modules` (`id_module`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `permissions` (
  `id_permission` int NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(50) NOT NULL,
  `description_permission` varchar(100) DEFAULT NULL,
  `id_module` int DEFAULT NULL,
  `id_transaction` int DEFAULT NULL,
  PRIMARY KEY (`id_permission`),
  KEY `fk_permissions_modules` (`id_module`),
  KEY `fk_permissions_transactions` (`id_transaction`),
  CONSTRAINT `fk_permissions_modules` FOREIGN KEY (`id_module`) REFERENCES `modules` (`id_module`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_permissions_transactions` FOREIGN KEY (`id_transaction`) REFERENCES `transactions` (`id_transaction`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_pw` varchar(50) NOT NULL,
  `user_email` varchar(80) DEFAULT NULL,
  `user_last_login` datetime DEFAULT NULL,
  `id_role` int DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `fk_users_roles` (`id_role`),
  CONSTRAINT `fk_users_roles` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;