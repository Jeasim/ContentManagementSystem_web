<?php
	require_once("action/Formation_transfert_Action.php");
	$action = new Formation_transfert_Action();
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
				<li class="active"><a href="formation_transfert">Formation et transfert</a></li>
			</ul>
		</div><!-- widget-categories -->
	</div><!-- col -->

	<div class="col-sm-7">
		<div class="blog-article">
			<h1>Formation et transfert</h1>
							Le transfert des connaissances est une étape primordiale afin de rendre les résultats découlant de la recherche accessibles et utiles à la communauté. Il s’agit d’adapter et de mettre en place des stratégies d’appropriation pour les milieux utilisateurs. Par la mise en place d’initiatives de partage, d’échanges, de mobilisation, de valorisation des connaissances et d’interventions, le CRISPESH propose des solutions à des problèmes sociaux touchant les personnes en situation de handicap, tout en stimulant l’innovation sociale et la diffusion des pratiques novatrices. Voici quelques exemples de stratégies de transfert de connaissances utilisées par le CRISPESH :

							<ul>
							<br>
								<li>Communications scientifiques et ouvertes au grand public</li>
								<li>Création de forums d’échanges entre les milieux de la recherche, les intervenants, la communauté et les personnes en situation de handicap</li>
								<li>Développement de formations par simulation</li>
								<li>Développement, mise en place et accompagnement de communautés de pratiques</li>
								<li>Formations  et ateliers à  la carte sur l’inclusion sociale des personnes en situation de handicap dans les milieux communautaires, scolaires et pour les entreprises</li>
								<li>Formations et animations</li>
								<li>Formations et ateliers thématiques:
									<ul>
										<li>La conception universelle de l’apprentissage en milieu scolaire</li>
										<li>Les fonctions exécutives : Pour semer les graines à même le cerveau!</li>
									</ul>
								</li>
								<li>Organisation d’événements communautaires pour sensibiliser la société à la réalité quotidienne et aux besoins des personnes en situation de handicap</li>
								<li>Publications scientifiques ou destinées au grand public</li>
							</ul>
		</div><!-- blog-article -->
	</div><!-- col -->

</div><!-- row -->

</div><!-- container -->
<div class="rond_background vert gauche grosseur_4" id="cercle_2"></div>

<?php
	require_once("partial/footer.php");