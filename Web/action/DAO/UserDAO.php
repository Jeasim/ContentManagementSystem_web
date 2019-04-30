<?php
	require_once("action/DAO/Connection.php");
	require_once("constants.php");

	class UserDAO {

		public static function authenticate($username, $password) {
			$isConnected = false;

			if($username === NOM_ADMIN){
				if(password_verify($password, PWD_ADMIN)){
					$isConnected = true;
				}
			}

			return $isConnected;
		}



		// public static function authenticate1($username, $password) {
		// 	$connection = Connection::getConnection();

		// 	$statement = $connection->prepare("SELECT * FROM USERS WHERE USERNAME = ?");
		// 	$statement->bindParam(1, $username);
		// 	$statement->setFetchMode(PDO::FETCH_ASSOC);
		// 	$statement->execute();

		// 	$infoUser = null;

		// 	if ($row = $statement->fetch()) {
		// 		if (password_verify($password, $row["PASSWORD"])) {
		// 			$infoUser = $row;
		// 		}
		// 	}

		// 	return $infoUser;
		// }



	}