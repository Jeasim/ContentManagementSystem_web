<?php
	require_once("action/Innovation_sociale_Action.php");
	$action = new Innovation_sociale_Action();
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
					<li class="active"><a href="innovation_sociale.php">L'innovation sociale</a></li>
					<li><a href="conception_handicap.php">Notre conception du handicap</a></li>
					<li><a href="situation_handicap.php">Qui sont les personnes en situation de handicap</a></li>
					<li><a href="champs_expertise.php">Champs d'expertise</a></li>
					<li><a href="partenaires.php">Nos partenaires</a></li>
				</ul>
			</div><!-- widget-categories -->
		</div><!-- col -->

		<div class="col-sm-7">

			<div class="blog-article">
				<h1>L'innovation sociale</h1>
				<p><span style="color: #059ce1;"><strong><em>Toute nouvelle approche, pratique ou intervention mise au point pour améliorer une situation ou solutionner un problème social et ayant trouvé preneur au niveau des institutions, des organisations, des communautés.</em></strong></span></p>
				<p><span style="color: #059ce1;"><strong><em>Camil Bouchard, 1999</em></strong></span></p>
				<p>L’innovation qui vise à atteindre des résultats positifs pour les personnes en situation de handicap, en passant par l’élaboration de pratiques sociales novatrices ou l’utilisation d’idées existantes, est le défi que le CRISPESH a pour mandat de relever. Pour ce faire, il collabore avec différents organismes et institutions en vue de développer des solutions efficaces et durables à des problèmes sociaux complexes qui répondent directement à des besoins exprimés par des organismes partageant cette vocation.</p>
				<p>Le financement que le CRISPESH reçoit a pour but  la création de réponses tangibles à ces besoins exprimés par les personnes qui travaillent dans les milieux concernés et qui se matérialisent par un transfert réel auprès de ces organismes.</p>
			</div><!-- blog-article -->

			</div><!-- col -->
	</div><!-- row -->
</div><!-- container -->
<div class="rond_background rouge droite grosseur_5" id="cercle_2"></div>

<?php
	require_once("partial/footer.php");