-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 27 avr. 2022 à 16:38
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_films`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteur`
--

CREATE TABLE `acteur` (
  `id` int(11) NOT NULL,
  `film_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `datenaissance` date NOT NULL,
  `sexe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `acteur`
--

INSERT INTO `acteur` (`id`, `film_id`, `nom`, `prenom`, `datenaissance`, `sexe`, `image`) VALUES
(1, NULL, 'Clavier', 'Christian', '1952-05-05', 'Masculin', '7b626710cb1722272323147e6e5aed09127aa02b.jpg'),
(2, NULL, 'Cruise', 'Tom', '1962-07-03', 'Masculin', 'aa5f8cb3ba19669f82669256afe3e9c901dcb44b.jpg'),
(3, NULL, 'Birkin', 'Jane', '1946-12-14', 'Feminin', 'c339f632232c46f3df3fd0d7ee9ef98899cabd35.jpg'),
(4, NULL, 'Schwarzenegger', 'Arnold', '1947-07-30', 'Masculin', '67929e7a58902e90b1c2013c69229a41887744cd.jpg'),
(5, NULL, 'Barbeau', 'Marion', '1991-07-02', 'Feminin', '8a604e1a1c22478e4e92fb8efa6bb6725520b8c1.bin'),
(6, NULL, 'Mikkelsen', 'Mads Mikkelsen', '1965-11-22', 'Masculin', '98910e322658f80324ec6fa107de02ae124dfb53.bin'),
(7, NULL, 'Pattinson', 'Robert', '1986-05-13', 'Masculin', '942ddc65b1acbda07f57941823f4f2b941a0cfa9.jpg'),
(8, NULL, 'Freeman', 'Morgan', '1937-06-01', 'Masculin', '4a88c99f9b7af40698b40e855e2ddc2b4d4e5abc.webp'),
(9, NULL, 'Kidman', 'Nicole', '1967-06-20', 'Feminin', 'd16fa06cc50e494fe9d93ef0507aa73a9e8dcc6d.jpg'),
(10, NULL, 'Pitt', 'Brad', '1963-12-18', 'Masculin', 'abcbc03f5127d02dc13b117374db172441eb51e0.bin'),
(11, NULL, 'Hemmings', 'David', '1941-09-18', 'Masculin', 'd5ab4471a0f1080c421b8852ef8922082c21b839.bin');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`) VALUES
(1, 'Comédie'),
(2, 'Science-fiction'),
(3, 'Drame');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220423142243', '2022-04-23 16:24:12', 73),
('DoctrineMigrations\\Version20220423143957', '2022-04-23 16:40:32', 182),
('DoctrineMigrations\\Version20220423161257', '2022-04-23 18:13:12', 228),
('DoctrineMigrations\\Version20220423161634', '2022-04-23 18:16:59', 144),
('DoctrineMigrations\\Version20220423161956', '2022-04-23 18:20:04', 34),
('DoctrineMigrations\\Version20220423212338', '2022-04-23 23:23:59', 285),
('DoctrineMigrations\\Version20220425074351', '2022-04-25 09:44:04', 446),
('DoctrineMigrations\\Version20220425100732', '2022-04-25 12:07:42', 253),
('DoctrineMigrations\\Version20220425113138', '2022-04-25 13:31:44', 75),
('DoctrineMigrations\\Version20220425113538', '2022-04-25 13:35:45', 37),
('DoctrineMigrations\\Version20220426100645', '2022-04-26 12:06:57', 275),
('DoctrineMigrations\\Version20220426125632', '2022-04-26 14:56:43', 107),
('DoctrineMigrations\\Version20220426145514', '2022-04-26 16:55:23', 133),
('DoctrineMigrations\\Version20220426150442', '2022-04-26 17:06:19', 234);

-- --------------------------------------------------------

--
-- Structure de la table `films`
--

CREATE TABLE `films` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `is_best_seller` tinyint(1) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `films_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `films`
--

INSERT INTO `films` (`id`, `titre`, `description`, `is_best_seller`, `image`, `created_at`, `slug`, `films_id`) VALUES
(2, 'Qu\'est ce qu\'on a tous fait au bon dieu ?', '<div>Ce sont bientôt les 40 ans de mariage de Claude et Marie Verneuil. Pour cette occasion, leurs quatre filles décident d’organiser une grande fête surprise dans la maison familiale de Chinon et d’y inviter les parents de chacun des gendres, pour quelques jours. Claude et Marie vont devoir accueillir sous leur toit les parents de Rachid, David, Chao et Charles : ce séjour \"familial\" s\'annonce mouvementé.</div>', 1, '35210541be4e11e37710af5c2a5ed04718565ebb.jpg', '0000-00-00 00:00:00', 'quest-ce-quon-a-tous-fait-au-bon-dieu', NULL),
(3, 'EnCorps', '<div>Elise, 26 ans est une grande danseuse classique. Elle se blesse pendant un spectacle et apprend qu’elle ne pourra plus danser. Dès lors sa vie va être bouleversée, Elise va devoir apprendre à se réparer… Entre Paris et la Bretagne, au gré des rencontres et des expériences, des déceptions et des espoirs, Elise va se rapprocher d’une compagnie de danse contemporaine. Cette nouvelle façon de danser va lui permettre de retrouver un nouvel élan et aussi une nouvelle façon de vivre.</div>', 1, '09a80872b23e708673bfa3000e3396a68472fbfe.jpg', '0000-00-00 00:00:00', 'encorps', NULL),
(5, 'Drunk', '<div>Quatre amis décident de mettre en pratique la théorie d’un psychologue norvégien selon laquelle l’homme aurait dès la naissance un déficit d’alcool dans le sang. Avec une rigueur scientifique, chacun relève le défi en espérant tous que leur vie n’en sera que meilleure ! Si dans un premier temps les résultats sont encourageants, la situation devient rapidement hors de contrôle.</div>', 1, '09893798785f6cb193c635acf3ff7a27264b9220.jpg', '0000-00-00 00:00:00', 'drunk', NULL),
(6, 'Tenet', '<div>Muni d\'un seul mot – Tenet – et décidé à se battre pour sauver le monde, notre protagoniste sillonne l\'univers crépusculaire de l\'espionnage international. Sa mission le projettera dans une dimension qui dépasse le temps. Pourtant, il ne s\'agit pas d\'un voyage dans le temps, mais d\'un renversement temporel…</div>', 1, '2b7c4c5eebf872a9f878510d4ed59982e9af8c7d.jpg', '0000-00-00 00:00:00', 'tenet', NULL),
(7, 'Les visiteurs', '<div>En l\'an de grace 1123, le comte de Montmirail et son fidèle écuyer, Jacquouille la Fripouille, se retrouvent propulsés en l\'an 1992 apres avoir bu une potion magique fabriquée par l\'enchanteur Eusaebius, censée leur permettre de se défaire d\'un terrible sort.</div>', 1, '6f1f07edd2583d328775d189ad240d89c4a3db9b.jpg', '0000-00-00 00:00:00', 'les-visiteurs', NULL),
(8, 'Asterix et cléopatre', '<div>Cléopâtre, la reine d’Égypte, décide, pour défier l\'Empereur romain Jules César, de construire en trois mois un palais somptueux en plein désert. Si elle y parvient, celui-ci devra concéder publiquement que le peuple égyptien est le plus grand de tous les peuples. Pour ce faire, Cléopâtre fait appel à Numérobis, un architecte d\'avant-garde plein d\'énergie. S\'il réussit, elle le couvrira d\'or. S\'il échoue, elle le jettera aux crocodiles.<br>Celui-ci, conscient du défi à relever, cherche de l\'aide auprès de son vieil ami Panoramix. Le druide fait le voyage en Égypte avec Astérix et Obélix. De son côté, Amonbofis, l\'architecte officiel de Cléopâtre, jaloux que la reine ait choisi Numérobis pour construire le palais, va tout mettre en œuvre pour faire échouer son concurrent.</div>', 1, '895bf2444f13eab190274145d67d2bf2b5e9e09c.jpg', '0000-00-00 00:00:00', 'asterix-et-cleopatre', NULL),
(9, 'Minority Report', '<div>A Washington, en 2054, la société du futur a éradiqué le meurtre en se dotant du système de prévention / détection / répression le plus sophistiqué du monde. Dissimulés au coeur du Ministère de la Justice, trois extra-lucides captent les signes précurseurs des violences homicides et en adressent les images à leur contrôleur, John Anderton, le chef de la \"Précrime\" devenu justicier après la disparition tragique de son fils. Celui-ci n\'a alors plus qu\'à lancer son escouade aux trousses du \"coupable\"...<br>Mais un jour se produit l\'impensable : l\'ordinateur lui renvoie sa propre image. D\'ici 36 heures, Anderton aura assassiné un parfait étranger. Devenu la cible de ses propres troupes, Anderton prend la fuite. Son seul espoir pour déjouer le complot : dénicher sa future victime ; sa seule arme : les visions parcellaires, énigmatiques, de la plus fragile des Pré-Cogs : Agatha.</div>', 1, '13d34b56770d0b07b5ac3340fdcb0c73cfca6f55.jpg', '0000-00-00 00:00:00', 'minority-report', NULL),
(10, 'Les évadés', '<div>Le banquier Andy Dufresne est arrêté pour avoir tué sa femme et son amant. Après une dure adaptation, il tente d\'améliorer les conditions de la prison et de redonner de l\'espoir à ses compagnons.</div>', 1, '73bd7b12794c44f4bd80d8aa1087e334f5b73aa4.jpg', '0000-00-00 00:00:00', 'les-evades', NULL),
(11, 'Les autres', '<div>En 1945, dans une immense demeure victorienne isolée sur l\'île de Jersey située au large de la Normandie, vit Grace, une jeune femme pieuse, et ses deux enfants, Anne et Nicholas. Les journées sont longues pour cette mère de famille qui passe tout son temps à éduquer ses enfants en leur inculquant ses principes religieux. Atteints d\'un mal étrange, Anne et Nicholas ne doivent en aucun cas être exposés à la lumière du jour. Ils vivent donc reclus dans ce manoir obscur, tous rideaux tirés.<br>Un jour d\'épais brouillard, trois personnes frappent à la porte du manoir isolé, en quête d’un travail. Grace, qui a justement besoin d\'aide pour l\'entretien du parc ainsi que d’une nouvelle nounou pour ses enfants, les engage. Dès lors, des événements étranges surviennent dans la demeure...</div>', 1, '45c0cb717c213dee3e478a7022908c01cfabd029.jpg', '0000-00-00 00:00:00', 'les-autres', NULL),
(12, 'Légendes d\'automne', '<div>Au cœur des contrées sauvages du Montana, trois frères, Alfred, Tristan et Samuel sont élevés par leur père, le colonel William Ludlow et ses amis indiens. Un jour, Samuel, le plus fragile, présente sa ravissante fiancée, Susannah à sa famille. Les trois jeunes hommes s’engagent dans la première Guerre Mondiale et Samuel décède sur le champ de bataille. A leur retour, Tristan et Alfred se battent pour conquérir le cœur de la belle veuve.</div>', 1, '2e0f50df5176038e0ad78d3e6db8e31286448066.jpg', '0000-00-00 00:00:00', 'legendes-dautomne', NULL),
(13, 'Blow up', '<div>Dans un parc de Londres, un jeune photographe surprend ce qu\'il croit être un couple d\'amoureux. Il découvre sur la pellicule une main tenant un revolver et un corps allongé dans les buisssons...</div>', 1, 'ebd522ce8165ec43b9e93b493d4ef5c029446022.jpg', '0000-00-00 00:00:00', 'blow-up', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `films_acteur`
--

CREATE TABLE `films_acteur` (
  `films_id` int(11) NOT NULL,
  `acteur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `films_acteur`
--

INSERT INTO `films_acteur` (`films_id`, `acteur_id`) VALUES
(2, 1),
(5, 6),
(7, 1),
(9, 2),
(10, 8),
(11, 9);

-- --------------------------------------------------------

--
-- Structure de la table `films_categorie`
--

CREATE TABLE `films_categorie` (
  `films_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `films_categorie`
--

INSERT INTO `films_categorie` (`films_id`, `categorie_id`) VALUES
(2, 1),
(7, 1),
(8, 1),
(9, 2),
(10, 3);

-- --------------------------------------------------------

--
-- Structure de la table `home_slider`
--

CREATE TABLE `home_slider` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `button_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_displayed` tinyint(1) DEFAULT NULL,
  `button_message` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `home_slider`
--

INSERT INTO `home_slider` (`id`, `titre`, `description`, `button_url`, `image`, `is_displayed`, `button_message`) VALUES
(1, 'Cette semaine on aime :', 'Qu\'est ce qu\'on a tous fais au bon dieu ?', 'http://127.0.0.1:8000/quest-ce-quon-a-tous-fait-au-bon-dieu', '3b1fc06cbd463b7ce084e1a946d3f1d18066b090.jpg', 0, 'Voir'),
(2, 'Cette semaine on aime :', 'Tenet', 'http://127.0.0.1:8000/Filmtenet', 'bfdba23d0941a0a2a90b1b09304efb8a01e6ae13.jpg', 1, 'Voir'),
(3, 'Cette semaine on aime :', 'Les évadés', 'http://127.0.0.1:8000/Filmles-evades', '6ecbaa40923745f32418b1504b8ca7b4252b58ef.jpg', 1, 'Voir');

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tags_films`
--

CREATE TABLE `tags_films` (
  `tags_id` int(11) NOT NULL,
  `films_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`, `firstname`, `lastname`, `is_verified`) VALUES
(3, 'adrichristophe@gmail.com', '{\"1\":\"ROLE_ADMIN\"}', '$2y$13$9yMQfJVq3mq2nMziI4Yc9eO.o35h3j7ZI6WkRxUA9WgN2ROR2FonS', 'Adrien', 'Adrien', 'Christophe', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acteur`
--
ALTER TABLE `acteur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_EAFAD362567F5183` (`film_id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_CEECCA51939610EE` (`films_id`);
ALTER TABLE `films` ADD FULLTEXT KEY `IDX_CEECCA51FF7747B4` (`titre`);

--
-- Index pour la table `films_acteur`
--
ALTER TABLE `films_acteur`
  ADD PRIMARY KEY (`films_id`,`acteur_id`),
  ADD KEY `IDX_5DAE58DB939610EE` (`films_id`),
  ADD KEY `IDX_5DAE58DBDA6F574A` (`acteur_id`);

--
-- Index pour la table `films_categorie`
--
ALTER TABLE `films_categorie`
  ADD PRIMARY KEY (`films_id`,`categorie_id`),
  ADD KEY `IDX_3783C771939610EE` (`films_id`),
  ADD KEY `IDX_3783C771BCF5E72D` (`categorie_id`);

--
-- Index pour la table `home_slider`
--
ALTER TABLE `home_slider`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tags_films`
--
ALTER TABLE `tags_films`
  ADD PRIMARY KEY (`tags_id`,`films_id`),
  ADD KEY `IDX_A5883C098D7B4FB4` (`tags_id`),
  ADD KEY `IDX_A5883C09939610EE` (`films_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `acteur`
--
ALTER TABLE `acteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `films`
--
ALTER TABLE `films`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `home_slider`
--
ALTER TABLE `home_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `acteur`
--
ALTER TABLE `acteur`
  ADD CONSTRAINT `FK_EAFAD362567F5183` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`);

--
-- Contraintes pour la table `films`
--
ALTER TABLE `films`
  ADD CONSTRAINT `FK_CEECCA51939610EE` FOREIGN KEY (`films_id`) REFERENCES `films` (`id`);

--
-- Contraintes pour la table `films_acteur`
--
ALTER TABLE `films_acteur`
  ADD CONSTRAINT `FK_5DAE58DB939610EE` FOREIGN KEY (`films_id`) REFERENCES `films` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_5DAE58DBDA6F574A` FOREIGN KEY (`acteur_id`) REFERENCES `acteur` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `films_categorie`
--
ALTER TABLE `films_categorie`
  ADD CONSTRAINT `FK_3783C771939610EE` FOREIGN KEY (`films_id`) REFERENCES `films` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_3783C771BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `tags_films`
--
ALTER TABLE `tags_films`
  ADD CONSTRAINT `FK_A5883C098D7B4FB4` FOREIGN KEY (`tags_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A5883C09939610EE` FOREIGN KEY (`films_id`) REFERENCES `films` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
