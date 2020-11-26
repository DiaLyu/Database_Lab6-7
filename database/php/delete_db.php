<?php
	$db_name = $_POST['db_name'];
	$host = 'databs';
	$user = 'root';
	$password = 'root';
	try {
		$dbh = new PDO("mysql:host={$host};", 'root', $password);
		$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

		$sql_delete_db = "DROP DATABASE {$db_name}";
		if($dbh->query($sql_delete_db))
		  echo "Выполнен запрос: ".$sql_delete_db;
	}  catch (PDOException $e) {
		echo "Ошибка! Запрос не выполнен" . $e->getMessage();
	}