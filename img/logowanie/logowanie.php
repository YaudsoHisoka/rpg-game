<?php
	$printable = false;
	if (isset($_POST['login']) && isset($_POST['pass'])) 
			if (!empty($_POST['login']) && 
				!empty($_POST['pass'])) 
			$printable = true;
		
 	
?>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<meta charset="utf-8"/>
	</head>
	<body style="background-image:url('https://i2.wp.com/cftaft.com/wp-content/uploads/2016/03/white-background-wallpaper-2956247.jpg?ssl=1'); text-align: center;">
	<div class="jumbotron" style="margin-top:13%;">
  <h1 class="display-3">Logowanie</h1>
  <p class="lead">Proszê siê zalogowaæ:</p>
  <hr class="my-2">
		<form method="post">
			<p>Login: <input type="text" name="login" placeholder="E-Mail/Login"/></p><br />
			<p>Has³o: <input type="password" name="pass" placeholder="Has³o"/></p><br />
			<input type="submit" value="Przeœlij"  class="btn btn-primary btn-lg"/>
		</form>
</div>

		<?php
			if ($printable) {
				$pdo = new PDO('mysql:host=localhost;port=3306;dbname=rpgdb;charset=utf8', 'root', '');
				$stm = $pdo->query("SELECT count(*) FROM `user` WHERE `first_name` = '{$_POST['login']}' AND `password` = '{$_POST['pass']}' AND (`user_type_id` = 1 OR `user_type_id` = 2);");
				$ret = $stm->fetch();
				if ($ret[0] == 1)
					header('Location: ../panel.php'); 
				else {
					$stm = $pdo->query("SELECT count(*) FROM `user` WHERE `email` LIKE '{$_POST['login']}%' AND `password` = '{$_POST['pass']}AND (`user_type_id` = 1 OR `user_type_id` = 2)';");
					$ret = $stm->fetch();
					print_r($ret);
					if ($ret[0] == 1)
                        header('Location: ../panel.php');
                        else {
                            echo "<p>Brak konta b¹dŸ autoryzacja niejednoznaczna!</p>";
                        }
				}
			}
		?>
	</body>

	
</html>
