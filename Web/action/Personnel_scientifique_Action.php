<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class Personnel_scientifique_Action extends CommonAction {

		public $employes;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Personnel scientifique", "Équipe", "equipe.php", "Équipe");

		}

		protected function executeAction() {
			$this->employes = TexteModifiableDAO::fetchEmployeParDepartement("Personnel scientifique");
		}
	}