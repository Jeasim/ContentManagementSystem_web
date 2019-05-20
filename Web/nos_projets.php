<?php
	require_once("action/DAO/TexteModifiableDAO.php");
	require_once("action/Nos_projets_Action.php");
	$action = new Nos_projets_Action();
	$action->execute();

	require_once("partial/header.php");
?>

<script src="js/nosProjets.js"></script>

<!-- CONTENT -->
<div id="content">

<div id="liste-projets">
	<div class="headline">
		<h3>Projets en cours</h3>
	</div>

	<?php
		foreach ($action->projetsEnCours as $projet) {
	?>

	<div class="bloc_blanc bloc_projet">
		<div class="container">

			<div class="row">
				<div class="col-sm-12">
					<div class="portfolio-item">
						<div class="row">
							<div class="col-sm-4">

								<div class="portfolio-item-thumbnail">
								photo
								<!-- <img src="images/projets/photographe.jpg" alt=""> -->
								</div>

							</div><!-- col -->
							<div class="col-sm-8">
								<div class="portfolio-item-details">

									<h4>
										<a title="<?= $projet["NOM"] ?>"><?= $projet["NOM"] ?></a>
									</h4>
									<a class="btn btn-blue" onclick="afficherProjet(<?= $projet['ID'] ?>)">
										Voir les détails du projet
									</a>

								</div><!-- portfolio-item-details -->
							</div><!-- col -->
						</div><!-- row -->
					</div><!-- portfolio-item -->
				</div><!-- col -->
			</div><!-- row -->
		</div><!-- container -->
	</div>
	<?php
		}
	?>


	<div class="headline">
		<h3>Projets complétés</h3>
	</div>

	<?php
		foreach ($action->projetsTermines as $projet) {
	?>

	<div class="bloc_blanc bloc_projet">
		<div class="container">

			<div class="row">
				<div class="col-sm-12">
					<div class="portfolio-item">
						<div class="row">
							<div class="col-sm-4">

								<div class="portfolio-item-thumbnail">
								photo
								<!-- <img src="images/projets/photographe.jpg" alt=""> -->
								</div>

							</div><!-- col -->
							<div class="col-sm-8">
								<div class="portfolio-item-details">

									<h4>
										<a title="<?= $projet["NOM"] ?>"><?= $projet["NOM"] ?></a>
									</h4>
									<a class="btn btn-blue" onclick="afficherProjet(<?= $projet['ID'] ?>)">
										Voir les détails du projet
									</a>

								</div><!-- portfolio-item-details -->
							</div><!-- col -->
						</div><!-- row -->
					</div><!-- portfolio-item -->
				</div><!-- col -->
			</div><!-- row -->
		</div><!-- container -->
	</div>
	<?php
		}
	?>

</div>




<div id="projet"></div>

<template id="template-projet">

	<div class="container">
		<div class="row">
			<div class="col-sm-12">
			<br>
				<center><h1 class="nom-projet"></h1></center>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<img>
			</div>

			<div class="col-sm-8">

				<p class="contenu-projet"></p>

				<div class="col-sm-12 infos-sup-projet">
					<div class="info-sup-projet">
						<hr>
						<h6 class="champ-projet"></h6>
						<div class="info-projet"></div>
					</div>
				</div>

				<div class="col-sm-12">
				<hr>
					<a href="nos_projets" class="btn btn-blue btn_retour_projet">Retour à la liste des projets</a>
				</div>

			</div><!-- col -->
		</div><!-- row -->
	</div><!-- container -->

</template>
</div><!-- CONTENT -->

<?php
	require_once("partial/footer.php");