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

			$contenu = $contenu['CONTENU'];

			return $contenu;
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

		public static function fetchEmploye($id){
			$connection = Connection::getConnection();
			$statement = $connection->prepare("SELECT * FROM employes WHERE id = ?");
			$statement->bindParam(1, $id);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			while ($row = $statement->fetch()) {
				$employe = $row;
			}

			$employe["DEPARTEMENT"] = self::fetchDepartement($id);

			return $employe;
		}

		public static function fetchDepartement($id){
			$connection = Connection::getConnection();
			$statement = $connection->prepare("SELECT nom FROM departements WHERE id = ( SELECT id_departement FROM employes WHERE id = ? )");
			$statement->bindParam(1, $id);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			while ($row = $statement->fetch()) {
				$departement = $row["NOM"];
			}

			return $departement;
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

		public static function ajouterEmploye($nom, $poste, $departement, $numTel, $courriel, $infoSup1, $infoSup2){
			$departementID = self::fetchDepartementID($departement);

			$connection = Connection::getConnection();
			$statement = $connection->prepare(" INSERT INTO employes( nom, id_departement, poste, courriel, numtel, info_sup1, info_sup2 ) VALUES( ?, ?, ?, ?, ?,  ?, ? )");
			$statement->bindParam(1, $nom);
			$statement->bindParam(2, $departementID);
			$statement->bindParam(3, $poste);
			$statement->bindParam(4, $courriel);
			$statement->bindParam(5, $numTel);
			$statement->bindParam(6, $infoSup1);
			$statement->bindParam(7, $infoSup2);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();
		}

		public static function modifierEmploye($id, $nom, $poste, $departement, $numTel, $courriel, $infoSup1, $infoSup2){
			$departementID = self::fetchDepartementID($departement);

			$connection = Connection::getConnection();
			$statement = $connection->prepare("UPDATE employes SET nom = ?, poste = ?, numtel = ?, courriel = ?, id_departement = ?, info_sup1 = ?, info_sup2 = ? WHERE id = ? ");
			$statement->bindParam(1, $nom);
			$statement->bindParam(2, $poste);
			$statement->bindParam(3, $numTel);
			$statement->bindParam(4, $courriel);
			$statement->bindParam(5, $departementID);
			$statement->bindParam(6, $infoSup1);
			$statement->bindParam(7, $infoSup2);
			$statement->bindParam(8, $id);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

		}

		public static function supprimerEmploye($employeID){
			$connection = Connection::getConnection();
			$statement = $connection->prepare("DELETE FROM employes WHERE id = ?");
			$statement->bindParam(1, $employeID);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();
		}

		public static function ajouterProjet($nom, $contenu, $statut){
			$connection = Connection::getConnection();
			$statement = $connection->prepare(" INSERT INTO projets( nom, contenu, statut ) VALUES( ?, ?, ? )");
			$statement->bindParam(1, $nom);
			$statement->bindParam(2, $contenu);
			$statement->bindParam(3, $statut);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();
		}

		public static function fetchProjets($statut){
			$connection = Connection::getConnection();
			$statement = $connection->prepare("SELECT * FROM projets WHERE statut = ?");
			$statement->bindParam(1, $statut);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$projets = [];

			while($row = $statement->fetch()) {
				$projets[] = $row;
			}

			return $projets;
		}

		public static function supprimerProjet($projetID){
			$connection = Connection::getConnection();
			$statement = $connection->prepare("DELETE FROM projets WHERE id = ?");
			$statement->bindParam(1, $projetID);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();
		}

		public static function ajouterInfoSupProjet($nom, $champ, $info){
			$projetID  = self::fetchProjetID($nom);

			$connection = Connection::getConnection();
			$statement = $connection->prepare(" INSERT INTO infos_projets( id_projet, champ, info ) VALUES( ?, ?, ? )");
			$statement->bindParam(1, $projetID);
			$statement->bindParam(2, $champ);
			$statement->bindParam(3, $info);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();
		}

		public static function ajouterInfoSupProjetParProjetID($projetID, $champ, $info){
			$connection = Connection::getConnection();
			$statement = $connection->prepare(" INSERT INTO infos_projets( id_projet, champ, info ) VALUES( ?, ?, ? )");
			$statement->bindParam(1, $projetID);
			$statement->bindParam(2, $champ);
			$statement->bindParam(3, $info);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();
		}

		public static function fetchProjetID($nomProjet){
			$connection = Connection::getConnection();
			$statement = $connection->prepare("SELECT id FROM projets WHERE nom = ?");
			$statement->bindParam(1, $nomProjet);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$projetID = null;

			if($row = $statement->fetch()) {
				$projetID = $row['ID'];
			}

			return $projetID;
		}

		public static function fetchProjet($projetID){
			$connection = Connection::getConnection();
			$statement = $connection->prepare("SELECT * FROM projets WHERE id = ?");
			$statement->bindParam(1, $projetID);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$projet = null;

			if($row = $statement->fetch()) {
				$projet = $row;
			}

			return $projet;
		}

		public static function fetchInfosSupProjet($projetID){
			$connection = Connection::getConnection();
			$statement = $connection->prepare("SELECT * FROM infos_projets WHERE id_projet = ?");
			$statement->bindParam(1, $projetID);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$infoSup = [];

			while($row = $statement->fetch()) {
				$infoSup[] = $row;
			}

			return $infoSup;
		}

		public static function modifierProjet($nom, $contenu, $statut, $projetID){
			$connection = Connection::getConnection();
			$statement = $connection->prepare("UPDATE projets SET nom = ?, contenu = ?, statut = ? WHERE id = ? ");
			$statement->bindParam(1, $nom);
			$statement->bindParam(2, $contenu);
			$statement->bindParam(3, $statut);
			$statement->bindParam(4, $projetID);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();
		}

		public static function modifierInfoSupProjet($champ, $info, $id){
			$connection = Connection::getConnection();
			$statement = $connection->prepare("UPDATE infos_projets SET champ = ?, info = ? WHERE id = ? ");
			$statement->bindParam(1, $champ);
			$statement->bindParam(2, $info);
			$statement->bindParam(3, $id);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();
		}

		public static function supprimerInfosProjet($projetID){
			$connection = Connection::getConnection();
			$statement = $connection->prepare("DELETE FROM infos_projets WHERE id_projet = ?");
			$statement->bindParam(1, $projetID);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();
		}
	}