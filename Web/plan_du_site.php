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
					<li class="page_item page-item-43"><a href="index">Page d&rsquo;accueil</a></li>
					<li class="page_item page-item-5 page_item_has_children"><a href="qui_sommes_nous">À propos de nous</a>
						<ul class='children'>
							<li class="page_item page-item-17"><a href="inclusion_sociale">L'inclusion sociale</a></li>
							<li class="page_item page-item-24"><a href="innovation_sociale">L'innovation sociale</a></li>
							<li class="page_item page-item-19"><a href="champs_expertise">Champs d&rsquo;expertise</a></li>
							<li class="page_item page-item-26"><a href="partenaires">Partenaires</a></li>
						</ul>
					</li>

					<!-- Ajouter "Équipe" et sous sous-pages -->

					<li class="page_item page-item-144 page_item_has_children"><a href="services">Nos services</a>
						<ul class='children'>
							<li class="page_item page-item-28"><a href="recherche_appliquee">Recherche appliquée</a></li>
							<li class="page_item page-item-28"><a href="services_accompagnement">Services d’accompagnement en innovation sociale</a></li>
							<li class="page_item page-item-28"><a href="laboratoire_technologies_adaptatives">Laboratoire en technologies adaptatives</a></li>
							<li class="page_item page-item-30"><a href="formation_transfert">Formation et transfert</a></li>
						</ul>
					</li>
					<li class="page_item page-item-145"><a href="documentation">Documentation</a></li>
					<li class="page_item page-item-7"><a href="nos_projets">Nos projets</a></li>
					<li class="page_item page-item-13"><a href="nous_joindre">Nous joindre</a></li>
				</ul>

			</div><!-- col -->
		</div><!-- row -->
	</div><!-- container -->


</div><!-- CONTENT -->

<?php
	require_once("partial/footer.php");