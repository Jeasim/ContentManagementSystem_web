<?php
	require_once("action/DAO/Connection.php");

	class TexteModifiableDAO{

		public static function lireTexteAccueil($section) {

			$connection = Connection::getConnection();
			$statement = $connection->prepare("SELECT * FROM accueil WHERE section=?");
			$statement->bindParam(1, $section);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$contenu = null;

			if ($row = $statement->fetch()) {
				$contenu = $row;
			}

			return $contenu['CONTENU'];
		}

		public static function updateTexteAccueil($texteModif, $section){
			$connection = Connection::getConnection();

			$statement = "UPDATE accueil SET contenu=? WHERE section=?";
			$connection->prepare($statement)->execute([$texteModif, $section]);
		}


		public static function fetchDepartements() {

			$connection = Connection::getConnection();
			$statement = $connection->prepare("SELECT * FROM departements");
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$departements = [];

			while ($row = $statement->fetch()) {
				$departements[] = $row['NOM'];
			}

			return $departements;
		}

	}