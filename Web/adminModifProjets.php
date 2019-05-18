<?php
	require_once("action/AdminModifProjets_Action.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	$action = new AdminModifProjets_Action();
	$action->execute();

	require_once("partial/header.php");
?>


<?php
	require_once("partial/footer.php");