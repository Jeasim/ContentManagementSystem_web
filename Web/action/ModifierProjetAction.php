<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	class ModifierProjetAction extends CommonAction {

		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC, "Modification 'Projets'", null, null, null, "Administrateur");
		}

		protected function executeAction() {

			$projetID = $_POST["projetID"];
			$nom = $_POST["nom"];
			$contenu = $_POST["contenu"];
			$statut = $_POST["statut"];

			$this->result = TexteModifiableDAO::modifierProjet($nom, $contenu, $statut, $projetID);
		}
	}