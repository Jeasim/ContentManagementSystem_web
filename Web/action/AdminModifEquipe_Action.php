<?php
	require_once("action/CommonAction.php");

	class AdminModifEquipe_Action extends CommonAction {

		public $departements;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_ADMINISTRATOR, "Modification 'Équipe'", null, null, "Administrateur");
		}

		protected function executeAction() {
			$this->departements = TexteModifiableDAO::fetchDepartements();
		}
	}