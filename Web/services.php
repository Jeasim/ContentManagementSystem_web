<?php
	require_once("action/Services_Action.php");
	$action = new Services_Action();
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
					<li><a href="services_accompagnement">Services d'accompagnement en innovation sociale</a></li>
					<li><a href="laboratoire_technologies_adaptatives">Laboratoire en technologies adaptatives</a></li>
					<li><a href="formation_transfert">Formation et transfert</a></li>
				</ul>
			</div><!-- widget-categories -->
		</div><!-- col -->

		<div class="col-sm-7">
			<div class="blog-article">
				<h1>Nos Services</h1>
					<p>Le CRISPESH offre différents services pour développer et mettre en place des initiatives qui relèvent de l’innovation sociale. Adoptant une démarche collaborative, il s’associe aux organismes communautaires, aux milieux de l’éducation et aux entreprises pour répondre à leurs besoins en matière d’inclusion sociale des personnes en situation de handicap.</p>
					<p>Les chercheurs et chargés de projets du CRISPESH créent et maintiennent des liens avec des partenaires universitaires, forment la relève en embauchant des étudiants et collaborent avec plusieurs centres de recherche et CCTT.</p>
					<p>Le CRISPESH met ainsi son expertise au service de la communauté afin de lui prêter main-forte dans la réalisation de divers mandats tout en favorisant l’instauration de pratiques sociales novatrices et inclusives. Les services que le CRISPESH propose sont:</p>

					<ul>
						<li>La recherche appliquée</li>
						<li>Le service d’accompagnement en innovation sociale</li>
						<li>Un laboratoire en technologies adaptatives</li>
						<li>La formation et le transfert</li>
					</ul>
			</div><!-- blog-article -->
		</div><!-- col -->

	</div><!-- row -->
	<div class="rond_background rouge gauche grosseur_5" id="cercle_2"></div>
</div><!-- container -->

<?php
	require_once("partial/footer.php");
