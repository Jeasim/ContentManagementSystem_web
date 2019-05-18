<?php
	require_once("action/CommonAction.php");

	class Emplois_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Emplois au CRISPESH", "equipe", "Équipe", "equipe.php", "Équipe");
		}

		protected function executeAction() {

		}
	}