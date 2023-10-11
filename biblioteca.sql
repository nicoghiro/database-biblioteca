-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ott 11, 2023 alle 22:03
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblioteca`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `autore`
--

CREATE TABLE `autore` (
  `id` int(11) NOT NULL,
  `Cognome` varchar(50) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `nascita-morte` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `autore`
--

INSERT INTO `autore` (`id`, `Cognome`, `Nome`, `nascita-morte`) VALUES
(1, 'Calvino', 'Italo', '1923-1985'),
(2, 'Manzoni', 'Alessandro', '1785-1873'),
(3, 'King', 'Stephen', '1947-vivo');

-- --------------------------------------------------------

--
-- Struttura della tabella `autore-libri`
--

CREATE TABLE `autore-libri` (
  `id` int(11) NOT NULL,
  `cod.copia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `autore-libri`
--

INSERT INTO `autore-libri` (`id`, `cod.copia`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `genere` varchar(20) NOT NULL,
  `eta` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `categoria`
--

INSERT INTO `categoria` (`id`, `genere`, `eta`) VALUES
(1, 'horror', '+14'),
(2, 'fantasy', '+8'),
(3, 'fiabe', '+2');

-- --------------------------------------------------------

--
-- Struttura della tabella `libri`
--

CREATE TABLE `libri` (
  `cod.copia` int(11) NOT NULL,
  `ISBN` varchar(11) NOT NULL,
  `Titolo` varchar(50) NOT NULL,
  `num_pagine` varchar(10000) NOT NULL,
  `categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `libri`
--

INSERT INTO `libri` (`cod.copia`, `ISBN`, `Titolo`, `num_pagine`, `categoria`) VALUES
(1, '01234567891', 'Se questo è un uomo ', '562', 1),
(2, '01234567891', 'Promessi sposi', '3211', 2),
(3, '01234567891', 'Il miglio verde', '987897489456456456', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `prestito`
--

CREATE TABLE `prestito` (
  `cod.copia` int(11) NOT NULL,
  `cod.tessera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `prestito`
--

INSERT INTO `prestito` (`cod.copia`, `cod.tessera`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `richiedente`
--

CREATE TABLE `richiedente` (
  `Cod.tessera` int(11) NOT NULL,
  `Cognome` varchar(50) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `mail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `richiedente`
--

INSERT INTO `richiedente` (`Cod.tessera`, `Cognome`, `Nome`, `telefono`, `mail`) VALUES
(1, 'Callioni', 'Edoardo Mario', '3313954087', 'caledo1907@gmail.com'),
(2, 'Verzeri', 'Mattero', '3331107806', 'matverzer@gmail.com'),
(3, 'Ghirardi', 'Nicolas', '3249875517', 'nicolasghirardi251005@gmail.com');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `autore`
--
ALTER TABLE `autore`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `autore-libri`
--
ALTER TABLE `autore-libri`
  ADD KEY `libro` (`cod.copia`),
  ADD KEY `autore` (`id`);

--
-- Indici per le tabelle `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `libri`
--
ALTER TABLE `libri`
  ADD PRIMARY KEY (`cod.copia`),
  ADD KEY `categoria` (`categoria`);

--
-- Indici per le tabelle `prestito`
--
ALTER TABLE `prestito`
  ADD KEY `richiedente` (`cod.tessera`);

--
-- Indici per le tabelle `richiedente`
--
ALTER TABLE `richiedente`
  ADD PRIMARY KEY (`Cod.tessera`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `autore`
--
ALTER TABLE `autore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `libri`
--
ALTER TABLE `libri`
  MODIFY `cod.copia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `richiedente`
--
ALTER TABLE `richiedente`
  MODIFY `Cod.tessera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `autore-libri`
--
ALTER TABLE `autore-libri`
  ADD CONSTRAINT `autore` FOREIGN KEY (`id`) REFERENCES `autore` (`id`),
  ADD CONSTRAINT `libro` FOREIGN KEY (`cod.copia`) REFERENCES `libri` (`cod.copia`);

--
-- Limiti per la tabella `libri`
--
ALTER TABLE `libri`
  ADD CONSTRAINT `categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id`);

--
-- Limiti per la tabella `prestito`
--
ALTER TABLE `prestito`
  ADD CONSTRAINT `richiedente` FOREIGN KEY (`cod.tessera`) REFERENCES `richiedente` (`Cod.tessera`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
