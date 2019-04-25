<?php
	require_once("partial/header.php");
?>

<div id="content">

	<div class="container">

		<div class="rond_background vert grosseur_2"></div>
		<div class="row">
			<div class="col-sm-12">

				<h1>Plan du site</h1>
				<ul class="sitemap">
					<li class="page_item page-item-43"><a href="index.php">Page d&rsquo;accueil</a></li>
					<li class="page_item page-item-5 page_item_has_children"><a href="qui_sommes_nous.php">À propos de nous</a>
						<ul class='children'>
							<li class="page_item page-item-17"><a href="inclusion_sociale.php">L'inclusion sociale</a></li>
							<li class="page_item page-item-24"><a href="innovation_sociale.php">L'innovation sociale</a></li>
							<li class="page_item page-item-19"><a href="champs_expertise.php">Champs d&rsquo;expertise</a></li>
							<li class="page_item page-item-26"><a href="partenaires.php">Partenaires</a></li>
						</ul>
					</li>

					<!-- Ajouter "Équipe" et sous sous-pages -->

					<li class="page_item page-item-144 page_item_has_children"><a href="services.php">Nos services</a>
						<ul class='children'>
							<li class="page_item page-item-28"><a href="recherche_appliquee.php">Recherche appliquée</a></li>
							<li class="page_item page-item-28"><a href="services_accompagnement.php">Services d’accompagnement en innovation sociale</a></li>
							<li class="page_item page-item-28"><a href="laboratoire_technologies_adaptatives.php">Laboratoire en technologies adaptatives</a></li>
							<li class="page_item page-item-30"><a href="formation_transfert.php">Formation et transfert</a></li>
						</ul>
					</li>
					<li class="page_item page-item-145"><a href="documentation.php">Documentation</a></li>
					<li class="page_item page-item-7"><a href="nos_projets.php">Nos projets</a></li>
					<li class="page_item page-item-13"><a href="nous_joindre.php">Nous joindre</a></li>
				</ul>

			</div><!-- col -->
		</div><!-- row -->
	</div><!-- container -->


</div><!-- CONTENT -->

<?php
	require_once("partial/footer.php");