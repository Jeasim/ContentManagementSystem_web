<?php
	require_once("action/DAO/Connection.php");

	class TexteModifiableDAO{

		public static function lireTexte($section) {

			$connection = Connection::getConnection();

			$statement = $connection->prepare("SELECT * FROM accueil");
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$contenu = null;

			if ($row = $statement->fetch()) {
				$contenu = $row;
			}

			return $contenu['CONTENU'];
		}

	}