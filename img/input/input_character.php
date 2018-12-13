<html>
<head>
<meta charset="UTF-8" />
<title>AAA</title>
</head>
	<body>
	<div id="form">
		<form action="input_scripts/add_character.php" method="post">
			Podaj Nazwe Postaci
			<input type="text" name="character_name" />
			<br> Podaj Klase
			<input type="text" name="character_class_id" /> 1-wojownik 2-ninja 3-mag 4-palladyn
			<br>Postac dla gracza czy NPC
			<input type="text" name="character_type_id" /> 1-gracz 2-NPC
			<br> Podaj statystyki:
			<input type="text" name="str" />strength <br>
			<input type="text" name="cons" />constitution <br>
			<input type="text" name="dex" />dexterity <br>
			<input type="text" name="int" />intelligence <br>
			<input type="text" name="char" />charisma<br>
			<input type="text" name="wis" />wisdom <br>
			<input type="text" name="willp" />willpower <br>
			<input type="text" name="per" />perception <br>
			<input type="text" name="luck" />luck <br>
			<input type="text" name="dmg" />damage <br>
			<input type="submit" value="DODAJ" />
		</form>
	</div>
	<div id="all_users">
	Istniejacy juz uzytkownicy :<br>
	<?php
		$modal=0;
		$pdo = new PDO('mysql:host=localhost;port=3306;dbname=rpgdb;charset=utf8','root','');
		$wynik = $pdo->query("SELECT * FROM user;");
		foreach($wynik as $row){
			echo $row['first_name'].' '.$row['last_name'].' Typ konta -->'.$row['user_type_id'].'<br>';
		}
		?>
	</div>
	</body>
</html>