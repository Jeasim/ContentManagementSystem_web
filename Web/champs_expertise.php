<?php
require_once("action/Champs_expertise_Action.php");
$action = new Champs_expertise_Action();
$action->execute();

require_once("partial/header.php");
require_once("partial/breadcrump_pageHeader.php");
?>


<div class="container">
	<div class="row">

		<div class="col-sm-5">
			<div class="widget widget-categories">
				<ul>
					<li><a href="inclusion_sociale.php">L’inclusion sociale</a></li>
					<li><a href="innovation_sociale.php">L'innovation sociale</a></li>
					<li><a href="conception_handicap.php">Notre conception du handicap</a></li>
					<li><a href="situation_handicap.php">Qui sont les personnes en situation de handicap</a></li>
					<li class="active"><a href="champs_expertise.php">Champs d'expertise</a></li>
					<li><a href="partenaires.php">Nos partenaires</a></li>
				</ul>
			</div><!-- widget-categories -->
		</div><!-- col -->

		<div class="col-sm-7">

			<div class="blog-article">
				<h1>Champs d'expertise</h1>
					<p>L’expertise du CRISPESH en matière de recherche et de transfert est vaste, dynamique et en constante évolution. Au fait des nombreux défis liés au handicap et de ses différentes manifestations, l’équipe du CRISPESH est en mesure de répondre adéquatement aux besoins variés qui lui sont communiqués ou qu’elle observe, tout en tenant compte de leurs particularités contextuelles.</p>
					<p>Les initiatives et les recherches menées par le CRISPESH touchent différents domaines d’expertise : conception universelle de l’apprentissage, auto-détermination, défense des intérêts et de la qualité de vie des personnes en situation de handicap, utilisation des aides technologiques pour soutenir l’inclusion, interprétation visuelle, etc. La section dédiée aux projets vous permettra d’en apprendre davantage sur les recherches que le CRISPESH a menées ou auxquelles il a collaboré.</p>
			</div><!-- blog-article -->

			</div><!-- col -->
	</div><!-- row -->
</div><!-- container -->

<?php
	require_once("partial/footer.php");