<?php
	require_once("action/AccueilAdmin_Action.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	$action = new AccueilAdmin_Action();
	$action->execute();

	require_once("partial/header.php");
?>

<script src="ckeditor/ckeditor.js"></script>

<form action="accueilAdmin.php" method="post">

	<textarea name="editeur" id="editor" rows="10" cols="80">
		<?= TexteModifiableDAO::LireTexte("accueil", "entete"); ?>
	</textarea>

	<script>
		CKEDITOR.replace( 'editeur' );
	</script>

	<button type="submit"> Soummettre </button>

</form>

<?php
	require_once("partial/footer.php");