<?php
	require_once("action/SupprimerEmployeAction.php");

	$action = new SupprimerEmployeAction;
	$action->execute();

	echo json_encode($action->result);