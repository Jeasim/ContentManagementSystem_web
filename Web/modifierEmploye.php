<?php
	require_once("action/ModifierEmployeAction.php");

	$action = new ModifierEmployeAction;
	$action->execute();

	echo json_encode($action->result);