<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class ModifierEmployeAction extends CommonAction {

		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_ADMINISTRATOR, "Modification 'Équipe'", null, null, "Administrateur");
		}

		protected function executeAction() {

			$id = $_POST["employeID"];
			$nom = utf8_encode($_POST["nom"]);
			$poste = utf8_encode($_POST["poste"]);
			$departement = utf8_encode($_POST["departement"]);
			$infoSup = utf8_encode($_POST["infoSup"]);
			$numTel = utf8_encode($_POST["numTel"]);
			$courriel = utf8_encode($_POST["courriel"]);

			$this->result = TexteModifiableDAO::modifierEmploye($id, $nom, $poste, $departement, $infoSup, $numTel, $courriel);
		}
	}