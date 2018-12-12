-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 12 Gru 2018, 03:01
-- Wersja serwera: 10.1.31-MariaDB
-- Wersja PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `rpgdb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ability`
--

CREATE TABLE `ability` (
  `ability_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ability_type_id` int(11) UNSIGNED NOT NULL,
  `required_level` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `ability`
--

INSERT INTO `ability` (`ability_id`, `name`, `ability_type_id`, `required_level`) VALUES
(1, 'pizgogrzmot', 5, 69),
(2, 'piorun lognisty siarczysty', 1, 65);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ability_type`
--

CREATE TABLE `ability_type` (
  `ability_type_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `desc` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `ability_type`
--

INSERT INTO `ability_type` (`ability_type_id`, `name`, `desc`) VALUES
(1, 'ogien', NULL),
(2, 'woda', NULL),
(3, 'powietrze', NULL),
(4, 'ziemia', NULL),
(5, 'blyskawica', NULL),
(6, 'wampiryczna', NULL),
(7, 'lecznicza', NULL),
(8, 'swiatla', NULL),
(9, 'cienia', NULL),
(10, 'unikatowa', 'tylko jedna osoba mozze ja posiadac\r\n');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `attribute`
--

CREATE TABLE `attribute` (
  `attribute_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `desc` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `attribute`
--

INSERT INTO `attribute` (`attribute_id`, `name`, `desc`) VALUES
(1, 'strength', 'A measure of how physically strong a character is.'),
(2, 'constitution', 'A measure of how resilient a character is.'),
(3, 'dexterity', 'A measure of how agile a character is.'),
(4, 'intelligence', 'A measure of a character\'s problem-solving ability.'),
(5, 'charisma', 'A measure of a character\'s social skills, and sometimes their physical appearance.'),
(6, 'wisdom', 'A measure of a character\'s common sense and/or spirituality.'),
(7, 'willpower', 'A measure of the character\'s mental resistance.'),
(8, 'perception', 'A measure of a character\'s openness to their surroundings.'),
(9, 'luck', 'A measure of a character having chance to favor him or her.'),
(10, 'damage', 'A measure to inflict damage');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character`
--

CREATE TABLE `character` (
  `character_id` int(11) UNSIGNED NOT NULL,
  `character_type_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `alive` tinyint(4) NOT NULL,
  `level` smallint(6) NOT NULL,
  `xp` bigint(20) NOT NULL,
  `money` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_attribute`
--

CREATE TABLE `character_attribute` (
  `character_attribute_id` int(11) UNSIGNED NOT NULL,
  `character_id` int(11) UNSIGNED NOT NULL,
  `attribute_id` int(11) UNSIGNED NOT NULL,
  `value` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_class`
--

CREATE TABLE `character_class` (
  `character_class_id` int(11) UNSIGNED NOT NULL,
  `character_id` int(11) UNSIGNED NOT NULL,
  `class_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_equipment`
--

CREATE TABLE `character_equipment` (
  `character_equipment_id` int(11) UNSIGNED NOT NULL,
  `equipment_slot_id` int(11) UNSIGNED NOT NULL,
  `character_id` int(11) UNSIGNED NOT NULL,
  `item_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_faction`
--

CREATE TABLE `character_faction` (
  `character_faction_id` int(11) UNSIGNED NOT NULL,
  `character_id` int(11) UNSIGNED NOT NULL,
  `faction_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_guild`
--

CREATE TABLE `character_guild` (
  `character_guild_id` int(11) UNSIGNED NOT NULL,
  `character_id` int(11) UNSIGNED NOT NULL,
  `guild_id` int(11) UNSIGNED NOT NULL,
  `guild_leader` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_guild_rank`
--

CREATE TABLE `character_guild_rank` (
  `character_guild_rank_id` int(11) UNSIGNED NOT NULL,
  `character_id` int(11) UNSIGNED NOT NULL,
  `guild_rank_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_item`
--

CREATE TABLE `character_item` (
  `character_item_id` int(11) UNSIGNED NOT NULL,
  `character_id` int(11) UNSIGNED NOT NULL,
  `item_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_location`
--

CREATE TABLE `character_location` (
  `character_location_id` int(11) UNSIGNED NOT NULL,
  `character_id` int(11) UNSIGNED NOT NULL,
  `location_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_loot`
--

CREATE TABLE `character_loot` (
  `character_loot_id` int(11) UNSIGNED NOT NULL,
  `loot_id` int(11) UNSIGNED NOT NULL,
  `character_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_party`
--

CREATE TABLE `character_party` (
  `character_party_id` int(11) UNSIGNED NOT NULL,
  `character_id` int(11) UNSIGNED NOT NULL,
  `party_id` int(11) UNSIGNED NOT NULL,
  `party_leader` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_status_effect`
--

CREATE TABLE `character_status_effect` (
  `character_status_effect_id` int(11) UNSIGNED NOT NULL,
  `character_id` int(11) UNSIGNED NOT NULL,
  `status_effect_id` int(11) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_title`
--

CREATE TABLE `character_title` (
  `character_title_id` int(11) UNSIGNED NOT NULL,
  `character_id` int(11) UNSIGNED NOT NULL,
  `title_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_type`
--

CREATE TABLE `character_type` (
  `character_type_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `character_type`
--

INSERT INTO `character_type` (`character_type_id`, `name`) VALUES
(1, 'player'),
(2, 'non-playable');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `class`
--

CREATE TABLE `class` (
  `class_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `class_ability`
--

CREATE TABLE `class_ability` (
  `class_ability_id` int(11) UNSIGNED NOT NULL,
  `class_id` int(11) UNSIGNED NOT NULL,
  `ability_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `effect_type`
--

CREATE TABLE `effect_type` (
  `effect_type_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `desc` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `effect_type`
--

INSERT INTO `effect_type` (`effect_type_id`, `name`, `desc`) VALUES
(1, 'buff', 'A temporary benefit to a character’s attributes'),
(2, 'debuff', 'A temporary hindrance to a character’s attributes');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `entity`
--

CREATE TABLE `entity` (
  `entity_id` int(11) UNSIGNED NOT NULL,
  `entity_type_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `level` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `entity_attribute`
--

CREATE TABLE `entity_attribute` (
  `entity_attribute_id` int(11) UNSIGNED NOT NULL,
  `entity_id` int(11) UNSIGNED NOT NULL,
  `attribute_id` int(11) UNSIGNED NOT NULL,
  `value` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `entity_class`
--

CREATE TABLE `entity_class` (
  `entity_class_id` int(11) UNSIGNED NOT NULL,
  `entity_id` int(11) UNSIGNED NOT NULL,
  `class_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `entity_faction`
--

CREATE TABLE `entity_faction` (
  `entity_faction_id` int(11) UNSIGNED NOT NULL,
  `entity_id` int(11) UNSIGNED NOT NULL,
  `faction_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `entity_location`
--

CREATE TABLE `entity_location` (
  `entity_location_id` int(11) UNSIGNED NOT NULL,
  `entity_id` int(11) UNSIGNED NOT NULL,
  `location_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `entity_loot`
--

CREATE TABLE `entity_loot` (
  `entity_loot_id` int(11) UNSIGNED NOT NULL,
  `loot_id` int(11) UNSIGNED NOT NULL,
  `entity_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `entity_status_effect`
--

CREATE TABLE `entity_status_effect` (
  `entity_status_effect_id` int(11) UNSIGNED NOT NULL,
  `entity_id` int(11) UNSIGNED NOT NULL,
  `status_effect_id` int(11) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `entity_type`
--

CREATE TABLE `entity_type` (
  `entity_type_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `equipment_slot`
--

CREATE TABLE `equipment_slot` (
  `equipment_slot_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `equipment_slot`
--

INSERT INTO `equipment_slot` (`equipment_slot_id`, `name`) VALUES
(4, 'back'),
(3, 'chest'),
(11, 'ears'),
(9, 'feet'),
(6, 'hands'),
(1, 'head'),
(8, 'leg'),
(13, 'main_hand'),
(10, 'neck'),
(14, 'off_hand'),
(12, 'ring'),
(2, 'shoulder'),
(7, 'waist'),
(5, 'wrist');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `faction`
--

CREATE TABLE `faction` (
  `faction_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guild`
--

CREATE TABLE `guild` (
  `guild_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guild_rank`
--

CREATE TABLE `guild_rank` (
  `guild_rank_id` int(11) UNSIGNED NOT NULL,
  `guild_id` int(11) UNSIGNED NOT NULL,
  `rank_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item`
--

CREATE TABLE `item` (
  `item_id` int(11) UNSIGNED NOT NULL,
  `item_type_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `required_level` smallint(6) DEFAULT NULL,
  `durability` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `item`
--

INSERT INTO `item` (`item_id`, `item_type_id`, `name`, `required_level`, `durability`) VALUES
(4, 2, 'asdasd', 33, 33),
(6, 7, 'maczuga drewniana', 5, 22);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item_attribute`
--

CREATE TABLE `item_attribute` (
  `item_attribute_id` int(11) UNSIGNED NOT NULL,
  `item_id` int(11) UNSIGNED NOT NULL,
  `attribute_id` int(11) UNSIGNED NOT NULL,
  `value` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item_location`
--

CREATE TABLE `item_location` (
  `item_location_id` int(11) UNSIGNED NOT NULL,
  `item_id` int(11) UNSIGNED NOT NULL,
  `location_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item_loot`
--

CREATE TABLE `item_loot` (
  `item_loot_id` int(11) UNSIGNED NOT NULL,
  `loot_id` int(11) UNSIGNED NOT NULL,
  `item_id` int(11) UNSIGNED NOT NULL,
  `drop_chance` float(4,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item_type`
--

CREATE TABLE `item_type` (
  `item_type_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `desc` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `item_type`
--

INSERT INTO `item_type` (`item_type_id`, `name`, `desc`) VALUES
(1, 'glowa', NULL),
(2, 'tulow', NULL),
(3, 'spodnie', NULL),
(4, 'buty', NULL),
(5, 'rekawice', NULL),
(6, 'bizuteria', NULL),
(7, 'bron', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `location`
--

CREATE TABLE `location` (
  `location_id` int(11) UNSIGNED NOT NULL,
  `x` bigint(20) NOT NULL,
  `y` bigint(20) NOT NULL,
  `place_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `loot`
--

CREATE TABLE `loot` (
  `loot_id` int(11) UNSIGNED NOT NULL,
  `xp` bigint(20) DEFAULT NULL,
  `money` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `party`
--

CREATE TABLE `party` (
  `party_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `place`
--

CREATE TABLE `place` (
  `place_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rank`
--

CREATE TABLE `rank` (
  `rank_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `status_effect`
--

CREATE TABLE `status_effect` (
  `status_effect_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `effect_type_id` int(11) UNSIGNED NOT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `title`
--

CREATE TABLE `title` (
  `title_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `user_type_id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`user_id`, `user_type_id`, `first_name`, `last_name`, `email`, `password`) VALUES
(3, 2, 'yaudso', 'hisoka', 'yaduso@hisoka.pl', 'aaaaa'),
(7, 2, 'asdad', 'asdadad', 'adasd', 'asdasdad'),
(8, 3, 'asdasdasdasd', 'sddsasad', 'dsadsadsad', 'sdadsasd');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_character`
--

CREATE TABLE `user_character` (
  `user_character_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `character_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_type`
--

CREATE TABLE `user_type` (
  `user_type_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `user_type`
--

INSERT INTO `user_type` (`user_type_id`, `name`) VALUES
(1, 'admin'),
(2, 'moderator'),
(3, 'player'),
(4, 'spectator');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `ability`
--
ALTER TABLE `ability`
  ADD PRIMARY KEY (`ability_id`),
  ADD KEY `fk_ability_ability_type_id` (`ability_type_id`);

--
-- Indeksy dla tabeli `ability_type`
--
ALTER TABLE `ability_type`
  ADD PRIMARY KEY (`ability_type_id`);

--
-- Indeksy dla tabeli `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indeksy dla tabeli `character`
--
ALTER TABLE `character`
  ADD PRIMARY KEY (`character_id`),
  ADD KEY `fk_character_character_type_id` (`character_type_id`);

--
-- Indeksy dla tabeli `character_attribute`
--
ALTER TABLE `character_attribute`
  ADD PRIMARY KEY (`character_attribute_id`),
  ADD UNIQUE KEY `uk_character_id_attribute_id` (`character_id`,`attribute_id`),
  ADD KEY `fk_character_attribute_attribute_id` (`attribute_id`);

--
-- Indeksy dla tabeli `character_class`
--
ALTER TABLE `character_class`
  ADD PRIMARY KEY (`character_class_id`),
  ADD UNIQUE KEY `uk_character_id` (`character_id`),
  ADD KEY `fk_character_class_class_id` (`class_id`);

--
-- Indeksy dla tabeli `character_equipment`
--
ALTER TABLE `character_equipment`
  ADD PRIMARY KEY (`equipment_slot_id`),
  ADD UNIQUE KEY `uk_equipment_slot_id_character_id` (`equipment_slot_id`,`character_id`),
  ADD KEY `fk_character_equipment_character_id` (`character_id`),
  ADD KEY `fk_character_equipment_item_id` (`item_id`);

--
-- Indeksy dla tabeli `character_faction`
--
ALTER TABLE `character_faction`
  ADD PRIMARY KEY (`character_faction_id`),
  ADD KEY `fk_character_faction_character_id` (`character_id`),
  ADD KEY `fk_character_faction_faction_id` (`faction_id`);

--
-- Indeksy dla tabeli `character_guild`
--
ALTER TABLE `character_guild`
  ADD PRIMARY KEY (`character_guild_id`),
  ADD UNIQUE KEY `uk_guild_id_guild_leader` (`guild_id`,`guild_leader`),
  ADD KEY `fk_character_guild_character_id` (`character_id`);

--
-- Indeksy dla tabeli `character_guild_rank`
--
ALTER TABLE `character_guild_rank`
  ADD PRIMARY KEY (`character_guild_rank_id`),
  ADD UNIQUE KEY `uk_character_id_guild_rank_id` (`character_id`,`guild_rank_id`),
  ADD KEY `fk_character_guild_rank_guild_rank_id` (`guild_rank_id`);

--
-- Indeksy dla tabeli `character_item`
--
ALTER TABLE `character_item`
  ADD PRIMARY KEY (`character_item_id`),
  ADD UNIQUE KEY `uk_character_id_item_id` (`character_id`,`item_id`),
  ADD KEY `fk_character_item_item_id` (`item_id`);

--
-- Indeksy dla tabeli `character_location`
--
ALTER TABLE `character_location`
  ADD PRIMARY KEY (`character_location_id`),
  ADD UNIQUE KEY `uk_character_id` (`character_id`),
  ADD KEY `fk_character_location_location_id` (`location_id`);

--
-- Indeksy dla tabeli `character_loot`
--
ALTER TABLE `character_loot`
  ADD PRIMARY KEY (`character_loot_id`),
  ADD KEY `fk_character_loot_loot_id` (`loot_id`),
  ADD KEY `fk_character_loot_character_id` (`character_id`);

--
-- Indeksy dla tabeli `character_party`
--
ALTER TABLE `character_party`
  ADD PRIMARY KEY (`character_party_id`),
  ADD UNIQUE KEY `uk_character_id` (`character_id`),
  ADD UNIQUE KEY `uk_party_id_party_leader` (`party_id`,`party_leader`);

--
-- Indeksy dla tabeli `character_status_effect`
--
ALTER TABLE `character_status_effect`
  ADD PRIMARY KEY (`character_status_effect_id`),
  ADD KEY `fk_character_status_effect_status_effect_id` (`status_effect_id`),
  ADD KEY `fk_character_status_effect_character_id` (`character_id`);

--
-- Indeksy dla tabeli `character_title`
--
ALTER TABLE `character_title`
  ADD PRIMARY KEY (`character_title_id`),
  ADD KEY `fk_character_title_character_id` (`character_id`),
  ADD KEY `fk_character_title_title_id` (`title_id`);

--
-- Indeksy dla tabeli `character_type`
--
ALTER TABLE `character_type`
  ADD PRIMARY KEY (`character_type_id`);

--
-- Indeksy dla tabeli `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`),
  ADD UNIQUE KEY `uk_name` (`name`);

--
-- Indeksy dla tabeli `class_ability`
--
ALTER TABLE `class_ability`
  ADD PRIMARY KEY (`class_ability_id`),
  ADD UNIQUE KEY `uk_class_id_ability_id` (`class_id`,`ability_id`),
  ADD KEY `fk_class_ability_ability_id` (`ability_id`);

--
-- Indeksy dla tabeli `effect_type`
--
ALTER TABLE `effect_type`
  ADD PRIMARY KEY (`effect_type_id`);

--
-- Indeksy dla tabeli `entity`
--
ALTER TABLE `entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `fk_entity_entity_type_id` (`entity_type_id`);

--
-- Indeksy dla tabeli `entity_attribute`
--
ALTER TABLE `entity_attribute`
  ADD PRIMARY KEY (`entity_attribute_id`),
  ADD UNIQUE KEY `uk_entity_id_attribute_id` (`entity_id`,`attribute_id`),
  ADD KEY `fk_entity_attribute_attribute_id` (`attribute_id`);

--
-- Indeksy dla tabeli `entity_class`
--
ALTER TABLE `entity_class`
  ADD PRIMARY KEY (`entity_class_id`),
  ADD UNIQUE KEY `uk_entity_id` (`entity_id`),
  ADD KEY `fk_entity_class_class_id` (`class_id`);

--
-- Indeksy dla tabeli `entity_faction`
--
ALTER TABLE `entity_faction`
  ADD PRIMARY KEY (`entity_faction_id`),
  ADD KEY `fk_entity_faction_entity_id` (`entity_id`),
  ADD KEY `fk_entity_faction_faction_id` (`faction_id`);

--
-- Indeksy dla tabeli `entity_location`
--
ALTER TABLE `entity_location`
  ADD PRIMARY KEY (`entity_location_id`),
  ADD UNIQUE KEY `uk_entity_id` (`entity_id`),
  ADD KEY `fk_entity_location_location_id` (`location_id`);

--
-- Indeksy dla tabeli `entity_loot`
--
ALTER TABLE `entity_loot`
  ADD PRIMARY KEY (`entity_loot_id`),
  ADD KEY `fk_entity_loot_loot_id` (`loot_id`),
  ADD KEY `fk_entity_loot_entity_id` (`entity_id`);

--
-- Indeksy dla tabeli `entity_status_effect`
--
ALTER TABLE `entity_status_effect`
  ADD PRIMARY KEY (`entity_status_effect_id`),
  ADD KEY `fk_entity_status_effect_status_effect_id` (`status_effect_id`),
  ADD KEY `fk_entity_status_effect_entity_id` (`entity_id`);

--
-- Indeksy dla tabeli `entity_type`
--
ALTER TABLE `entity_type`
  ADD PRIMARY KEY (`entity_type_id`);

--
-- Indeksy dla tabeli `equipment_slot`
--
ALTER TABLE `equipment_slot`
  ADD PRIMARY KEY (`equipment_slot_id`),
  ADD UNIQUE KEY `uk_name` (`name`);

--
-- Indeksy dla tabeli `faction`
--
ALTER TABLE `faction`
  ADD PRIMARY KEY (`faction_id`);

--
-- Indeksy dla tabeli `guild`
--
ALTER TABLE `guild`
  ADD PRIMARY KEY (`guild_id`);

--
-- Indeksy dla tabeli `guild_rank`
--
ALTER TABLE `guild_rank`
  ADD PRIMARY KEY (`guild_rank_id`),
  ADD UNIQUE KEY `uk_guild_id_rank_id` (`guild_id`,`rank_id`),
  ADD KEY `fk_guild_rank_rank_id` (`rank_id`);

--
-- Indeksy dla tabeli `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `fk_item_item_type_id` (`item_type_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indeksy dla tabeli `item_attribute`
--
ALTER TABLE `item_attribute`
  ADD PRIMARY KEY (`item_attribute_id`),
  ADD UNIQUE KEY `uk_item_id_attribute_id` (`item_id`,`attribute_id`),
  ADD KEY `fk_item_attribute_attribute_id` (`attribute_id`);

--
-- Indeksy dla tabeli `item_location`
--
ALTER TABLE `item_location`
  ADD PRIMARY KEY (`item_location_id`),
  ADD UNIQUE KEY `uk_item_id` (`item_id`),
  ADD KEY `fk_item_location_location_id` (`location_id`);

--
-- Indeksy dla tabeli `item_loot`
--
ALTER TABLE `item_loot`
  ADD PRIMARY KEY (`item_loot_id`),
  ADD KEY `fk_item_loot_loot_id` (`loot_id`),
  ADD KEY `fk_item_loot_item_id` (`item_id`);

--
-- Indeksy dla tabeli `item_type`
--
ALTER TABLE `item_type`
  ADD PRIMARY KEY (`item_type_id`),
  ADD KEY `item_type_id` (`item_type_id`);

--
-- Indeksy dla tabeli `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`),
  ADD UNIQUE KEY `uk_x_y` (`x`,`y`),
  ADD KEY `fk_location_place_id` (`place_id`);

--
-- Indeksy dla tabeli `loot`
--
ALTER TABLE `loot`
  ADD PRIMARY KEY (`loot_id`);

--
-- Indeksy dla tabeli `party`
--
ALTER TABLE `party`
  ADD PRIMARY KEY (`party_id`);

--
-- Indeksy dla tabeli `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`place_id`);

--
-- Indeksy dla tabeli `rank`
--
ALTER TABLE `rank`
  ADD PRIMARY KEY (`rank_id`);

--
-- Indeksy dla tabeli `status_effect`
--
ALTER TABLE `status_effect`
  ADD PRIMARY KEY (`status_effect_id`),
  ADD KEY `fk_status_effect_effect_type_id` (`effect_type_id`);

--
-- Indeksy dla tabeli `title`
--
ALTER TABLE `title`
  ADD PRIMARY KEY (`title_id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_user_user_type_id` (`user_type_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `user_character`
--
ALTER TABLE `user_character`
  ADD PRIMARY KEY (`user_character_id`),
  ADD UNIQUE KEY `uk_user_id_character_id` (`user_id`,`character_id`),
  ADD KEY `fk_user_character_character_id` (`character_id`);

--
-- Indeksy dla tabeli `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`user_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `ability`
--
ALTER TABLE `ability`
  MODIFY `ability_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `ability_type`
--
ALTER TABLE `ability_type`
  MODIFY `ability_type_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `attribute`
--
ALTER TABLE `attribute`
  MODIFY `attribute_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `character`
--
ALTER TABLE `character`
  MODIFY `character_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `character_attribute`
--
ALTER TABLE `character_attribute`
  MODIFY `character_attribute_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `character_class`
--
ALTER TABLE `character_class`
  MODIFY `character_class_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `character_equipment`
--
ALTER TABLE `character_equipment`
  MODIFY `equipment_slot_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `character_faction`
--
ALTER TABLE `character_faction`
  MODIFY `character_faction_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `character_guild`
--
ALTER TABLE `character_guild`
  MODIFY `character_guild_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `character_guild_rank`
--
ALTER TABLE `character_guild_rank`
  MODIFY `character_guild_rank_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `character_item`
--
ALTER TABLE `character_item`
  MODIFY `character_item_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `character_location`
--
ALTER TABLE `character_location`
  MODIFY `character_location_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `character_loot`
--
ALTER TABLE `character_loot`
  MODIFY `character_loot_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `character_party`
--
ALTER TABLE `character_party`
  MODIFY `character_party_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `character_status_effect`
--
ALTER TABLE `character_status_effect`
  MODIFY `character_status_effect_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `character_title`
--
ALTER TABLE `character_title`
  MODIFY `character_title_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `character_type`
--
ALTER TABLE `character_type`
  MODIFY `character_type_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `class_ability`
--
ALTER TABLE `class_ability`
  MODIFY `class_ability_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `effect_type`
--
ALTER TABLE `effect_type`
  MODIFY `effect_type_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `entity`
--
ALTER TABLE `entity`
  MODIFY `entity_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `entity_attribute`
--
ALTER TABLE `entity_attribute`
  MODIFY `entity_attribute_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `entity_class`
--
ALTER TABLE `entity_class`
  MODIFY `entity_class_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `entity_faction`
--
ALTER TABLE `entity_faction`
  MODIFY `entity_faction_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `entity_location`
--
ALTER TABLE `entity_location`
  MODIFY `entity_location_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `entity_loot`
--
ALTER TABLE `entity_loot`
  MODIFY `entity_loot_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `entity_status_effect`
--
ALTER TABLE `entity_status_effect`
  MODIFY `entity_status_effect_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `entity_type`
--
ALTER TABLE `entity_type`
  MODIFY `entity_type_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `equipment_slot`
--
ALTER TABLE `equipment_slot`
  MODIFY `equipment_slot_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `faction`
--
ALTER TABLE `faction`
  MODIFY `faction_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `guild`
--
ALTER TABLE `guild`
  MODIFY `guild_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `guild_rank`
--
ALTER TABLE `guild_rank`
  MODIFY `guild_rank_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `item_attribute`
--
ALTER TABLE `item_attribute`
  MODIFY `item_attribute_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `item_location`
--
ALTER TABLE `item_location`
  MODIFY `item_location_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `item_loot`
--
ALTER TABLE `item_loot`
  MODIFY `item_loot_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `item_type`
--
ALTER TABLE `item_type`
  MODIFY `item_type_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `loot`
--
ALTER TABLE `loot`
  MODIFY `loot_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `party`
--
ALTER TABLE `party`
  MODIFY `party_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `place`
--
ALTER TABLE `place`
  MODIFY `place_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `rank`
--
ALTER TABLE `rank`
  MODIFY `rank_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `status_effect`
--
ALTER TABLE `status_effect`
  MODIFY `status_effect_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `title`
--
ALTER TABLE `title`
  MODIFY `title_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `user_character`
--
ALTER TABLE `user_character`
  MODIFY `user_character_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user_type`
--
ALTER TABLE `user_type`
  MODIFY `user_type_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `ability`
--
ALTER TABLE `ability`
  ADD CONSTRAINT `fk_ability_ability_type_id` FOREIGN KEY (`ability_type_id`) REFERENCES `ability_type` (`ability_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `character`
--
ALTER TABLE `character`
  ADD CONSTRAINT `fk_character_character_type_id` FOREIGN KEY (`character_type_id`) REFERENCES `character_type` (`character_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `character_attribute`
--
ALTER TABLE `character_attribute`
  ADD CONSTRAINT `fk_character_attribute_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_character_attribute_character_id` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `character_class`
--
ALTER TABLE `character_class`
  ADD CONSTRAINT `fk_character_class_character_id` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_character_class_class_id` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `character_equipment`
--
ALTER TABLE `character_equipment`
  ADD CONSTRAINT `fk_character_equipment_character_id` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_character_equipment_equipment_slot_id` FOREIGN KEY (`equipment_slot_id`) REFERENCES `equipment_slot` (`equipment_slot_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_character_equipment_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `character_faction`
--
ALTER TABLE `character_faction`
  ADD CONSTRAINT `fk_character_faction_character_id` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_character_faction_faction_id` FOREIGN KEY (`faction_id`) REFERENCES `faction` (`faction_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `character_guild`
--
ALTER TABLE `character_guild`
  ADD CONSTRAINT `fk_character_guild_character_id` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_character_guild_guild_id` FOREIGN KEY (`guild_id`) REFERENCES `guild` (`guild_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `character_guild_rank`
--
ALTER TABLE `character_guild_rank`
  ADD CONSTRAINT `fk_character_guild_rank_character_id` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_character_guild_rank_guild_rank_id` FOREIGN KEY (`guild_rank_id`) REFERENCES `guild_rank` (`guild_rank_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `character_item`
--
ALTER TABLE `character_item`
  ADD CONSTRAINT `fk_character_item_character_id` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_character_item_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `character_location`
--
ALTER TABLE `character_location`
  ADD CONSTRAINT `fk_character_location_character_id` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_character_location_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `character_loot`
--
ALTER TABLE `character_loot`
  ADD CONSTRAINT `fk_character_loot_character_id` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_character_loot_loot_id` FOREIGN KEY (`loot_id`) REFERENCES `loot` (`loot_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `character_party`
--
ALTER TABLE `character_party`
  ADD CONSTRAINT `fk_character_party_character_id` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_character_party_party_id` FOREIGN KEY (`party_id`) REFERENCES `party` (`party_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `character_status_effect`
--
ALTER TABLE `character_status_effect`
  ADD CONSTRAINT `fk_character_status_effect_character_id` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_character_status_effect_status_effect_id` FOREIGN KEY (`status_effect_id`) REFERENCES `status_effect` (`status_effect_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `character_title`
--
ALTER TABLE `character_title`
  ADD CONSTRAINT `fk_character_title_character_id` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_character_title_title_id` FOREIGN KEY (`title_id`) REFERENCES `title` (`title_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `class_ability`
--
ALTER TABLE `class_ability`
  ADD CONSTRAINT `fk_class_ability_ability_id` FOREIGN KEY (`ability_id`) REFERENCES `ability` (`ability_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_class_ability_class_id` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `entity`
--
ALTER TABLE `entity`
  ADD CONSTRAINT `fk_entity_entity_type_id` FOREIGN KEY (`entity_type_id`) REFERENCES `entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `entity_attribute`
--
ALTER TABLE `entity_attribute`
  ADD CONSTRAINT `fk_entity_attribute_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_entity_attribute_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `entity_class`
--
ALTER TABLE `entity_class`
  ADD CONSTRAINT `fk_entity_class_class_id` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_entity_class_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `entity_faction`
--
ALTER TABLE `entity_faction`
  ADD CONSTRAINT `fk_entity_faction_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_entity_faction_faction_id` FOREIGN KEY (`faction_id`) REFERENCES `faction` (`faction_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `entity_location`
--
ALTER TABLE `entity_location`
  ADD CONSTRAINT `fk_entity_location_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_entity_location_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `entity_loot`
--
ALTER TABLE `entity_loot`
  ADD CONSTRAINT `fk_entity_loot_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_entity_loot_loot_id` FOREIGN KEY (`loot_id`) REFERENCES `loot` (`loot_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `entity_status_effect`
--
ALTER TABLE `entity_status_effect`
  ADD CONSTRAINT `fk_entity_status_effect_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_entity_status_effect_status_effect_id` FOREIGN KEY (`status_effect_id`) REFERENCES `status_effect` (`status_effect_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `guild_rank`
--
ALTER TABLE `guild_rank`
  ADD CONSTRAINT `fk_guild_rank_guild_id` FOREIGN KEY (`guild_id`) REFERENCES `guild` (`guild_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_guild_rank_rank_id` FOREIGN KEY (`rank_id`) REFERENCES `rank` (`rank_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `fk_item_item_type_id` FOREIGN KEY (`item_type_id`) REFERENCES `item_type` (`item_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `item_attribute`
--
ALTER TABLE `item_attribute`
  ADD CONSTRAINT `fk_item_attribute_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_item_attribute_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `item_location`
--
ALTER TABLE `item_location`
  ADD CONSTRAINT `fk_item_location_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_item_location_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `item_loot`
--
ALTER TABLE `item_loot`
  ADD CONSTRAINT `fk_item_loot_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_item_loot_loot_id` FOREIGN KEY (`loot_id`) REFERENCES `loot` (`loot_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `fk_location_place_id` FOREIGN KEY (`place_id`) REFERENCES `place` (`place_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `status_effect`
--
ALTER TABLE `status_effect`
  ADD CONSTRAINT `fk_status_effect_effect_type_id` FOREIGN KEY (`effect_type_id`) REFERENCES `effect_type` (`effect_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_user_type_id` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`user_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `user_character`
--
ALTER TABLE `user_character`
  ADD CONSTRAINT `fk_user_character_character_id` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_character_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
