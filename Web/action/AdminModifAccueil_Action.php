<?php
	require_once("action/CommonAction.php");

	class AdminModifAccueil_Action extends CommonAction {



		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_ADMINISTRATOR, "Modification 'Accueil'", null, null, "Administrateur");
		}

		protected function executeAction() {

			$this->contenuSectionModif = TexteModifiableDAO::lireTexteAccueil($this->sectionModif);

			if(!empty($_POST["editeurEntete"])){
				$this->contenuSectionModif = TexteModifiableDAO::lireTexteAccueil($this->sectionModif);
			}

			if(!empty($_POST["editeur"])){
				TexteModifiableDAO::updateTexteAccueil($_POST["editeur"], $this->sectionModif);
			}
		}
	}