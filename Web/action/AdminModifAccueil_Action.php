<?php
	require_once("action/CommonAction.php");

	class AdminModifAccueil_Action extends CommonAction {


		public $contenuEntete;
		public $contenuPresentation;


		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_ADMINISTRATOR, "Modification 'Accueil'", null, null, "Administrateur");
		}

		protected function executeAction() {

			$this->contenuEntete = TexteModifiableDAO::lireTexteAccueil("entete");
			$this->contenuPresentation = TexteModifiableDAO::lireTexteAccueil("presentation");

			if(!empty($_POST["editeurPresentation"])){
				$contenu = utf8_encode ($_POST["editeurPresentation"] );
				TexteModifiableDAO::updateTexteAccueil($contenu, "presentation");
			}

			if(!empty($_POST["editeurEntete"])){
				$contenu = utf8_encode ($_POST["editeurEntete"] );
				TexteModifiableDAO::updateTexteAccueil($contenu, "entete");
			}



		}
	}