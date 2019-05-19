<?php
	require_once("action/SupprimerProjetAction.php");

	$action = new SupprimerProjetAction;
	$action->execute();

	echo json_encode($action->result);