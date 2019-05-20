<?php
	require_once("action/AjouterInfosSupProjetAction.php");

	$action = new AjouterInfosSupProjetAction;
	$action->execute();

	echo json_encode($action->result);