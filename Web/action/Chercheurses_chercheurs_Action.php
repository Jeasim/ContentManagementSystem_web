<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class Chercheurses_chercheurs_Action extends CommonAction {

		public $employes;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Chercheuses et chercheurs affiliés", "Équipe", "equipe.php", "Équipe");

		}

		protected function executeAction() {
			$this->employes = TexteModifiableDAO::fetchEmployeParDepartement("Chercheuses et chercheurs affiliés");
		}
	}