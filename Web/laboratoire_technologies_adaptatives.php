<?php
	require_once("action/Laboratoire_technologies_adaptatives_Action.php");
	$action = new Laboratoire_technologies_adaptatives_Action();
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
					<li class="active"><a href="laboratoire_technologies_adaptatives">Laboratoire en technologies adaptatives</a></li>
					<li><a href="formation_transfert">Formation et transfert</a></li>
				</ul>
			</div><!-- widget-categories -->
		</div><!-- col -->

		<div class="col-sm-7">
			<div class="blog-article">
				<h1>Laboratoire en technologies adaptatives</h1>
						<p>Le Collège Dawson et le CRISPESH sont heureux d’offrir les services de leur laboratoire en technologies adaptatives mis en place grâce au soutien financier du Conseil de recherches en sciences naturelles et en génie du Canada (CRSNG), en collaboration avec les Instituts de recherche en santé du Canada (IRSC) et le Conseil de recherches en sciences humaines (CRSH). Il propose des services éducatifs et un accompagnement en vue de favoriser l’inclusion scolaire et professionnelle des personnes en situation de handicap. Le laboratoire a pour mission:</p>
					<ul>
						<li>De permettre aux étudiants, aux enseignants, aux professionnels, aux chercheurs et aux personnes en situation de handicap d’expérimenter une grande variété de technologies, d’instruments et de logiciels</li>
						<li>D’offrir de la formation sur mesure quant à l’utilisation de ces technologies</li>
						<li>D’offrir du soutien aux chercheurs qui s’intéressent à l’utilisation de ces technologies</li>
						<li>D’offrir de l’aide technique</li>
					</ul>
			</div><!-- blog-article -->
		</div><!-- col -->

	</div><!-- row -->
<div class="rond_background vert gauche grosseur_5" id="cercle_2"></div>
</div><!-- container -->

<?php
	require_once("partial/footer.php");