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
$name = $_POST['name'];
$type = $_POST['type'];
$dur = $_POST['trwalosc'];
$rlvl = $_POST['lvl'];

$sql = "INSERT INTO `item` (`name`, `item_type_id`, `durability`, `required_level`) VALUES ('$name','$type','$dur','$rlvl')";

if(!mysqli_query($con,$sql))
{
echo 'cos jeblo z dodawaniem';
}
else 
{
echo 'dodane';
}
header ("refresh:2; url=../../panel.php");