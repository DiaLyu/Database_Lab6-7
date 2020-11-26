-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 26 2020 г., 15:13
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db_ddl_dml`
--

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `book_and_its_reader`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `book_and_its_reader` (
`full_name` varchar(255)
,`course` int(10) unsigned
,`author_by_book` varchar(55)
,`name_of_book` varchar(255)
);

-- --------------------------------------------------------

--
-- Структура таблицы `borrowed_books`
--

CREATE TABLE `borrowed_books` (
  `id` int(11) NOT NULL,
  `id_st` int(11) NOT NULL,
  `id_bk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `borrowed_books`
--

INSERT INTO `borrowed_books` (`id`, `id_st`, `id_bk`) VALUES
(1, 1, 3),
(6, 5, 9),
(7, 3, 9),
(8, 2, 12),
(9, 5, 5),
(10, 3, 1),
(11, 1, 2),
(13, 6, 13),
(14, 8, 1),
(15, 7, 2),
(16, 4, 15),
(17, 6, 11),
(19, 8, 10);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `deptors_at_the_end`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `deptors_at_the_end` (
`full_name` varchar(255)
,`course` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Структура таблицы `library`
--

CREATE TABLE `library` (
  `id_bk` int(11) NOT NULL,
  `author_by_book` varchar(55) NOT NULL,
  `name_of_book` varchar(255) NOT NULL,
  `year_of_publishing` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `library`
--

INSERT INTO `library` (`id_bk`, `author_by_book`, `name_of_book`, `year_of_publishing`) VALUES
(1, 'Джордж Оруэлл', '1984', 1949),
(2, 'Альбер Камю', 'Чума', 1947),
(3, 'Айн Ренд', 'Атлант расправил плечи', 1970),
(5, 'Н.В.Гоголь', 'Мертвые души', 1842),
(6, 'Э.М.Ремарк', 'На западном фронте без перемен', 1929),
(7, 'Харпер Ли', 'Убить пересмешника', 1960),
(8, 'Кассандра Клэр', 'Орудия смерти. Город небесного огня', 2014),
(9, 'Рэй Бредбери', 'Вино из одуванчиков', 1957),
(10, 'Роберт Киосаки ', 'Богатый папа, бедный папа', 2003),
(11, 'Энтони Бёрджесс', 'Заводной апельсин', 1962),
(12, 'Борис Васильев', 'Не стреляйте в белых лебедей', 1975),
(13, 'Чарльз Диккенс', 'Дэвид Копперфильд', 1849),
(14, 'Ф.М. Достоевский ', 'Преступление и наказание', 1866),
(15, 'В.Набоков', 'Лолита', 1955),
(16, 'Михаил Булгаков', 'Мастер и Маргарита', 1936),
(18, 'А.С.Грибоедов', 'Горе от ума', 1831);

--
-- Триггеры `library`
--
DELIMITER $$
CREATE TRIGGER `delete_readers` BEFORE DELETE ON `library` FOR EACH ROW BEGIN
DELETE FROM borrowed_books WHERE borrowed_books.id_bk = OLD.id_bk;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `preservation_del` AFTER DELETE ON `library` FOR EACH ROW BEGIN
INSERT INTO updated_library(id_upd, author, operation)
VALUES (OLD.id_bk, OLD.author_by_book, 'del');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `preservation_ins` BEFORE INSERT ON `library` FOR EACH ROW BEGIN
INSERT INTO updated_library(id_upd, author, operation)
VALUES (NEW.id_bk, NEW.author_by_book, 'ins');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `preservation_upd` AFTER UPDATE ON `library` FOR EACH ROW BEGIN
INSERT INTO updated_library(id_upd, author, operation)
VALUES (OLD.id_bk, OLD.author_by_book, 'upd');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `modern_books`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `modern_books` (
`author_by_book` varchar(55)
,`name_of_book` varchar(255)
);

-- --------------------------------------------------------

--
-- Структура таблицы `students`
--

CREATE TABLE `students` (
  `id_st` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `course` int(10) UNSIGNED NOT NULL,
  `phone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `students`
--

INSERT INTO `students` (`id_st`, `full_name`, `course`, `phone`) VALUES
(1, 'Косолапов Никита', 2, '89328456725'),
(2, 'Верхотурова Мария', 2, '89375425827'),
(3, 'Денисова Светлана', 4, '89876542345'),
(4, 'Махнёва Вера', 3, '89000334672'),
(5, 'Иванова Анастасия', 5, '89995556677'),
(6, 'Квалов Александр', 1, '89776545321'),
(7, 'Хлебова Дарья', 1, '89342854253'),
(8, 'Шолохов Андрей', 3, '89776545452'),
(9, 'Юшкова Анастасия', 4, '89990002211'),
(10, 'Бушмакина Алина', 5, '89773345656');

-- --------------------------------------------------------

--
-- Структура таблицы `updated_library`
--

CREATE TABLE `updated_library` (
  `id_tb` int(11) NOT NULL,
  `id_upd` int(11) NOT NULL,
  `author` varchar(55) NOT NULL,
  `operation` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `updated_library`
--

INSERT INTO `updated_library` (`id_tb`, `id_upd`, `author`, `operation`) VALUES
(27, 17, 'А.С.Пушкин', 'ins'),
(28, 17, 'А.С.Пушкин', 'upd'),
(29, 17, 'А.С.Пушкин', 'del'),
(30, 4, 'Л.Н.Толстой', 'del'),
(31, 18, 'А.С.Грибоедов', 'ins');

-- --------------------------------------------------------

--
-- Структура для представления `book_and_its_reader`
--
DROP TABLE IF EXISTS `book_and_its_reader`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book_and_its_reader`  AS  select `students`.`full_name` AS `full_name`,`students`.`course` AS `course`,`library`.`author_by_book` AS `author_by_book`,`library`.`name_of_book` AS `name_of_book` from ((`borrowed_books` join `students` on(`borrowed_books`.`id_st` = `students`.`id_st`)) join `library` on(`borrowed_books`.`id_bk` = `library`.`id_bk`)) ;

-- --------------------------------------------------------

--
-- Структура для представления `deptors_at_the_end`
--
DROP TABLE IF EXISTS `deptors_at_the_end`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `deptors_at_the_end`  AS  select `students`.`full_name` AS `full_name`,`students`.`course` AS `course` from `students` where `students`.`course` > 3 ;

-- --------------------------------------------------------

--
-- Структура для представления `modern_books`
--
DROP TABLE IF EXISTS `modern_books`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `modern_books`  AS  select `library`.`author_by_book` AS `author_by_book`,`library`.`name_of_book` AS `name_of_book` from `library` where `library`.`year_of_publishing` > 1900 ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `borrowed_books`
--
ALTER TABLE `borrowed_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bk` (`id_bk`),
  ADD KEY `id_st` (`id_st`);

--
-- Индексы таблицы `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`id_bk`);

--
-- Индексы таблицы `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id_st`);

--
-- Индексы таблицы `updated_library`
--
ALTER TABLE `updated_library`
  ADD PRIMARY KEY (`id_tb`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `borrowed_books`
--
ALTER TABLE `borrowed_books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `library`
--
ALTER TABLE `library`
  MODIFY `id_bk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `students`
--
ALTER TABLE `students`
  MODIFY `id_st` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `updated_library`
--
ALTER TABLE `updated_library`
  MODIFY `id_tb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `borrowed_books`
--
ALTER TABLE `borrowed_books`
  ADD CONSTRAINT `borrowed_books_ibfk_1` FOREIGN KEY (`id_bk`) REFERENCES `library` (`id_bk`),
  ADD CONSTRAINT `borrowed_books_ibfk_2` FOREIGN KEY (`id_st`) REFERENCES `students` (`id_st`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
