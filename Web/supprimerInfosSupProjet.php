<?php
	require_once("action/SupprimerInfosSupProjetAction.php");

	$action = new SupprimerInfosSupProjetAction;
	$action->execute();

	echo json_encode($action->result);