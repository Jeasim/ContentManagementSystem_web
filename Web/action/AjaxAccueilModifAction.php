<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class AjaxAccueilModifAction extends CommonAction {

		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_ADMINISTRATOR, "Ajax modification accueil", null, null, null) ;
		}

		protected function executeAction() {
			$this->result = TexteModifiableDAO::lireTexteAccueil($_POST["section"]);
		}
	}