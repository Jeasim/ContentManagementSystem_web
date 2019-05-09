<?php
	require_once("action/AccueilAdmin_Action.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	$action = new AccueilAdmin_Action();
	$action->execute();

	require_once("partial/header.php");
?>

<h1> Bonjour admin! </h1>

</form>

<?php
	require_once("partial/footer.php");