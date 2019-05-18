<?php
	require_once("action/CommonAction.php");

	class Error_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Erreur", null, "Accueil", "index.php", "Erreur");
		}

		protected function executeAction() {

		}
	}