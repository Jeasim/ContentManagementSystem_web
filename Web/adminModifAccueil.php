<?php
	require_once("action/AdminModifAccueil_Action.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	$action = new AdminModifAccueil_Action();
	$action->execute();

	require_once("partial/header.php");
?>

<script src="ckeditor/ckeditor.js"></script>

<div class="contenu-page-ModifAccueil">

	<div class="selection-section-modif">

		<h1>Sélectionner la section que vous désirez modifier</h1>

		<div class="liste-sections-modif">
			<ul>
				<li> <a href="?section-modif=entete">Entête</a></li>
				<li> <a href="?section-modif=presentation">Présentation</a></li>
			</ul>
		</div>


		<div class="img-section-modif img-modif-<?= $action->sectionModif ?> "></div>

	</div>

	<div class="form-ModifAccueil">

		<form action="adminModifAccueil.php" method="post">

			<textarea name="editeur" id="editor">
				<?= $action->contenuSectionModif ?>
			</textarea>

			<script>
				CKEDITOR.replace( 'editeur' );
			</script>

			<button type="submit" class="btn-soummettre"> Soummettre </button>

		</form>
	</div>

</div>

<?php
	require_once("partial/footer.php");