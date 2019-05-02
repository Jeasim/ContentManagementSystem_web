<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class AccueilAdmin_Action extends CommonAction {

		public $texteModif;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_ADMINISTRATOR, "Accueil administrateur", null, null, "Administrateur");
		}

		protected function executeAction() {
			if(!empty($_POST["editeur"])){
				TexteModifiableDAO::updateTexteAccueil($_POST["editeur"], "entete");
			}
		}
	}