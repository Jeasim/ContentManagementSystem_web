<?php
	require_once("action/AjouterProjetAction.php");

	$action = new AjouterProjetAction;
	$action->execute();

	echo json_encode($action->result);