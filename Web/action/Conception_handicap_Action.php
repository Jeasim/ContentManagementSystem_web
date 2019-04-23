<?php
	require_once("action/CommonAction.php");

	class Conception_handicap_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Notre conception du handicap");
		}

		protected function executeAction() {

		}
	}