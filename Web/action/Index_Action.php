<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class Index_Action extends CommonAction {

		public $contenuEnTete;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Accueil");
		}

		protected function executeAction() {
			$this->contenuEnTete = TexteModifiableDAO::lireTexteAccueil("entete");
			$this->contenuPresentation = TexteModifiableDAO::lireTexteAccueil("presentation");
		}
	}