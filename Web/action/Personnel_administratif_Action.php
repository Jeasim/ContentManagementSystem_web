<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class Personnel_administratif_Action extends CommonAction {

		public $employes;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Personnel administratif", "equipe", "Équipe", "equipe.php", "Équipe");

		}

		protected function executeAction() {
			$this->employes = TexteModifiableDAO::fetchEmployeParDepartement("Personnel administratif");
		}
	}