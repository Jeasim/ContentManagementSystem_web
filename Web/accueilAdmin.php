<?php
	require_once("action/AccueilAdmin_Action.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	$action = new AccueilAdmin_Action();
	$action->execute();

	require_once("partial/header.php");
?>

<script src="ckeditor/ckeditor.js"></script>

<form action="accueilAdmin.php" method="post">

	<textarea name="editor" id="editor" rows="10" cols="80">
		<?php
			$texte = TexteModifiableDAO::LireTexte("accueil", "entete");
			echo $texte;
		?>
	</textarea>

	<script>
		CKEDITOR.replace( 'editor' );
	</script>

</form>

<?php
	require_once("partial/footer.php");