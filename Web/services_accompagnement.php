<?php
	require_once("action/Services_accompagnement_Action.php");
	$action = new Services_accompagnement_Action();
	$action->execute();

	require_once("partial/header.php");
	require_once("partial/breadcrump_pageHeader.php");
?>

<div class="container">
	<div class="row">

		<div class="col-sm-5">
			<div class="widget widget-categories">
				<ul>
					<li><a href="recherche_appliquee">Recherche appliquée</a></li>
					<li class="active"><a href="services_accompagnement">Services d'accompagnement en innovation sociale</a></li>
					<li><a href="laboratoire_technologies_adaptatives">Laboratoire en technologies adaptatives</a></li>
					<li><a href="formation_transfert">Formation et transfert</a></li>
				</ul>
			</div><!-- widget-categories -->
		</div><!-- col -->

		<div class="col-sm-7">
			<div class="blog-article">
				<h1>Services d’accompagnement en innovation sociale</h1>
								<p>L’équipe du CRISPESH possède une vaste expertise dans l’inclusion scolaire, professionnelle, ainsi que dans les différents milieux de vie des personnes en situation de handicap. Ces compétences permettent d’offrir de l’accompagnement et du soutien à la recherche de solutions pour favoriser la participation sociale des personnes en situation de handicap. Voici quelques exemples des services offerts:</p>
								<ul>
									<li>Élaboration d’outils de recherche</li>
									<li>Aide à la recherche de financement (incluant l’identification de programmes et la rédaction de demandes de subvention)</li>
									<li>Développement, mise en place et accompagnement de communautés de pratique</li>
									<li>Identification de stratégies facilitant l’adoption de meilleures pratiques d’inclusion sociale des personnes en situation de handicap</li>
									<li>Implantation d’outils, soutien et support technique aux organisations qui ont la responsabilité d’intégrer ou souhaitent inclure les personnes en situation de handicap, et ce, dans différentes fonctions, situations et contextes</li>
									<li>Recension des écrits</li>
									<li>Recherche et rédaction d’avis et de rapports</li>
									<li>Soutien à l’utilisation de technologies adaptatives, notamment par le biais d’un laboratoire en technologies adaptatives</li>
								</ul>
			</div><!-- blog-article -->
		</div><!-- col -->

	</div><!-- row -->
<div class="rond_background jaune gauche grosseur_5" id="cercle_2"></div>
</div><!-- container -->

<?php
	require_once("partial/footer.php");
