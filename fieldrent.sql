-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 21 Okt 2021 pada 09.32
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fieldrent`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `access_menu`
--

CREATE TABLE `access_menu` (
  `id_access` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `access_menu`
--

INSERT INTO `access_menu` (`id_access`, `id_menu`, `level`, `created_at`, `updated_at`, `deleted_at`, `id_user`) VALUES
(16, 1, 1, '2021-10-18 22:47:33', NULL, NULL, 1),
(17, 2, 1, '2021-10-18 22:47:33', NULL, NULL, 1),
(18, 3, 1, '2021-10-18 22:47:33', NULL, NULL, 1);
-- --------------------------------------------------------

--
-- Struktur dari tabel `booking_fields`
--


-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `id_customer` int(11) NOT NULL,
  `customer_code` varchar(10) NOT NULL,
  `customer_name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fields`
--

CREATE TABLE `fields` (
  `id_field` int(11) NOT NULL,
  `field_name` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `fields`
--

INSERT INTO `fields` (`id_field`, `field_name`, `price`, `note`, `created_at`, `updated_at`, `deleted_at`, `id_user`) VALUES
(1, 'Lapangan Timur', 50000, 'Lapangan Timur - Rumput sintetis', '2021-10-18 21:49:15', NULL, NULL, 1),
(2, 'Lapangan Tengah', 45000, 'Lapangan Tengah - Vinyl', '2021-10-18 21:49:15', NULL, NULL, 1),
(3, 'Lapangan Barat', 65000, 'Lapangan Barat - Parquette', '2021-10-18 21:49:55', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `global_variable`
--

CREATE TABLE `global_variable` (
  `id` int(11) NOT NULL,
  `variable` varchar(40) NOT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `global_variable`
--

INSERT INTO `global_variable` (`id`, `variable`, `data`) VALUES
(1, 'default_content_menu', '<header class=\"mb-3\">\r\n                <a href=\"#\" class=\"burger-btn d-block d-xl-none\">\r\n                    <i class=\"bi bi-justify fs-3\"></i>\r\n                </a>\r\n            </header>\r\n\r\n            <div class=\"page-heading\">\r\n                <div class=\"page-title\">\r\n                    <div class=\"row\">\r\n                        <div class=\"col-12 col-md-6 order-md-1 order-last\">\r\n                            <h3><?php echo $menu ?></h3>\r\n                            <p class=\"text-subtitle text-muted\"><?php echo $description ?></p>\r\n                        </div>\r\n                        <div class=\"col-12 col-md-6 order-md-2 order-first\">\r\n                            <nav aria-label=\"breadcrumb\" class=\"breadcrumb-header float-start float-lg-end\">\r\n                                <ol class=\"breadcrumb\">\r\n                                    <li class=\"breadcrumb-item active\"><a href=\"<?php echo $menu_link ?>\"><?php echo $menu ?></a></li>\r\n                                    <!-- <li class=\"breadcrumb-item active\" aria-current=\"page\"><?php echo $submenu ?></li> -->\r\n                                </ol>\r\n                            </nav>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n                <section class=\"section\">\r\n                    <div class=\"card\">\r\n                        <div class=\"card-header\">\r\n                            <h4 class=\"card-title float-start\">List Field</h4>\r\n                            <button id=\"add\" class=\"btn btn-sm btn-outline-primary float-end\">+</button>\r\n                        </div>\r\n                        <div class=\"card-body\">\r\n                            <div class=\"table-responsive\">\r\n                                <table class=\"table table-hover\">\r\n                                    <thead>\r\n                                        <tr>\r\n                                            <th>No.</th>\r\n                                            <th>Column</th>\r\n                                            <th>Column</th>\r\n                                            <th>Column</th>\r\n                                            <th>#</th>\r\n                                        </tr>\r\n                                    </thead>\r\n                                    <tbody id=\"tbody-field\">\r\n\r\n                                    </tbody>\r\n\r\n                                </table>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </section>\r\n            </div>\r\n\r\n            <div class=\"modal fade text-left modal-borderless\" id=\"field-modal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel1\" aria-hidden=\"true\">\r\n                <div class=\"modal-dialog modal-lg\" role=\"document\">\r\n                    <div class=\"modal-content\">\r\n                        <div class=\"modal-header bg-primary\" id=\"modal-header\">\r\n                            <h5 class=\"modal-title white\" id=\"myModalLabel1\">Basic Modal</h5>\r\n                            <button type=\"button\" class=\"close rounded-pill\"\r\n                                data-bs-dismiss=\"modal\" aria-label=\"Close\">\r\n                                <i data-feather=\"x\"></i>\r\n                            </button>\r\n                        </div>\r\n                        <div class=\"modal-body\">\r\n                            <form class=\"form form-horizontal\">\r\n                                            <div class=\"form-body\">\r\n                                                <div class=\"row\">\r\n                                                    <div class=\"col-md-4\">\r\n                                                        <label>Field Name</label>\r\n                                                    </div>\r\n                                                    <div class=\"col-md-8 form-group\">\r\n                                                        <input type=\"text\" id=\"field_name\" class=\"form-control form-control-sm\"\r\n                                                            name=\"field_name\" placeholder=\"Field Name\">\r\n                                                    </div>\r\n                                                    <div class=\"col-md-4\">\r\n                                                        <label>Price</label>\r\n                                                    </div>\r\n                                                    <div class=\"col-md-8 form-group\">\r\n                                                        <input type=\"number\" id=\"price\" class=\"form-control form-control-sm\"\r\n                                                            name=\"price\" placeholder=\"0\">\r\n                                                    </div>\r\n                                                    <div class=\"col-md-4\">\r\n                                                        <label>Notes</label>\r\n                                                    </div>\r\n                                                    <div class=\"col-md-8 form-group\">\r\n                                                        <div class=\"form-floating\">\r\n                                                            <textarea class=\"form-control form-control-sm\" id=\"note\" name=\"note\" row=\"5\" placeholder=\"Leave a comment here\"\r\n                                                                id=\"floatingTextarea\"></textarea>\r\n                                                            <label for=\"floatingTextarea\">Note</label>\r\n                                                        </div>                                                    \r\n                                                    </div>\r\n                                                    <div class=\"col-md-4\">\r\n                                                        <label>Additional Picture</label>\r\n                                                    </div>\r\n                                                    <div class=\"col-md-8 form-group\">\r\n                                                        <input class=\"form-control form-control-sm\" id=\"formFileSm\" name=\"picture\" type=\"file\">\r\n\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </form>\r\n                        </div>\r\n                        <div class=\"modal-footer\">\r\n                            <button type=\"button\" class=\"btn\" data-bs-dismiss=\"modal\">\r\n                                <i class=\"bx bx-x d-block d-sm-none\"></i>\r\n                                <span class=\"d-none d-sm-block\">Close</span>\r\n                            </button>\r\n                            <button type=\"button\" class=\"btn btn-primary ml-1\"\r\n                                data-bs-dismiss=\"modal\">\r\n                                <i class=\"bx bx-check d-block d-sm-none\"></i>\r\n                                <span class=\"d-none d-sm-block\">Save</span>\r\n                            </button>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n<script>\r\n    //list data goes here.\r\n    //example url : app/master/Fields.php?f_name=get_all_fields\r\n    $.ajax({\r\n        url : \"look at example\",\r\n        type : \"GET\",\r\n        success : function(result){\r\n            $(\"#tbody-field\").html(result);\r\n        }\r\n    })\r\n\r\n    $(\"#add\").click(function(){\r\n        modalShow(\'add\');\r\n    })\r\n\r\n    // function to show modal\r\n    function modalShow(mtd){\r\n        var title;\r\n        if (mtd==\"add\") {\r\n            title = \"Add New Field\";\r\n        }else{\r\n            title = \"Edit field\";\r\n        }\r\n        $(\".modal-title\").html(title);\r\n        $(\"#field-modal\").modal(\'toggle\');\r\n    }\r\n\r\n\r\n\r\n\r\n</script>\r\n'),
(2, 'default_content_submenu', '            <header class=\"mb-3\">\r\n                <a href=\"#\" class=\"burger-btn d-block d-xl-none\">\r\n                    <i class=\"bi bi-justify fs-3\"></i>\r\n                </a>\r\n            </header>\r\n\r\n            <div class=\"page-heading\">\r\n                <div class=\"page-title\">\r\n                    <div class=\"row\">\r\n                        <div class=\"col-12 col-md-6 order-md-1 order-last\">\r\n                            <h3><?php echo $submenu ?></h3>\r\n                            <p class=\"text-subtitle text-muted\">Data Field </p>\r\n                        </div>\r\n                        <div class=\"col-12 col-md-6 order-md-2 order-first\">\r\n                            <nav aria-label=\"breadcrumb\" class=\"breadcrumb-header float-start float-lg-end\">\r\n                                <ol class=\"breadcrumb\">\r\n                                    <li class=\"breadcrumb-item\"><a href=\"<?php echo $menu_link ?>\"><?php echo $menu ?></a></li>\r\n                                    <li class=\"breadcrumb-item active\" aria-current=\"page\"><?php echo $submenu ?></li>\r\n                                </ol>\r\n                            </nav>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n                <section class=\"section\">\r\n                    <div class=\"card\">\r\n                        <div class=\"card-header\">\r\n                            <h4 class=\"card-title float-start\">List Field</h4>\r\n                            <button id=\"add\" class=\"btn btn-sm btn-outline-primary float-end\">+</button>\r\n                        </div>\r\n                        <div class=\"card-body\">\r\n                            <div class=\"table-responsive\">\r\n                                <table class=\"table table-hover\">\r\n                                    <thead>\r\n                                        <tr>\r\n                                            <th>No.</th>\r\n                                            <th>Field Name</th>\r\n                                            <th>Note</th>\r\n                                            <th>Price</th>\r\n                                            <th>#</th>\r\n                                        </tr>\r\n                                    </thead>\r\n                                    <tbody id=\"tbody-field\">\r\n\r\n                                    </tbody>\r\n\r\n                                </table>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </section>\r\n            </div>\r\n\r\n            <div class=\"modal fade text-left modal-borderless\" id=\"field-modal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel1\" aria-hidden=\"true\">\r\n                <div class=\"modal-dialog modal-lg\" role=\"document\">\r\n                    <div class=\"modal-content\">\r\n                        <div class=\"modal-header bg-primary\" id=\"modal-header\">\r\n                            <h5 class=\"modal-title white\" id=\"myModalLabel1\">Basic Modal</h5>\r\n                            <button type=\"button\" class=\"close rounded-pill\"\r\n                                data-bs-dismiss=\"modal\" aria-label=\"Close\">\r\n                                <i data-feather=\"x\"></i>\r\n                            </button>\r\n                        </div>\r\n                        <div class=\"modal-body\">\r\n                            <form class=\"form form-horizontal\">\r\n                                            <div class=\"form-body\">\r\n                                                <div class=\"row\">\r\n                                                    <div class=\"col-md-4\">\r\n                                                        <label>Field Name</label>\r\n                                                    </div>\r\n                                                    <div class=\"col-md-8 form-group\">\r\n                                                        <input type=\"text\" id=\"field_name\" class=\"form-control form-control-sm\"\r\n                                                            name=\"field_name\" placeholder=\"Field Name\">\r\n                                                    </div>\r\n                                                    <div class=\"col-md-4\">\r\n                                                        <label>Price</label>\r\n                                                    </div>\r\n                                                    <div class=\"col-md-8 form-group\">\r\n                                                        <input type=\"number\" id=\"price\" class=\"form-control form-control-sm\"\r\n                                                            name=\"price\" placeholder=\"0\">\r\n                                                    </div>\r\n                                                    <div class=\"col-md-4\">\r\n                                                        <label>Notes</label>\r\n                                                    </div>\r\n                                                    <div class=\"col-md-8 form-group\">\r\n                                                        <div class=\"form-floating\">\r\n                                                            <textarea class=\"form-control form-control-sm\" id=\"note\" name=\"note\" row=\"5\" placeholder=\"Leave a comment here\"\r\n                                                                id=\"floatingTextarea\"></textarea>\r\n                                                            <label for=\"floatingTextarea\">Note</label>\r\n                                                        </div>                                                    \r\n                                                    </div>\r\n                                                    <div class=\"col-md-4\">\r\n                                                        <label>Additional Picture</label>\r\n                                                    </div>\r\n                                                    <div class=\"col-md-8 form-group\">\r\n                                                        <input class=\"form-control form-control-sm\" id=\"formFileSm\" name=\"picture\" type=\"file\">\r\n\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </form>\r\n                        </div>\r\n                        <div class=\"modal-footer\">\r\n                            <button type=\"button\" class=\"btn\" data-bs-dismiss=\"modal\">\r\n                                <i class=\"bx bx-x d-block d-sm-none\"></i>\r\n                                <span class=\"d-none d-sm-block\">Close</span>\r\n                            </button>\r\n                            <button type=\"button\" class=\"btn btn-primary ml-1\"\r\n                                data-bs-dismiss=\"modal\">\r\n                                <i class=\"bx bx-check d-block d-sm-none\"></i>\r\n                                <span class=\"d-none d-sm-block\">Save</span>\r\n                            </button>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n<script>\r\n    $.ajax({\r\n        url : \"app/master/Fields.php?f_name=get_all_fields\",\r\n        type : \"GET\",\r\n        success : function(result){\r\n            $(\"#tbody-field\").html(result);\r\n        }\r\n    })\r\n\r\n    $(\"#add\").click(function(){\r\n        modalShow(\'add\');\r\n    })\r\n\r\n    function modalShow(mtd){\r\n        var title;\r\n        if (mtd==\"add\") {\r\n            title = \"Add New Field\";\r\n        }else{\r\n            title = \"Edit field\";\r\n        }\r\n        $(\".modal-title\").html(title);\r\n        $(\"#field-modal\").modal(\'toggle\');\r\n    }\r\n\r\n    function getFieldbyId(id){\r\n        $.ajax({\r\n            url : \"app/master/Fields.php?f_name=get_field_by_id\",\r\n            type : \"GET\",\r\n            data : {\r\n                data : id,\r\n            },\r\n            dataType : \"JSON\",\r\n            success : function(result){\r\n                $(\"#field_name\").val(result.field_name);\r\n                $(\"#price\").val(result.price);\r\n                $(\"#note\").val(result.note);\r\n\r\n                modalShow(\'edit\');\r\n            }\r\n        })\r\n    }\r\n\r\n\r\n\r\n</script>\r\n'),
(3, 'app_name', 'Field Rent'),
(4, 'app_logo', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `levels`
--

CREATE TABLE `levels` (
  `id_level` int(11) NOT NULL,
  `level_name` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `levels`
--

INSERT INTO `levels` (`id_level`, `level_name`, `created_at`, `updated_at`, `deleted_at`, `id_user`) VALUES
(1, 'Administrator', '2021-10-18 21:44:41', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id_menu` int(11) NOT NULL,
  `menu_name` varchar(20) NOT NULL,
  `menu_description` text DEFAULT NULL,
  `link` text NOT NULL,
  `path` varchar(20) NOT NULL,
  `icon` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id_menu`, `menu_name`, `menu_description`, `link`, `path`, `icon`, `created_at`, `updated_at`, `deleted_at`, `id_user`) VALUES
(1, 'Dashboard', 'Resume all transactions\r\n', 'index.php', '', 'bi bi-grid-fill', '2021-10-18 21:27:05', NULL, NULL, 1),
(2, 'Master Data', NULL, '#', 'master', 'bi bi-grid-1x2-fill', '2021-10-18 21:27:05', NULL, NULL, 1),
(3, 'Setting', NULL, '#', 'setting', 'bi bi-gear-fill', '2021-10-18 21:32:07', NULL, NULL, 1);


-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_methods`
--

--
-- Dumping data untuk tabel `payment_methods`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `submenus`
--

CREATE TABLE `submenus` (
  `id_submenu` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `submenu_name` varchar(20) NOT NULL,
  `submenu_description` text DEFAULT NULL,
  `link` text NOT NULL,
  `pageload` varchar(20) DEFAULT NULL,
  `path` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `submenus`
--

INSERT INTO `submenus` (`id_submenu`, `id_menu`, `submenu_name`, `submenu_description`, `link`, `pageload`, `path`, `created_at`, `updated_at`, `deleted_at`, `id_user`) VALUES
(3, 2, 'Fields', 'Data field', 'index.php?pageload=fields', 'fields', 'pages/master/fields/fields.php', '2021-10-18 21:36:17', NULL, NULL, 1),
(4, 2, 'Customers', NULL, 'index.php?pageload=customers', 'customers', 'pages/master/customers/customers.php', '2021-10-18 21:36:17', NULL, NULL, 1),
(6, 3, 'User Levels', NULL, 'index.php?pageload=user_levels', 'user_levels', 'pages/setting/user_levels/user_levels.php', '2021-10-18 21:37:49', NULL, NULL, 1),
(7, 3, 'Users', NULL, 'index.php?pageload=users', 'users', 'pages/setting/users/users.php', '2021-10-18 21:38:33', NULL, NULL, 1),
(8, 3, 'Menus', 'Set menu on sidebar', 'index.php?pageload=menus', 'menus', 'pages/setting/menus/menus.php', '2021-10-18 21:38:33', NULL, NULL, 1),
(9, 3, 'Submenus', NULL, 'index.php?pageload=submenus', 'submenus', 'pages/setting/submenus/submenus.php', '2021-10-18 21:39:12', NULL, NULL, 1),
(10, 3, 'Access Menu', NULL, 'index.php?pageload=access_menus', 'access_menus', 'pages/setting/access_menu/access_menu.php', '2021-10-18 21:39:12', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `user_image` text DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `level` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `user_image`, `email`, `password`, `level`, `created_at`, `updated_at`, `deleted_at`, `created_by`) VALUES
(1, 'superuser', NULL, 'brianmarcius27@gmail.com', 'MTIzNDU2Nzg=', 1, '2021-10-18 21:22:59', NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `access_menu`
--
ALTER TABLE `access_menu`
  ADD PRIMARY KEY (`id_access`);

--
-- Indeks untuk tabel `booking_fields`
--

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indeks untuk tabel `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id_field`);

--
-- Indeks untuk tabel `global_variable`
--
ALTER TABLE `global_variable`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id_level`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `payments`
--


--
-- Indeks untuk tabel `payment_methods`
--


--
-- Indeks untuk tabel `submenus`
--
ALTER TABLE `submenus`
  ADD PRIMARY KEY (`id_submenu`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `access_menu`
--
ALTER TABLE `access_menu`
  MODIFY `id_access` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `booking_fields`
--


--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fields`
--
ALTER TABLE `fields`
  MODIFY `id_field` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `global_variable`
--
ALTER TABLE `global_variable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `levels`
--
ALTER TABLE `levels`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `payments`
--


--
-- AUTO_INCREMENT untuk tabel `payment_methods`
--


--
-- AUTO_INCREMENT untuk tabel `submenus`
--
ALTER TABLE `submenus`
  MODIFY `id_submenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
