CREATE DATABASE test;

USE test;

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sex` int UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `age` int UNSIGNED,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`email`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
