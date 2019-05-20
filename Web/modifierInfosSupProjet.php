<?php
	require_once("action/ModifierInfosSupProjetAction.php");

	$action = new ModifierInfosSupProjetAction;
	$action->execute();

	echo json_encode($action->result);