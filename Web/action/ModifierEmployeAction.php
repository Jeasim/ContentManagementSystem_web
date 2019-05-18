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
			$nom = utf8_encode($_POST["nom"]);
			$poste = utf8_encode($_POST["poste"]);
			$departement = utf8_encode($_POST["departement"]);
			$infoSup1 = utf8_encode($_POST["infoSup1"]);
			$infoSup2 = utf8_encode($_POST["infoSup2"]);
			$numTel = utf8_encode($_POST["numTel"]);
			$courriel = utf8_encode($_POST["courriel"]);

			$this->result = TexteModifiableDAO::modifierEmploye($id, $nom, $poste, $departement, $numTel, $courriel, $infoSup1, $infoSup2);
		}
	}