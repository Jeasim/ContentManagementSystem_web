<?php
	require_once("action/Emplois_Action.php");
	$action = new Emplois_Action();
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
				<li><a href="conseil">Conseil d’administration</a></li>
				<li class="active"><a href="emplois">Emplois au CRISPESH</a></li>
			</ul>
		</div><!-- widget-categories -->
	</div><!-- col -->

	<div class="col-sm-7">
		<div class="col-sm-12">
		<h1>Emplois au CRISPESH et <p>formation de la relève scientifique</p></h1>
		<p>Dans la réalisation de son mandat, le CRISPESH contribue à la formation de la relève scientifique. Pour ce faire, il embauche, à même ses projets, des étudiants de niveau collégial et universitaire à titre d’assistants de recherche. De plus, il accueille des stagiaires universitaires de deuxième et de troisième cycle qui s’intéressent aux questions qui touchent l’inclusion des personnes en situation de handicap.</p>

		<p><b>Avantages pour les assistants de recherche et les stagiaires:</b></p>
		<ul>
			<li>Soutien et encadrement de la part de l’équipe du CRISPESH</li>
			<li>Accès aux ressources documentaires du Centre</li>
			<li>Acquisition de compétences en recherche</li>
			<li>Développement d’une expertise sur l’inclusion sociale des personnes en situation de handicap</li>
			<li>Expérience en milieu de travail</li>
			<li>Acquisition de compétences transférables (ex. : autonomie, gestion du temps, travail d’équipe) pouvant mener à l’obtention d’un emploi</li>
			<li>Opportunités de réseautage</li>
		</ul>
		<br>
		<p><b>Pour obtenir un poste d’assistant de recherche dans un projet:</b></p>
		<ul>
			<li>Surveiller les affichages de postes au cégep ou à l’université</li>
			<li>Surveiller les affichages dans les réseaux des organismes qui œuvrent auprès des personnes en situation de handicap</li>
			<li>Soumettre sa candidature en fonction d’un affichage en particulier</li>
			<li>Soumettre une candidature spontanée par courriel, à l’adresse: crispesh@cvm.qc.ca, à l’attention de Roch Ducharme, directeur général du CRISPESH</li>
		</ul>
		<br>
		<p><b>Pour faire une proposition de stage de recherche dans le cadre d’études universitaires, vous devez soumettre:</b></p>
		<ul>
			<li>Une lettre de présentation (1 page)</li>
			<li>Un résumé de proposition ou d’intérêts de recherche (1 page)</li>
			<li>Un CV</li>
		</ul>
			<p>Toutes autres candidatures spontanées sont les bienvenues, par courriel, à l’adresse : crispesh@cvm.qc.ca</p>
		</div>
	</div><!-- col -->
	<div class="rond_background jaune droite grosseur_2" id="cercle_2"></div>
</div><!-- row -->
</div><!-- container -->
<div class="rond_background vert gauche grosseur_5" id="cercle_2"></div>

<?php
	require_once("partial/footer.php");