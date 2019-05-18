<?php
	require_once("action/CommonAction.php");

	class Nous_joindre_Action extends CommonAction {

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Nous joindre", "joindre", "Accueil", "index.php", "Nous joindre");
		}

		protected function executeAction() {
			if(!empty($_POST["name"]) && !empty($_POST["email"]) && !empty($_POST["subject"]) && !empty($_POST["message"])){
				$to      = 'jeasim05@gmail.com';
				$subject = $_POST["subject"];
				$message = $_POST["message"];
				$headers = 'Envoyé par: ' . $_POST["name"] . '\r\n à ' . $_POST["email"];

				mail($to, $subject, $message, $headers);
			}
		}
	}