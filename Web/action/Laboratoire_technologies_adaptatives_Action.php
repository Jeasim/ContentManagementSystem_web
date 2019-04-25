<?php
	require_once("action/CommonAction.php");

	class Laboratoire_technologies_adaptatives_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Laboratoire en technologies adaptatives", "Nos Services", "services.php", "Nos services");
		}

		protected function executeAction() {

		}
	}