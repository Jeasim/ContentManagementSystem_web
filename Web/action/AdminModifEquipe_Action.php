<?php
	require_once("action/CommonAction.php");

	class AdminModifEquipe_Action extends CommonAction {

		public $departements;
		public $departementSelectionne = "Personnel administratif";
		public $employes;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_ADMINISTRATOR, "Modification 'Équipe'", "admin", null, null, "Administrateur");
		}

		protected function executeAction() {
			$this->departements = TexteModifiableDAO::fetchDepartements();
			$this->employes = TexteModifiableDAO::fetchEmployeParDepartement($this->departementSelectionne);

			if(!empty($_GET["departementSelectionne"])){
				$this->departementSelectionne = $_GET["departementSelectionne"];
				$this->employes = TexteModifiableDAO::fetchEmployeParDepartement($this->departementSelectionne);
			}
		}
	}