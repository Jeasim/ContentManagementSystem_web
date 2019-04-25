<?php
	require_once("action/Recherche_appliquee_Action.php");
	$action = new Recherche_appliquee_Action();
	$action->execute();

	require_once("partial/header.php");
	require_once("partial/breadcrump_pageHeader.php");
?>

<div class="container">
	<div class="row">

		<div class="col-sm-5">
			<div class="widget widget-categories">
				<ul>
					<li class="active"><a href="recherche_appliquee.php">Recherche appliquée</a></li>
					<li><a href="services_accompagnement.php">Services d'accompagnement en innovation sociale</a></li>
					<li><a href="laboratoire_technologies_adaptatives.php">Laboratoire en technologies adaptatives</a></li>
					<li><a href="formation_transfert.php">Formation et transfert</a></li>
				</ul>
			</div><!-- widget-categories -->
		</div><!-- col -->

		<div class="col-sm-7">
			<div class="blog-article">
				<h1>Recherche appliquée</h1>
					<p>En se dédiant au volet appliqué, le CRISPESH fait le pont entre la recherche et la communauté. L’équipe propose des adaptations pratiques, basées sur les résultats de la recherche fondamentale, afin de solutionner ou de résoudre différents problèmes sociaux en collaborant et en accompagnant les milieux dans les volets suivants:</p>
					<ul>
						<li>Le développement et la mise en œuvre de projets de recherche appliquée</li>
						<li>Le développement de partenariats de recherche avec les milieux communautaires, collégiaux et universitaires</li>
						<li>L’encadrement d’étudiants de niveau collégial et universitaire</li>
					</ul>
			</div><!-- blog-article -->
		</div><!-- col -->
		<div class="rond_background jaune droite grosseur_2" id="cercle_2"></div>
	</div><!-- row -->
</div><!-- container -->

<?php
	require_once("partial/footer.php");