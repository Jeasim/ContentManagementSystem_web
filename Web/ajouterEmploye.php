<?php
	require_once("action/AjouterEmployeAction.php");

	$action = new AjouterEmployeAction;
	$action->execute();

	echo json_encode($action->result);