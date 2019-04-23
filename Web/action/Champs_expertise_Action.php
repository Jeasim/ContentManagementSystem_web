<?php
	require_once("action/CommonAction.php");

	class Champs_expertise_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Champs d'expertise", "Qui sommes-nous?", "qui_sommes_nous.php", "À propos");
		}

		protected function executeAction() {

		}
	}