-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 10 Maj 2023, 14:48
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `meme`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `timestamp` date NOT NULL,
  `filename` varchar(96) NOT NULL,
  `title` text NOT NULL,
  `authorId` int(11) NOT NULL,
  `removed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `post`
--

INSERT INTO `post` (`id`, `timestamp`, `filename`, `title`, `authorId`, `removed`) VALUES
(1, '0000-00-00', '2023-04-19 15:11:55', 'Pan Zawadzki jet super gość', 1, 0),
(2, '0000-00-00', '2023-04-19 15:13:00', 'Pan Zawadzki jet super gość', 1, 0),
(3, '0000-00-00', '2023-04-19 15:14:34', 'Pan Zawadzki jet super gość', 1, 0),
(4, '0000-00-00', '2023-04-24 14:03:12', 'olaf MA malego batonika', 3, 0),
(5, '0000-00-00', '2023-05-10 13:51:05', '11', 1, 1),
(6, '0000-00-00', '2023-05-10 14:35:49', '123', 1, 0),
(7, '0000-00-00', '2023-05-10 14:36:19', '123', 1, 0),
(8, '2023-05-10', 'img/7bfc0e4049b9384ce9a09c3ec5fabcf3df79f55aee86419ce53d4919460f6ae8.webp', '123', 1, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'gowno@chuj.pl', '$argon2i$v=19$m=65536,t=4,p=1$cXgycXFDb3JOUzFDOVZUSg$UBYk/Fw40P4kcAKRjclF34BxVDONTMkHAfsHlLfdqv8'),
(3, 'olaffajszer@wp.pl', '$argon2i$v=19$m=65536,t=4,p=1$dGtQcXpKRzRCYVpGMkFldQ$JuRIFob3t8o+sWFm8goECNeOk4im9qfVdwqOzyfUPuQ');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vote`
--

CREATE TABLE `vote` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `vote`
--

INSERT INTO `vote` (`id`, `post_id`, `score`, `user_id`) VALUES
(1, 1, -1, 1),
(2, 1, 1, 1),
(3, 1, 1, 1),
(4, 1, 1, 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `vote`
--
ALTER TABLE `vote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
