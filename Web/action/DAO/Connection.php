<?php
	require_once("action\DAO\constants.php");

	class Connection {

		private static $connection;

		public static function getConnection() {
			if (Connection::$connection == null) {
				Connection::$connection = new PDO("oci:dbname=" . DB_NAME . ";charset=utf8", DB_USER, DB_PASS);
				Connection::$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				Connection::$connection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
			}

			return Connection::$connection;
		}
	}