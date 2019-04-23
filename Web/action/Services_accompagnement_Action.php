<?php
	require_once("action/CommonAction.php");

	class Services_accompagnement_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Service d’accompagnement en innovation sociale", "Nos Services", "services.php", "Nos services");
		}

		protected function executeAction() {

		}
	}