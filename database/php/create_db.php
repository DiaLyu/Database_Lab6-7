<?php
	$db_name = $_POST['db_name'];
	$db_charset = $_POST['db_charset'];
	$host = 'databs';
	$user = 'root';
	$password = 'root';
	try {
		$dbh = new PDO("mysql:host={$host};", 'root', $password);
		$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$sql_create_db = "CREATE DATABASE {$db_name} COLLATE {$db_charset}";
		if ($dbh->query($sql_create_db))
			echo "База данных \"".$db_name."\" добавлена! ".$sql_create_db;
		else echo "Ошибка создания базы данных!";
	}  catch (PDOException $e) {
		echo "Ошибка! Запрос не выполнен" . $e->getMessage();
	}