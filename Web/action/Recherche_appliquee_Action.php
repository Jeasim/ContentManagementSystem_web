<?php
	require_once("action/CommonAction.php");

	class Recherche_appliquee_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Recherche appliquée", "Nos Services", "services.php", "Nos services");
		}

		protected function executeAction() {

		}
	}