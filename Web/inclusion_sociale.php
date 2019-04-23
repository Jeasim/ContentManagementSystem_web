<?php
	require_once("action/Inclusion_sociale_Action.php");
	$action = new Inclusion_sociale_Action();
	$action->execute();

	require_once("partial/header.php");
	require_once("partial/breadcrump_pageHeader.php");
?>

<div class="container">
	<div class="row">

		<div class="col-sm-5">
			<div class="widget widget-categories">
				<ul>
					<li class="active"><a href="inclusion_sociale.php">L’inclusion sociale</a></li>
					<li><a href="innovation_sociale.php">L'innovation sociale</a></li>
					<li><a href="conception_handicap.php">Notre conception du handicap</a></li>
					<li><a href="situation_handicap.php">Qui sont les personnes en situation de handicap</a></li>
					<li><a href="champs_expertise.php">Champs d'expertise</a></li>
					<li><a href="partenaires.php">Nos partenaires</a></li>
				</ul>
			</div><!-- widget-categories -->
		</div><!-- col -->

		<div class="col-sm-7">

			<div class="blog-article">
				<h1>L’inclusion sociale</h1>
				<p>Inclusion veut dire « travailler ensemble » pour éliminer les barrières à l’égalité pour tous, dans tous les aspects de la vie communautaire.</p>
				<p>Une société inclusive, c’est une société qui maximise les opportunités d’y prendre part pour tous ses membres. L’inclusion sociale vise à mettre en place des environnements physiques et sociaux qui répondent aux besoins de tous, et ce, tant dans les sphères culturelles, économiques, politiques que sociales. Notre société doit s’adapter à la diversité qui la compose et être prête à l’accueillir. De cette façon, chacun bénéficiera de chances égales de participation.</p>
				<p>Favoriser et valoriser l’inclusion sociale des personnes en situation de handicap, c’est reconnaître leur potentiel, l’accepter et lui faire une place. Cela signifie que celles-ci sont non seulement bienvenues dans les milieux scolaires et professionnels, par exemple, mais qu’elles sont aussi supportées par différentes stratégies qui leur permettent de participer en fonction de leur pleine capacité. Travailler pour l’inclusion des personnes en situation de handicap, c’est promouvoir l’égalité des chances dans le respect des qualités, des forces et des limites de chacun.</p>
			</div><!-- blog-article -->

			</div><!-- col -->
	</div><!-- row -->
</div><!-- container -->
<div class="rond_background bleu droite grosseur_5" id="cercle_2"></div>

<?php
	require_once("partial/footer.php");