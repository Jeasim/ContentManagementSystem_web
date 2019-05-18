<?php
	require_once("action/CommonAction.php");

	class AdminModifProjets_Action extends CommonAction {


		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_ADMINISTRATOR, "Modification 'Projets'", "admin", null, null, "Administrateur");
		}

		protected function executeAction() {

		}
	}