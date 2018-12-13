<?php

$con = mysqli_connect('127.0.0.1','root','');

if(!$con)
{
echo ' cos jeblo z serwerem';
}
if (!mysqli_select_db($con,'rpgdb'))
{
echo 'cos jeblo z baza danuch';
}
$name = $_POST['character_name'];
$class = $_POST['character_type_id'];
$type = $_POST['character_type_id'];
$str = $_POST['str'];
$ = $_POST[''];
$cons = $_POST['cons'];
$dex = $_POST['dex'];
$int = $_POST['int'];
$char = $_POST['char'];
$wis = $_POST['wis'];
$willp = $_POST['willp'];
$per = $_POST['per'];
$luck = $_POST['luck'];




$sql = "INSERT INTO `ability` (`name`,`ability_type_id`,`required_level`) VALUES ('$name','$type','$rlvl')";


if(!mysqli_query($con,$sql))
{
echo 'cos jeblo z dodawaniem';
}
else 
{
echo 'dodane';
}
header ("refresh:2; url=../../panel.php");