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

$first = $_POST['first_name'];
$last = $_POST['last_name'];
$password = $_POST['password'];
$email = $_POST['email'];
$type = $_POST['user_type_id'];

$sql = "INSERT INTO `user` (`user_type_id`, `first_name`, `last_name`, `email`, `password`) VALUES ('$type', '$first', '$last', '$email', '$password')";

if(!mysqli_query($con,$sql))
{
echo 'cos jeblo z dodawaniem';
}
else 
{
echo 'dodane';
}
header ("refresh:2; url=../../panel.php");