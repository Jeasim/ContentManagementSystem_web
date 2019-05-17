<?php
	require_once("action/FetchInfosEmployeAction.php");

	$action = new FetchInfosEmployeAction();
	$action->execute();

	echo json_encode($action->result);