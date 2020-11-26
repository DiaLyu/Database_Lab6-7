<?php
	error_reporting(E_ALL);
	ini_set('display_errors', 1);
	$host = 'databs';
	$dbname = 'shop';
	$user = 'root';
	$password = 'root';
	$dbh = null;
	try {
		$dbh = new PDO("mysql:host={$host};", 'root', $password);
	} catch (Throwable $e) {
		echo "Ошибка подключения к базе данных<br>" . $e->getMessage() . "<br>";
	}
	$result = get_database_list($dbh); // получает список баз данных
	show_database_list($result);
	function get_database_list($dbh) {
		$result = $dbh->query('SHOW DATABASES')->fetchAll();
		foreach ($result as $key => $value) {
			if ($value['Database'] === 'performance_schema' || 
					$value['Database'] === 'information_schema' ||
					$value['Database'] === 'mysql')
				unset($result[$key]);
		} // удаление системных баз данных, чтобы их не отображать
		return $result;
	}
	function show_database_list($result) {
		$icon = "fa-database";
		$list_database = "<ul class=\"list_database\">";
		foreach ($result as $value) {
			$list_database .= "<li class=\"database\"><i class=\"far {$icon}\"></i>";
			$list_database .= "<a href=\"#\" data-db=\"{$value['Database']}\" class=\"database-link\">{$value['Database']}</a>";
			$list_database .= "<i class=\"fa fa-trash delete_database\" aria-hidden=\"true\"></i></li>";
		}
		$list_database .= "</ul>";
		echo $list_database;
	}
?>