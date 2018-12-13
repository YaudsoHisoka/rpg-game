<html>
<head>
<meta charset="UTF-8" />
<title>AAA</title>
</head>
	<body>
	<div id="form">
		<form action="input_scripts/add_user.php" method="post">
			Podaj Imie
			<input type="text" name="first_name" />
			<br> Podaj Nazwisko
			<input type="text" name="last_name" />
			<br>Podaj haslo
			<input type="password" name="password" />
			<br> Podaj email
			<input type="text" name="email" />
			<br> Typ konta 
			<input type="text" name="user_type_id" />(1 -admin , 2 - moderator , 3 - gracz , 4 - obserwator)<br>
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