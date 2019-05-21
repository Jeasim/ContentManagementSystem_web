<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class FetchProjetAction extends CommonAction {

		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_ADMINISTRATOR, "fetch projet");
		}

		protected function executeAction() {

			echo var_dump(TexteModifiableDAO::fetchProjet($_POST["projetID"]));
		}
	}