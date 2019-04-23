<?php
	require_once("action/CommonAction.php");

	class Index_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Accueil");
		}

		protected function executeAction() {

		}
	}