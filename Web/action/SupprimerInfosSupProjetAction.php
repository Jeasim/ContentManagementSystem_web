<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class SupprimerInfosSupProjetAction extends CommonAction {

		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Modification 'Projets'", null, null, null, "Administrateur");
		}

		protected function executeAction() {

			$this->result = TexteModifiableDAO::supprimerInfosProjet($_POST["projetID"]);

		}
	}