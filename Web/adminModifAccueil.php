<?php
	require_once("action/AdminModifAccueil_Action.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	$action = new AdminModifAccueil_Action();
	$action->execute();

	require_once("partial/header.php");
?>

<script src="js\adminModifAccueil.js"></script>
<script src="ckeditor/ckeditor.js"></script>

<h1 class="page-ModifAccueil-h1">Modifier la page d'acceuil</h1>

<div class="contenu-page-ModifAccueil">

	<div class="form-ModifAccueil">
		<div class="label-section">
			<h2>Entête</h2>
			<img src="images/admin/modif-accueil-entete.png" alt="Section entête" class="img-section-modif">
		</div>

		<form action="adminModifAccueil.php" method="post">

			<textarea name="editeurEntete" id="editeurEntete">

			</textarea>

			<script>
				CKEDITOR.replace( 'editeurEntete' );
			</script>

			<button type="submit" class="btn-blue btn soummettre-modif-accueil"> Soummettre </button>

		</form>
	</div>


	<div class="form-ModifAccueil">

		<div class="label-section">
			<h2>Présentation</h2>
			<img src="images/admin/modif-accueil-presentation.png" alt="Section présentation" class="img-section-modif">
		</div>

		<form action="adminModifAccueil.php" method="post">

			<textarea name="editeurPresentation" id="editeurPresentation">

			</textarea>

			<script>
				CKEDITOR.replace( 'editeurPresentation' );
			</script>

			<button type="submit" class="btn-blue btn soummettre-modif-accueil"> Soummettre </button>

		</form>
	</div>

</div>

<?php
	require_once("partial/footer.php");