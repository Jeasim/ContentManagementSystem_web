<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class AjouterInfosSupProjetAction extends CommonAction {

		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Modification 'Projets'", null, null, null, "Administrateur");
		}

		protected function executeAction() {

			$nom = $_POST["nom"];
			$champ = $_POST["champ"];
			$info = $_POST["info"];

			$this->result = TexteModifiableDAO::ajouterInfoSupProjet($nom, $champ, $info);
		}
	}