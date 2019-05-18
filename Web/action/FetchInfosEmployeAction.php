<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class FetchInfosEmployeAction extends CommonAction {

		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_ADMINISTRATOR, "Modification 'Équipe'", null,  null, null, "Administrateur");
		}

		protected function executeAction() {

			$this->result = TexteModifiableDAO::fetchEmploye($_POST["employeID"]);

		}
	}