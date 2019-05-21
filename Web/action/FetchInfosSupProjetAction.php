<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class FetchInfosSupProjetAction extends CommonAction {

		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "fetch projet");
		}

		protected function executeAction() {

			$this->result = TexteModifiableDAO::fetchInfosSupProjet($_POST["projetID"]);

		}
	}