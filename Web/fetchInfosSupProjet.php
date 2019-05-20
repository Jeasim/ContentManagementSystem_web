<?php
	require_once("action/FetchInfosSupProjetAction.php");

	$action = new FetchInfosSupProjetAction();
	$action->execute();

	echo json_encode($action->result);