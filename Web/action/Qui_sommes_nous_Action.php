<?php
	require_once("action/CommonAction.php");

	class Qui_sommes_nous_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Qui sommes-nous?", "Accueil", "index.php", "À propos");
		}

		protected function executeAction() {

		}
	}