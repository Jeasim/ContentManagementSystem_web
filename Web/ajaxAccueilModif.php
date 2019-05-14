<?php
	require_once("action/AjaxAccueilModifAction.php");

	$action = new AjaxAccueilModifAction();
	$action->execute();

	echo json_encode($action->result);
