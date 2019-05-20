<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class ModifierInfosSupProjetAction extends CommonAction {

		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_ADMINISTRATOR, "Modification 'Projet'", "admin", null, null, "Administrateur");
		}

		protected function executeAction() {

			$champ = $_POST["champ"];
			$info = $_POST["info"];

			$this->result = TexteModifiableDAO::modifierInfoSupProjet($champ, $info, $id);
		}
	}