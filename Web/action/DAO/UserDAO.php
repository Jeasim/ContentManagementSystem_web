<?php
	require_once("action/DAO/Connection.php");

	class UserDAO {

		public static function authenticate($username, $password) {
			$connection = Connection::getConnection();

			$statement = $connection->prepare("SELECT * FROM USERS WHERE USERNAME = ?");
			$statement->bindParam(1, $username);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$infoUser = null;

			if ($row = $statement->fetch()) {
				if (password_verify($password, $row["PASSWORD"])) {
					$infoUser = $row;
				}
			}

			return $infoUser;
		}

	}