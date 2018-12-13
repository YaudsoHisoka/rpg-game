<?php 
$pdo = new PDO('mysql:host=localhost;port=3306;dbname=rpgdb;charset=utf8','root','');
?>
<html>
	<head>
	<title>Panel</title>
	<meta charset="UTF-8" />	
	</head>
	
	<body><br><br>
		<div id="input"><h1>INPUT</h1>
			<br>
			<br>
			<br>
			<br>
			<form action="input/input_user.php"><input type="submit" name="input_user" value="DODAJ UZYTKOWNIKA" /></form>
			<form action="input/input_item.php"><input type="submit" name="input_item" value="DODAJ ITEM" /></form>
			<form action="input/input_ability.php"><input type="submit" name="input_ability" value="DODAJ UMIEJETNOSC" /></form>
			<form action="input/input_character.php"><input type="submit" name="input_character" value="DODAJ POSTAC" /></form>
			
		</div>
	</body>
</html>