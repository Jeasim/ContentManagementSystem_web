<?php
	require_once("action/CommonAction.php");

	class Nos_projets_Action extends CommonAction {

		public $projetsEnCours;
		public $projetsTermines;
		private $enCours = 0;
		private $termine = 1;


		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, CommonAction::$VISIBILITY_PUBLIC, "Nos Projets", "projets", "Accueil", "index.php", "Nos Projets");
		}

		protected function executeAction() {
			$this->projetsEnCours = TexteModifiableDAO::fetchProjets($this->enCours);
			$this->projetsTermines = TexteModifiableDAO::fetchProjets($this->termine);
		}


	}