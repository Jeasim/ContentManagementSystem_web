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

			$contenu = utf8_decode($contenu['CONTENU']);

			return $contenu;
		}

		public static function updateTexteAccueil($texteModif, $section){
			$connection = Connection::getConnection();

			$texteModif = utf8_encode($texteModif);

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
				$departements[] = utf8_decode($row['NOM']);
			}

			return $departements;
		}

		public static function fetchEmployeParDepartement($departement){
			$departementID =  self::fetchDepartementID($departement);

			$connection = Connection::getConnection();
			$statement = $connection->prepare("SELECT * FROM employes WHERE id_departement = ?");
			$statement->bindParam(1, $departementID);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$employes = [];

			while ($row = $statement->fetch()) {
				$row["INFOS"] = self::fetchInfosSupEmploye($row["ID"]);
				$employes[] = $row;
			}

			return $employes;
		}

		public static function fetchDepartementID($nomDepartment){
			$connection = Connection::getConnection();
			$statement = $connection->prepare("SELECT id FROM departements WHERE nom = ?");
			$statement->bindParam(1, $nomDepartment);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			if($row = $statement->fetch()) {
				$departementID = $row['ID'];
			}

			return $departementID;
		}

		public static function fetchInfosSupEmploye($employeID){
			$connection = Connection::getConnection();
			$statement = $connection->prepare("SELECT info FROM infos_sup WHERE id_employe = ?");
			$statement->bindParam(1, $employeID);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$info = null;

			if($row = $statement->fetch()) {
				$info = $row;
			}

			return $info;
		}

	}