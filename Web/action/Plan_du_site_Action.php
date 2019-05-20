<?php
	require_once("action/CommonAction.php");

	class Plan_du_site_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Plan du site", "plan", "Accueil", "index.php", "Plan du site");
		}

		protected function executeAction() {

		}
	}