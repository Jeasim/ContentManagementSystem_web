<?php
	require_once("action/CommonAction.php");

	class Partenaires_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Nos partenaires");
		}

		protected function executeAction() {

		}
	}