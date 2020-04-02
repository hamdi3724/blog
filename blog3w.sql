-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 02 avr. 2020 à 15:05
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blog3w`
--

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

CREATE TABLE `author` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `author`
--

INSERT INTO `author` (`id`, `firstname`, `lastname`) VALUES
(1, 'John', 'Doe');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(2, 'Jeux-Vidéos'),
(1, 'Voyages');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  `contents` text NOT NULL,
  `creation_timestamp` datetime NOT NULL,
  `post_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `contents` text NOT NULL,
  `creation_timestamp` datetime NOT NULL,
  `author_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `category_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `title`, `contents`, `creation_timestamp`, `author_id`, `category_id`, `image`) VALUES
(1, 'Tunisia', 'Lorem ipsum dolor sit amet, elit imperdiet, non facilisis, non in vel pede velit, ligula metus sed amet posuere sagittis eu, fringilla rutrum mattis vel iaculis quo semper. A congue vulputate lorem sociis orci, ullamcorper tincidunt duis sed, tellus purus nonummy enim cras, quam potenti nullam sodales, praesent placerat sed. Est ligula lorem luctus, a nibh in faucibus proin. Auctor per interdum dui orci adipiscing, wisi egestas tellus id nunc fusce quis, ipsum sed diam litora, accumsan integer sed dui mauris. Fermentum auctor, eget pretium varius, nunc semper odio lorem lacinia donec, in amet. Proin amet fames, facere eros nunc, rutrum fringilla gravida, sollicitudin urna sit litora molestie, volutpat egestas sodales et feugiat. Tortor habitant wisi amet eget mi tellus, posuere lectus malesuada elit, elit pellentesque neque quam odio maecenas. Elit cursus mattis felis metus nec maecenas. Amet eget.\r\n\r\n', '2020-03-18 20:50:50', 1, 1, 'https://picsum.photos/300/300'),
(2, 'Mario Kart 8', 'Lorem ipsum dolor sit amet, venenatis dapibus mauris ut proin, sit aliquam ipsum egestas ante. Wisi euismod potenti molestie cursus libero praesent, dictum sit in animi praesent, egestas dictum, non risus euismod, a ante hac. Lobortis odio, rhoncus ornare enim, laoreet cras dictum. Tristique justo aliquam molestie nam mauris. Phasellus sodales id elit aenean nullam gravida, aliquet lorem. Sed et vitae bibendum, blandit sapien, habitasse ante consequat ad nec et, hendrerit dui. Adipiscing natoque nunc amet, pulvinar dolor feugiat et vivamus. Dolor a consequat ut sapien adipiscing, vehicula suspendisse ornare quisque velit aptent libero, luctus vitae placerat est aliquet elit. Vestibulum tellus, tempor porttitor mauris at fringilla, malesuada mattis orci eu sapien id, mauris wisi metus ac neque in. Libero aliquam vivamus, lectus ante ligula orci. Ut id scelerisque dui vestibulum ut accumsan, sed aliquam gravida sed, vehicula dolor purus nec, porttitor orci in. Dictum feugiat, urna nunc egestas metus erat, justo semper suscipit blandit dolor, vitae inceptos libero quis in pellentesque.\r\n\r\n', '2020-03-19 17:55:52', 1, 2, 'https://picsum.photos/300/300');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `firstname`, `lastname`, `email`, `password`) VALUES
(1, 'midotta', 'Mahmoud', 'Abid', 'abidmahmoud8@gmail.com', '$2y$10$aksBv02OP7i2MwTE.1sqa.SNFtjw3P6uERpS2QGOm4z5ZiSUVc7wy'),
(2, 'hamdi3724', 'Hamdi', 'Farjallah', 'hamdifarjallah.tn@gmail.com', '23345146');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Name` (`name`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CreationTimestamp` (`creation_timestamp`),
  ADD KEY `Post_Id` (`post_id`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Title` (`title`),
  ADD KEY `CreationTimestamp` (`creation_timestamp`),
  ADD KEY `Author_Id` (`author_id`),
  ADD KEY `Category_Id` (`category_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `author`
--
ALTER TABLE `author`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `Comment_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `Post_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Post_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
