<?php
	require_once("action/CommonAction.php");

	class Situation_handicap_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Situation de handicap", "Qui sommes-nous?", "qui_sommes_nous.php", "À propos");
		}

		protected function executeAction() {

		}
	}