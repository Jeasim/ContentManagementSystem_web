<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class AjouterProjetAction extends CommonAction {

		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_ADMINISTRATOR, "Modification 'Projets'", null, null, null, "Administrateur");
		}

		protected function executeAction() {

			$nom = $_POST["nom"];
			$contenu = $_POST["contenu"];
			$statut = $_POST["statut"];

			$this->result = TexteModifiableDAO::ajouterProjet($nom, $contenu, $statut);
		}
	}