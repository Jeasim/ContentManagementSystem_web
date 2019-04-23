<?php
	require_once("action/Conception_handicap_Action.php");
	$action = new Conception_handicap_Action();
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
					<li class="active"><a href="conception_handicap.php">Notre conception du handicap</a></li>
					<li><a href="situation_handicap.php">Qui sont les personnes en situation de handicap</a></li>
					<li><a href="champs_expertise.php">Champs d'expertise</a></li>
					<li><a href="partenaires.php">Nos partenaires</a></li>
				</ul>
			</div><!-- widget-categories -->
		</div><!-- col -->

		<div class="col-sm-7">

			<div class="blog-article">
				<h1>Notre conception du handicap</h1>
				<p><span style="color: #059ce1;"><strong><em>Le handicap fait partie de la condition humaine - pratiquement tout le monde, à un moment ou l'autre de la vie, aura une déficience temporaire ou permanente et ceux qui parviendront à un âge avancé connaîtront des difficultés fonctionnelles croissantes.</em></strong></span></p>
				<p><span style="color: #059ce1;"><strong><em>Organisation Mondiale de la Santé, 2011, 7</em></strong></span></p>
				<p>Jusqu’à tout récemment, le handicap était considéré comme un problème médical individuel. Cette condition jugée comme étant intrinsèque à une personne lui octroyait un statut d’« handicapé ». Adopter cette perspective sur le handicap signifie de tenir pour acquis que cette personne qui se distingue de la norme doit changer et s’adapter à son environnement physique et social, et non l’inverse.</p>
				<p>Le CRISPESH adopte, quant à lui, une conception du handicap dite « sociale ». Cette perspective explique plutôt le handicap par l’incompatibilité entre le cadre de vie, l’organisation sociale et ses structures, ainsi que les prédispositions d’une portion de la population. Cette optique met l’accent sur le fait que les limitations ou les restrictions vécues par un individu apparaissent dans ses interactions avec son environnement physique et social. Pour éviter ces situations de handicap, il faut privilégier une approche qui vise à apporter des changements à cet environnement physique et social. Ainsi, une conception dite « sociale » du handicap rejette la perspective voulant que les inégalités sociales associées aux handicaps soient la conséquence d’une marginalisation légitime d’individus considérés  « anormaux ».</p>
			</div><!-- blog-article -->

			</div><!-- col -->
	</div><!-- row -->
</div><!-- container -->
<div class="rond_background vert droite grosseur_5" id="cercle_2"></div>

<?php
	require_once("partial/footer.php");