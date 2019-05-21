<?php
	require_once("action/AccueilAdmin_Action.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	$action = new AccueilAdmin_Action();
	$action->execute();

	require_once("partial/header.php");
?>

<div class="texte-accueil-admin">
	<h1> Bonjour admin! </h1>
	<p>En étant connecté, vous aurez accès à plusieurs options de modification du site du CRISPESH</p>
	<p>Vous pourrez ainsi changer à partir de l'onglet "Administrateur" le contenu des pages:</p>
	<ul>
		<li>Accueil</li>
		<li>Équipe</li>
		<li>Projets</li>
	</ul>
	<p>N'oubliez pas de vous déconnecter en fermant votre session.</p>
</div>

</form>

<?php
	require_once("partial/footer.php");