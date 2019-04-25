<?php
	require_once("action/CommonAction.php");

	class Nous_joindre_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Nous joindre", "Accueil", "index.php", "Nous joindre");
		}

		protected function executeAction() {

		}
	}