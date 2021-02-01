-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 17 2020 г., 22:13
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `medrum`
--

-- --------------------------------------------------------

--
-- Структура таблицы `backend_access_log`
--

CREATE TABLE `backend_access_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_access_log`
--

INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 1, '127.0.0.1', '2020-12-17 14:19:51', '2020-12-17 14:19:51');

-- --------------------------------------------------------

--
-- Структура таблицы `backend_users`
--

CREATE TABLE `backend_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_activated` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_users`
--

INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `role_id`, `activated_at`, `last_login`, `created_at`, `updated_at`, `deleted_at`, `is_superuser`) VALUES
(1, 'Admin', 'Person', 'admin', 'admin@domain.tld', '$2y$10$AJWXsm3jf6rFf19rCO0xyOWIFG6aKqF2gvSyumq85XIICuCmbW1Gq', NULL, '$2y$10$QcXOvw0fY59Zz.0KCJff.uANpwdKL67NPC4AzI5PnjFWQKacOpequ', NULL, '', 1, 2, NULL, '2020-12-17 14:19:50', '2020-12-17 14:11:42', '2020-12-17 14:19:50', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `backend_users_groups`
--

CREATE TABLE `backend_users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_users_groups`
--

INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_groups`
--

CREATE TABLE `backend_user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_user_groups`
--

INSERT INTO `backend_user_groups` (`id`, `name`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
(1, 'Owners', '2020-12-17 14:11:42', '2020-12-17 14:11:42', 'owners', 'Default group for website owners.', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_preferences`
--

CREATE TABLE `backend_user_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_user_preferences`
--

INSERT INTO `backend_user_preferences` (`id`, `user_id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 1, 'backend', 'backend', 'preferences', '{\"locale\":\"ru\",\"fallback_locale\":\"en\",\"timezone\":\"UTC\",\"editor_font_size\":\"12\",\"editor_word_wrap\":\"fluid\",\"editor_code_folding\":\"manual\",\"editor_tab_size\":\"4\",\"editor_theme\":\"twilight\",\"editor_show_invisibles\":\"0\",\"editor_highlight_active_line\":\"1\",\"editor_use_hard_tabs\":\"0\",\"editor_show_gutter\":\"1\",\"editor_auto_closing\":\"0\",\"editor_autocompletion\":\"manual\",\"editor_enable_snippets\":\"0\",\"editor_display_indent_guides\":\"0\",\"editor_show_print_margin\":\"0\",\"user_id\":1}');

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_roles`
--

CREATE TABLE `backend_user_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_user_roles`
--

INSERT INTO `backend_user_roles` (`id`, `name`, `code`, `description`, `permissions`, `is_system`, `created_at`, `updated_at`) VALUES
(1, 'Publisher', 'publisher', 'Site editor with access to publishing tools.', '', 1, '2020-12-17 14:11:42', '2020-12-17 14:11:42'),
(2, 'Developer', 'developer', 'Site administrator with access to developer tools.', '', 1, '2020-12-17 14:11:42', '2020-12-17 14:11:42');

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_throttle`
--

CREATE TABLE `backend_user_throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT 0,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT 0,
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_user_throttle`
--

INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
(1, 1, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_theme_data`
--

CREATE TABLE `cms_theme_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_theme_logs`
--

CREATE TABLE `cms_theme_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_theme_templates`
--

CREATE TABLE `cms_theme_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int(10) UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `deferred_bindings`
--

CREATE TABLE `deferred_bindings` (
  `id` int(10) UNSIGNED NOT NULL,
  `master_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_10_01_000001_Db_Deferred_Bindings', 1),
(2, '2013_10_01_000002_Db_System_Files', 1),
(3, '2013_10_01_000003_Db_System_Plugin_Versions', 1),
(4, '2013_10_01_000004_Db_System_Plugin_History', 1),
(5, '2013_10_01_000005_Db_System_Settings', 1),
(6, '2013_10_01_000006_Db_System_Parameters', 1),
(7, '2013_10_01_000007_Db_System_Add_Disabled_Flag', 1),
(8, '2013_10_01_000008_Db_System_Mail_Templates', 1),
(9, '2013_10_01_000009_Db_System_Mail_Layouts', 1),
(10, '2014_10_01_000010_Db_Jobs', 1),
(11, '2014_10_01_000011_Db_System_Event_Logs', 1),
(12, '2014_10_01_000012_Db_System_Request_Logs', 1),
(13, '2014_10_01_000013_Db_System_Sessions', 1),
(14, '2015_10_01_000014_Db_System_Mail_Layout_Rename', 1),
(15, '2015_10_01_000015_Db_System_Add_Frozen_Flag', 1),
(16, '2015_10_01_000016_Db_Cache', 1),
(17, '2015_10_01_000017_Db_System_Revisions', 1),
(18, '2015_10_01_000018_Db_FailedJobs', 1),
(19, '2016_10_01_000019_Db_System_Plugin_History_Detail_Text', 1),
(20, '2016_10_01_000020_Db_System_Timestamp_Fix', 1),
(21, '2017_08_04_121309_Db_Deferred_Bindings_Add_Index_Session', 1),
(22, '2017_10_01_000021_Db_System_Sessions_Update', 1),
(23, '2017_10_01_000022_Db_Jobs_FailedJobs_Update', 1),
(24, '2017_10_01_000023_Db_System_Mail_Partials', 1),
(25, '2017_10_23_000024_Db_System_Mail_Layouts_Add_Options_Field', 1),
(26, '2013_10_01_000001_Db_Backend_Users', 2),
(27, '2013_10_01_000002_Db_Backend_User_Groups', 2),
(28, '2013_10_01_000003_Db_Backend_Users_Groups', 2),
(29, '2013_10_01_000004_Db_Backend_User_Throttle', 2),
(30, '2014_01_04_000005_Db_Backend_User_Preferences', 2),
(31, '2014_10_01_000006_Db_Backend_Access_Log', 2),
(32, '2014_10_01_000007_Db_Backend_Add_Description_Field', 2),
(33, '2015_10_01_000008_Db_Backend_Add_Superuser_Flag', 2),
(34, '2016_10_01_000009_Db_Backend_Timestamp_Fix', 2),
(35, '2017_10_01_000010_Db_Backend_User_Roles', 2),
(36, '2018_12_16_000011_Db_Backend_Add_Deleted_At', 2),
(37, '2014_10_01_000001_Db_Cms_Theme_Data', 3),
(38, '2016_10_01_000002_Db_Cms_Timestamp_Fix', 3),
(39, '2017_10_01_000003_Db_Cms_Theme_Logs', 3),
(40, '2018_11_01_000001_Db_Cms_Theme_Templates', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `rainlab_blog_categories`
--

CREATE TABLE `rainlab_blog_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `rainlab_blog_posts`
--

CREATE TABLE `rainlab_blog_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `rainlab_blog_posts_categories`
--

CREATE TABLE `rainlab_blog_posts_categories` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_activity` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_event_logs`
--

CREATE TABLE `system_event_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_files`
--

CREATE TABLE `system_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_mail_layouts`
--

CREATE TABLE `system_mail_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_css` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_mail_layouts`
--

INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `options`, `created_at`, `updated_at`) VALUES
(1, 'Default layout', 'default', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-default\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ \"now\"|date(\"Y\") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>', '{{ content|raw }}', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2020-12-17 14:11:42', '2020-12-17 14:11:42'),
(2, 'System layout', 'system', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-system\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2020-12-17 14:11:42', '2020-12-17 14:11:42');

-- --------------------------------------------------------

--
-- Структура таблицы `system_mail_partials`
--

CREATE TABLE `system_mail_partials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_mail_templates`
--

CREATE TABLE `system_mail_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_parameters`
--

CREATE TABLE `system_parameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_parameters`
--

INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 'system', 'update', 'count', '0'),
(2, 'system', 'core', 'hash', '\"09e97b374096a78701452e3faa8ceba1\"'),
(3, 'system', 'core', 'build', '\"471\"'),
(4, 'cms', 'theme', 'active', '\"medrum\"'),
(5, 'system', 'update', 'retry', '1608313594');

-- --------------------------------------------------------

--
-- Структура таблицы `system_plugin_history`
--

CREATE TABLE `system_plugin_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_plugin_history`
--

INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
(1, 'October.Demo', 'comment', '1.0.1', 'First version of Demo', '2020-12-17 14:11:42'),
(2, 'RainLab.Blog', 'script', '1.0.1', 'create_posts_table.php', '2020-12-17 14:20:40'),
(3, 'RainLab.Blog', 'script', '1.0.1', 'create_categories_table.php', '2020-12-17 14:20:41'),
(4, 'RainLab.Blog', 'script', '1.0.1', 'seed_all_tables.php', '2020-12-17 14:20:41'),
(5, 'RainLab.Blog', 'comment', '1.0.1', 'Initialize plugin.', '2020-12-17 14:20:41'),
(6, 'RainLab.Blog', 'comment', '1.0.2', 'Added the processed HTML content column to the posts table.', '2020-12-17 14:20:41'),
(7, 'RainLab.Blog', 'comment', '1.0.3', 'Category component has been merged with Posts component.', '2020-12-17 14:20:41'),
(8, 'RainLab.Blog', 'comment', '1.0.4', 'Improvements to the Posts list management UI.', '2020-12-17 14:20:41'),
(9, 'RainLab.Blog', 'comment', '1.0.5', 'Removes the Author column from blog post list.', '2020-12-17 14:20:41'),
(10, 'RainLab.Blog', 'comment', '1.0.6', 'Featured images now appear in the Post component.', '2020-12-17 14:20:41'),
(11, 'RainLab.Blog', 'comment', '1.0.7', 'Added support for the Static Pages menus.', '2020-12-17 14:20:41'),
(12, 'RainLab.Blog', 'comment', '1.0.8', 'Added total posts to category list.', '2020-12-17 14:20:41'),
(13, 'RainLab.Blog', 'comment', '1.0.9', 'Added support for the Sitemap plugin.', '2020-12-17 14:20:41'),
(14, 'RainLab.Blog', 'comment', '1.0.10', 'Added permission to prevent users from seeing posts they did not create.', '2020-12-17 14:20:41'),
(15, 'RainLab.Blog', 'comment', '1.0.11', 'Deprecate \"idParam\" component property in favour of \"slug\" property.', '2020-12-17 14:20:41'),
(16, 'RainLab.Blog', 'comment', '1.0.12', 'Fixes issue where images cannot be uploaded caused by latest Markdown library.', '2020-12-17 14:20:41'),
(17, 'RainLab.Blog', 'comment', '1.0.13', 'Fixes problem with providing pages to Sitemap and Pages plugins.', '2020-12-17 14:20:41'),
(18, 'RainLab.Blog', 'comment', '1.0.14', 'Add support for CSRF protection feature added to core.', '2020-12-17 14:20:41'),
(19, 'RainLab.Blog', 'comment', '1.1.0', 'Replaced the Post editor with the new core Markdown editor.', '2020-12-17 14:20:41'),
(20, 'RainLab.Blog', 'comment', '1.1.1', 'Posts can now be imported and exported.', '2020-12-17 14:20:41'),
(21, 'RainLab.Blog', 'comment', '1.1.2', 'Posts are no longer visible if the published date has not passed.', '2020-12-17 14:20:41'),
(22, 'RainLab.Blog', 'comment', '1.1.3', 'Added a New Post shortcut button to the blog menu.', '2020-12-17 14:20:41'),
(23, 'RainLab.Blog', 'script', '1.2.0', 'categories_add_nested_fields.php', '2020-12-17 14:20:41'),
(24, 'RainLab.Blog', 'comment', '1.2.0', 'Categories now support nesting.', '2020-12-17 14:20:41'),
(25, 'RainLab.Blog', 'comment', '1.2.1', 'Post slugs now must be unique.', '2020-12-17 14:20:41'),
(26, 'RainLab.Blog', 'comment', '1.2.2', 'Fixes issue on new installs.', '2020-12-17 14:20:41'),
(27, 'RainLab.Blog', 'comment', '1.2.3', 'Minor user interface update.', '2020-12-17 14:20:41'),
(28, 'RainLab.Blog', 'script', '1.2.4', 'update_timestamp_nullable.php', '2020-12-17 14:20:41'),
(29, 'RainLab.Blog', 'comment', '1.2.4', 'Database maintenance. Updated all timestamp columns to be nullable.', '2020-12-17 14:20:41'),
(30, 'RainLab.Blog', 'comment', '1.2.5', 'Added translation support for blog posts.', '2020-12-17 14:20:41'),
(31, 'RainLab.Blog', 'comment', '1.2.6', 'The published field can now supply a time with the date.', '2020-12-17 14:20:41'),
(32, 'RainLab.Blog', 'comment', '1.2.7', 'Introduced a new RSS feed component.', '2020-12-17 14:20:41'),
(33, 'RainLab.Blog', 'comment', '1.2.8', 'Fixes issue with translated `content_html` attribute on blog posts.', '2020-12-17 14:20:41'),
(34, 'RainLab.Blog', 'comment', '1.2.9', 'Added translation support for blog categories.', '2020-12-17 14:20:41'),
(35, 'RainLab.Blog', 'comment', '1.2.10', 'Added translation support for post slugs.', '2020-12-17 14:20:41'),
(36, 'RainLab.Blog', 'comment', '1.2.11', 'Fixes bug where excerpt is not translated.', '2020-12-17 14:20:41'),
(37, 'RainLab.Blog', 'comment', '1.2.12', 'Description field added to category form.', '2020-12-17 14:20:41'),
(38, 'RainLab.Blog', 'comment', '1.2.13', 'Improved support for Static Pages menus, added a blog post and all blog posts.', '2020-12-17 14:20:41'),
(39, 'RainLab.Blog', 'comment', '1.2.14', 'Added post exception property to the post list component, useful for showing related posts.', '2020-12-17 14:20:41'),
(40, 'RainLab.Blog', 'comment', '1.2.15', 'Back-end navigation sort order updated.', '2020-12-17 14:20:41'),
(41, 'RainLab.Blog', 'comment', '1.2.16', 'Added `nextPost` and `previousPost` to the blog post component.', '2020-12-17 14:20:41'),
(42, 'RainLab.Blog', 'comment', '1.2.17', 'Improved the next and previous logic to sort by the published date.', '2020-12-17 14:20:41'),
(43, 'RainLab.Blog', 'comment', '1.2.18', 'Minor change to internals.', '2020-12-17 14:20:41'),
(44, 'RainLab.Blog', 'comment', '1.2.19', 'Improved support for Build 420+', '2020-12-17 14:20:41'),
(45, 'RainLab.Blog', 'script', '1.3.0', 'posts_add_metadata.php', '2020-12-17 14:20:41'),
(46, 'RainLab.Blog', 'comment', '1.3.0', 'Added metadata column for plugins to store data in', '2020-12-17 14:20:41'),
(47, 'RainLab.Blog', 'comment', '1.3.1', 'Fixed metadata column not being jsonable', '2020-12-17 14:20:41'),
(48, 'RainLab.Blog', 'comment', '1.3.2', 'Allow custom slug name for components, add 404 handling for missing blog posts, allow exporting of blog images.', '2020-12-17 14:20:41'),
(49, 'RainLab.Blog', 'comment', '1.3.3', 'Fixed \'excluded categories\' filter from being run when value is empty.', '2020-12-17 14:20:41'),
(50, 'RainLab.Blog', 'comment', '1.3.4', 'Allow post author to be specified. Improved translations.', '2020-12-17 14:20:41'),
(51, 'RainLab.Blog', 'comment', '1.3.5', 'Fixed missing user info from breaking initial seeder in migrations. Fixed a PostgreSQL issue with blog exports.', '2020-12-17 14:20:41'),
(52, 'RainLab.Blog', 'comment', '1.3.6', 'Improved French translations.', '2020-12-17 14:20:41'),
(53, 'RainLab.Blog', 'comment', '1.4.0', 'Stability improvements. Rollback custom slug names for components', '2020-12-17 14:20:41'),
(54, 'RainLab.Blog', 'comment', '1.4.1', 'Fixes potential security issue with unsafe Markdown. Allow blog bylines to be translated.', '2020-12-17 14:20:41'),
(55, 'RainLab.Blog', 'comment', '1.4.2', 'Fix 404 redirects for missing blog posts. Assign current category to the listed posts when using the Posts component on a page with the category parameter available.', '2020-12-17 14:20:41'),
(56, 'RainLab.Blog', 'comment', '1.4.3', 'Fixes incompatibility with locale switching when plugin is used in conjunction with the Translate plugin. Fixes undefined category error.', '2020-12-17 14:20:41'),
(57, 'RainLab.Pages', 'comment', '1.0.1', 'Implemented the static pages management and the Static Page component.', '2020-12-17 14:21:13'),
(58, 'RainLab.Pages', 'comment', '1.0.2', 'Fixed the page preview URL.', '2020-12-17 14:21:13'),
(59, 'RainLab.Pages', 'comment', '1.0.3', 'Implemented menus.', '2020-12-17 14:21:13'),
(60, 'RainLab.Pages', 'comment', '1.0.4', 'Implemented the content block management and placeholder support.', '2020-12-17 14:21:13'),
(61, 'RainLab.Pages', 'comment', '1.0.5', 'Added support for the Sitemap plugin.', '2020-12-17 14:21:13'),
(62, 'RainLab.Pages', 'comment', '1.0.6', 'Minor updates to the internal API.', '2020-12-17 14:21:13'),
(63, 'RainLab.Pages', 'comment', '1.0.7', 'Added the Snippets feature.', '2020-12-17 14:21:13'),
(64, 'RainLab.Pages', 'comment', '1.0.8', 'Minor improvements to the code.', '2020-12-17 14:21:13'),
(65, 'RainLab.Pages', 'comment', '1.0.9', 'Fixes issue where Snippet tab is missing from the Partials form.', '2020-12-17 14:21:13'),
(66, 'RainLab.Pages', 'comment', '1.0.10', 'Add translations for various locales.', '2020-12-17 14:21:13'),
(67, 'RainLab.Pages', 'comment', '1.0.11', 'Fixes issue where placeholders tabs were missing from Page form.', '2020-12-17 14:21:13'),
(68, 'RainLab.Pages', 'comment', '1.0.12', 'Implement Media Manager support.', '2020-12-17 14:21:13'),
(69, 'RainLab.Pages', 'script', '1.1.0', 'snippets_rename_viewbag_properties.php', '2020-12-17 14:21:13'),
(70, 'RainLab.Pages', 'comment', '1.1.0', 'Adds meta title and description to pages. Adds |staticPage filter.', '2020-12-17 14:21:13'),
(71, 'RainLab.Pages', 'comment', '1.1.1', 'Add support for Syntax Fields.', '2020-12-17 14:21:13'),
(72, 'RainLab.Pages', 'comment', '1.1.2', 'Static Breadcrumbs component now respects the hide from navigation setting.', '2020-12-17 14:21:13'),
(73, 'RainLab.Pages', 'comment', '1.1.3', 'Minor back-end styling fix.', '2020-12-17 14:21:13'),
(74, 'RainLab.Pages', 'comment', '1.1.4', 'Minor fix to the StaticPage component API.', '2020-12-17 14:21:13'),
(75, 'RainLab.Pages', 'comment', '1.1.5', 'Fixes bug when using syntax fields.', '2020-12-17 14:21:13'),
(76, 'RainLab.Pages', 'comment', '1.1.6', 'Minor styling fix to the back-end UI.', '2020-12-17 14:21:13'),
(77, 'RainLab.Pages', 'comment', '1.1.7', 'Improved menu item form to include CSS class, open in a new window and hidden flag.', '2020-12-17 14:21:13'),
(78, 'RainLab.Pages', 'comment', '1.1.8', 'Improved the output of snippet partials when saved.', '2020-12-17 14:21:13'),
(79, 'RainLab.Pages', 'comment', '1.1.9', 'Minor update to snippet inspector internal API.', '2020-12-17 14:21:13'),
(80, 'RainLab.Pages', 'comment', '1.1.10', 'Fixes a bug where selecting a layout causes permanent unsaved changes.', '2020-12-17 14:21:13'),
(81, 'RainLab.Pages', 'comment', '1.1.11', 'Add support for repeater syntax field.', '2020-12-17 14:21:13'),
(82, 'RainLab.Pages', 'comment', '1.2.0', 'Added support for translations, UI updates.', '2020-12-17 14:21:13'),
(83, 'RainLab.Pages', 'comment', '1.2.1', 'Use nice titles when listing the content files.', '2020-12-17 14:21:13'),
(84, 'RainLab.Pages', 'comment', '1.2.2', 'Minor styling update.', '2020-12-17 14:21:13'),
(85, 'RainLab.Pages', 'comment', '1.2.3', 'Snippets can now be moved by dragging them.', '2020-12-17 14:21:13'),
(86, 'RainLab.Pages', 'comment', '1.2.4', 'Fixes a bug where the cursor is misplaced when editing text files.', '2020-12-17 14:21:13'),
(87, 'RainLab.Pages', 'comment', '1.2.5', 'Fixes a bug where the parent page is lost upon changing a page layout.', '2020-12-17 14:21:13'),
(88, 'RainLab.Pages', 'comment', '1.2.6', 'Shared view variables are now passed to static pages.', '2020-12-17 14:21:13'),
(89, 'RainLab.Pages', 'comment', '1.2.7', 'Fixes issue with duplicating properties when adding multiple snippets on the same page.', '2020-12-17 14:21:13'),
(90, 'RainLab.Pages', 'comment', '1.2.8', 'Fixes a bug where creating a content block without extension doesn\'t save the contents to file.', '2020-12-17 14:21:13'),
(91, 'RainLab.Pages', 'comment', '1.2.9', 'Add conditional support for translating page URLs.', '2020-12-17 14:21:13'),
(92, 'RainLab.Pages', 'comment', '1.2.10', 'Streamline generation of URLs to use the new Cms::url helper.', '2020-12-17 14:21:13'),
(93, 'RainLab.Pages', 'comment', '1.2.11', 'Implements repeater usage with translate plugin.', '2020-12-17 14:21:13'),
(94, 'RainLab.Pages', 'comment', '1.2.12', 'Fixes minor issue when using snippets and switching the application locale.', '2020-12-17 14:21:13'),
(95, 'RainLab.Pages', 'comment', '1.2.13', 'Fixes bug when AJAX is used on a page that does not yet exist.', '2020-12-17 14:21:13'),
(96, 'RainLab.Pages', 'comment', '1.2.14', 'Add theme logging support for changes made to menus.', '2020-12-17 14:21:13'),
(97, 'RainLab.Pages', 'comment', '1.2.15', 'Back-end navigation sort order updated.', '2020-12-17 14:21:13'),
(98, 'RainLab.Pages', 'comment', '1.2.16', 'Fixes a bug when saving a template that has been modified outside of the CMS (mtime mismatch).', '2020-12-17 14:21:13'),
(99, 'RainLab.Pages', 'comment', '1.2.17', 'Changes locations of custom fields to secondary tabs instead of the primary Settings area. New menu search ability on adding menu items', '2020-12-17 14:21:13'),
(100, 'RainLab.Pages', 'comment', '1.2.18', 'Fixes cache-invalidation issues when RainLab.Translate is not installed. Added Greek & Simplified Chinese translations. Removed deprecated calls. Allowed saving HTML in snippet properties. Added support for the MediaFinder in menu items.', '2020-12-17 14:21:13'),
(101, 'RainLab.Pages', 'comment', '1.2.19', 'Catch exception with corrupted menu file.', '2020-12-17 14:21:13'),
(102, 'RainLab.Pages', 'comment', '1.2.20', 'StaticMenu component now exposes menuName property; added pages.menu.referencesGenerated event.', '2020-12-17 14:21:13'),
(103, 'RainLab.Pages', 'comment', '1.2.21', 'Fixes a bug where last Static Menu item cannot be deleted. Improved Persian, Slovak and Turkish translations.', '2020-12-17 14:21:13'),
(104, 'RainLab.Pages', 'comment', '1.3.0', 'Added support for using Database-driven Themes when enabled in the CMS configuration.', '2020-12-17 14:21:13'),
(105, 'RainLab.Pages', 'comment', '1.3.1', 'Added ChildPages Component, prevent hidden pages from being returned via menu item resolver.', '2020-12-17 14:21:13'),
(106, 'RainLab.Pages', 'comment', '1.3.2', 'Fixes error when creating a subpage whose parent has no layout set.', '2020-12-17 14:21:13'),
(107, 'RainLab.Pages', 'comment', '1.3.3', 'Improves user experience for users with only partial access through permissions', '2020-12-17 14:21:13'),
(108, 'RainLab.Pages', 'comment', '1.3.4', 'Fix error where large menus were being truncated due to the PHP \"max_input_vars\" configuration value. Improved Slovenian translation.', '2020-12-17 14:21:13'),
(109, 'RainLab.Pages', 'comment', '1.3.5', 'Minor fix to bust the browser cache for JS assets. Prevent duplicate property fields in snippet inspector.', '2020-12-17 14:21:13'),
(110, 'RainLab.Pages', 'comment', '1.3.6', 'ChildPages component now displays localized page titles from Translate plugin.', '2020-12-17 14:21:13');

-- --------------------------------------------------------

--
-- Структура таблицы `system_plugin_versions`
--

CREATE TABLE `system_plugin_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_frozen` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_plugin_versions`
--

INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
(1, 'October.Demo', '1.0.1', '2020-12-17 14:11:42', 0, 0),
(2, 'RainLab.Blog', '1.4.3', '2020-12-17 14:20:41', 0, 0),
(3, 'RainLab.Pages', '1.3.6', '2020-12-17 14:21:13', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `system_request_logs`
--

CREATE TABLE `system_request_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_revisions`
--

CREATE TABLE `system_revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `backend_access_log`
--
ALTER TABLE `backend_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `backend_users`
--
ALTER TABLE `backend_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_unique` (`login`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD KEY `act_code_index` (`activation_code`),
  ADD KEY `reset_code_index` (`reset_password_code`),
  ADD KEY `admin_role_index` (`role_id`);

--
-- Индексы таблицы `backend_users_groups`
--
ALTER TABLE `backend_users_groups`
  ADD PRIMARY KEY (`user_id`,`user_group_id`);

--
-- Индексы таблицы `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_unique` (`name`),
  ADD KEY `code_index` (`code`);

--
-- Индексы таблицы `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`);

--
-- Индексы таблицы `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_unique` (`name`),
  ADD KEY `role_code_index` (`code`);

--
-- Индексы таблицы `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `backend_user_throttle_user_id_index` (`user_id`),
  ADD KEY `backend_user_throttle_ip_address_index` (`ip_address`);

--
-- Индексы таблицы `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Индексы таблицы `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_data_theme_index` (`theme`);

--
-- Индексы таблицы `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_logs_type_index` (`type`),
  ADD KEY `cms_theme_logs_theme_index` (`theme`),
  ADD KEY `cms_theme_logs_user_id_index` (`user_id`);

--
-- Индексы таблицы `cms_theme_templates`
--
ALTER TABLE `cms_theme_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_templates_source_index` (`source`),
  ADD KEY `cms_theme_templates_path_index` (`path`);

--
-- Индексы таблицы `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deferred_bindings_master_type_index` (`master_type`),
  ADD KEY `deferred_bindings_master_field_index` (`master_field`),
  ADD KEY `deferred_bindings_slave_type_index` (`slave_type`),
  ADD KEY `deferred_bindings_slave_id_index` (`slave_id`),
  ADD KEY `deferred_bindings_session_key_index` (`session_key`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rainlab_blog_categories`
--
ALTER TABLE `rainlab_blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_categories_slug_index` (`slug`),
  ADD KEY `rainlab_blog_categories_parent_id_index` (`parent_id`);

--
-- Индексы таблицы `rainlab_blog_posts`
--
ALTER TABLE `rainlab_blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  ADD KEY `rainlab_blog_posts_slug_index` (`slug`);

--
-- Индексы таблицы `rainlab_blog_posts_categories`
--
ALTER TABLE `rainlab_blog_posts_categories`
  ADD PRIMARY KEY (`post_id`,`category_id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Индексы таблицы `system_event_logs`
--
ALTER TABLE `system_event_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_event_logs_level_index` (`level`);

--
-- Индексы таблицы `system_files`
--
ALTER TABLE `system_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_files_field_index` (`field`),
  ADD KEY `system_files_attachment_id_index` (`attachment_id`),
  ADD KEY `system_files_attachment_type_index` (`attachment_type`);

--
-- Индексы таблицы `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_mail_templates_layout_id_index` (`layout_id`);

--
-- Индексы таблицы `system_parameters`
--
ALTER TABLE `system_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_index` (`namespace`,`group`,`item`);

--
-- Индексы таблицы `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_history_code_index` (`code`),
  ADD KEY `system_plugin_history_type_index` (`type`);

--
-- Индексы таблицы `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_versions_code_index` (`code`);

--
-- Индексы таблицы `system_request_logs`
--
ALTER TABLE `system_request_logs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `system_revisions`
--
ALTER TABLE `system_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  ADD KEY `system_revisions_user_id_index` (`user_id`),
  ADD KEY `system_revisions_field_index` (`field`);

--
-- Индексы таблицы `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_settings_item_index` (`item`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `backend_access_log`
--
ALTER TABLE `backend_access_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `backend_users`
--
ALTER TABLE `backend_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cms_theme_templates`
--
ALTER TABLE `cms_theme_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблицы `rainlab_blog_categories`
--
ALTER TABLE `rainlab_blog_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `rainlab_blog_posts`
--
ALTER TABLE `rainlab_blog_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `system_event_logs`
--
ALTER TABLE `system_event_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_files`
--
ALTER TABLE `system_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_parameters`
--
ALTER TABLE `system_parameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT для таблицы `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `system_request_logs`
--
ALTER TABLE `system_request_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_revisions`
--
ALTER TABLE `system_revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
