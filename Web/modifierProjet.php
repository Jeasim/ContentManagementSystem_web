<?php
	require_once("action/ModifierProjetAction.php");

	$action = new ModifierProjetAction;
	$action->execute();

	echo json_encode($action->result);