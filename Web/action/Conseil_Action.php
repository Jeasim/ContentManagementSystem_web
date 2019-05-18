<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class Conseil_Action extends CommonAction {

		public $employes;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Conseil d’administration", "Équipe", "equipe.php", "Équipe");

		}

		protected function executeAction() {
			$this->employes = TexteModifiableDAO::fetchEmployeParDepartement("Conseil d'administration");
		}
	}