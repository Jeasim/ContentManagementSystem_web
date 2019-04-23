<?php
	require_once("action/CommonAction.php");

	class Situation_handicap_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Qui sont les personnes en situation de handicap?");
		}

		protected function executeAction() {

		}
	}