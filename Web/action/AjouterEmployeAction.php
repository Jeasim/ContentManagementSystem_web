<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class AjouterEmployeAction extends CommonAction {

		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Modification 'Équipe'", null, null, null, "Administrateur");
		}

		protected function executeAction() {

			$nom = $_POST["nom"];
			$poste = $_POST["poste"];
			$departement = $_POST["departement"];
			$infoSup1 = $_POST["infoSup1"];
			$infoSup2 = $_POST["infoSup2"];
			$numTel = $_POST["numTel"];
			$courriel = $_POST["courriel"];

			$this->result = TexteModifiableDAO::ajouterEmploye($nom, $poste, $departement, $numTel, $courriel, $infoSup1, $infoSup2);
		}
	}