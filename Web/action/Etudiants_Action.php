<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class Etudiants_Action extends CommonAction {

		public $employes;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Étudiants", "equipe", "Équipe", "equipe.php", "Équipe");

		}

		protected function executeAction() {
			$this->employes = TexteModifiableDAO::fetchEmployeParDepartement("Étudiants (Assistants de recherche et stagiaires)");
		}
	}