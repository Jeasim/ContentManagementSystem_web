<?php
	require_once("action/CommonAction.php");

	class Documentation_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Documentation", "Accueil", "index.php", "Documentation");
		}

		protected function executeAction() {

		}
	}