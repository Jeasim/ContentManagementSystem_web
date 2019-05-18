<?php
	require_once("action/Qui_sommes_nous_Action.php");
	$action = new Qui_sommes_nous_Action();
	$action->execute();

	require_once("partial/header.php");
	require_once("partial/breadcrump_pageHeader.php");
?>


<div class="container">
	<div class="row">

		<div class="col-sm-5">
			<div class="widget widget-categories">
				<ul>
					<li><a href="inclusion_sociale">L’inclusion sociale</a></li>
					<li><a href="innovation_sociale">L'innovation sociale</a></li>
					<li><a href="conception_handicap">Notre conception du handicap</a></li>
					<li><a href="situation_handicap">Qui sont les personnes en situation de handicap</a></li>
					<li><a href="champs_expertise">Champs d'expertise</a></li>
					<li><a href="partenaires">Nos partenaires</a></li>
				</ul>
			</div><!-- widget-categories -->
		</div><!-- col -->

		<div class="col-sm-7">

			<div class="blog-article">
				<h1>CRISPESH</h1>
					<p>Le Centre de recherche pour l’inclusion des personnes en situation de handicap (CRISPESH) est un centre collégial de transfert de technologie en pratiques sociales novatrices (CCTT-PSN), né d’un partenariat entre le <a href="http://www.cvm.qc.ca/Pages/index.aspx" target="_blank">Cégep du Vieux Montréal&nbsp;</a>et le <a href="http://www.dawsoncollege.qc.ca/french/" target="_blank">Collège Dawson</a>.</p>
					<p>Le Centre a été reconnu en octobre 2010 par le ministère de l’Éducation, du Loisir et du Sport (MELS), maintenant le <a href="http://www.education.gouv.qc.ca/" target="_blank">Ministère de l’Éducation et de l’Enseignement Supérieur.</a></p>
					<p>En juillet 2015, le cégep du Vieux Montréal et le collège Dawson confiaient la gestion du CRISPESH à un organisme<br> à but non lucratif du même nom créé dans le but de réaliser le mandat du Centre.</p>
					<p>Le CRISPESH fait partie du <a href="http://reseautranstech.qc.ca/" target="_blank">Réseau Trans-tech</a>, un regroupement de 49 centres collégiaux de transfert de technologie réunissant plus de 1000 experts à travers le Québec qui se dédient à l’innovation au moyen de la recherche appliquée et du transfert.</p>
			</div><!-- blog-article -->

		</div><!-- col -->
	</div><!-- row -->
</div><!-- container -->
<div class="rond_background vert droite grosseur_5" id="cercle_2"></div>

<?php
	require_once("partial/footer.php");