<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class ModifierEmployeAction extends CommonAction {

		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_ADMINISTRATOR, "Modification 'Équipe'", "admin", null, null, "Administrateur");
		}

		protected function executeAction() {

			$id = $_POST["employeID"];
			$nom = $_POST["nom"];
			$poste = $_POST["poste"];
			$departement = $_POST["departement"];
			$infoSup1 = $_POST["infoSup1"];
			$infoSup2 = $_POST["infoSup2"];
			$numTel = $_POST["numTel"];
			$courriel = $_POST["courriel"];

			$this->result = TexteModifiableDAO::modifierEmploye($id, $nom, $poste, $departement, $numTel, $courriel, $infoSup1, $infoSup2);
		}
	}