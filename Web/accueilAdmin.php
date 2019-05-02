<?php
	require_once("action/AccueilAdmin_Action.php");

	$action = new AccueilAdmin_Action();
	$action->execute();

	require_once("partial/header.php");
?>




<?php
	require_once("partial/footer.php");