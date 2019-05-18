<?php
	require_once("action/CommonAction.php");

	class Equipe_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Équipe", "equipe", "Accueil", "index.php", "Équipe");
		}

		protected function executeAction() {

		}
	}