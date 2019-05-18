<?php
	require_once("action/Equipe_Action.php");
	$action = new Equipe_Action();
	$action->execute();

	require_once("partial/header.php");
	require_once("partial/breadcrump_pageHeader.php");
?>
<div class="container">
<div class="row">
	<div class="col-sm-5">
		<div class="widget widget-categories">
			<ul>
				<li><a href="personnel_administratif">Personnel administratif</a></li>
				<li><a href="personnel_scientifique">Personnel scientifique</a></li>
				<li><a href="etudiants">Étudiants (Assistants de recherche et stagiaires)</a></li>
				<li><a href="chercheurses_chercheurs">Chercheuses et chercheurs affiliés</a></li>
				<li><a href="conseil">Le conseil d’administration</a></li>
				<li><a href="emplois">Emplois au CRISPESH</a></li>
			</ul>
		</div><!-- widget-categories -->
	</div><!-- col -->

	<div class="col-sm-7">
		<div class="col-sm-12">
		<h1>Équipe du CRISPESH</h1>
		<p>Dans la réalisation de son mandat, le CRISPESH contribue à la formation de la relève scientifique. Pour ce faire, il embauche, à même ses projets, des étudiants de niveau collégial et universitaire à titre d’assistants de recherche. De plus, il accueille des stagiaires universitaires de deuxième et de troisième cycle qui s’intéressent aux questions qui touchent l’inclusion des personnes en situation de handicap.</p>
		</div>
	</div><!-- col -->


	</div><!-- row -->
</div><!-- container -->

<?php
	require_once("partial/footer.php");