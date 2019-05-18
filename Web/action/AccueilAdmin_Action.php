<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class AccueilAdmin_Action extends CommonAction {

		public $texteModif;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_ADMINISTRATOR, "Accueil administrateur", "admin",null, null, "Administrateur");
		}

		protected function executeAction() {

		}
	}