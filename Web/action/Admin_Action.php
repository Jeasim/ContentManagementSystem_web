<?php
	require_once("action/CommonAction.php");
	require_once("DAO/UserDAO.php");

	class Admin_Action extends CommonAction {

		public $wrongLogin = false;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Administrateur");
		}

		protected function executeAction() {



			if(!empty($_POST["admin-username"]) && !empty($_POST["admin-password"])){
				if(UserDAO::authenticate($_POST["admin-username"], $_POST["admin-password"])){
					$_SESSION["visibility"] = 1;
				}
				else{
					$this->wrongLogin = true;
				}
			}

		}
	}