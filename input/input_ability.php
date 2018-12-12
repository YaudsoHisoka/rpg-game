<html>
<head>
<meta charset="UTF-8" />
<title>AAA</title>
</head>
	<body>
	<div id="form">
		<form action="input_scripts/add_ability.php" method="post">
			Podaj nazwe
			<input type="text" name="name" />
			<br> Podaj typ
			<input type="text" name="type" /> 1- ogien 2-woda 3-powietrze 4-ziemia 5-blyskawica 6-wampiryczna 7-lecznicza 8-swiatla 9-cienia 10-unikatowa
			<br>Podaj wymagany lvl
			<input type="text" name="lvl" />
			<input type="submit" value="DODAJ" />
		</form>
	</div>
	<div id="all_users">
	Istniejace juz umiejetnosci :<br>
	<?php
		$modal=0;
		$pdo = new PDO('mysql:host=localhost;port=3306;dbname=rpgdb;charset=utf8','root','');
		$wynik = $pdo->query("SELECT * FROM ability;");
		foreach($wynik as $row){
			echo $row['name'].' typ '.$row['ability_type_id'].' wymagany poziom '.$row['required_level'].'<br>';
		}
		?>
	</div>
	</body>
</html>