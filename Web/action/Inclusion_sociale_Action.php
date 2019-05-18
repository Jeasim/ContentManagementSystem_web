<?php
	require_once("action/CommonAction.php");

	class Inclusion_sociale_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "L’inclusion sociale", "propos", "Qui sommes-nous?", "qui_sommes_nous.php", "À propos");
		}

		protected function executeAction() {

		}
	}