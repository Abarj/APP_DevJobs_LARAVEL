/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `candidatos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `vacante_id` bigint unsigned NOT NULL,
  `cv` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidatos_user_id_foreign` (`user_id`),
  KEY `candidatos_vacante_id_foreign` (`vacante_id`),
  CONSTRAINT `candidatos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `candidatos_vacante_id_foreign` FOREIGN KEY (`vacante_id`) REFERENCES `vacantes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `categorias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `categoria` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `salarios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `salario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rol` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `vacantes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `titulo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salario_id` bigint unsigned NOT NULL,
  `categoria_id` bigint unsigned NOT NULL,
  `empresa` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_limite` date NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publicado` int NOT NULL DEFAULT '1',
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vacantes_salario_id_foreign` (`salario_id`),
  KEY `vacantes_categoria_id_foreign` (`categoria_id`),
  KEY `vacantes_user_id_foreign` (`user_id`),
  CONSTRAINT `vacantes_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vacantes_salario_id_foreign` FOREIGN KEY (`salario_id`) REFERENCES `salarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vacantes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `candidatos` (`id`, `user_id`, `vacante_id`, `cv`, `created_at`, `updated_at`) VALUES
(21, 7, 11, 'SWCOeKQJiZcbzC4NgvOPsiPhEHrENnr5DSWQwcAd.pdf', '2022-09-08 13:14:51', '2022-09-08 13:14:51');
INSERT INTO `candidatos` (`id`, `user_id`, `vacante_id`, `cv`, `created_at`, `updated_at`) VALUES
(22, 7, 12, '1Lzvw1xFYpPnjURqYSIitUjx1PGWyvCxf6fqLsh6.pdf', '2022-09-08 13:15:11', '2022-09-08 13:15:11');
INSERT INTO `candidatos` (`id`, `user_id`, `vacante_id`, `cv`, `created_at`, `updated_at`) VALUES
(23, 9, 12, 'hFxaTtZURFpRg8SysJpjCnjlbvFP3JQ7QP2CCNFg.pdf', '2022-09-08 13:15:37', '2022-09-08 13:15:37');
INSERT INTO `candidatos` (`id`, `user_id`, `vacante_id`, `cv`, `created_at`, `updated_at`) VALUES
(24, 7, 15, 'D6bWuVdUzOLq7tRWXNDSIvtCm3dCCHnmVmJVbDLp.pdf', '2022-09-08 13:24:45', '2022-09-08 13:24:45'),
(25, 9, 15, 'cPWGNUKEZ5C2tXoGxJAVM2QnaSO8KBRQ24QdNSQR.pdf', '2022-09-08 13:25:44', '2022-09-08 13:25:44');

INSERT INTO `categorias` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(1, 'Backend Developer', '2022-09-02 18:35:04', '2022-09-02 18:35:04');
INSERT INTO `categorias` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(2, 'Front end Developer', '2022-09-02 18:35:04', '2022-09-02 18:35:04');
INSERT INTO `categorias` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(3, 'Mobile Developer', '2022-09-02 18:35:04', '2022-09-02 18:35:04');
INSERT INTO `categorias` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(4, 'Techlead', '2022-09-02 18:35:04', '2022-09-02 18:35:04'),
(5, 'UX / UI Design', '2022-09-02 18:35:04', '2022-09-02 18:35:04'),
(6, 'Software Architecture', '2022-09-02 18:35:04', '2022-09-02 18:35:04'),
(7, 'Devops', '2022-09-02 18:35:04', '2022-09-02 18:35:04');



INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_09_01_173243_add_rol_to_users_table', 2),
(18, '2022_09_01_183429_create_vacante_table', 3),
(19, '2022_09_02_120934_create_salarios_table', 3),
(20, '2022_09_02_122900_create_categorias_table', 3),
(22, '2022_09_02_183547_add_columns_to_vacantes_table', 4),
(23, '2022_09_07_105950_create_candidatos_table', 5),
(24, '2022_09_07_152539_create_notifications_table', 6);

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0018c4f9-43ae-4747-9042-1b9f56b3dfd2', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":11,\"nombre_vacante\":\"React Developer\",\"usuario_id\":7}', '2022-09-07 18:52:38', '2022-09-07 18:50:22', '2022-09-07 18:52:38');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0a283c6e-a0bd-4394-ac9d-f0a744cabc57', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":12,\"nombre_vacante\":\"Python Back End Developer\",\"usuario_id\":9}', '2022-09-08 13:20:45', '2022-09-08 13:15:39', '2022-09-08 13:20:45');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0d96c816-5c54-474f-9919-8ef2a72f5c1c', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":11,\"nombre_vacante\":\"React Developer\",\"usuario_id\":7}', '2022-09-07 18:52:58', '2022-09-07 18:50:32', '2022-09-07 18:52:58');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('10bad3ce-808c-4368-814b-e6b604dc8c15', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":11,\"nombre_vacante\":\"React Developer\",\"usuario_id\":7}', '2022-09-08 13:20:45', '2022-09-08 13:06:14', '2022-09-08 13:20:45'),
('165a520c-4679-42f8-9628-97ca60a27ebc', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":12,\"nombre_vacante\":\"Python Back End Developer\",\"usuario_id\":9}', '2022-09-08 13:20:45', '2022-09-08 13:12:26', '2022-09-08 13:20:45'),
('36cfb62f-bc72-48bf-91f3-108e349469da', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 8, '{\"id_vacante\":15,\"nombre_vacante\":\"Information security analysts\",\"usuario_id\":7}', '2022-09-08 13:26:02', '2022-09-08 13:24:47', '2022-09-08 13:26:02'),
('38a89c23-cea6-4044-bca2-a47a11e7cbf0', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":11,\"nombre_vacante\":\"React Developer\",\"usuario_id\":7}', '2022-09-08 13:20:45', '2022-09-08 13:14:53', '2022-09-08 13:20:45'),
('3e05d1c0-a7fb-44e3-a62c-9c220d88bed5', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":11,\"nombre_vacante\":\"React Developer\",\"usuario_id\":7}', '2022-09-07 18:52:58', '2022-09-07 18:50:30', '2022-09-07 18:52:58'),
('42cd6a70-c385-4826-9ea8-55d8a829f141', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":12,\"nombre_vacante\":\"Python Back End Developer\",\"usuario_id\":7}', '2022-09-08 13:20:45', '2022-09-08 13:15:13', '2022-09-08 13:20:45'),
('7ff34399-fd03-404f-92c0-04860397339f', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":12,\"nombre_vacante\":\"Python Back End Developer\",\"usuario_id\":7}', '2022-09-08 13:20:45', '2022-09-08 13:08:20', '2022-09-08 13:20:45'),
('c0778c9e-e419-4bcc-852f-4765d66c8caf', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 8, '{\"id_vacante\":15,\"nombre_vacante\":\"Information security analysts\",\"usuario_id\":9}', '2022-09-08 13:26:02', '2022-09-08 13:25:46', '2022-09-08 13:26:02'),
('ce03fd53-6ea4-40bf-bcdf-d8c29e0d0efd', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":11,\"nombre_vacante\":\"React Developer\",\"usuario_id\":7}', '2022-09-07 18:52:58', '2022-09-07 18:50:41', '2022-09-07 18:52:58'),
('dbaa6548-b4c6-4b6c-8cf5-dabbee22e314', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":11,\"nombre_vacante\":\"React Developer\",\"usuario_id\":9}', '2022-09-07 18:52:08', '2022-09-07 18:37:58', '2022-09-07 18:52:08'),
('df0976f3-8cca-48c8-867a-0538967087cd', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":11,\"nombre_vacante\":\"React Developer\",\"usuario_id\":7}', '2022-09-07 18:52:08', '2022-09-07 16:48:25', '2022-09-07 18:52:08'),
('fdd5e152-6245-4330-8ed1-1fde458ac54c', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":11,\"nombre_vacante\":\"React Developer\",\"usuario_id\":7}', '2022-09-07 18:52:08', '2022-09-07 18:50:39', '2022-09-07 18:52:08');





INSERT INTO `salarios` (`id`, `salario`, `created_at`, `updated_at`) VALUES
(1, '0€ - 499€', '2022-09-02 18:35:04', '2022-09-02 18:35:04');
INSERT INTO `salarios` (`id`, `salario`, `created_at`, `updated_at`) VALUES
(2, '500€ - 749€', '2022-09-02 18:35:04', '2022-09-02 18:35:04');
INSERT INTO `salarios` (`id`, `salario`, `created_at`, `updated_at`) VALUES
(3, '750€ - 999€', '2022-09-02 18:35:04', '2022-09-02 18:35:04');
INSERT INTO `salarios` (`id`, `salario`, `created_at`, `updated_at`) VALUES
(4, '1000€ - 1499€', '2022-09-02 18:35:04', '2022-09-02 18:35:04'),
(5, '1500€ - 1999€', '2022-09-02 18:35:04', '2022-09-02 18:35:04'),
(6, '2000€ - 2499€', '2022-09-02 18:35:04', '2022-09-02 18:35:04'),
(7, '2500€ - 2999€', '2022-09-02 18:35:04', '2022-09-02 18:35:04'),
(8, '3000€ - 4999€', '2022-09-02 18:35:04', '2022-09-02 18:35:04'),
(9, '+5000€', '2022-09-02 18:35:04', '2022-09-02 18:35:04');

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `rol`) VALUES
(5, 'Alvaro', 'correo@correo.com', '2022-09-01 17:41:41', '$2y$10$BbGhybx0WA3s.P0GGjpHx.D6K84sLdQwDxjO9LGLTKevGrkhbNsFq', NULL, '2022-09-01 17:38:46', '2022-09-01 17:41:41', 2);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `rol`) VALUES
(7, 'Jorge', 'correo2@correo.com', '2022-09-05 19:09:56', '$2y$10$Xi/1XXI2JHZJ/z3RG5uCQ.AYhMyeSwKxPqvgI.fLE2FhtfSwXONo2', NULL, '2022-09-05 19:09:10', '2022-09-05 19:09:56', 1);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `rol`) VALUES
(8, 'Paula', 'correo3@correo.com', '2022-09-05 19:10:36', '$2y$10$nq62kprNCkeJejnTiaQ5nOt7Pn4QA9GxJ4BH8pafzheN.pFe7/UOO', NULL, '2022-09-05 19:10:32', '2022-09-05 19:10:36', 2);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `rol`) VALUES
(9, 'Juan', 'correo4@correo.com', '2022-09-05 19:11:37', '$2y$10$6C.iNuCKtD1Nh4rjA5IHpuETehIR.5F4kvyQ9N8iOaBm88wX7.dOe', NULL, '2022-09-05 19:11:22', '2022-09-05 19:11:37', 1);

INSERT INTO `vacantes` (`id`, `created_at`, `updated_at`, `titulo`, `salario_id`, `categoria_id`, `empresa`, `fecha_limite`, `descripcion`, `imagen`, `publicado`, `user_id`) VALUES
(11, '2022-09-05 19:14:48', '2022-09-05 19:19:52', 'React Developer', 7, 2, 'Uber', '2022-10-01', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse rhoncus, lectus ut condimentum laoreet, urna metus imperdiet diam, ac luctus augue erat dignissim eros. Nullam consectetur eros vel ultrices malesuada.', 'NL9irne8rz3eH3b1AoUEoh6pWhDCoBFj4uHpDboD.png', 1, 5);
INSERT INTO `vacantes` (`id`, `created_at`, `updated_at`, `titulo`, `salario_id`, `categoria_id`, `empresa`, `fecha_limite`, `descripcion`, `imagen`, `publicado`, `user_id`) VALUES
(12, '2022-09-05 19:19:12', '2022-09-05 19:19:12', 'Python Back End Developer', 8, 1, 'Netflix', '2022-09-30', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse rhoncus, lectus ut condimentum laoreet, urna metus imperdiet diam, ac luctus augue erat dignissim eros. Donec aliquam ullamcorper molestie. Nam nec semper nibh, quis rhoncus nulla. Sed ut tortor eu purus convallis tempus.', 'vjn45QVSYGyAv3KI432nNiyi0bXrXnXTfjSycYSN.jpg', 1, 5);
INSERT INTO `vacantes` (`id`, `created_at`, `updated_at`, `titulo`, `salario_id`, `categoria_id`, `empresa`, `fecha_limite`, `descripcion`, `imagen`, `publicado`, `user_id`) VALUES
(13, '2022-09-08 13:19:01', '2022-09-08 13:20:41', 'Laravel Full Stack Developer ', 6, 7, 'Sony', '2022-10-30', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultricies auctor commodo. Fusce nec aliquet dolor. Aliquam ut nulla condimentum, tristique sem a, suscipit tellus. Morbi consequat luctus ultrices. Vestibulum ac mollis massa. Ut augue dui, elementum rhoncus nisl pretium, volutpat luctus orci. Nullam diam nulla, tincidunt id congue eget, aliquam in libero. Morbi ligula urna, elementum placerat sapien a, viverra aliquam lacus.', 'WBxucBjosjRYRwwphuu1teU9WXbpEKUsM6jcYk8Q.jpg', 1, 5);
INSERT INTO `vacantes` (`id`, `created_at`, `updated_at`, `titulo`, `salario_id`, `categoria_id`, `empresa`, `fecha_limite`, `descripcion`, `imagen`, `publicado`, `user_id`) VALUES
(14, '2022-09-08 13:22:57', '2022-09-08 13:22:57', 'Computer network architects', 8, 6, 'Tesla', '2022-11-30', 'Etiam in egestas tellus, id feugiat neque. Donec porttitor viverra malesuada. Duis bibendum ut mauris sit amet bibendum. Donec vel felis quis sapien lacinia tempus. Praesent rutrum imperdiet nibh, sit amet ultrices erat pharetra et. Curabitur faucibus euismod nisl, sit amet scelerisque eros dictum eget.', '7hNj23wHyP4gYtDsvgVYtAsH7a1Kk5PvfCr1I7Zw.jpg', 1, 8),
(15, '2022-09-08 13:24:19', '2022-09-08 13:24:19', 'Information security analysts', 9, 1, 'SpaceX', '2022-11-30', 'Donec pulvinar aliquet ante vel dignissim. Aenean vel mollis erat. Quisque ac erat ut turpis gravida aliquam a ut enim. Mauris accumsan lectus nibh, eu scelerisque tellus viverra ut. Etiam porttitor, nisl nec dignissim gravida, magna neque imperdiet dui, et tempor leo leo sed sapien. Suspendisse laoreet ac metus vel fermentum. Sed semper, nunc eget luctus ultrices, diam libero consectetur nulla, at elementum metus mauris id nisl.', 'J1Dahe9p1B1qZ0E5IniE4c5Y0oiVv3EeL8rlhWCL.jpg', 1, 8);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;