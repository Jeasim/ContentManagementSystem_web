<?php
	require_once("action/FetchProjetAction.php");

	$action = new FetchProjetAction();
	$action->execute();

	echo json_encode($action->result);