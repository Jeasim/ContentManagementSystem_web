<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class SupprimerProjetAction extends CommonAction {

		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_ADMINISTRATOR, "Modification 'Projets'", null, null, null, "Administrateur");
		}

		protected function executeAction() {

			$this->result = TexteModifiableDAO::supprimerProjet($_POST["projetID"]);

		}
	}