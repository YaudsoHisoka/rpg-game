<html>
<head>
<meta charset="UTF-8" />
<title>AAA</title>
</head>
	<body>
	<div id="form">
		<form action="input_scripts/add_item.php" method="post">
			Podaj nazwe
			<input type="text" name="name" />
			<br> Podaj typ :
			<input type="text" name="type" /> 1-glowa 2 tulów 3-spodnie 4-buty, 5- rekawice,6-bizuteria 7-bron
			<br> Podaj trwałość
			<input type="text" name="trwalosc" />
			<br>Podaj wymagany poziom
			<input type="text" name="lvl" /><br>
			<input type="submit" value="DODAJ" />
		</form>
	</div>
	<div id="all_users">
	Istniejace juz itemy :<br>
	<?php
		$modal=0;
		$pdo = new PDO('mysql:host=localhost;port=3306;dbname=rpgdb;charset=utf8','root','');
		$wynik = $pdo->query("SELECT * FROM item;");
		foreach($wynik as $row){
			echo $row['name'].' typ'.$row['item_type_id'].' Trwalosc:'.$row['durability'].' Na poziom -->'.$row['required_level'].'<br>';
		}
		?>
	</div>
	</body>
</html>