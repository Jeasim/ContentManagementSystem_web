<?php
	require_once("action/CommonAction.php");

	class AccueilAdmin_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_ADMINISTRATOR, "Accueil administrateur", null, null, "Administrateur");
		}

		protected function executeAction() {

		}
	}