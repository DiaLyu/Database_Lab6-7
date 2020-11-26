<!DOCTYPE html>
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<title>База данных PHP</title>
	<link rel="stylesheet" href="libs/overhang/overhang.css">
	<link rel="stylesheet" href="fontawesome/css/all.css">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
    rel="stylesheet">
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
</body>
	<div class="left-block">
		<h1 class="name-of-project"><i class="fa fa-cogs" aria-hidden="true"></i>DataBase
		</h1>
		<div class="navigation_database">
			<a class="btn_create_database btn">Создать БД</a>
			<?php require_once("php/connection.php");?>
		</div>
	</div>
	<div class="right-block">
	</div>
	<div class="sql-block-input">
		<div class="sql-block-open">
			<i class="far fa-arrow-alt-from-bottom"></i>
			<p class="sql-text">SQL</p>
		</div>
		<div class="sql-block-content">
			<p class="sql-block-content-text">Запишите SQL запрос</p>
			<button class="sql-block-content-btn">Выполнить</button>
			<textarea cols="49" rows="9"></textarea>
		</div>
	</div>
	<script src="js/jquery.js"></script>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
	<script src="libs/overhang/overhang.js"></script>
	<script src="js/script.js"></script>
</body>
</html>
<a href="#" class="view-link"></a>