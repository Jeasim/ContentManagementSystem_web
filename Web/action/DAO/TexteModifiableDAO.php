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

		public static function updateTexteEnTete($texteModif){
			$connection = Connection::getConnection();

			$statement = "UPDATE accueil SET contenu=? WHERE section='entete'";
			$connection->prepare($statement)->execute([$texteModif]);
		}

	}